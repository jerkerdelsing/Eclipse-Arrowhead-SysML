#!/usr/bin/env python3
"""Regenerate the 5.3 Java reference SysML v2 and v1.6 libraries. No builds or deployment."""
from pathlib import Path
import json,re,hashlib,os,xml.etree.ElementTree as ET
import argparse,sys,types,contextlib,io,copy,shutil
from update_arrowhead_dsl import annotate_full_ports, prune_notation
parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('--source-root',type=Path,required=True)
parser.add_argument('--output',type=Path,required=True,help='Distribution directory containing SysML-v2 and SysML v1.6')
parser.add_argument('--provenance',type=Path)
cli=parser.parse_args()
R=cli.source_root.resolve();D=cli.output.resolve();O=D/'SysML-v2';O.mkdir(parents=True,exist_ok=True)
manifest={};inventory=[];differences=[]
def src(p):
 p=Path(p);manifest[os.path.relpath(p,R)]=hashlib.sha256(p.read_bytes()).hexdigest();return p.read_text()
def q(s):return json.dumps(str(s),ensure_ascii=False)
def doc(s):return 'doc /* '+str(s).replace('*/','* /')+' */'
def ident(s):return "'"+str(s).replace('\\','\\\\').replace("'","\\'")+"'"
def args(t,cmd,n):
 pat=re.compile(r'\\'+cmd+r'\s*(?=\{)');out=[]
 for m in pat.finditer(t):
  i=m.end();a=[]
  for _ in range(n):
   while i<len(t) and t[i].isspace():i+=1
   if i>=len(t) or t[i]!='{': break
   start=i+1;depth=1;i+=1
   while i<len(t) and depth:
    if t[i]=='\\' and i+1<len(t) and t[i+1] in '{}':i+=2;continue
    if t[i]=='{':depth+=1
    elif t[i]=='}':depth-=1
    i+=1
   a.append(t[start:i-1])
  if len(a)==n:out.append(a)
 return out
def clean(t):
 t=re.sub(r'\\fparam\{\{([^{}]*)\}\}',r'{\1}',t)
 t=t.replace(r'\allowbreak{}','').replace(r'\_','_').replace(r'\{','{').replace(r'\}','}').replace(r'\textless{}','<').replace(r'\textgreater{}','>')
 t=re.sub(r'\\fparam\{\{([^{}]*)\}\}',r'{\1}',t)
 t=t.replace(r'\&','&')
 t=re.sub(r'\\(?:mref|pref)\[[^]]*\]\{([^{}]*)\}',r'\1',t)
 for _ in range(8):t=re.sub(r'\\(?:texttt|textit|mref|pref|pdef|fparam)\{([^{}]*)\}',r'\1',t)
 return t.replace('$','').replace(r'\,',' ').strip()

def scalar(ty):
 ty=ty.strip();arr=ty.startswith(('List<','Set<','Collection<','Array<')) or ty.endswith('[]')
 base=re.sub(r'^(?:List|Set|Collection|Array)<(.*)>$',r'\1',ty).removesuffix('[]')
 mapping={'String':'String','string':'String','UUID':'String','boolean':'Boolean','Boolean':'Boolean','int':'Integer','Integer':'Integer','long':'Integer','Long':'Integer','Number':'Real','double':'Real','Double':'Real','float':'Real','Float':'Real','BigDecimal':'Real','Instant':'String','ZonedDateTime':'String','LocalDateTime':'String','OffsetDateTime':'String'}
 return mapping.get(base),base,arr

def datafile(package,dtos,enums,source):
 lines=['library package '+package+' {','    private import ScalarValues::*;','    private import ArrowheadFoundation::*;']
 for en,vals in sorted(enums.items()):
  lines+=['    enum def '+ident(en)+' {']+['        enum '+ident(v)+';' for v in vals]+['    }']
 for name,fields in sorted(dtos.items()):
  lines+=['    item def '+ident(name)+' :> JSONMessage {', '        '+doc('Source: '+source+'. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive.')]
  seen=set()
  for f in fields:
   if f['name'] in seen:continue
   seen.add(f['name']);ty=f['type'];s,base,arr=scalar(ty);mult='[0..*]' if arr else '[0..1]'
   if s:decl=f'attribute {ident(f["name"])} : {s}{mult};'
   elif base in enums:decl=f'attribute {ident(f["name"])} : {ident(base)}{mult};'
   elif package!='ArrowheadCoreData' and base in core['dtos']:decl=f'ref item {ident(f["name"])} : ArrowheadCoreData::{ident(base)}{mult};'
   elif package!='ArrowheadCoreData' and base in core['enums']:decl=f'attribute {ident(f["name"])} : ArrowheadCoreData::{ident(base)}{mult};'
   elif base in dtos:decl=f'ref item {ident(f["name"])} : {ident(base)}{mult};'
   else:decl=f'ref item {ident(f["name"])} : JSONValue{mult};'
   lines+=['        '+decl[:-1]+' { '+doc('Source type: '+ty+'. '+f.get('description',''))+' }']
  lines+=['    }']
 lines+=['}'];(O/(package+'.sysml')).write_text('\n'.join(lines)+'\n')


# Reuse the release's Java extraction code, fixing annotation argument and comment parsing.
p=R/'ah5-core-java-spring/documentation-tools/extract.py'
code=src(p).replace('ROOT = Path(sys.argv[1])','ROOT = SOURCE_ROOT')
code=code[:code.rfind('\nmain()')]
x=types.ModuleType('java_extract');x.__dict__['SOURCE_ROOT']=R;exec(compile(code,str(p),'exec'),x.__dict__)
def strip_comments(s):
 return re.sub(r'"(?:\\.|[^"\\])*"|/\*.*?\*/|//[^\n]*',lambda m: m.group() if m.group().startswith('"') else ' ',s,flags=re.S)
