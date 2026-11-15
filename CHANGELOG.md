# Changelog

*[Version française : CHANGELOG.fr.md](CHANGELOG.fr.md)*

## 1.25.1.0 (2026-11-15): first release
- Static extraction of the 961 SDK Lua files: 13,390 functions, inheritance, specialization events, `MessageType`, `g_*` globals.
- 819 engine function signatures from `scriptBinding.xml`.
- In-game scan: 4,308 globals, 2,651 of them missing from the SDK sources (`Weather`, `Environment`, `FSBaseMission`, `EffectManager`…), names only.
- Written descriptions (French) for 35 files (1,325 functions): `WorkParticles`, `ParticleUtil`, wheels (`Wheels`, `WheelEffects`, `WheelPhysics`…),
  `Washable`, `VehicleSystem`, `Enterable`, `Motorized`, `Lights`, `Dischargeable`, materials and particles, `Sprayer`, `Combine`, `Cutter`
  and the soil-working and harvesting tools.
- LuaLS stubs, mkdocs site, validation CI.
- English README as the main one, French versions as `*.fr.md`.
