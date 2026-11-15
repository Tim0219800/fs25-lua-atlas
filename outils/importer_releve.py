"""Importe atlas_releve.tsv (mod_releve) et le compare au dump statique.

Usage : python -I outils/importer_releve.py 1.25.1.0 <chemin atlas_releve.tsv>
Produit : donnees/<v>/releve.tsv (copie), doc/<v>/releve.md, stubs/<v>/releve.lua
(classes et fonctions présentes en jeu mais absentes des sources du SDK ; types inconnus).
"""
import json, shutil, sys
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent


def main(v, tsv):
    tsv = Path(tsv)
    dst = ROOT / 'donnees' / v / 'releve.tsv'
    dst.parent.mkdir(parents=True, exist_ok=True)
    if tsv.resolve() != dst.resolve():
        shutil.copyfile(tsv, dst)
    data = json.loads((ROOT / 'donnees' / v / 'statique.json').read_text(encoding='utf-8'))
    connus = set()
    for f in data['files']:
        connus.update(f['classes'])
        connus.update(fn['name'].replace(':', '.') for fn in f['functions'])
        connus.update(g['name'] for g in f['globals'])
    connus.update(e['name'] for e in data['engine'])

    entete, racines, env, mods = '', [], [], set()
    top = {}                       # globale -> type
    membres = defaultdict(list)    # globale -> [(nom, type, hérité)]
    for raw in tsv.read_text(encoding='utf-8', errors='replace').splitlines():
        c = raw.split('\t')
        if raw.startswith('# racine'):
            racines.append(c[1:])
            continue
        if raw.startswith('#'):
            entete = raw
            continue
        if len(c) < 2:
            continue
        nom, typ = c[0], c[1]
        if typ == 'envmod' or nom.startswith('FS25_') or nom.startswith('FS22_'):
            mods.add(nom.split('.')[0].split(':')[0])
            continue
        if nom.startswith('@env.'):
            env.append((nom[5:], typ))
            continue
        herite = len(c) > 1 and c[1].startswith('[mt')
        if herite:          # format "chemin:fn\t[mtN]\tfunction..."
            typ = c[2] if len(c) > 2 else 'function'
        sep = ':' if ':' in nom else '.'
        if sep in nom:
            g, _, m = nom.partition(sep)
            membres[g].append((m, typ, herite))
        else:
            top[nom] = typ

    absents = {g: t for g, t in top.items() if g not in connus}
    nfn_moteur = sum(1 for g, t in absents.items() if t == 'function')
    L = [f'# Relevé en jeu — FS25 {v}', '', f'`{entete}`', '',
         f'{len(top)} globales relevées, dont {len(absents)} absentes des sources du SDK '
         f'({nfn_moteur} fonctions, probablement moteur).', '']
    if racines:
        L += ['## Racines explorées', '', '| Racine | Type | Clés |', '|---|---|---|']
        L += [f'| {r[0]} | {r[1] if len(r) > 1 else ""} | {r[2] if len(r) > 2 else ""} |' for r in racines]
        L.append('')
    L += [f'Environnements de mods tiers ignorés : {len(mods)}.', '']
    L += ['## Surcharges de l\'environnement des mods', '',
          'Noms définis directement dans l\'environnement isolé où tourne le code d\'un mod '
          '(ils masquent ou remplacent la version globale).', '']
    L += [f'- `{n}` ({t})' for n, t in env]
    L += ['', '## Tables absentes des sources du SDK', '']
    sdir = ROOT / 'stubs' / v / 'releve'
    if sdir.exists():
        shutil.rmtree(sdir)
    sdir.mkdir(parents=True)
    old = ROOT / 'stubs' / v / 'releve.lua'
    if old.exists():
        old.unlink()
    TETE = ['---@meta', f'-- FS25 {v} : relevé en jeu, absent des sources du SDK (types inconnus)', '']
    S = list(TETE)
    for g in sorted(absents):
        t = absents[g]
        if t == 'table':
            ms = membres.get(g, [])
            L.append(f'### {g} ({len(ms)} membres)')
            L.append(', '.join(f'`{m}`' for m, mt, _ in sorted(ms) if mt == 'function') or '—')
            L.append('')
            C = TETE + [f'---@class {g}', f'{g} = {{}}', '']
            for m, mt, h in sorted(set(ms)):
                if mt == 'function' and m.isidentifier():
                    C.append(f'function {g}{":" if h else "."}{m}(...) end')
            if g.isidentifier():
                (sdir / f'{g}.lua').write_text('\n'.join(C) + '\n', encoding='utf-8')
    L += ['## Fonctions globales absentes des sources et de scriptBinding.xml', '']
    L.append(', '.join(f'`{g}`' for g in sorted(absents) if absents[g] == 'function') or '—')
    (ROOT / 'doc' / v / 'releve.md').write_text('\n'.join(L) + '\n', encoding='utf-8')
    S.append('')
    for g in sorted(absents):
        if absents[g] == 'function' and g.isidentifier():
            S.append(f'function {g}(...) end')
    (sdir / '_fonctions.lua').write_text('\n'.join(S) + '\n', encoding='utf-8')
    print(f'{len(mods)} env de mods ignorés, {len(top)} globales, {len(absents)} absentes du dump, {len(env)} surcharges env')


if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2])