x.strip_comments=strip_comments
original_api=x.parse_api
def parse_api(p,res):
 # The upstream parser treats produces= as part of the class path expression.
 # Supply a temporary resolver that isolates the path or value argument.
 class Resolver:
  def get(self,e,c=None):
   if e and ('produces' in e or 'consumes' in e):
    e=x.parse_annotation_arg(e,'path') or x.parse_annotation_arg(e,'value') or e.split(',')[0]
   if e and e.strip().startswith('{'):e=e.strip()[1:].split(',')[0].strip()
   value=res.get(e,c) if e else ''
   if value is None:raise ValueError('Cannot resolve '+str(e)+' in '+str(p))
   return value
 try: eps=original_api(p,Resolver())
 except TypeError as err: raise ValueError('Unresolved Java route '+str(p)) from err
 aliases=[]
 mappings=list(re.finditer(r'@(Get|Post|Put|Delete|Patch)Mapping\b(?:\((.*?)\))?',strip_comments(p.read_text()),re.S))
 for ep,m in zip(eps,mappings):
  am=re.search(r'(?:path|value)\s*=\s*\{([^}]+)\}',m.group(2) or '')
  if am:
   exprs=[e.strip() for e in am.group(1).split(',')];first=res.get(exprs[0],p.stem)
   for expr in exprs[1:]:
    value=res.get(expr,p.stem)
    if value is None:raise ValueError('Unresolved alias '+expr)
    base=ep['path'][:-len(first)] if first else ep['path']
    aliases.append({**ep,'path':base+value})
 eps+=aliases
 for ep in eps:ep['source']=str(p.relative_to(R));ep['evidence']='java-controller'
 return eps
x.parse_api=parse_api
buf=io.StringIO()
with contextlib.redirect_stdout(buf):x.main()
core=json.loads(buf.getvalue())
# Hash source evidence rather than packaged JARs from an earlier release.
for base in [R/'ah5-core-java-spring',R/'ah5-common-java-spring']:
 for p in sorted(base.rglob('*.java')):
  if '/src/main/' in str(p):src(p)
systems=[]
for name,sy in core['systems'].items():
 base=R/'ah5-core-java-spring'/sy['module'];sysinfo=next(base.glob('src/main/java/**/*SystemInfo.java'))
 systems.append(dict(name=name,group='Core',source=str(sysinfo.relative_to(R)),summary='Java release 5.3 core system '+name,services=sy['services'],dtos=copy.deepcopy(core['dtos']),enums=core['enums'],data='ArrowheadCoreData',consumed=[],unregistered=sy.get('unregisteredEndpoints',[]),base=base))
for base in sorted(R.glob('ah5-*')):
 if not (base/'src/main/java').exists():continue
 name=base.name.split('-')[1];dp=base/'documentation/v5.3.0';sysds=list(dp.glob('*-SysD.tex'))
 summary='Java release 5.3 support system '+name
 if sysds:
  tx=src(sysds[0]);m=re.search(r'This document describes.*?(?=\n\n)',tx,re.S)
  if m:summary=clean(m.group())
 elif (base/'README.md').exists():summary=src(base/'README.md').split('\n\n')[1]
 if name=='SoSConfigurator':summary+=' Legacy system; superseded by SoLocalCloudConfigurator.'
 systems.append(dict(name=name,group='Support',source=str((sysds[0] if sysds else base/'README.md').relative_to(R)),summary=summary,services=[],dtos={},enums={},data='Arrowhead'+name+'Data',consumed=[],unregistered=[],base=base))

def norm(p):
 return re.sub(r'\{[^{}]*\}','{}',p.split('?')[0].rstrip('/'))

def inline_services(p,res):
 out=[];tx=strip_comments(p.read_text())
 local={(p.stem,m.group(1)):m.group(2) for m in re.finditer(r'final String (\w+) = ([^;]+);',tx)}
 res=x.Resolver({**res.raw,**local})
 for m in re.finditer(r'new ServiceModel.Builder\(\)(.*?)(?=;)',tx,re.S):
  block=m.group(1);sm=re.search(r'\.serviceDefinition\(([^)]+)\)',block);bp=re.search(r'(?:interfaceBuilder|http)\(([^)]+)\)',block) or re.search(r'\.basePath\(([^)]+)\)',block)
  if not sm or not bp:continue
  sn=res.get(sm.group(1),p.stem);base=res.get(bp.group(1),p.stem)
  ops=[]
  for om in re.finditer(r'\.operation\(([^,]+),\s*operation\((?:HttpMethod\.)?(\w+|"\w+"),\s*([^)]+)\)\)',block):
   ops.append(dict(name=res.get(om.group(1),p.stem),method=om.group(2).strip('"'),path=res.get(om.group(3),p.stem)))
  for om in re.finditer(r'\.operation\(([^,]+),\s*new HttpOperationModel.Builder\(\)\.method\(([^)]+)\)\.path\(([^)]+)\)',block):
   ops.append(dict(name=res.get(om.group(1),p.stem),method=res.get(om.group(2),p.stem),path=res.get(om.group(3),p.stem)))
  if sn and base and ops:out.append(dict(serviceDefinition=sn,version='1.0.0',http=dict(basePath=base,ops=ops)))
 return out

