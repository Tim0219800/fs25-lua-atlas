# Contributing

*[Version française : CONTRIBUTING.fr.md](CONTRIBUTING.fr.md)*

The most useful contributions are **descriptions** (`descriptions/<version>/<path>.json`) and corrections of facts verified in game.

## Description format
```json
{
  "fichier": "vehicles/specializations/WorkParticles.lua",
  "module": "Role of the file, client/server side, data read, effect conditions, extension points.",
  "fonctions": {
    "WorkParticles:onUpdateTick": "What the function does, parameters, return values, pitfalls."
  }
}
```
- Keys in `fonctions` must match the code **exactly**: `Class.fn` (dot) or `Class:fn` (method).
- Language: descriptions are written in **French** for consistency. Plain, factual tone.
  (English contributions are welcome as issues; they will be translated.)

## Rules (non-negotiable)
1. **Never copy** GIANTS code, function bodies or comments. Rephrase in your own words.
   Quoting a variable name, an XML key, a default value or a unit is fine.
2. **Invent nothing.** State the confidence level:
   - **NON VÉRIFIÉ** (not verified): behaviour depends on code missing from the dump (e.g. `Weather`, `Environment`, `EffectManager`);
   - « non relu » (skimmed): part not read in detail;
   - « non vérifié en jeu » (not tested in game): read in the code, not tested.
3. Flag apparent game bugs with « à noter : … ».
4. Point to the code with `file:line` instead of quoting it.

## Check before submitting
```
python -I outils/generer.py 1.25.1.0
```
CI checks that the JSON files are valid, that no GIANTS text is present, and that the stubs are valid Lua (`luajit -bl`).
