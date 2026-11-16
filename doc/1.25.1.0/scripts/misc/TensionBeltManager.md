# misc/TensionBeltManager.lua

*[Version française](../../fr/scripts/misc/TensionBeltManager.md)*

Source: `dataS/scripts/misc/TensionBeltManager.lua` — FS25 1.25.1.0

✍ Plain manager (not an AbstractManager subclass) that stores the visual definitions of tension belts (straps used to secure loads). Belt types are registered when a map i3d node using the onCreateTensionBelt callback is loaded; each reads user attributes and child nodes (material, dummy material, hooks, ratchet). The first registered belt becomes the default.

- **TensionBeltManager** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `TensionBeltManager.new(customMt: any) → table` | 17 | ✍ Constructor: builds the manager with the given or default metatable and initialises its data tables. |
| `TensionBeltManager:initDataStructures()` | 27 | ✍ Empties the belts table and clears the default belt data. |
| `TensionBeltManager:unloadMapData()` | 34 | ✍ Called on map unload: simply resets all stored belts by re-running initDataStructures. |
| `TensionBeltManager.onCreateTensionBelt(_: any, id: any)` | 40 | ✍ i3d onCreate callback for a belt template node. Reads user attributes name (default "default") and width (default 0.15), then scans children flagged isMaterial, isDummyMaterial, isHook (first and second hook) and isRatchet. Warns and skips if the type exists or if material or dummy material is missing; stores the belt and sets the first one as default. Uses the global g_tensionBeltManager. |
| `TensionBeltManager:getType(beltName: any)` | 98 | ✍ Builds the internal key for a belt name: the uppercased name prefixed with BELT_TYPE_. |
| `TensionBeltManager:getBeltData(beltName: any)` | 104 | ✍ Returns the belt definition for a name, falling back to the default belt when the name is nil or unknown (nil if no belt was ever registered). |