for sy in systems:
 base=sy['base'];dp=base/'documentation/v5.3.0';docs={}
 sy['defaultPort']=None
 for cfg in sorted((base/'src/main/resources').glob('application.*')):
  tx=src(cfg);m=re.search(r'^server.port\s*=\s*(\d+)',tx,re.M) or re.search(r'port:\s*(?:\$\{[^}:]+:)?(\d+)',tx)
  if m:sy['defaultPort']=int(m.group(1))
 # Balanced TeX macros preserve braces inside type/path arguments.
 for p in sorted(dp.glob('*.tex')):
  tx=src(p)
  if not p.name.endswith('-IDD.tex'):continue
  service=args(tx,'ArrowheadServiceID',1)
  if not service:continue
  sn=service[0][0];protocol=p.stem.rsplit('-',2)[-2].lower();protocol={'https':'http'}.get(protocol,protocol)
  ops=[]
  for a in args(tx,'osubsection',5):
   on,method,path,req,res=map(clean,a)
   path=re.sub(r'\\fparam\{([^{}]*)\}',r'\1',path)
   ops.append(dict(name=on,method=method,path=path,fullPath=path,requestBody=req or None,response=res or None,queryParams=[],pathVars=[],source=str(p.relative_to(R)),evidence='documentation'))
  docs.setdefault(sn,dict(serviceDefinition=sn,version='1.0.0'))[protocol]=dict(ops=ops,source=str(p.relative_to(R)))
  reg=tx.split('\\subsection{Interface registration}',1)
  if len(reg)>1:docs[sn][protocol]['registration']=clean(reg[1].split('\\section{Service Operations}',1)[0])
  pos=list(re.finditer(r'\\msubsection\{struct\}\{([^}]+)\}',tx))
  for i,m in enumerate(pos):
   body=tx[m.end():pos[i+1].start() if i+1<len(pos) else len(tx)];fields=[]
   for line in body.splitlines():
    if line.startswith('"') and ' & ' in line:
     parts=line.split(' & ',2)
     if len(parts)==3:fields.append(dict(name=clean(parts[0]).strip('"'),type=clean(parts[1]),description=clean(parts[2].split('\\\\')[0])))
   sy['dtos'][m.group(1)]=fields
 files=sorted(base.glob('src/main/java/**/*.java'));common=list((R/'ah5-common-java-spring/common-utils/src/main/java').rglob('*Constants.java'))
 for p in files:src(p)
 res=x.Resolver(x.parse_constants(common+files))
 eps=[]
 for p in files:
  if re.search(r'@(RestController|Controller)\b',p.read_text()) and re.search(r'@(Get|Post|Put|Delete|Patch)Mapping\b',p.read_text()):eps+=parse_api(p,res)
 if sy['group']=='Support':
  info=list(base.glob('src/main/java/**/*SystemInfo.java'));registered=[]
  if info:
   try:registered=x.parse_sysinfo(info[0],res)
   except (KeyError,TypeError):registered=inline_services(info[0],res)
   inline=inline_services(info[0],res)
   for v in inline:
    target=next((a for a in registered if a['serviceDefinition']==v['serviceDefinition']),None)
    if target is not None:target.update(v)
    else:registered.append(v)
  if sy['name']=='LocalCloudManager':
   tx=info[0].read_text();rows=re.findall(r'\{\s*"([^"]+)",\s*"(GET|POST|PUT|DELETE|PATCH)",\s*"([^"]+)"\s*\}',tx)
   if rows:
    target=next(v for v in registered if v['serviceDefinition']=='localCloudManagement')
    target['http']=dict(basePath='/api',ops=[dict(name=n,method=m,path=p.removeprefix('/api')) for n,m,p in rows])
  sy['services']=registered or list(docs.values())
  for v in sy['services']:
   if 'mqtt' in v:v['mqtt']['ops']=[dict(name=o) if isinstance(o,str) else o for o in v['mqtt']['ops']]
 # Merge documentation-only transports, especially native AMQP publication.
 for sn,sv in docs.items():
  target=next((v for v in sy['services'] if v['serviceDefinition']==sn),None)
  if target is None:
   target=dict(serviceDefinition=sn,version=sv['version']);sy['services'].append(target)
  for proto in ['http','mqtt','amqp']:
   if proto in sv:
    if proto not in target:target[proto]=sv[proto]
    else:
     target[proto]['source']=sv[proto]['source']
     target[proto]['registration']=sv[proto].get('registration','')
     for op in target[proto]['ops']:
      match=next((o for o in sv[proto]['ops'] if o['name']==op['name']),None)
      if match:
       for k in ['requestBody','response']:
        if not op.get(k):op[k]=match.get(k)
 for sv in sy['services']:
  for proto in ['http','mqtt','amqp']:
   if proto not in sv:continue
   it=sv[proto];it.setdefault('source',str(info[0].relative_to(R)) if sy['group']=='Support' and info else sy['source'])
   for op in it['ops']:
    op.setdefault('source',it['source']);op.setdefault('evidence','java-registration')
    if proto=='http':
     
     if op.get('path') is None:raise ValueError(str((sy['name'],sv,op)))
     path=op.get('fullPath',it.get('basePath','')+op.get('path',''))
     match=next((e for e in eps if e['method']==op.get('method') and norm(e['path'])==norm(path)),None)
     if match:
      if op.get('evidence')=='documentation' and (op.get('requestBody')!=match.get('requestBody') or norm(path)!=norm(match['path'])):
       differences.append(dict(system=sy['name'],service=sv['serviceDefinition'],documented=copy.deepcopy(op),implementation=copy.deepcopy(match)))
      op.update({k:match[k] for k in ['requestBody','response','queryParams','pathVars','codes','source','evidence']});op['fullPath']=match['path'];match['matched']=True
     else:
      op['fullPath']=path
      # A registered descriptor can differ from its implemented controller path.
      alt=op.get('implementedPath')
      if alt:op['fullPath']=alt
    elif proto=='mqtt':
     op.setdefault('method','REQUEST_REPLY');op.setdefault('fullPath',it.get('baseTopic','')+op['name'])
    else:op.setdefault('method','PUBLISH')
 # Complete source-only controller routes remain explicitly separate from registered services.
 registered_keys={(o.get('method'),norm(o.get('fullPath',o.get('path','')))) for v in sy['services'] for o in v.get('http',{}).get('ops',[])}
 sy['unregistered']=[e for e in eps if (e['method'],norm(e['path'])) not in registered_keys]
 # Optional native telemetry is common-library behavior, including systems without a current IDD.
 if not any(v['serviceDefinition']=='sysMonitor' for v in sy['services']):
  sv=copy.deepcopy(next(v for v in systems[0]['services'] if v['serviceDefinition']=='sysMonitor'))
  sy['services'].append(sv)
 if sy['name']=='SoLocalCloudConfigurator':sy['consumed']=['localCloudConfiguration','serviceOrchestration','authorization','identity','serviceDiscovery']
 sysd=next(iter(dp.glob('*-SysD.tex')),None)
 if sysd:
  m=re.search(r'\\textbf\{Consumed\}(.*?)};',sysd.read_text(),re.S)
  if m:sy['consumed']=[clean(v).strip() for v in m.group(1).split('\\\\') if clean(v).strip()]

 for p in files:
  tx=strip_comments(p.read_text())
  for m in re.finditer(r'\brecord\s+(\w+)\s*\(',tx):
   end=x.balanced(tx,m.end()-1);params=tx[m.end():end]
   params=re.sub(r'@[\w.]+(?:\([^)]*\))?\s*','',params);parts=[];cur='';depth=0
   for ch in params:
    if ch=='<':depth+=1
    elif ch=='>':depth-=1
    if ch==',' and depth==0:parts.append(cur);cur=''
    else:cur+=ch
   parts.append(cur);fields=[]
   for part in parts:
    bits=part.strip().rsplit(None,1)
    if len(bits)==2:fields.append(dict(name=bits[1],type=' '.join(bits[0].split()),description='Java record component; '+str(p.relative_to(R))))
   if fields:sy['dtos'][m.group(1)]=fields
 datafile(sy['data'],sy['dtos'],sy['enums'],str(base.relative_to(R))+' source and v5.3.0 IDDs')

