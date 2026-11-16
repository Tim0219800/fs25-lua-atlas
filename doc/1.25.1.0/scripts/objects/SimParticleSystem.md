# objects/SimParticleSystem.lua

*[Version française](../../fr/scripts/objects/SimParticleSystem.md)*

Source: `dataS/scripts/objects/SimParticleSystem.lua` — FS25 1.25.1.0

✍ Map object created from an i3d node (onCreate) that pre-simulates a precipitation-type particle system so it already looks established when the game starts. It is registered as a non-updateable in the current mission and has no update or delete logic.

- **SimParticleSystem** (l.9)

## Functions

| Function | Line | Description |
|---|---|---|
| `SimParticleSystem:onCreate(id: integer)` | 14 | ✍ i3d onCreate callback: builds a SimParticleSystem for the node and registers it with `g_currentMission:addNonUpdateable`. |
| `SimParticleSystem.new(name: integer) → table` | 22 | ✍ Constructor. If the node is a shape whose geometry has the precipitation class id, it reads the particle system lifespan and advances the simulation by that duration. Engine calls themselves are UNVERIFIED (not in the dump). |
