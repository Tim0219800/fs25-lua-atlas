# Changelog

*[Version française : CHANGELOG.fr.md](CHANGELOG.fr.md)*

## 1.25.1.0, update 2 (2026-11-16): complete bilingual descriptions
- Written descriptions for **all 961 files and 13,390 functions**, in English and French (drafted with AI assistance from the SDK sources, checked automatically).
- French site under `doc/1.25.1.0/fr/` (every page, index, events, messages, globals, engine functions, in-game scan).
- Stubs now carry the English descriptions.
- New `outils/verifier_descriptions.py`: skeletons, key and language checks, anti-copy check against the sources.
- `extraire.py` takes the game version from the output folder; CI checks that every description is bilingual.

## 1.25.1.0 (2026-11-15): first release
- Static extraction of the 961 SDK Lua files: 13,390 functions, inheritance, specialization events, `MessageType`, `g_*` globals.
- 819 engine function signatures from `scriptBinding.xml`.
- In-game scan: 4,308 globals, 2,651 of them missing from the SDK sources (`Weather`, `Environment`, `FSBaseMission`, `EffectManager`…), names only.
- Written descriptions (French) for 35 files (1,325 functions): `WorkParticles`, `ParticleUtil`, wheels (`Wheels`, `WheelEffects`, `WheelPhysics`…),
  `Washable`, `VehicleSystem`, `Enterable`, `Motorized`, `Lights`, `Dischargeable`, materials and particles, `Sprayer`, `Combine`, `Cutter`
  and the soil-working and harvesting tools.
- LuaLS stubs, mkdocs site, validation CI.
- English README as the main one, French versions as `*.fr.md`.