# All five core systems share one data namespace, including their documented MQTT schemas.
shared_dtos={}
for sy in systems:
 if sy['group']=='Core':
  for dn,fields in sy['dtos'].items():
   if dn in shared_dtos and [(f['name'],f['type']) for f in shared_dtos[dn]]!=[(f['name'],f['type']) for f in fields]:raise ValueError('Conflicting core DTO '+dn)
   shared_dtos[dn]=fields
core['dtos']=shared_dtos
for sy in systems:
 if sy['group']=='Core':sy['dtos']=shared_dtos
datafile('ArrowheadCoreData',shared_dtos,core['enums'],'Java shared DTO sources and all five core v5.3.0 IDD schema catalogues')

# The previous DSL is a compatibility seed; no old implementation checkout is required.
seed=Path(__file__).with_name('ArrowheadDSL.template.txt').read_text().replace('5.2.2','5.3.0').replace('2026-10-27','2026-11-14').replace('RELEASE CANDIDATE','RELEASE CANDIDATE')
(O/'ArrowheadDSL.sysml').write_text(seed)
foundation='''library package ArrowheadFoundation {
    private import ScalarValues::*;
    private import ArrowheadProfile::*;
    item def JSONValue;
    item def JSONMessage :> JSONValue;
    abstract part def ArrowheadSystem {
        attribute implementationVersion : String = "5.3.0";
        attribute releaseStatus : String = "RELEASE CANDIDATE";
    }
    abstract port def ArrowheadService;
    abstract part def Device;
    abstract part def IntraCloudNetwork;
    abstract part def InterCloudNetwork;
    abstract part def LocalCloud { part systems : ArrowheadSystem[0..*]; part devices : Device[0..*]; }
    abstract part def SystemOfLocalClouds { part clouds : LocalCloud[0..*]; }
    connection def DeviceNetworkConnection { end device : Device; end network : IntraCloudNetwork; }
    connection def InterCloudDeviceNetworkConnection { end device : Device; end network : InterCloudNetwork; }
}
'''
(O/'ArrowheadFoundation.sysml').write_text(foundation)

# Runtime-dispatched console routes are documented separately from the advertised descriptor table.
for sy in systems:
 if sy['name']=='LocalCloudManager':
  p=next(sy['base'].glob('src/main/java/**/ConsoleApiController.java'))
  sy['unregistered'].append(dict(method='ANY',path='/api/**',source=str(p.relative_to(R)),evidence='java-dispatcher',summary='Runtime dispatcher; console session and feature flags apply. Advertised descriptor paths can be less specific than runtime paths.'))

# Request/response item type wrapper: standard scalars can be action parameters too.
def parameter(direction,name,ty,sy):
 ty=re.sub(r'^ResponseEntity<(.*)>$',r'\1',ty or '')
 if ty in ['void','Void']:return None
 st,base,arr=scalar(ty);mult='[0..*]' if arr else '[0..1]'
 if st:return direction+' attribute '+ident(name)+' : ScalarValues::'+st+mult+';'
 if base in sy['enums']:return direction+' attribute '+ident(name)+' : '+sy['data']+'::'+ident(base)+mult+';'
 target=sy['data']+'::'+ident(base) if base in sy['dtos'] else 'ArrowheadCoreData::'+ident(base) if base in core['dtos'] else 'JSONMessage'
 return direction+' item '+ident(name)+' : '+target+mult+';'
