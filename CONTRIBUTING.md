# Contributing

*[Version française : CONTRIBUTING.fr.md](CONTRIBUTING.fr.md)*

The most useful contributions are **corrections of descriptions** (`descriptions/<version>/<path>.json`) and facts verified in game.

## Description format
Every description is bilingual: **English** (main, used by the stubs and the English site) and **French** (secondary site under `doc/<version>/fr/`).
```json
{
  "fichier": "vehicles/specializations/WorkParticles.lua",
  "module": {"en": "Role of the file, client/server side, data read, extension points.",
             "fr": "Rôle du fichier, côté client/serveur, données lues, points d'extension."},
  "fonctions": {
    "WorkParticles:onUpdateTick": {"en": "What the function does, side effects, return values, pitfalls.",
                                   "fr": "Ce que fait la fonction, effets de bord, valeurs de retour, pièges."}
  }
}
```
- Keys in `fonctions` must match the code **exactly**: `Class.fn` (dot) or `Class:fn` (method). Every non-local function of the file has a key.
- New file: `python -I outils/verifier_descriptions.py 1.25.1.0 --squelette <dir/File.lua>` creates the skeleton with every key.
- Both languages say the same facts. If you only write one language, say so in the pull request: it will be translated.

## Rules (non-negotiable)
1. **Never copy** GIANTS code, function bodies or comments. Rephrase in your own words.
   Quoting a variable name, an XML key, a default value or a unit is fine.
2. **Invent nothing.** State the confidence level:
   - **UNVERIFIED** / **NON VÉRIFIÉ**: behaviour depends on code missing from the dump (e.g. `Weather`, `Environment`, `EffectManager`);
   - "Signature only" / « Signature seule »: the file has no function bodies in the SDK dump;
   - "not tested in game" / « non vérifié en jeu »: read in the code, not tested.
3. Flag apparent game bugs with "Note: …" / « À noter : … ».
4. Point to the code with `file:line` instead of quoting it.

## Check before submitting
```
python -I outils/verifier_descriptions.py 1.25.1.0
python -I outils/generer.py 1.25.1.0
```
The verifier checks keys, both languages and, if you have the game sources locally, that no run of 8 words is copied from them.
CI checks that the JSON files are valid and bilingual, that no GIANTS text is present, and that the stubs are valid Lua (`luajit -bl`).
