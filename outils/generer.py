"""Génère stubs LuaLS + doc Markdown depuis donnees/<v>/statique.json et descriptions/<v>/*.json.

Usage : python -I outils/generer.py 1.25.1.0
Règle juridique : aucun texte libre GIANTS n'est recopié (ni corps, ni commentaires, ni 'desc' du binding).
Seuls noms, types, arités, catégories et renvois fichier:ligne sont repris ; les textes viennent de descriptions/.
"""
import json, re, sys
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TYPES = {'float': 'number', 'int': 'integer', 'entityId': 'integer', 'bool': 'boolean', 'any': 'any'}
LUA_KW = {'and', 'break', 'do', 'else', 'elseif', 'end', 'false', 'for', 'function', 'goto', 'if', 'in',
          'local', 'nil', 'not', 'or', 'repeat', 'return', 'then', 'true', 'until', 'while'}
V = None


def lt(t):
    if not t:
        return 'any'
    opt = t.endswith('?')
    t = t.rstrip('?')
    r = '|'.join(TYPES.get(x, x) for x in t.split('|'))
    return r + ('?' if opt else '')


def argname(n, i):
    n = re.sub(r'\W', '_', n or '')
    if not n or n[0].isdigit():
        return f'arg{i + 1}'
    return n + '_' if n in LUA_KW else n


def load_desc(v):
    d = {}
    for p in (ROOT / 'descriptions' / v).rglob('*.json'):
        j = json.loads(p.read_text(encoding='utf-8'))
        d[j['fichier']] = j
    return d


def ptypes(f):
    by = {p['name']: p['type'] for p in f['params'] if p.get('name')}
    pos = [p['type'] for p in f['params']]
    return [(a, by.get(a) or (pos[i] if i < len(pos) else None)) for i, a in enumerate(f['args'])]


def stub_file(fi, desc):
    L = ['---@meta', f'-- FS25 {V} : {fi["file"]} (generated stub, FS25 Lua Atlas)', '']
    desc = desc or {}
    fd = desc.get('fonctions', {})
    for cname, c in fi['classes'].items():
        if desc.get('module'):
            L.append('--- ' + desc['module'].replace('\n', '\n--- '))
        L.append(f'---@class {cname}' + (f' : {c["parent"]}' if c.get('parent') else ''))
        L.append(f'{cname} = {{}}\n')
    for f in fi['functions']:
        if f['local']:
            continue
        if f['name'] in fd:
            L.append('--- ' + fd[f['name']].replace('\n', '\n--- '))
        for a, t in ptypes(f):
            if a != '...':
                L.append(f'---@param {a} {lt(t)}')
        for r in f['returns']:
            L.append(f'---@return {lt(r["type"])}')
        L.append(f'function {f["name"]}({", ".join(f["args"])}) end\n')
    return '\n'.join(L)


def md_file(fi, desc):
    desc = desc or {}
    L = [f'# {fi["file"]}', '', f'Source: `dataS/scripts/{fi["file"]}` — FS25 {V}', '']
    if fi['bodyless']:
        L += ['> ⚠ In the SDK dump this file only contains **signatures** (no bodies).', '']
    if desc.get('module'):
        L += ['✍ ' + desc['module'], '']
    for cname, c in fi['classes'].items():
        L.append(f'- **{cname}**' + (f' inherits from `{c["parent"]}`' if c.get('parent') else '') + f' (l.{c["line"]})')
    fd = desc.get('fonctions', {})
    pub = [f for f in fi['functions'] if not f['local']]
    if pub:
        L += ['', '## Functions', '', '| Function | Line | Description (FR) |', '|---|---|---|']
        for f in pub:
            sig = f'{f["name"]}({", ".join(a + ": " + lt(t) for a, t in ptypes(f))})'
            ret = ', '.join(lt(r['type']) for r in f['returns'])
            if ret:
                sig += ' → ' + ret
            sig = sig.replace('|', r'\|')
            d = fd.get(f['name'], '').replace('\n', ' ').replace('|', r'\|')
            L.append(f'| `{sig}` | {f["line"]} | {("✍ " + d) if d else ""} |')
    if fi['spec']:
        L += ['', '## Specialization', '', '| Type | Name | Line |', '|---|---|---|']
        L += [f'| {s["kind"]} | `{s["name"]}` | {s["line"]} |' for s in fi['spec']]
    if fi['msgSub'] or fi['msgPub']:
        L += ['', '## Messages', '']
        L += [f'- subscribes `{m["msg"]}` (l.{m["line"]})' for m in fi['msgSub']]
        L += [f'- publishes `{m["msg"]}` (l.{m["line"]})' for m in fi['msgPub']]
    return '\n'.join(L) + '\n'


