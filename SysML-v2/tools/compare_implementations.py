#!/usr/bin/env python3
"""Extract current native HTTP catalogues offline, without starting systems."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile


def run(command, cwd, env=None):
    result = subprocess.run(command, cwd=cwd, env=env, check=True,
                            stdout=subprocess.PIPE, text=True)
    return json.loads(result.stdout)


def copy_go(source, destination):
    for path in source.rglob('*'):
        if not path.is_file() or path.name.endswith('_test.go'):
            continue
        if path.suffix != '.go' and path.name not in ('go.mod', 'go.sum'):
            continue
        if {'vendor', 'bin', '.git', 'model-route-inventory'}.intersection(path.relative_to(source).parts):
            continue
        target = destination / path.relative_to(source)
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(path, target)


def go_routes(source, temporary, core):
    folder = temporary / ('go-core' if core else 'go-support')
    copy_go(source, folder)
    module = (folder / 'go.mod').read_text().splitlines()[0].split()[1]
    main = folder / 'cmd/model-route-inventory/main.go'
    main.parent.mkdir(parents=True, exist_ok=True)
    roles = ('for _,name:=range []string{"authentication","consumer-authorization",'
             '"serviceorchestration-dynamic","serviceorchestration-simple"}' if core
             else 'for name:=range core.Systems')
    main.write_text('package main\nimport("encoding/json";"os";"' + module +
                    '/internal/core")\nfunc main(){out:=map[string]any{};' + roles +
                    '{s,_:=core.OpenStore("");a,e:=core.New(core.Config{Role:name,Name:name},s,nil);'
                    'if e!=nil{panic(e)};out[name]=a.Routes};json.NewEncoder(os.Stdout).Encode(out)}')
    env = dict(os.environ, GOWORK='off', GOPROXY='off', GOSUMDB='off',
               GOCACHE=str(temporary / 'go-cache'))
    return run(['go', 'run', './cmd/model-route-inventory'], folder, env)


def rust_routes(source, temporary):
    folder = temporary / 'rust-routes'
    (folder / 'src').mkdir(parents=True)
    (folder / 'Cargo.toml').write_text(
        '[package]\nname="arrowhead-route-inventory"\nversion="0.1.0"\nedition="2024"\n'
        '[dependencies]\nserde={version="1",features=["derive"]}\nserde_json="1"\n')
    for area, package in [('core', 'ah5-core-rust'), ('support', 'ah5-support-runtime-rust')]:
        base = source / package / 'src'
        config = (base / 'config.rs').read_text().split('pub const ROLES:', 1)[1]
        config = 'pub const ROLES:' + config.split('];', 1)[0] + '];'
        (folder / 'src' / (area + 'config.rs')).write_text(config)
        (folder / 'src' / (area + '.rs')).write_text(
            (base / 'contracts.rs').read_text().replace('crate::config::', 'crate::' + area + 'config::'))
    (folder / 'src/main.rs').write_text(
        'mod core;mod coreconfig;mod support;mod supportconfig;fn main(){'
        'let mut out=serde_json::Map::new();'
        'for(role,name,_)in coreconfig::ROLES{out.insert(name.into(),serde_json::to_value(core::routes(role)).unwrap());}'
        'for(role,name,_)in supportconfig::ROLES{out.insert(name.into(),serde_json::to_value(support::routes(role)).unwrap());}'
        'println!("{}",serde_json::Value::Object(out));}')
    return run(['cargo', 'run', '--offline', '--quiet'], folder)


def normalized(path):
    return re.sub(r'\{[^{}]*\}', '{}', path.split('?')[0].rstrip('/'))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--go-root', type=Path, required=True)
    parser.add_argument('--rust-root', type=Path, required=True)
    parser.add_argument('--java-inventory', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    java = json.loads(args.java_inventory.read_text())
    with tempfile.TemporaryDirectory(prefix='arrowhead-model-routes-') as work:
        temporary = Path(work)
        go = go_routes(args.go_root / 'ah5-TimeManager-go', temporary, False)
        core = go_routes(args.go_root / 'ah5-core-go/authentication', temporary, True)
        names = {'authentication': 'Authentication', 'consumer-authorization': 'ConsumerAuthorization',
                 'serviceorchestration-dynamic': 'DynamicServiceOrchestration',
                 'serviceorchestration-simple': 'SimpleStoreServiceOrchestration'}
        go.update({names[key]: value for key, value in core.items()})
        text = (args.go_root / 'ah5-core-go/serviceregistry/handlers.go').read_text()
        go['ServiceRegistry'] = [dict(method=method, path='/serviceregistry' + path)
                                 for method, path in re.findall(
                                     r's\.(?:route|mux.HandleFunc)\("(GET|POST|PUT|DELETE|PATCH) "\s*\+\s*b\s*\+\s*"([^"]+)"', text)]
        rust = rust_routes(args.rust_root, temporary)
    results = []
    for system in java['systems']:
        name = system['name']
        reference = {(op['method'], normalized(op['path'])) for op in java['operations']
                     if op['system'] == name and op['protocol'] == 'http'}
        for language, native in [('Go', go), ('Rust', rust)]:
            row = dict(system=name, language=language, referenceCount=len(reference))
            if name not in native:
                row['status'] = ('not-evaluated' if name == 'LocalCloudManager' or
                                 (language == 'Go' and name == 'LocalCloudConfigurator') else 'no-system-folder')
            else:
                keys = {(route['method'], normalized(route['path'])) for route in native[name]
                        if route.get('implemented', True)}
                row.update(status='source-route-declarations' if name == 'ServiceRegistry' and language == 'Go'
                           else 'runtime-route-catalogue', matches=len(reference & keys),
                           javaOnly=[dict(method=m, path=p) for m, p in sorted(reference - keys)],
                           nativeOnly=[dict(method=m, path=p) for m, p in sorted(keys - reference)],
                           unsupported=[r for r in native[name] if not r.get('implemented', True)])
            results.append(row)
    for filename, value in [('go-routes.json', go), ('rust-routes.json', rust),
                            ('route-differences.json', results)]:
        (args.output / filename).write_text(json.dumps(value, indent=2) + '\n')
    print('Extracted and compared HTTP routes for', len(java['systems']), 'Java systems.')


if __name__ == '__main__':
    main()
