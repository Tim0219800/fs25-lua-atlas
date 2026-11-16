# materials/ParticleSystemManager.lua

*[Version française](../../fr/scripts/materials/ParticleSystemManager.md)*

Source: `dataS/scripts/materials/ParticleSystemManager.lua` — FS25 1.25.1.0

✍ Global manager for "shared" particle systems (g_particleSystemManager, derives from AbstractManager). It keeps a list of particle type names and, for each type, a single reference particleSystem table created by MaterialUtil.onCreateParticleSystem from an I3D node of a particle holder (absent from the dump). Effects then copy this reference system (ParticleUtil.copyParticleSystem, body absent from the dump), so the exact use of the copy is UNVERIFIED here. It runs on every peer: nothing is synchronized over the network.

VANILLA TYPES declared in loadMapData (ParticleSystemManager.lua:40-82), worth keeping in mind for reuse: unloading; smoke, smoke_damping, smoke_chimney, smoke_train_main, smoke_train_side; chopper, straw, cutter_chopper; soil, soil_smoke, soil_chunks, soil_big_chunks, soil_harvesting; spreader, spreader_smoke; windrower, tedder, weeder; crusher_wood, crusher_dust; prepare_fruit; cleaning_soil, cleaning_dust; washer_water; SPRAYERCANNON_MIST; chainsaw_wood, chainsaw_dust; pickup, pickup_falling; sowing; loading; wheel_dust, wheel_dry, wheel_wet, wheel_snow; bees; horse_step_slow, horse_step_fast; spraycan_paint; HYDRAULIC_HAMMER, HYDRAULIC_HAMMER_DEBRIS; STONE. Names are upper-cased and the global ParticleType table points to nameToIndex. This file does not say which machine uses which type (look in the specializations, e.g. WorkParticles).

LIMIT: one system per type (no per-fill-type variant in this manager; the material is handled by MaterialManager:getParticleMaterial). Adding a system for an existing type deletes the previous one (ParticleUtil.deleteParticleSystem): a mod that re-declares a type therefore replaces the vanilla system for all uses.

EXTENSION POINTS: addParticleType for new types (before the particle holder is loaded), addParticleSystem, getParticleSystem. The exact moment particle holders are loaded is UNVERIFIED (outside the dump).

- **ParticleSystemManager** inherits from `AbstractManager` (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `ParticleSystemManager.new(customMt: any) → table` | 20 | ✍ Creates the manager. |
| `ParticleSystemManager:initDataStructures()` | 28 | ✍ Resets the tables of names, types and particle systems. |
| `ParticleSystemManager:loadMapData() → boolean` | 37 | ✍ Declares the vanilla particle types (list in the module text), publishes the global ParticleType table and returns true. |
| `ParticleSystemManager:unloadMapData()` | 91 | ✍ Deletes every reference particle system (ParticleUtil.deleteParticleSystem) then delegates to the parent class. |
| `ParticleSystemManager:addParticleType(name: string)` | 102 | ✍ Adds a particle type (name validated then upper-cased); has no effect if already known. |
| `ParticleSystemManager:getParticleSystemTypeByName(name: string) → string` | 122 | ✍ Returns the normalized (upper-case) name if it is declared, otherwise nil. |
| `ParticleSystemManager:addParticleSystem(particleType: string, particleSystem: integer)` | 140 | ✍ Associates a reference particle system with a type; if a system already existed for that type, it is deleted first. Note: the original comment mentions a material index and an identifier that do not exist in the real signature (particleType, particleSystem). |
| `ParticleSystemManager:getParticleSystem(particleTypeName: string) → table` | 153 | ✍ Returns the reference table of the type requested by name, nil if the type is unknown or has no system. Note: the original comment mentions a fill type, but the function only takes the type name. |