for sy in systems:
 name=sy['name'];lines=['library package Arrowhead'+name+' {','    private import ScalarValues::*;','    private import ArrowheadFoundation::*;','    private import ArrowheadProfile::*;']
 for sv in sy['services']:
  sn=sv['serviceDefinition'];prefix=name+'_'+sn
  lines+=['    port def '+prefix+'_SD :> ArrowheadService {','        @SD { MicroserviceName = '+q(sn)+'; }','        '+doc('Service version '+sv.get('version','unspecified')+'. Source: '+sy['source']), '    }']
  for protocol in ['http','mqtt','amqp']:
   if protocol not in sv:continue
   it=sv[protocol];pd=prefix+'_'+protocol.upper()+'_IDD'
   lines+=['    port def '+pd+' :> '+prefix+'_SD {','        @IDD { MicroserviceName = '+q(sn)+'; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'+ident(protocol)+'; }', '        @SourceTrace { path = '+q(it.get('source',sy['source']))+'; }']
   if it.get('registration'):
    reg=it['registration']
    try:
     start=re.search(r'\{\s*"serviceDefinitionName"',reg).start();registration=json.JSONDecoder().raw_decode(reg[start:])[0]
     interface=registration['interfaces'][0]
     for key in ['templateName','protocol','policy']:
      if key in interface:lines+=['        attribute '+key+' : String = '+q(interface[key])+';']
     for key,value in interface.get('properties',{}).items():
      if isinstance(value,(str,int)) and not (key=='basePath' and it.get('basePath')):
       lines+=['        attribute '+ident(key)+' : '+('Integer' if isinstance(value,int) else 'String')+' = '+q(value)+';' if not isinstance(value,int) else '        attribute '+ident(key)+' : Integer = '+str(value)+';']
    except (ValueError,KeyError,TypeError,AttributeError,json.JSONDecodeError):
     for phrase,key in [('base path','basePath'),('interface template','templateName'),('policy','policy')]:
      match=re.search(re.escape(phrase)+r' ([^ ,;]+)',reg)
      if match and not (key=='basePath' and it.get('basePath')):lines+=['        attribute '+key+' : String = '+q(match.group(1).rstrip('.'))+';']
   if it.get('basePath'):lines+=['        attribute basePath : String = '+q(it['basePath'])+';']
   if it.get('baseTopic'):lines+=['        attribute baseTopic : String = '+q(it['baseTopic'])+';']
   if it.get('registration'):lines+=['        '+doc('Registration (source documentation): '+it['registration'])]
   seen=set()
   for i,op in enumerate(it['ops']):
    on=op['name'];un=on if on not in seen else on+'_'+str(i);seen.add(on)
    rq=parameter('in',un+'Request',op.get('requestBody',op.get('payload')),sy);rs=parameter('out',un+'Response',op.get('response'),sy)
    lines+=['        '+doc(on+': '+op.get('method','MQTT request/reply')+' '+op.get('fullPath',op.get('path',it.get('baseTopic','')+on))+'. Input: '+str(op.get('requestBody',op.get('payload')))+'; output: '+str(op.get('response'))+'. '+op.get('summary',''))]
    # Direction is from provider: requests in, responses or publications out.
    if (op.get('requestBody') or op.get('payload')) and rq:lines+=['        '+rq]
    if (op.get('response') or protocol=='mqtt') and rs:lines+=['        '+rs]
    inventory.append({'system':name,'service':sn,'protocol':protocol,'operation':on,'method':op.get('method'),'path':op.get('fullPath',op.get('path',it.get('baseTopic','')+on)),'source':op.get('source',it.get('source',sy['source'])),'requestType':op.get('requestBody',op.get('payload')),'responseType':op.get('response'),'queryParameters':op.get('queryParams',[]),'pathParameters':op.get('pathVars',[]),'statusCodes':op.get('codes',[]),'evidence':op.get('evidence','documentation'),'registered':True})
   lines+=['    }','    port def '+pd+'_Implementation :> '+pd+' { @IDD_Implementation; }']
   for i,op in enumerate(it['ops']):
    an=prefix+'_'+protocol+'_'+op['name']+'_'+str(i)
    lines+=['    action def '+ident(an)+' {','        '+doc(op.get('summary','Operation '+op['name'])+'. Wire method: '+op.get('method','MQTT request/reply')+'; address: '+op.get('fullPath',op.get('path',it.get('baseTopic','')+op['name']))+'. Query parameters: '+json.dumps(op.get('queryParams',[]))+'. Path parameters: '+json.dumps(op.get('pathVars',[]))+'. Status codes: '+json.dumps(op.get('codes',[])))]
    lines+=['        @WireOperation { protocol = '+q(protocol)+'; method = '+q(op.get('method','REQUEST_REPLY'))+'; address = '+q(op.get('fullPath',op.get('path',it.get('baseTopic','')+op['name'])))+'; requestType = '+q(op.get('requestBody',op.get('payload')) or 'unspecified')+'; responseType = '+q(op.get('response') or 'unspecified')+'; queryParameters = '+q(json.dumps(op.get('queryParams',[])))+'; pathParameters = '+q(json.dumps(op.get('pathVars',[])))+'; statusCodes = '+q(json.dumps(op.get('codes',[])))+'; }']
    rq=parameter('in','request',op.get('requestBody',op.get('payload')),sy)
    if (op.get('requestBody') or op.get('payload')) and rq:lines+=['        '+rq]
    rs=parameter('out','response',op.get('response'),sy)
    if (op.get('response') or protocol=='mqtt') and rs:lines+=['        '+rs]
    lines+=['    }']
 lines+=['    part def '+name+'_SysD :> ArrowheadSystem {','        @SysD { MicrosystemName = '+q(name)+'; FunctionalProperties = '+q(sy['summary'])+'; }','        @SourceTrace { path = '+q(sy['source'])+'; }','        '+doc(sy['summary'])]
 for sv in sy['services']:lines+=['        port '+ident(sv['serviceDefinition']+'_SD')+' : '+name+'_'+sv['serviceDefinition']+'_SD'+('[0..1]' if sv['serviceDefinition']=='sysMonitor' else '')+' { @FullPort; }']
 if sy['consumed']:lines+=['        '+doc('Consumed dependencies from SysD: '+', '.join(sy['consumed'])+'. These are external requirements, not assumed co-deployments.')]
 lines+=['    }','    part def '+name+'_SysDD :> '+name+'_SysD {','        @SysDD;']
 for sv in sy['services']:
  for protocol in ['http','mqtt','amqp']:
   if protocol in sv:lines+=['        port '+ident(sv['serviceDefinition']+'_'+protocol)+' : '+name+'_'+sv['serviceDefinition']+'_'+protocol.upper()+'_IDD'+('[0..1]' if protocol in ['mqtt','amqp'] else '')+' { @FullPort; }']
 lines+=['    }','    part def '+name+' :> '+name+'_SysDD {','        @System_Implementation;', '        attribute defaultListeningPort : Integer[0..1]'+(' = '+str(sy['defaultPort']) if sy['defaultPort'] else '')+';', '        '+doc('Java reference implementation; release/5.3. Native sysMonitor requires sysmonitor.enabled=true.'), '    }','}']
 for i,ep in enumerate(sy['unregistered']):
  lines.insert(-1,'    action def '+ident(name+'_Unregistered_'+str(i))+' { '+doc('Unregistered HTTP endpoint; '+ep['method']+' '+ep['path']+'; source '+ep['source'])+' @WireOperation { protocol = "http"; method = '+q(ep['method'])+'; address = '+q(ep['path'])+'; } }')
 (O/('Arrowhead'+name+'.sysml')).write_text('\n'.join(lines)+'\n')
# Catalog is reusable optional membership; orchestration variants can coexist but are alternatives by deployment choice.
lines=['library package ArrowheadLocalCloudLibrary {','    private import ArrowheadFoundation::*;','    private import ArrowheadProfile::*;','    part def ArrowheadLocalCloud :> LocalCloud {','        @LocalcloudImplementation;']
for sy in systems:
 lines+=['        part '+ident(sy['name'][0].lower()+sy['name'][1:])+' : Arrowhead'+sy['name']+'::'+sy['name']+'[0..1] :> systems;']
