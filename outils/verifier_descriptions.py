"""Checks bilingual descriptions and creates empty skeletons.

Usage:
  python -I outils/verifier_descriptions.py <v>                      check every descriptions/<v>/**/*.json
  python -I outils/verifier_descriptions.py <v> a.lua b.lua         check only these source files
  python -I outils/verifier_descriptions.py <v> --squelette a.lua   create descriptions/<v>/a.json (empty en/fr) if missing
Options: --sources <dir> (default ../gameSource/dataS/scripts) enables the anti-copy check
         (no run of 8 identical words shared with the GIANTS source file).

Expected format:
  {"fichier": "dir/File.lua",
   "module": {"en": "...", "fr": "..."},
   "fonctions": {"Class:fn": {"en": "...", "fr": "..."}}}
Every non-local function of the file must have a key. Exit code 1 if anything is wrong.
"""
import json, re, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
WORD = re.compile(r"[A-Za-z0-9_]+")


def load_static(v):
    d = json.loads((ROOT / 'donnees' / v / 'statique.json').read_text(encoding='utf-8'))
    return {f['file']: f for f in d['files']}


def desc_path(v, lua):
    return ROOT / 'descriptions' / v / (lua[:-4] + '.json')


def public(fi):
    out = []
    for f in fi['functions']:
        if not f['local'] and f['name'] not in out:
            out.append(f['name'])
    return out


def skeleton(v, lua, static):
    p = desc_path(v, lua)
    if p.exists():
        print('exists', p.relative_to(ROOT))
        return
    fi = static[lua]
    j = {'fichier': lua, 'module': {'en': '', 'fr': ''},
         'fonctions': {n: {'en': '', 'fr': ''} for n in public(fi)}}
    p.parent.mkdir(parents=True, exist_ok=True)
    p.write_text(json.dumps(j, ensure_ascii=False, indent=1) + '\n', encoding='utf-8', newline='\n')
    print('created', p.relative_to(ROOT), len(j['fonctions']), 'functions')


def shingles(text, n=8):
    w = [x.lower() for x in WORD.findall(text)]
    return {' '.join(w[i:i + n]) for i in range(len(w) - n + 1)}


def check(p, static, sources):
    err = []
    try:
        j = json.loads(p.read_text(encoding='utf-8'))
    except Exception as e:
        return [f'invalid JSON: {e}']
    lua = j.get('fichier', '')
    if lua not in static:
        return [f'unknown source file: {lua!r}']

    def bi(val, where):
        if not isinstance(val, dict):
            err.append(f'{where}: expected {{"en", "fr"}}')
            return []
        miss = [k for k in ('en', 'fr') if not str(val.get(k, '')).strip()]
        if miss:
            err.append(f'{where}: empty {"/".join(miss)}')
        return [str(val.get('en', '')), str(val.get('fr', ''))]

    texts = bi(j.get('module'), 'module')
    fn = j.get('fonctions', {})
    pub = public(static[lua])
    for n in pub:
        if n not in fn:
            err.append(f'missing function: {n}')
    for n, val in fn.items():
        if n not in pub:
            err.append(f'unknown function: {n}')
        texts += bi(val, n)
    if sources:
        src = Path(sources) / lua
        if src.exists():
            sh = shingles(src.read_text(encoding='utf-8', errors='replace'))
            for t in texts:
                hit = shingles(t) & sh
                if hit:
                    err.append(f'text copied from the source: "{sorted(hit)[0]}"')
                    break
    return err


def main(argv):
    v, rest = argv[0], argv[1:]
    sources = str(ROOT.parent / 'gameSource' / 'dataS' / 'scripts')
    if '--sources' in rest:
        i = rest.index('--sources')
        sources = rest[i + 1]
        del rest[i:i + 2]
    static = load_static(v)
    if rest and rest[0] == '--squelette':
        for lua in rest[1:]:
            skeleton(v, lua, static)
        return 0
    paths = [desc_path(v, l) for l in rest] if rest else sorted((ROOT / 'descriptions' / v).rglob('*.json'))
    if not Path(sources).exists():
        sources = None
    bad = 0
    for p in paths:
        if not p.exists():
            print('MISSING', p.relative_to(ROOT))
            bad += 1
            continue
        e = check(p, static, sources)
        if e:
            bad += 1
            print('KO', p.relative_to(ROOT))
            for x in e[:15]:
                print('   ', x)
            if len(e) > 15:
                print(f'    ... {len(e) - 15} more')
    print(f'{len(paths)} file(s), {bad} with errors' + ('' if sources else ' (anti-copy check skipped: no sources)'))
    return 1 if bad else 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
