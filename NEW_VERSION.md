# Moving the atlas to a new game version

*[Version française : NOUVELLE_VERSION.md](NOUVELLE_VERSION.md)*

1. **Exact version**: read the `VERSION` file at the root of the FS25 install (e.g. `1.26.0.0`).
2. **Sources**: extract `sdk/debugger/gameSource.zip` into a **new** folder outside the repository; do not overwrite the old one.
3. **Static extraction**:
   `python -I outils/extraire.py "<extracted>/dataS/scripts" "<FS25>/sdk/debugger/scriptBinding.xml" donnees/<v>/statique.json`
   The game version is taken from the output folder name (or a 4th argument).
4. **In-game scan**: install `outils/mod_releve/`, load a savegame, then
   `python -I outils/importer_releve.py <v> "<FS25 profile>/atlas_releve.tsv"`.
   Check in `log.txt` that the mod is accepted: `descVersion` may increase between game versions.
5. **Carry descriptions over**: copy `descriptions/<old>/` to `descriptions/<v>/`, then look for keys that no longer exist
   (small script: compare the `fonctions` keys with `statique.json`). Re-read functions whose signature changed.
6. **Generate**: `python -I outils/generer.py <v>` then `python -I outils/empaqueter.py <v>`.
7. Update `README.md` / `README.fr.md` (version, coverage), `doc/index.md`, `CHANGELOG.md`, then publish a release with `dist/stubs-<v>.zip`.
   **Never publish `donnees/`**: it comes from the GIANTS sources.
