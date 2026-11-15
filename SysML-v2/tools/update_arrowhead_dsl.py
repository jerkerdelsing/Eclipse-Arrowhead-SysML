#!/usr/bin/env python3
"""Normalize the active Arrowhead 5.3 DSL and its Papyrus references."""
from pathlib import Path
import hashlib
import re
import xml.etree.ElementTree as ET

XMI = 'http://www.omg.org/spec/XMI/20131001'
UML = 'http://www.eclipse.org/uml2/5.0.0/UML'
DSL = 'http://www.eclipse.org/papyrus/arrowhead'
ID = '{' + XMI + '}id'
TYPE = '{' + XMI + '}type'


def read_xml(path):
    namespaces = dict(value for _, value in ET.iterparse(path, events=['start-ns']))
    return ET.parse(path), namespaces


def write_xml(tree, path, namespaces):
    root = tree.getroot()
    used = {name.split('}')[0][1:] for element in root.iter()
            for name in [element.tag, *element.attrib] if name.startswith('{')}
    for prefix, uri in namespaces.items():
        if re.fullmatch(r'ns\d+', prefix):
            prefix = 'xmi' if 'XMI' in uri else 'external'
        ET.register_namespace(prefix, uri)
        if uri not in used:
            root.set('xmlns:' + prefix if prefix else 'xmlns', uri)
    ET.indent(tree, space='  ')
    tree.write(path, encoding='UTF-8', xml_declaration=True)


def multiplicity(element, lower, upper):
    for tag, value, kind in [('lowerValue', lower, 'LiteralInteger'),
                             ('upperValue', upper, 'LiteralUnlimitedNatural')]:
        child = element.find(tag)
        if child is None:
            child = ET.SubElement(element, tag, {TYPE: 'uml:' + kind,
                                  ID: element.get(ID) + '_' + tag})
        child.set('value', str(value))


def update_profile(path):
    tree, namespaces = read_xml(path)
    root = tree.getroot()
    profile = root.find('{' + UML + '}Profile')
    # Rebuild the dynamic Ecore definition from the updated UML declarations.
    for annotation in list(profile.findall('eAnnotations')):
        if any(c.get(TYPE) == 'ecore:EPackage' for c in annotation):
            profile.remove(annotation)
    elements = list(profile.iter())
    enums = {e.get('name'): e for e in elements if e.get(TYPE) == 'uml:Enumeration'}
    old = enums.get('MQTT3.1.1_MessageTypeKind')
    new = enums['MQTT5.0_MessageTypeKind']
    mapping = {}
    if old is not None:
        mapping[old.get(ID)] = new.get(ID)
        literals = {c.get('name'): c.get(ID) for c in new.findall('ownedLiteral')}
        for literal in old.findall('ownedLiteral'):
            mapping[literal.get(ID)] = literals[literal.get('name')]
    for element in elements:
        for key, value in list(element.attrib.items()):
            if key == ID:
                continue
            if '#' in value:
                base, fragment = value.rsplit('#', 1)
                element.set(key, base + '#' + mapping.get(fragment, fragment))
            else:
                element.set(key, ' '.join(mapping.get(token, token) for token in value.split())
                            if any(token in mapping for token in value.split()) else value)
    for parent in elements:
        for child in list(parent):
            if child is old or child.get('name') in ['ProxyPort', 'E_ProxyPort_Port1']:
                parent.remove(child)
    for stereotype in profile.iter('packagedElement'):
        if stereotype.get(TYPE) != 'uml:Stereotype':
            continue
        for prop in stereotype.findall('ownedAttribute'):
            if stereotype.get('name') == 'SysD' and prop.get('name') == 'FunctionalProperties':
                prop.find('type').set('href', 'pathmap://UML_LIBRARIES/UMLPrimitiveTypes.library.uml#String')
                multiplicity(prop, 1, '*')
            if stereotype.get('name') == 'IDD' and prop.get('name') == 'Port':
                multiplicity(prop, 1, 1)
            if prop.get('name') == 'StatusCode':
                multiplicity(prop, 1, '*')
    write_xml(tree, path, namespaces)


def prune_notation(path, semantic):
    """Remove views of retired profile elements and edges attached to those views."""
    tree, namespaces = read_xml(path)
    root = tree.getroot()
    valid = {e.get(ID) for e in ET.parse(semantic).iter() if e.get(ID)}
    removed = set()
    for parent in list(root.iter()):
        for child in list(parent):
            references = [e.get('href') for e in child.findall('element') if e.get('href')]
            if any('#' in value and value.rsplit('#', 1)[1] not in valid for value in references):
                removed.update(v for e in child.iter() for k, v in e.attrib.items() if k.endswith('}id'))
                parent.remove(child)
    changed = True
    while changed:
        changed = False
        for parent in list(root.iter()):
            for child in list(parent):
                if any(child.get(k) in removed for k in ['source', 'target']):
                    removed.update(v for e in child.iter() for k, v in e.attrib.items() if k.endswith('}id'))
                    parent.remove(child)
                    changed = True
    write_xml(tree, path, namespaces)


def update_v2(text):
    text = re.sub(r'\s*enum def MQTT311MessageTypeKind\s*\{[^}]*\}', '', text)
    text = re.sub(r"\s*alias 'MQTT3\.1\.1_MessageTypeKind' for MQTT311MessageTypeKind;", '', text)
    text = re.sub(r'\s*metadata def ProxyPort\s*(?::>\s*AFPVNDatatypes::ProxyPort)?\s*;', '', text)
    text = text.replace('ScalarValues::Integer[0..1]', 'ScalarValues::Integer[1]')
    text = text.replace('StatusKodKind[0..*]', 'StatusKodKind[1..*]')
    text = text.replace('MQTT311MessageTypeKind', 'MQTT50MessageTypeKind')
    return text


def annotate_full_ports(root):
    """Migrate existing applications and annotate every UML port in this model."""
    full = '{' + DSL + '}FullPort'
    for element in root:
        if element.tag.endswith('}ProxyPort'):
            element.tag = element.tag.rsplit('}', 1)[0] + '}FullPort'
    annotated = {e.get('base_Port') for e in root if e.tag == full}
    ports = [e for e in root.iter() if e.get(TYPE) == 'uml:Port' and e.get(ID)]
    for port in ports:
        identifier = port.get(ID)
        if identifier not in annotated:
            ET.SubElement(root, full, {
                ID: '_afull_' + hashlib.sha256(identifier.encode()).hexdigest()[:24],
                'base_Port': identifier})
            annotated.add(identifier)


if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('distribution', type=Path)
    args = parser.parse_args()
    folder = args.distribution
    for file in ['ArrowheadDSL.sysml', 'tools/ArrowheadDSL.template.txt']:
        path = folder / 'SysML-v2' / file
        path.write_text(update_v2(path.read_text()))
    path = folder / 'SysML v1.6/Metamodel and Profile/ArrowheadProfile_v5.3.profile.uml'
    update_profile(path)
    prune_notation(path.with_suffix('.notation'), path)
    model = folder / 'SysML v1.6/EclipseArrowhead-5.3/Arrowhead-5.3.uml'
    tree, namespaces = read_xml(model)
    annotate_full_ports(tree.getroot())
    write_xml(tree, model, namespaces)
