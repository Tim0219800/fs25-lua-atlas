"""Extraction statique de l'API Lua FS25 (lecture seule des sources).

Usage : python -I outils/extraire.py <dossier dataS/scripts> <scriptBinding.xml> donnees/<version>/statique.json [version]
La version du jeu vient du 4e argument, sinon du nom du dossier de sortie.
Ne recopie aucun corps de fonction : uniquement noms, paramètres, annotations, numéros de ligne.
"""
import json, re, sys, xml.etree.ElementTree as ET
from pathlib import Path

RE_FUNC = re.compile(r'^(local\s+)?function\s+([\w.:]+)\s*\(([^)]*)\)')
RE_CLASS = re.compile(r'^local\s+\w+\s*=\s*Class\(\s*([\w.]+)\s*(?:,\s*([\w.]+))?')
RE_TABLE = re.compile(r'^([A-Z]\w*)\s*=\s*\{\s*\}?')
RE_GLOBAL = re.compile(r'^\s*(g_\w+)\s*=')
RE_DOC = re.compile(r'^--\s*@(param|return|category)\s+(.*)$')
RE_SPEC = re.compile(r'SpecializationUtil\.(registerEvent|registerEventListener|registerFunction|registerOverwrittenFunction)\(\s*\w+\s*,\s*"(\w+)"')
RE_MSG_SUB = re.compile(r'g_messageCenter:subscribe\(\s*(MessageType\.\w+)')
RE_MSG_PUB = re.compile(r'g_messageCenter:publish\w*\(\s*(MessageType\.\w+)')


def parse_doc(lines):
    """Bloc de commentaires '---' / '--' qui précède une fonction."""
    resume, params, rets, cat = [], [], [], None
    for l in lines:
        m = RE_DOC.match(l)
        if m:
            kind, rest = m.groups()
            parts = rest.split(None, 2)
            if kind == 'param':
                params.append({'type': parts[0] if parts else None,
                               'name': parts[1] if len(parts) > 1 else None,
                               'desc': parts[2] if len(parts) > 2 else ''})
            elif kind == 'return':
                rets.append({'type': parts[0] if parts else None, 'desc': ' '.join(parts[1:])})
            else:
                cat = rest.strip()
        else:
            t = l.lstrip('-').strip()
            if t:
                resume.append(t)
    return {'resume': ' '.join(resume), 'params': params, 'returns': rets, 'category': cat}


def parse_file(path, rel):
    src = path.read_text(encoding='utf-8', errors='replace').splitlines()
    out = {'file': rel, 'classes': {}, 'functions': [], 'globals': [], 'spec': [],
           'msgSub': [], 'msgPub': [], 'bodyless': True}
    doc = []
    for i, raw in enumerate(src, 1):
        line = raw.rstrip()
        s = line.strip()
        if s.startswith('--') and not s.startswith('-- Copyright'):
            doc.append(s)
            continue
        m = RE_FUNC.match(line)
        if m:
            local, name, args = m.groups()
            d = parse_doc(doc)
            sep = ':' if ':' in name else '.'
            owner, _, fn = name.rpartition(sep)
            out['functions'].append({'name': name, 'owner': owner or None, 'method': sep == ':',
                                     'local': bool(local), 'args': [a.strip() for a in args.split(',') if a.strip()],
                                     'line': i, **d})
            # fichier "signatures seules" : la ligne suivante non vide est 'end'
            nxt = next((x.strip() for x in src[i:i + 3] if x.strip()), '')
            empty = s.endswith(' end') or nxt == 'end'
            out['functions'][-1]['bodyless'] = empty
            if not empty:
                out['bodyless'] = False
        else:
            mc = RE_CLASS.match(line)
            if mc:
                out['classes'].setdefault(mc.group(1), {})['parent'] = mc.group(2)
                out['classes'][mc.group(1)]['line'] = i
            mt = RE_TABLE.match(line)
            if mt:
                c = out['classes'].setdefault(mt.group(1), {})
                c.setdefault('line', i)
                d = parse_doc(doc)
                if d['resume']:
                    c['resume'] = d['resume']
                if d['category']:
                    c['category'] = d['category']
            mg = RE_GLOBAL.match(line)
            if mg:
                out['globals'].append({'name': mg.group(1), 'line': i})
        for kind, nm in RE_SPEC.findall(line):
            out['spec'].append({'kind': kind, 'name': nm, 'line': i})
        out['msgSub'] += [{'msg': x, 'line': i} for x in RE_MSG_SUB.findall(line)]
        out['msgPub'] += [{'msg': x, 'line': i} for x in RE_MSG_PUB.findall(line)]
        if s:
            doc = []
    if not out['functions']:
        out['bodyless'] = False
    return out


def parse_binding(path):
    res = []
    for f in ET.parse(path).getroot().iter('function'):
        def params(tag):
            node = f.find(tag)
            return [] if node is None else [{'name': p.get('name'), 'type': p.get('type'),
                                             'optional': p.get('optional')} for p in node.iter('param')]
        res.append({'name': f.get('name'), 'category': f.get('category'),
                    'desc': f.get('desc'), 'inputs': params('input'), 'outputs': params('output')})
    return res


def main(scripts, binding, sortie, version=None):
    root = Path(scripts)
    files = [parse_file(p, p.relative_to(root).as_posix()) for p in sorted(root.rglob('*.lua'))]
    data = {'gameVersion': version or Path(sortie).parent.name, 'files': files, 'engine': parse_binding(binding)}
    Path(sortie).parent.mkdir(parents=True, exist_ok=True)
    Path(sortie).write_text(json.dumps(data, ensure_ascii=False, indent=1), encoding='utf-8')
    nf = sum(len(f['functions']) for f in files)
    print(f"{len(files)} fichiers, {nf} fonctions, {len(data['engine'])} fonctions moteur, "
          f"{sum(f['bodyless'] for f in files)} fichiers signatures seules")


if __name__ == '__main__':
    main(*sys.argv[1:5])
