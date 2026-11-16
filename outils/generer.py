"""Génère stubs LuaLS + doc Markdown (anglais principal, français secondaire)
depuis donnees/<v>/statique.json et descriptions/<v>/**/*.json.

Usage : python -I outils/generer.py 1.25.1.0
Sorties : stubs/<v>/ (textes anglais), doc/<v>/ (anglais), doc/<v>/fr/ (français).
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

T = {
    'en': dict(other='fr', other_label='Version française', source='Source', bodyless=
               '> ⚠ In the SDK dump this file only contains **signatures** (no bodies).',
               inherits='inherits from', functions='Functions', function='Function', line='Line',
               description='Description', spec='Specialization', type='Type', name='Name',
               subscribes='subscribes', publishes='publishes', fallback='(FR only) ',
               title='FS25 Lua Atlas — game version', summary='{nf} files, {nfn} functions, {ne} engine functions. '
               'Written descriptions ✍: {nd} files, {ndf} functions.',
               links='[Specialization events](evenements.md) · [Messages](messages.md) · [g_* globals](globales.md)'
                     ' · [Engine functions](moteur.md) · [In-game scan](releve.md)',
               events='Specialization events', ev_head='| Event | Declared by | Listened by |', files='file(s)',
               msg_head='| Message | Published by | Subscribers |', glob='g_* globals',
               glob_head='| Global | Assigned in |', engine='Engine functions',
               engine_intro='Signatures from `sdk/debugger/scriptBinding.xml` (incomplete: some functions called '
                            'by the game or by mods are not listed).'),
    'fr': dict(other='en', other_label='English version', source='Source', bodyless=
               '> ⚠ Dans le dump du SDK, ce fichier ne contient que des **signatures** (pas de corps).',
               inherits='hérite de', functions='Fonctions', function='Fonction', line='Ligne',
               description='Description', spec='Spécialisation', type='Type', name='Nom',
               subscribes="s'abonne à", publishes='publie', fallback='(EN seulement) ',
               title='Atlas Lua FS25 — version du jeu', summary='{nf} fichiers, {nfn} fonctions, {ne} fonctions moteur. '
               'Descriptions rédigées ✍ : {nd} fichiers, {ndf} fonctions.',
               links='[Événements de spécialisation](evenements.md) · [Messages](messages.md) · '
                     '[Globales g_*](globales.md) · [Fonctions moteur](moteur.md) · [Relevé en jeu](releve.md)',
               events='Événements de spécialisation', ev_head='| Événement | Déclaré par | Écouté par |',
               files='fichier(s)', msg_head='| Message | Publié par | Abonnés |', glob='Globales g_*',
               glob_head='| Globale | Assignée dans |', engine='Fonctions moteur',
               engine_intro='Signatures tirées de `sdk/debugger/scriptBinding.xml` (incomplet : certaines fonctions '
                            'appelées par le jeu ou par des mods n\'y figurent pas).'),
}


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


def bi(val):
    """Ancien format (chaîne française) ou nouveau {"en", "fr"} -> dict nettoyé."""
    if isinstance(val, str):
        val = {'fr': val}
    return {k: str(val.get(k, '')).strip() for k in ('en', 'fr')} if isinstance(val, dict) else {'en': '', 'fr': ''}


def txt(val, lang, tag=True):
    if not val:
        return ''
    if val.get(lang):
        return val[lang]
    o = val.get(T[lang]['other'])
    return (T[lang]['fallback'] + o) if (o and tag) else (o or '')


def load_desc(v):
    d = {}
    for p in (ROOT / 'descriptions' / v).rglob('*.json'):
        j = json.loads(p.read_text(encoding='utf-8'))
        fn = {k: bi(x) for k, x in j.get('fonctions', {}).items()}
        fn = {k: x for k, x in fn.items() if x['en'] or x['fr']}
        mod = bi(j.get('module', ''))
        if fn or mod['en'] or mod['fr']:
            d[j['fichier']] = {'module': mod, 'fonctions': fn}
    return d


def ptypes(f):
    by = {p['name']: p['type'] for p in f['params'] if p.get('name')}
    pos = [p['type'] for p in f['params']]
    return [(a, by.get(a) or (pos[i] if i < len(pos) else None)) for i, a in enumerate(f['args'])]


def com(s):
    return '--- ' + s.replace('\n', '\n--- ')


def stub_file(fi, desc):
    L = ['---@meta', f'-- FS25 {V} : {fi["file"]} (generated stub, FS25 Lua Atlas)', '']
    desc = desc or {}
    fd = desc.get('fonctions', {})
    mod = txt(desc.get('module'), 'en', tag=False)
    for cname, c in fi['classes'].items():
        if mod:
            L.append(com(mod))
        L.append(f'---@class {cname}' + (f' : {c["parent"]}' if c.get('parent') else ''))
        L.append(f'{cname} = {{}}\n')
    for f in fi['functions']:
        if f['local']:
            continue
        d = txt(fd.get(f['name']), 'en', tag=False)
        if d:
            L.append(com(d))
        for a, t in ptypes(f):
            if a != '...':
                L.append(f'---@param {a} {lt(t)}')
        for r in f['returns']:
            L.append(f'---@return {lt(r["type"])}')
        L.append(f'function {f["name"]}({", ".join(f["args"])}) end\n')
    return '\n'.join(L)


def md_file(fi, desc, lang):
    t = T[lang]
    desc = desc or {}
    depth = fi['file'].count('/')
    other = ('../' * (depth + 1) + 'fr/scripts/') if lang == 'en' else ('../' * (depth + 2) + 'scripts/')
    other += fi['file'][:-4] + '.md'
    L = [f'# {fi["file"]}', '', f'*[{t["other_label"]}]({other})*', '',
         f'{t["source"]}: `dataS/scripts/{fi["file"]}` — FS25 {V}', '']
    if fi['bodyless']:
        L += [t['bodyless'], '']
    mod = txt(desc.get('module'), lang)
    if mod:
        L += ['✍ ' + mod, '']
    for cname, c in fi['classes'].items():
        L.append(f'- **{cname}**' + (f' {t["inherits"]} `{c["parent"]}`' if c.get('parent') else '') + f' (l.{c["line"]})')
    fd = desc.get('fonctions', {})
    pub = [f for f in fi['functions'] if not f['local']]
    if pub:
        L += ['', f'## {t["functions"]}', '', f'| {t["function"]} | {t["line"]} | {t["description"]} |', '|---|---|---|']
        for f in pub:
            sig = f'{f["name"]}({", ".join(a + ": " + lt(ty) for a, ty in ptypes(f))})'
            ret = ', '.join(lt(r['type']) for r in f['returns'])
            if ret:
                sig += ' → ' + ret
            sig = sig.replace('|', r'\|')
            d = txt(fd.get(f['name']), lang).replace('\n', ' ').replace('|', r'\|')
            L.append(f'| `{sig}` | {f["line"]} | {("✍ " + d) if d else ""} |')
    if fi['spec']:
        L += ['', f'## {t["spec"]}', '', f'| {t["type"]} | {t["name"]} | {t["line"]} |', '|---|---|---|']
        L += [f'| {s["kind"]} | `{s["name"]}` | {s["line"]} |' for s in fi['spec']]
    if fi['msgSub'] or fi['msgPub']:
        L += ['', '## Messages', '']
        L += [f'- {t["subscribes"]} `{m["msg"]}` (l.{m["line"]})' for m in fi['msgSub']]
        L += [f'- {t["publishes"]} `{m["msg"]}` (l.{m["line"]})' for m in fi['msgPub']]
    return '\n'.join(L) + '\n'


def write(p, s):
    p.parent.mkdir(parents=True, exist_ok=True)
    p.write_text(s, encoding='utf-8', newline='\n')


def main():
    data = json.loads((ROOT / 'donnees' / V / 'statique.json').read_text(encoding='utf-8'))
    desc = load_desc(V)
    stubs, doc = ROOT / 'stubs' / V, ROOT / 'doc' / V
    out = {'en': doc, 'fr': doc / 'fr'}
    groups = defaultdict(list)
    events = defaultdict(lambda: defaultdict(list))
    msgs = defaultdict(lambda: defaultdict(list))
    globs = []
    for fi in data['files']:
        dsc = desc.get(fi['file'])
        write(stubs / 'scripts' / fi['file'], stub_file(fi, dsc))
        for lang in out:
            write(out[lang] / 'scripts' / (fi['file'][:-4] + '.md'), md_file(fi, dsc, lang))
        groups[fi['file'].split('/')[0] if '/' in fi['file'] else '(root)'].append((fi, dsc))
        for s in fi['spec']:
            if s['kind'] in ('registerEvent', 'registerEventListener'):
                events[s['name']][s['kind']].append(fi['file'])
        for k, lst in (('sub', fi['msgSub']), ('pub', fi['msgPub'])):
            for x in lst:
                msgs[x['msg']][k].append(fi['file'])
        globs += [(g['name'], fi['file'], g['line']) for g in fi['globals']]

    nf = sum(len(f['functions']) for f in data['files'])
    nd = sum(len(d['fonctions']) for d in desc.values())
    agg = defaultdict(list)
    for n, f, l in globs:
        agg[n].append(f'{f}:{l}')
    bycat = defaultdict(list)
    for e in data['engine']:
        bycat[e['category'] or '?'].append(e)

    for lang, d in out.items():
        t = T[lang]
        sw = '*[Version française](fr/{p})*' if lang == 'en' else '*[English version](../{p})*'
        L = [f'# {t["title"]} {V}', '', sw.format(p='index.md'), '',
             t['summary'].format(nf=len(data['files']), nfn=nf, ne=len(data['engine']), nd=len(desc), ndf=nd), '',
             '- ' + t['links'], '']
        for g in sorted(groups):
            L += [f'## {g}', '']
            for fi, dsc in sorted(groups[g], key=lambda x: x[0]['file']):
                mark = ' ✍' if dsc else ''
                L.append(f'- [{fi["file"]}](scripts/{fi["file"][:-4]}.md) — {len(fi["functions"])} fn{mark}')
            L.append('')
        write(d / 'index.md', '\n'.join(L))

        L = [f'# {t["events"]}', '', sw.format(p='evenements.md'), '', t['ev_head'], '|---|---|---|']
        for e in sorted(events):
            dec = ', '.join(sorted(set(events[e]['registerEvent']))) or '—'
            L.append(f'| `{e}` | {dec} | {len(set(events[e]["registerEventListener"]))} {t["files"]} |')
        write(d / 'evenements.md', '\n'.join(L) + '\n')

        L = ['# MessageType', '', sw.format(p='messages.md'), '', t['msg_head'], '|---|---|---|']
        for m in sorted(msgs):
            L.append(f'| `{m}` | {", ".join(sorted(set(msgs[m]["pub"]))) or "—"} | {len(set(msgs[m]["sub"]))} |')
        write(d / 'messages.md', '\n'.join(L) + '\n')

        L = [f'# {t["glob"]}', '', sw.format(p='globales.md'), '', t['glob_head'], '|---|---|']
        L += [f'| `{n}` | {", ".join(agg[n][:3])}{" …" if len(agg[n]) > 3 else ""} |' for n in sorted(agg)]
        write(d / 'globales.md', '\n'.join(L) + '\n')

        L = [f'# {t["engine"]}', '', sw.format(p='moteur.md'), '', t['engine_intro'], '']
        for c in sorted(bycat):
            L += [f'## {c}', '']
            for e in bycat[c]:
                ins = ', '.join(f'{p["name"]}: {lt(p["type"])}' for p in e['inputs'])
                outs = ', '.join(lt(p['type']) for p in e['outputs'])
                L.append(f'- `{e["name"]}({ins})`' + (f' → `{outs}`' if outs else ''))
            L.append('')
        write(d / 'moteur.md', '\n'.join(L))

    # moteur : signatures seulement (les 'desc' GIANTS ne sont pas recopiées)
    S = ['---@meta', f'-- FS25 {V} : engine functions (signatures from scriptBinding.xml)', '',
         '---@alias entityId integer', '---@alias float number', '']
    for e in data['engine']:
        names = [argname(p['name'], i) for i, p in enumerate(e['inputs'])]
        for n, p in zip(names, e['inputs']):
            S.append(f'---@param {n} {lt(p["type"])}{"?" if p.get("optional") == "true" else ""}')
        for p in e['outputs']:
            S.append(f'---@return {lt(p["type"])} {argname(p["name"], 0) if p["name"] else ""}'.rstrip())
        S.append(f'function {e["name"]}({", ".join(names)}) end\n')
    write(stubs / 'moteur.lua', '\n'.join(S))
    print(f'stubs et doc générés dans stubs/{V}, doc/{V} et doc/{V}/fr ({len(desc)} fichiers décrits, {nd} fonctions)')


if __name__ == '__main__':
    V = sys.argv[1]
    main()
