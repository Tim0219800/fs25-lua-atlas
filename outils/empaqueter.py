"""Construit stubs-<v>.zip pour la release (stubs + licences + README).

Usage : python -I outils/empaqueter.py 1.25.1.0
Les données brutes (donnees/) ne sont JAMAIS empaquetées : elles proviennent des sources GIANTS.
"""
import sys, zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent


def main(v):
    out = ROOT / 'dist' / f'stubs-{v}.zip'
    out.parent.mkdir(exist_ok=True)
    n = 0
    with zipfile.ZipFile(out, 'w', zipfile.ZIP_DEFLATED) as z:
        for p in sorted((ROOT / 'stubs' / v).rglob('*.lua')):
            z.write(p, p.relative_to(ROOT).as_posix())
            n += 1
        for f in ('LICENSE', 'LEGAL.md', 'LEGAL.fr.md', 'README.md', 'README.fr.md'):
            z.write(ROOT / f, f)
    print(f'{out.relative_to(ROOT)} : {n} stubs')


if __name__ == '__main__':
    main(sys.argv[1])