lines+=['    }','    part def ArrowheadSystemOfLocalClouds :> SystemOfLocalClouds {','        @System_of_LocalcloudsImplementation;','        part localClouds : ArrowheadLocalCloud[0..*] :> clouds;','    }','}']
(O/'ArrowheadLocalCloudLibrary.sysml').write_text('\n'.join(lines)+'\n')
foundation=O/'ArrowheadFoundation.sysml'
ft=foundation.read_text().rstrip()[:-1]
for cn,left,right in [
 ('LocalCloudDesign_System_of_LocalcloudsDesign','LocalCloud','SystemOfLocalClouds'),
 ('System_of_LocacloudsDesignDescription_LocalcloudDesignDescription','SystemOfLocalClouds','LocalCloud'),
 ('System_of_LocalcloudsImplementation_LocalcloudImplementation','SystemOfLocalClouds','LocalCloud'),
 ('LocalcloudImplementation_System_Implementation','LocalCloud','ArrowheadSystem'),
 ('DeviceDesign_IntracloudNetworkDesign','Device','IntraCloudNetwork'),
 ('DeviceDesign_IntercloudNetworkDesign','Device','InterCloudNetwork'),
 ('DeviceDesignDescription_IntracloudNetworkDesignDescription','Device','IntraCloudNetwork'),
 ('DeviceDesignDescription_IntercloudNetworkDesignDescription','Device','InterCloudNetwork')]:
 ft+='    connection def '+cn+' { end leftEnd : '+left+'; end rightEnd : '+right+'; }\n'
ft+='    connection def System_Implementation_IDD_Implementation { end system : ArrowheadSystem; end port service : ArrowheadService; }\n}\n'
foundation.write_text(ft)


provenance=json.loads(cli.provenance.read_text()) if cli.provenance else {}
for relative in ['profile-library-sysml/distribution/SysML v1.6/EclipseArrowhead-5.0/Arrowhead-5.0.uml','profile-library-sysml/distribution/SysML v1.6/Metamodel and Profile/ArrowheadProfile_v5.0.profile.uml']:
 path=R/relative
 if not path.exists():path=next((R/'profile-library-sysml/distribution/SysML v1.6').rglob(Path(relative).name))
 src(path)
generator_inputs={p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in [Path(__file__),Path(__file__).with_name('ArrowheadDSL.template.txt'),Path(__file__).with_name('ArrowheadProfile_v5.3.template.txt'),Path(__file__).with_name('update_arrowhead_dsl.py')] if p.exists()}

counts=dict(systems=len(systems),services=sum(len(s['services']) for s in systems),interfaces=sum(sum(p in v for p in ['http','mqtt','amqp']) for s in systems for v in s['services']),operations=len(inventory))
summary=[dict(name=s['name'],group=s['group'],services=len(s['services']),interfaces=sum(sum(p in v for p in ['http','mqtt','amqp']) for v in s['services']),operations=sum(o['system']==s['name'] for o in inventory),defaultPort=s['defaultPort'],consumedDependencies=s['consumed'],unregisteredEndpoints=s['unregistered']) for s in systems]
(D/'sources.json').write_text(json.dumps(dict(modelVersion='5.3.0',dslRevisionDate='2026-11-15',dslRules={'mqtt':'5.0','SysD.FunctionalProperties':'String[1..*]','IDD.Port':'Integer[1]','Protocol.StatusCode':'StatusKodKind[1..*]','portAnnotation':'FullPort'},date='2026-11-14',provenance=provenance,generatorInputs=generator_inputs,inputs=manifest,counts=counts,systems=summary,operations=inventory,documentationDifferences=differences),indent=2)+'\n')
(O/'sources.json').write_bytes((D/'sources.json').read_bytes())

# Generate a separate Papyrus 5.3 entry point. Preserve the original 5.0 diagrams and IDs.
original_v1=R/'profile-library-sysml/distribution/SysML v1.6'
for folder in ['ArrowheadPrinciples','EclipseArrowhead-5.0']:
 source=original_v1/folder;target=D/'SysML v1.6'/folder
 if source.resolve()!=target.resolve():shutil.copytree(source,target,dirs_exist_ok=True)
profile_target=D/'SysML v1.6/Metamodel and Profile';profile_target.mkdir(parents=True,exist_ok=True)
profile_source=next(original_v1.rglob('ArrowheadProfile_v5.0.profile.uml')).parent
for p in profile_source.glob('ArrowheadProfile_v5.0.profile.*'):
 target=profile_target/p.name
 if p.resolve()!=target.resolve():shutil.copy2(p,target)
profile_seed=Path(__file__).with_name('ArrowheadProfile_v5.3.template.txt')
if profile_seed.exists():(profile_target/'ArrowheadProfile_v5.3.profile.uml').write_bytes(profile_seed.read_bytes())
for suffix in ['di','notation']:
 source=profile_target/('ArrowheadProfile_v5.0.profile.'+suffix)
 if source.exists():(profile_target/('ArrowheadProfile_v5.3.profile.'+suffix)).write_text(source.read_text().replace('ArrowheadProfile_v5.0','ArrowheadProfile_v5.3'))

prune_notation(profile_target/'ArrowheadProfile_v5.3.profile.notation',profile_target/'ArrowheadProfile_v5.3.profile.uml')

V=D/'SysML v1.6/EclipseArrowhead-5.3';V.mkdir(parents=True,exist_ok=True)
XMI='http://www.omg.org/spec/XMI/20131001';UML='http://www.eclipse.org/uml2/5.0.0/UML';BLOCKS='http://www.eclipse.org/papyrus/sysml/1.6/SysML/Blocks'
for prefix,ns in [('xmi',XMI),('xsi','http://www.w3.org/2001/XMLSchema-instance'),('uml',UML),('Blocks',BLOCKS),('PortsAndFlows','http://www.eclipse.org/papyrus/sysml/1.6/SysML/PortsAndFlows'),('ArrowheadDSL','http://www.eclipse.org/papyrus/arrowhead'),('ecore','http://www.eclipse.org/emf/2002/Ecore'),('standard','http://www.eclipse.org/uml2/5.0.0/UML/Profile/Standard')]:ET.register_namespace(prefix,ns)
def xid(key):return '_ah53_'+hashlib.sha256(key.encode()).hexdigest()[:24]
def el(parent,tag,kind,key,**attrs):
 attrs={f'{{{XMI}}}id':xid(key),**attrs}
 if kind:attrs[f'{{{XMI}}}type']='uml:'+kind
 return ET.SubElement(parent,tag,attrs)
def comment(parent,key,text):
 c=el(parent,'ownedComment','Comment',key);ET.SubElement(c,'body').text=text
