# Passer l'atlas à une nouvelle version du jeu

*[English version: NEW_VERSION.md](NEW_VERSION.md)*

1. **Version exacte** : lire le fichier `VERSION` à la racine de l'installation de FS25 (par exemple `1.26.0.0`).
2. **Sources** : extraire `sdk/debugger/gameSource.zip` dans un **nouveau** dossier hors du dépôt, sans écraser l'ancien.
3. **Extraction statique** :
   `python -I outils/extraire.py "<extrait>/dataS/scripts" "<FS25>/sdk/debugger/scriptBinding.xml" donnees/<v>/statique.json`
   Corriger au passage `gameVersion` dans `extraire.py`.
4. **Relevé en jeu** : installer `outils/mod_releve/`, charger une partie, puis
   `python -I outils/importer_releve.py <v> "<profil FS25>/atlas_releve.tsv"`.
   Vérifier dans `log.txt` que le mod est accepté : `descVersion` peut augmenter d'une version du jeu à l'autre.
5. **Reporter les descriptions** : copier `descriptions/<ancienne>/` vers `descriptions/<v>/`, puis vérifier les clés
   qui n'existent plus (petit script : comparer les clés de `fonctions` à `statique.json`). Relire les fonctions dont la signature a changé.
6. **Générer** : `python -I outils/generer.py <v>` puis `python -I outils/empaqueter.py <v>`.
7. Mettre à jour `README.md` (version, couverture), `doc/index.md`, `CHANGELOG.md`, puis publier une release avec `dist/stubs-<v>.zip`.
   **Ne jamais publier `donnees/`**, qui provient des sources GIANTS.
