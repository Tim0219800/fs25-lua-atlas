# placeables/specializations/PlaceableMultiBunkerSilo.lua

Source : `dataS/scripts/placeables/specializations/PlaceableMultiBunkerSilo.lua` — FS25 1.25.1.0

- **PlaceableMultiBunkerSilo** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableMultiBunkerSilo.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableMultiBunkerSilo.initSpecialization()` | 25 |  |
| `PlaceableMultiBunkerSilo.registerEventListeners(placeableType: any)` | 31 |  |
| `PlaceableMultiBunkerSilo.registerFunctions(placeableType: any)` | 42 |  |
| `PlaceableMultiBunkerSilo.registerOverwrittenFunctions(placeableType: any)` | 50 |  |
| `PlaceableMultiBunkerSilo.registerXMLPaths(schema: any, basePath: any)` | 61 |  |
| `PlaceableMultiBunkerSilo.registerSavegameXMLPaths(schema: any, basePath: any)` | 84 |  |
| `PlaceableMultiBunkerSilo:onLoad(savegame: table)` | 93 |  |
| `PlaceableMultiBunkerSilo:onDelete()` | 156 |  |
| `PlaceableMultiBunkerSilo:onFinalizePlacement()` | 171 |  |
| `PlaceableMultiBunkerSilo:onReadStream(streamId: any, connection: any)` | 187 |  |
| `PlaceableMultiBunkerSilo:onWriteStream(streamId: any, connection: any)` | 199 |  |
| `PlaceableMultiBunkerSilo:loadFromXMLFile(xmlFile: any, key: any)` | 211 |  |
| `PlaceableMultiBunkerSilo:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 227 |  |
| `PlaceableMultiBunkerSilo:setWallVisibility(isLeftVisible: any, isBackVisible: any, isRightVisible: any)` | 238 |  |
| `PlaceableMultiBunkerSilo:getIsBunkerSiloExtendable()` | 280 |  |
| `PlaceableMultiBunkerSilo:updateBunkerSiloWalls(isDeleting: any)` | 287 |  |
| `PlaceableMultiBunkerSilo:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 328 |  |
| `PlaceableMultiBunkerSilo:onSell()` | 342 |  |
| `PlaceableMultiBunkerSilo:canBeSold(superFunc: any)` | 351 |  |
| `PlaceableMultiBunkerSilo:startPlacementCheck(superFunc: function, x: number?, y: number?, z: number?, rotY: number?)` | 371 |  |
| `PlaceableMultiBunkerSilo:getHasOverlap(superFunc: any, x: any, y: any, z: any, rotY: any, checkFunc: any)` | 404 |  |
| `PlaceableMultiBunkerSilo:getPlacementRotation(superFunc: any, x: any, y: any, z: any)` | 428 |  |
| `PlaceableMultiBunkerSilo:getPlacementPosition(superFunc: any, x: any, y: any, z: any)` | 442 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoad` | 32 |
| registerEventListener | `onDelete` | 33 |
| registerEventListener | `onFinalizePlacement` | 34 |
| registerEventListener | `onReadStream` | 35 |
| registerEventListener | `onWriteStream` | 36 |
| registerEventListener | `onSell` | 37 |
| registerFunction | `updateBunkerSiloWalls` | 43 |
| registerFunction | `setWallVisibility` | 44 |
| registerFunction | `getIsBunkerSiloExtendable` | 45 |
| registerOverwrittenFunction | `getPlacementPosition` | 51 |
| registerOverwrittenFunction | `getPlacementRotation` | 52 |
| registerOverwrittenFunction | `getHasOverlap` | 53 |
| registerOverwrittenFunction | `startPlacementCheck` | 54 |
| registerOverwrittenFunction | `canBeSold` | 55 |
| registerOverwrittenFunction | `setOwnerFarmId` | 56 |
