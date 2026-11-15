# vehicles/specializations/WoodHarvesterLight.lua

Source : `dataS/scripts/vehicles/specializations/WoodHarvesterLight.lua` — FS25 1.25.1.0


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WoodHarvesterLight.prerequisitesPresent(specializations: table) → boolean` | 25 |  |
| `WoodHarvesterLight.initSpecialization()` | 31 |  |
| `WoodHarvesterLight.registerFunctions(vehicleType: any)` | 61 |  |
| `WoodHarvesterLight.registerOverwrittenFunctions(vehicleType: any)` | 70 |  |
| `WoodHarvesterLight.registerEventListeners(vehicleType: any)` | 78 |  |
| `WoodHarvesterLight:onLoad(savegame: any)` | 88 |  |
| `WoodHarvesterLight:onDelete()` | 145 |  |
| `WoodHarvesterLight:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 156 |  |
| `WoodHarvesterLight:onTurnedOn()` | 254 |  |
| `WoodHarvesterLight:onTurnedOff()` | 261 |  |
| `WoodHarvesterLight:getSupportsAutoTreeAlignment(superFunc: any)` | 273 |  |
| `WoodHarvesterLight:getAutoAlignHasValidTree(superFunc: any, radius: any)` | 279 |  |
| `WoodHarvesterLight:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 288 |  |
| `WoodHarvesterLight:updateLogSpawner(tx: any, ty: any, tz: any, radius: any)` | 315 |  |
| `WoodHarvesterLight:onWoodHarversterLogSpawnerCallback(nodeId: any, ...: any)` | 382 |  |
| `WoodHarvesterLight:spawnLogHeap(splitTypeIndex: any, treeVolume: any)` | 398 |  |
| `WoodHarvesterLight.spawnLogs(filename: any, numTrees: any, bx: any, by: any, bz: any, bry: any, lDiameter: any, lLength: any, farmId: any)` | 411 |  |
| `WoodHarvesterLight:spawnTreeStump(x: any, y: any, z: any)` | 481 |  |

## Spécialisation

| Type | Nom | Ligne |
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
