# vehicles/specializations/WoodHarvesterLight.lua

*[Version française](../../../fr/scripts/vehicles/specializations/WoodHarvesterLight.md)*

Source: `dataS/scripts/vehicles/specializations/WoodHarvesterLight.lua` — FS25 1.25.1.0

✍ Simplified (automatic) wood harvester specialization. It requires TurnOnVehicle and AutomaticArmControlHarvester, which supply the arm alignment and the target tree. When the head is on and a non-stump tree is inside the cut node, it plays a cut animation, then deletes the whole tree, spawns a heap of pine logs on a free spot near it and plants a pine stump. A `woodHarvesterLight` configuration type is added. The class table declaration is absent from the dump lines.


## Functions

| Function | Line | Description |
|---|---|---|
| `WoodHarvesterLight.prerequisitesPresent(specializations: table) → boolean` | 25 | ✍ Returns true only if the vehicle type has both TurnOnVehicle and AutomaticArmControlHarvester. |
| `WoodHarvesterLight.initSpecialization()` | 31 | ✍ Adds the `woodHarvesterLight` configuration type and registers XML paths: cut node, cut and grab animations, log spawner settings, cut effects and sound. |
| `WoodHarvesterLight.registerFunctions(vehicleType: any)` | 61 | ✍ Registers `updateLogSpawner`, `onWoodHarversterLogSpawnerCallback`, `spawnLogHeap` and `spawnTreeStump` on the vehicle type. |
| `WoodHarvesterLight.registerOverwrittenFunctions(vehicleType: any)` | 70 | ✍ Overrides `getSupportsAutoTreeAlignment`, `getAutoAlignHasValidTree` and `getAreControlledActionsAllowed`. |
| `WoodHarvesterLight.registerEventListeners(vehicleType: any)` | 78 | ✍ Subscribes to onLoad, onDelete, onUpdate, onTurnedOn and onTurnedOff. |
| `WoodHarvesterLight:onLoad(savegame: any)` | 88 | ✍ Reads cut node, animations and log spawner settings; the log model is fixed to `data/maps/trees/logs/pineLog.i3d` (size 0.4 x 5, volume 0.66). Loads effects and sound on clients. Removes update and turn on/off listeners if no cut node exists. |
| `WoodHarvesterLight:onDelete()` | 145 | ✍ Client: deletes the cut effects and sound samples. |
| `WoodHarvesterLight:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 156 | ✍ While on, finds a non-stump tree in the cut node and, unless arm alignment is running, plays the cut animation; at half progress it deletes the tree, spawns the log heap and stump (if volume is nonzero), updates cut-count stats, achievements and hints, and replays controlled actions when available. Always feeds the log spawner with the current alignment target. Note: there is no server check in the cut branch (UNVERIFIED whether the vehicle update only runs where expected). |
| `WoodHarvesterLight:onTurnedOn()` | 254 | ✍ Plays the grab animation forward. |
| `WoodHarvesterLight:onTurnedOff()` | 261 | ✍ Plays the grab animation backward and, on clients, stops effects and sounds. |
| `WoodHarvesterLight:getSupportsAutoTreeAlignment(superFunc: any)` | 273 | ✍ Always returns true. |
| `WoodHarvesterLight:getAutoAlignHasValidTree(superFunc: any, radius: any)` | 279 | ✍ Returns two booleans: whether a tree is currently in the cut node, and whether the radius fits the configured maximum. |
| `WoodHarvesterLight:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 288 | ✍ When starting the action sequence, returns false with a warning if the tree is invalid (no access, wrong type, too thick), out of range, or no free spawn box exists. Turning off is always allowed; otherwise defers to the parent. |
| `WoodHarvesterLight:updateLogSpawner(tx: any, ty: any, tz: any, radius: any)` | 315 | ✍ Each call, resolves the previous async overlap test and searches for a free box next to the tree (sides, then behind, widening in steps of 2 up to `maxSpawnWidth`). Starts the next `overlapBoxAsync` test and keeps the last valid box and its heading. |
| `WoodHarvesterLight:onWoodHarversterLogSpawnerCallback(nodeId: any, ...: any)` | 382 | ✍ Overlap callback: any hit that is not a terrain transform group marks the tested box as blocked and advances to the next candidate. Always clears the pending flag. |
| `WoodHarvesterLight:spawnLogHeap(splitTypeIndex: any, treeVolume: any)` | 398 | ✍ If a valid box exists, spawns logs for a tree: count is tree volume divided by the log volume (at least 1), owned by the vehicle's farm. `splitTypeIndex` is not used. |
| `WoodHarvesterLight.spawnLogs(filename: any, numTrees: any, bx: any, by: any, bz: any, bry: any, lDiameter: any, lLength: any, farmId: any)` | 411 | ✍ Computes positions for a stack of logs in a box (a base row on the terrain plus a top row nested between them) and creates a `ForestryLog` per position from the given file with the given farm as owner. |
| `WoodHarvesterLight:spawnTreeStump(x: any, y: any, z: any)` | 481 | ✍ Plants a `pineStump` tree at the given position through `g_treePlantManager` if that tree type exists. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `updateLogSpawner` | 62 |
| registerFunction | `onWoodHarversterLogSpawnerCallback` | 63 |
| registerFunction | `spawnLogHeap` | 64 |
| registerFunction | `spawnTreeStump` | 65 |
| registerOverwrittenFunction | `getSupportsAutoTreeAlignment` | 71 |
| registerOverwrittenFunction | `getAutoAlignHasValidTree` | 72 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 73 |
| registerEventListener | `onLoad` | 79 |
| registerEventListener | `onDelete` | 80 |
| registerEventListener | `onUpdate` | 81 |
| registerEventListener | `onTurnedOn` | 82 |
| registerEventListener | `onTurnedOff` | 83 |
