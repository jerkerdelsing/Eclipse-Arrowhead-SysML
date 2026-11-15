#!/usr/bin/env python3
"""Check the five requested Arrowhead DSL rules in both active model formats."""
import argparse
import json
from pathlib import Path
import re
import xml.etree.ElementTree as ET

XMI = '{http://www.omg.org/spec/XMI/20131001}'
UML = '{http://www.eclipse.org/uml2/5.0.0/UML}'
DSL = '{http://www.eclipse.org/papyrus/arrowhead}'


def lower_upper(prop):
    low, high = prop.find('lowerValue'), prop.find('upperValue')
    return (low.get('value', '0') if low is not None else '1',
            high.get('value', '0') if high is not None else '1')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('distribution', type=Path)
    folder = parser.parse_args().distribution
    profile_path = folder / 'SysML v1.6/Metamodel and Profile/ArrowheadProfile_v5.3.profile.uml'
    profile_root = ET.parse(profile_path).getroot()
    profile = profile_root.find(UML + 'Profile')
    stereotypes = {e.get('name'): e for e in profile.iter()
                   if e.get(XMI + 'type') == 'uml:Stereotype' and e.get('name')}
    enums = {e.get('name'): e for e in profile.iter()
             if e.get(XMI + 'type') == 'uml:Enumeration'}
    assert 'ProxyPort' not in stereotypes and 'FullPort' in stereotypes
    assert 'MQTT3.1.1_MessageTypeKind' not in enums
    mqtt = enums['MQTT5.0_MessageTypeKind']
    method = next(p for p in stereotypes['ServiceProtocol_MQTT'].findall('ownedAttribute')
                  if p.get('name') == 'Method')
    assert method.get('type') == mqtt.get(XMI + 'id')
    for name, field, primitive, bounds in [
            ('SysD', 'FunctionalProperties', 'String', ('1', '*')),
            ('IDD', 'Port', 'Integer', ('1', '1'))]:
        prop = next(p for p in stereotypes[name].findall('ownedAttribute') if p.get('name') == field)
        assert prop.find('type').get('href').endswith('#' + primitive), (name, field)
        assert lower_upper(prop) == bounds, (name, field)
    protocols = ['ServiceProtocol_HTTP', 'ServiceProtocol_MQTT', 'ServiceProtocol_COAP']
    for name in protocols:
        prop = next(p for p in stereotypes[name].findall('ownedAttribute') if p.get('name') == 'StatusCode')
        assert lower_upper(prop) == ('1', '*'), name
    # Check the actual generated Ecore package, not only the editable UML declarations.
    packages = [c for annotation in profile.findall('eAnnotations') for c in annotation
                if c.get(XMI + 'type') == 'ecore:EPackage']
    assert len(packages) == 1, 'Expected one current, defined Ecore profile package'
    classes = {e.get('name'): e for e in packages[0].findall('eClassifiers')}
    assert 'ProxyPort' not in classes and 'MQTT311_MessageTypeKind' not in classes
    for name, field, primitive, upper in [
            ('SysD', 'FunctionalProperties', 'String', '-1'), ('IDD', 'Port', 'Integer', '1')]:
        prop = next(p for p in classes[name].findall('eStructuralFeatures') if p.get('name') == field)
        assert prop.get('lowerBound', '0') == '1' and prop.get('upperBound', '1') == upper
        assert prop.find('eType').get('href').endswith('#//' + primitive)
    for name in protocols:
        prop = next(p for p in classes[name].findall('eStructuralFeatures') if p.get('name') == 'StatusCode')
        assert prop.get('lowerBound') == '1' and prop.get('upperBound') == '-1'
    method = next(p for p in classes['ServiceProtocol_MQTT'].findall('eStructuralFeatures')
                  if p.get('name') == 'Method')
    # UML2 removes punctuation when deriving Ecore classifier names.
    assert method.get('eType') == classes['MQTT50_MessageTypeKind'].get(XMI + 'id')
    # Check v2 vocabulary/cardinalities, with the MQTT wrapper's inherited method type.
    text = (folder / 'SysML-v2/ArrowheadDSL.sysml').read_text()
    assert 'ProxyPort' not in text and 'MQTT311' not in text and 'MQTT3.1.1' not in text
    assert re.search(r'metadata def SysD\s*\{[^}]*FunctionalProperties\s*:\s*String\[1\.\.\*\]', text)
    assert re.search(r'metadata def IDD\s*:>\s*SD\s*\{[^}]*Port\s*:\s*ScalarValues::Integer\[1\]', text)
    assert re.search(r'ArrowHeadServiceInterfaceMQTT\s*\{\s*attribute Method\s*:\s*MQTT50MessageTypeKind\[1\]', text)
    for name in protocols:
        assert re.search(r'metadata def ' + name + r'\b[^}]*StatusCode\s*:\s*StatusKodKind\[1\.\.\*\]', text)
    v2_ports = 0
    for path in (folder / 'SysML-v2').glob('*.sysml'):
        text = path.read_text()
        assert '@ProxyPort' not in text
        if '@SysD ' in text:
            ports = re.findall(r'^\s*port (?!def\b)[^\n]+', text, re.M)
            assert all('@FullPort' in port for port in ports), path.name
            v2_ports += len(ports)
    root = ET.parse(folder / 'SysML v1.6/EclipseArrowhead-5.3/Arrowhead-5.3.uml').getroot()
    assert not any(e.tag.endswith('}ProxyPort') for e in root)
    ports = {e.get(XMI + 'id') for e in root.iter()
             if e.get(XMI + 'type') == 'uml:Port' and e.get(XMI + 'id')}
    annotated = {e.get('base_Port') for e in root if e.tag == DSL + 'FullPort'}
    assert ports == annotated
    identifiers = [e.get(XMI + 'id') for e in root.iter() if e.get(XMI + 'id')]
    assert len(identifiers) == len(set(identifiers))
    # All surviving profile diagram targets must still exist after retiring ProxyPort/MQTT 3.1.1.
    ids = {e.get(XMI + 'id') for e in profile_root.iter() if e.get(XMI + 'id')}
    for e in ET.parse(profile_path.with_suffix('.notation')).iter():
        href = e.get('href', '')
        if 'ArrowheadProfile_v5.3.profile.uml#' in href:
            assert href.rsplit('#', 1)[1] in ids, href
    print(json.dumps(dict(result='PASS',rules=5,v2FullPorts=v2_ports,v1FullPorts=len(ports),
                          v1ProxyPorts=0,v2ProxyPorts=0,profileDefinitions=1)))


if __name__ == '__main__':
    main()