old=R/'profile-library-sysml/distribution/SysML v1.6/EclipseArrowhead-5.0'
tree=ET.ElementTree(ET.fromstring((old/'Arrowhead-5.0.uml').read_bytes()));root=tree.getroot();root.set('xmlns:ecore','http://www.eclipse.org/emf/2002/Ecore');model=root.find(f'{{{UML}}}Model');model.set('name','EclipseArrowhead_5_3_0')
release=el(model,'packagedElement','Package','release',name='Release_5_3_0')
comment(release,'release-comment','Java reference release/5.3, 5.3.0 release candidate. Generated 2026-11-14. All current definitions are in this package; earlier model elements remain as a legacy reference for the retained diagrams. Native sysMonitor is conditional on sysmonitor.enabled=true. See sources.json and CROSS-LANGUAGE-DIFFERENCES.md.')
# UML primitive references use standard library hrefs, preserving typed wire DTOs.
primitives={n:'#'+n for n in ['String','Integer','Real','Boolean']}
def type_ref(parent,ty,dtos,enums,scope):
 st,base,arr=scalar(ty or '')
 if st:ET.SubElement(parent,'type',{f'{{{XMI}}}type':'uml:PrimitiveType','href':'pathmap://UML_LIBRARIES/UMLPrimitiveTypes.library.uml'+primitives[st]})
 elif base in dtos or base in enums:parent.set('type',xid(scope+'/data/'+base))
 elif base in core['dtos'] or base in core['enums']:parent.set('type',xid('ServiceRegistry/data/'+base))
 else:parent.set('type',xid('JSONValue'))
 if arr:
  el(parent,'lowerValue','LiteralInteger',parent.get(f'{{{XMI}}}id')+'/lower',value='0')
  el(parent,'upperValue','LiteralUnlimitedNatural',parent.get(f'{{{XMI}}}id')+'/upper',value='*')
 else:el(parent,'lowerValue','LiteralInteger',parent.get(f'{{{XMI}}}id')+'/lower',value='0')
json_type=el(release,'packagedElement','DataType','JSONValue',name='JSONValue')
ids={};interface_ids={}
for sy in systems:
 name=sy['name'];pkg=el(release,'packagedElement','Package',name+'/package',name=name)
 comment(pkg,name+'/source',sy['summary']+' Source: '+sy['source'])
 data=el(pkg,'packagedElement','Package',name+'/data',name='Data')
 for en,values in sorted(sy['enums'].items()):
  enode=el(data,'packagedElement','Enumeration',name+'/data/'+en,name=en)
  for i,value in enumerate(values):el(enode,'ownedLiteral','EnumerationLiteral',name+'/enum/'+en+'/'+str(i),name=value)
 for dn,fields in sorted(sy['dtos'].items()):
  dnnode=el(data,'packagedElement','DataType',name+'/data/'+dn,name=dn)
  for f in fields:
   field=el(dnnode,'ownedAttribute','Property',name+'/data/'+dn+'/'+f['name'],name=f['name'])
   type_ref(field,f['type'],sy['dtos'],sy['enums'],name)
   comment(field,name+'/data/'+dn+'/'+f['name']+'/source','Source type: '+f['type']+'. '+f.get('description',''))
 classes={}
 for suffix in ['_SysD','_SysDD','']:
  key=name+suffix;cl=el(pkg,'packagedElement','Class',key,name=key,isAbstract='false');classes[suffix]=cl
  ET.SubElement(root,f'{{{BLOCKS}}}Block',{f'{{{XMI}}}id':xid(key+'/Block'),'base_Class':xid(key)})
  ET.SubElement(root,'{http://www.eclipse.org/papyrus/arrowhead}'+{'_SysD':'SysD','_SysDD':'SysDD','':'System_Implementation'}[suffix],{f'{{{XMI}}}id':xid(key+'/DSL'),'base_Class':xid(key)})
  comment(cl,key+'/comment',sy['summary']+' Version 5.3.0; default port '+str(sy['defaultPort'])+'; source '+sy['source'])
  if suffix!='_SysD':el(cl,'generalization','Generalization',key+'/generalization',general=xid(name+('_SysD' if suffix=='_SysDD' else '_SysDD')))
 ids[name]=xid(name)
 for sv in sy['services']:
  sn=sv['serviceDefinition'];sdkey=name+'/'+sn+'/SD';sd=el(pkg,'packagedElement','Class',sdkey,name=sn+'_SD')
  ET.SubElement(root,'{http://www.eclipse.org/papyrus/arrowhead}SD',{f'{{{XMI}}}id':xid(sdkey+'/DSL'),'base_Class':xid(sdkey)})
  port=el(classes['_SysD'],'ownedAttribute','Port',sdkey+'/port',name=sn+'_SD',type=xid(sdkey),isService='true',aggregation='composite')
  if sn=='sysMonitor':el(port,'lowerValue','LiteralInteger',sdkey+'/port/lower',value='0')
  for proto in ['http','mqtt','amqp']:
   if proto not in sv:continue
   it=sv[proto];key=name+'/'+sn+'/'+proto;idd=el(pkg,'packagedElement','Class',key,name=sn+'_'+proto.upper()+'_IDD')
   ET.SubElement(root,'{http://www.eclipse.org/papyrus/arrowhead}IDD',{f'{{{XMI}}}id':xid(key+'/DSL'),'base_Class':xid(key)})
   el(idd,'generalization','Generalization',key+'/generalization',general=xid(sdkey))
   comment(idd,key+'/source','Source: '+it.get('source',sy['source'])+'; '+it.get('registration',''))
   wireport=el(classes['_SysDD'],'ownedAttribute','Port',key+'/port',name=sn+'_'+proto,type=xid(key),isService='true',aggregation='composite')
   if proto in ['mqtt','amqp']:el(wireport,'lowerValue','LiteralInteger',key+'/port/lower',value='0')
   for i,op in enumerate(it['ops']):
    opkey=key+'/'+str(i);oper=el(idd,'ownedOperation','Operation',opkey,name=op['name'])
    address=op.get('fullPath',op.get('path',it.get('baseTopic','')+op['name']))
    comment(oper,opkey+'/wire',json.dumps(dict(protocol=proto,method=op.get('method'),address=address,source=op.get('source',it.get('source',sy['source'])),query=op.get('queryParams',[]),path=op.get('pathVars',[]),status=op.get('codes',[]))))
    for direction,ty in [('in',op.get('requestBody',op.get('payload'))),('return',op.get('response'))]:
     ty=re.sub(r'^ResponseEntity<(.*)>$',r'\1',ty or '')
     if not ty or ty in ['void','Void']:continue
     par=el(oper,'ownedParameter','Parameter',opkey+'/'+direction,name='request' if direction=='in' else 'response',direction=direction)
     type_ref(par,ty,sy['dtos'],sy['enums'],name)
 if sy['unregistered']:
  epnode=el(pkg,'packagedElement','Interface',name+'/unregistered',name='UnregisteredEndpoints')
  for i,ep in enumerate(sy['unregistered']):
   oper=el(epnode,'ownedOperation','Operation',name+'/unregistered/'+str(i),name=(ep.get('javaMethod') or 'dispatch')+'_'+str(i))
   comment(oper,name+'/unregistered/'+str(i)+'/source',json.dumps(ep))
