# placeables/specializations/PlaceableShallowWaterSimulation.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableShallowWaterSimulation.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableShallowWaterSimulation.lua` — FS25 1.25.1.0

✍ Placeable specialization with no prerequisites that registers water planes and obstacles from placeable.shallowWaterSimulation with g_currentMission.shallowWaterSimulation, so water on the building reacts to the shallow water simulation. It does nothing if that simulation does not exist or for construction previews. The simulation class itself is not in the dump (UNVERIFIED).

- **PlaceableShallowWaterSimulation** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableShallowWaterSimulation.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true. |
| `PlaceableShallowWaterSimulation:onLoad(savegame: table)` | 51 | ✍ Skips if there is no simulation or the placeable is a construction preview. Otherwise optionally applies a base material by name to each water plane and registers it, then adds each obstacle node with type (default rectangle), size, offset and Y rotation. |
| `PlaceableShallowWaterSimulation:onDelete()` | 126 | ✍ Removes the water planes (area geometry and plane) and obstacles that this placeable had registered. |