def main():
    data = json.loads((ROOT / 'donnees' / V / 'statique.json').read_text(encoding='utf-8'))
    desc = load_desc(V)
    stubs, doc = ROOT / 'stubs' / V, ROOT / 'doc' / V
    groups = defaultdict(list)
    events = defaultdict(lambda: defaultdict(list))
    msgs = defaultdict(lambda: defaultdict(list))
    globs = []
    for fi in data['files']:
        dsc = desc.get(fi['file'])
        p = stubs / 'scripts' / fi['file']
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(stub_file(fi, dsc), encoding='utf-8')
        m = doc / 'scripts' / (fi['file'][:-4] + '.md')
        m.parent.mkdir(parents=True, exist_ok=True)
        m.write_text(md_file(fi, dsc), encoding='utf-8')
        groups[fi['file'].split('/')[0] if '/' in fi['file'] else '(racine)'].append((fi, dsc))
        for s in fi['spec']:
            if s['kind'] in ('registerEvent', 'registerEventListener'):
                events[s['name']][s['kind']].append(fi['file'])
        for k, lst in (('écoute', fi['msgSub']), ('publie', fi['msgPub'])):
            for x in lst:
                msgs[x['msg']][k].append(fi['file'])
        globs += [(g['name'], fi['file'], g['line']) for g in fi['globals']]

    nf = sum(len(f['functions']) for f in data['files'])
    nd = sum(len(d.get('fonctions', {})) for d in desc.values())
    L = [f'# FS25 Lua Atlas — game version {V}', '',
         f'{len(data["files"])} files, {nf} functions, {len(data["engine"])} engine functions. '
         f'Written descriptions (✍, French): {len(desc)} files, {nd} functions.', '',
         '- [Specialization events](evenements.md) · [Messages](messages.md) · '
         '[g_* globals](globales.md) · [Engine functions](moteur.md) · [In-game scan](releve.md)', '']
    for g in sorted(groups):
        L += [f'## {g}', '']
        for fi, dsc in sorted(groups[g], key=lambda x: x[0]['file']):
            mark = ' ✍' if dsc else ''
            L.append(f'- [{fi["file"]}](scripts/{fi["file"][:-4]}.md) — {len(fi["functions"])} fn{mark}')
        L.append('')
    (doc / 'index.md').write_text('\n'.join(L), encoding='utf-8')

    L = ['# Specialization events', '', '| Event | Declared by | Listened by |', '|---|---|---|']
    for e in sorted(events):
        dec = ', '.join(sorted(set(events[e]['registerEvent']))) or '—'
        L.append(f'| `{e}` | {dec} | {len(set(events[e]["registerEventListener"]))} file(s) |')
    (doc / 'evenements.md').write_text('\n'.join(L) + '\n', encoding='utf-8')

    L = ['# MessageType', '', '| Message | Published by | Subscribers |', '|---|---|---|']
    for m in sorted(msgs):
        L.append(f'| `{m}` | {", ".join(sorted(set(msgs[m]["publie"]))) or "—"} | {len(set(msgs[m]["écoute"]))} |')
    (doc / 'messages.md').write_text('\n'.join(L) + '\n', encoding='utf-8')

    agg = defaultdict(list)
    for n, f, l in globs:
        agg[n].append(f'{f}:{l}')
    L = ['# g_* globals', '', '| Global | Assigned in |', '|---|---|']
    L += [f'| `{n}` | {", ".join(agg[n][:3])}{" …" if len(agg[n]) > 3 else ""} |' for n in sorted(agg)]
    (doc / 'globales.md').write_text('\n'.join(L) + '\n', encoding='utf-8')

    # moteur : signatures seulement (les 'desc' GIANTS ne sont pas recopiées)
    S = ['---@meta', f'-- FS25 {V} : fonctions moteur (signatures depuis scriptBinding.xml)', '',
         '---@alias entityId integer', '---@alias float number', '']
    L = ['# Engine functions', '', 'Signatures from `sdk/debugger/scriptBinding.xml` (incomplete: '
         'some functions called by the game or by mods are not listed).', '']
    bycat = defaultdict(list)
    for e in data['engine']:
        bycat[e['category'] or '?'].append(e)
        names = [argname(p['name'], i) for i, p in enumerate(e['inputs'])]
        for n, p in zip(names, e['inputs']):
            S.append(f'---@param {n} {lt(p["type"])}{"?" if p.get("optional") == "true" else ""}')
        for p in e['outputs']:
            S.append(f'---@return {lt(p["type"])} {argname(p["name"], 0) if p["name"] else ""}'.rstrip())
        S.append(f'function {e["name"]}({", ".join(names)}) end\n')
    for c in sorted(bycat):
        L += [f'## {c}', '']
        for e in bycat[c]:
            ins = ', '.join(f'{p["name"]}: {lt(p["type"])}' for p in e['inputs'])
            outs = ', '.join(lt(p['type']) for p in e['outputs'])
            L.append(f'- `{e["name"]}({ins})`' + (f' → `{outs}`' if outs else ''))
        L.append('')
    (stubs / 'moteur.lua').write_text('\n'.join(S), encoding='utf-8')
    (doc / 'moteur.md').write_text('\n'.join(L), encoding='utf-8')
    print(f'stubs et doc générés dans stubs/{V} et doc/{V}')


if __name__ == '__main__':
    V = sys.argv[1]
    main()