cloud=el(release,'packagedElement','Class','ArrowheadLocalCloud',name='ArrowheadLocalCloud')
ET.SubElement(root,f'{{{BLOCKS}}}Block',{f'{{{XMI}}}id':xid('cloud/Block'),'base_Class':xid('ArrowheadLocalCloud')})
for name,target in ids.items():
 prop=el(cloud,'ownedAttribute','Property','cloud/'+name,name=name[0].lower()+name[1:],type=target,aggregation='composite')
 el(prop,'lowerValue','LiteralInteger','cloud/'+name+'/lower',value='0')
solc=el(release,'packagedElement','Class','ArrowheadSystemOfLocalClouds',name='ArrowheadSystemOfLocalClouds')
ET.SubElement(root,f'{{{BLOCKS}}}Block',{f'{{{XMI}}}id':xid('solc/Block'),'base_Class':xid('ArrowheadSystemOfLocalClouds')})
prop=el(solc,'ownedAttribute','Property','solc/clouds',name='clouds',type=xid('ArrowheadLocalCloud'),aggregation='composite')
el(prop,'lowerValue','LiteralInteger','solc/clouds/lower',value='0');el(prop,'upperValue','LiteralUnlimitedNatural','solc/clouds/upper',value='*')
for element in root.iter():
 if element.get('href'):
  href=element.get('href').replace('ArrowheadProfile_v5.0.profile.uml','ArrowheadProfile_v5.3.profile.uml')
  if 'ArrowheadProfile_v5.3.profile.uml#' in href:href='../Metamodel%20and%20Profile/ArrowheadProfile_v5.3.profile.uml#'+href.split('#',1)[1]
  element.set('href',href)
annotate_full_ports(root)
ET.indent(tree,space='  ');tree.write(V/'Arrowhead-5.3.uml',encoding='UTF-8',xml_declaration=True)
for suffix in ['di','notation','_en_US.properties']:
 original=old/('Arrowhead-5.0'+('.'+suffix if not suffix.startswith('_') else suffix))
 if original.exists():
  dest=V/('Arrowhead-5.3'+('.'+suffix if not suffix.startswith('_') else suffix));dest.write_text(original.read_text().replace('Arrowhead-5.0.uml','Arrowhead-5.3.uml').replace('Arrowhead-5.0.notation','Arrowhead-5.3.notation'))
# New overview in the existing Papyrus notation syntax, leaving legacy diagrams intact.
notation=V/'Arrowhead-5.3.notation';nt=ET.parse(notation);nr=nt.getroot();nr.set('xmlns:uml',UML);nr.set('xmlns:ecore','http://www.eclipse.org/emf/2002/Ecore');NX='http://www.omg.org/XMI';NN='http://www.eclipse.org/gmf/runtime/1.0.3/notation'
ET.register_namespace('notation',NN)
diagram=ET.SubElement(nr,f'{{{NN}}}Diagram',{f'{{{NX}}}id':xid('overview'), 'type':'PapyrusUMLClassDiagram','name':'Release 5.3 Core and Support Systems','measurementUnit':'Pixel'})
for i,sy in enumerate(systems):
 shape=ET.SubElement(diagram,'children',{f'{{{NX}}}type':'notation:Shape',f'{{{NX}}}id':xid('overview/'+sy['name']),'type':'Class_Shape','fontName':'Arial','fontHeight':'11','fillColor':'16777215'})
 ET.SubElement(shape,'children',{f'{{{NX}}}type':'notation:DecorationNode',f'{{{NX}}}id':xid('label/'+sy['name']),'type':'Class_NameLabel'})
 ET.SubElement(shape,'element',{f'{{{NX}}}type':'uml:Class','href':'Arrowhead-5.3.uml#'+ids[sy['name']]})
 ET.SubElement(shape,'layoutConstraint',{f'{{{NX}}}type':'notation:Bounds',f'{{{NX}}}id':xid('bounds/'+sy['name']),'x':str(30+(i%5)*310),'y':str(30+(i//5)*110),'width':'285','height':'75'})
ET.SubElement(diagram,'element',{f'{{{NX}}}type':'uml:Package','href':'Arrowhead-5.3.uml#'+xid('release')})
ET.indent(nt,space='  ');nt.write(notation,encoding='UTF-8',xml_declaration=True)
# Coverage is produced from the exact same inventory as both model formats.
rows=['# Eclipse Arrowhead 5.3 model coverage','','Java reference release/5.3, snapshot 2026-11-14. Five core variants and twenty support systems, including the legacy SoSConfigurator.','','| System | Role | Services | Interfaces | Operations |','|---|---|---:|---:|---:|']
for s in summary:rows.append(f"| {s['name']} | {s['group']} | {s['services']} | {s['interfaces']} | {s['operations']} |")
rows+=['',f"Totals: {counts['systems']} systems, {counts['services']} services, {counts['interfaces']} protocol interfaces, {counts['operations']} protocol operations.",'','Operations are counted once per transport. Native sysMonitor entries describe conditional publication. Console and diagnostic routes are listed separately in sources.json and UnregisteredEndpoints. Route presence and permissive DTO cardinalities do not establish runtime interchangeability.']
(O/'COVERAGE.md').write_text('\n'.join(rows)+'\n')
print(json.dumps(counts))
