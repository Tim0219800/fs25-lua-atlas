# placeables/specializations/PlaceableBunkerSilo.lua

Source: `dataS/scripts/placeables/specializations/PlaceableBunkerSilo.lua` — FS25 1.25.1.0

- **PlaceableBunkerSilo** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableBunkerSilo.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableBunkerSilo.registerEventListeners(placeableType: any)` | 24 |  |
| `PlaceableBunkerSilo.registerFunctions(placeableType: any)` | 35 |  |
| `PlaceableBunkerSilo.registerOverwrittenFunctions(placeableType: any)` | 43 |  |
| `PlaceableBunkerSilo.registerXMLPaths(schema: any, basePath: any)` | 54 |  |
| `PlaceableBunkerSilo.registerSavegameXMLPaths(schema: any, basePath: any)` | 66 |  |
| `PlaceableBunkerSilo:onLoad(savegame: table)` | 75 |  |
| `PlaceableBunkerSilo:onDelete()` | 99 |  |
| `PlaceableBunkerSilo:onFinalizePlacement()` | 111 |  |
| `PlaceableBunkerSilo:onReadStream(streamId: any, connection: any)` | 123 |  |
| `PlaceableBunkerSilo:onWriteStream(streamId: any, connection: any)` | 133 |  |
| `PlaceableBunkerSilo:loadFromXMLFile(xmlFile: any, key: any)` | 143 |  |
| `PlaceableBunkerSilo:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 151 |  |
| `PlaceableBunkerSilo:setWallVisibility(isLeftVisible: any, isRightVisible: any)` | 159 |  |
| `PlaceableBunkerSilo:getIsBunkerSiloExtendable()` | 166 |  |
| `PlaceableBunkerSilo:updateBunkerSiloWalls(isDeleting: any)` | 173 |  |
| `PlaceableBunkerSilo:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 209 |  |
| `PlaceableBunkerSilo:onSell()` | 221 |  |
| `PlaceableBunkerSilo:canBeSold(superFunc: any)` | 229 |  |
| `PlaceableBunkerSilo:startPlacementCheck(superFunc: function, x: number?, y: number?, z: number?, rotY: number?)` | 247 |  |
| `PlaceableBunkerSilo:getHasOverlap(superFunc: any, x: any, y: any, z: any, rotY: any, checkFunc: any)` | 280 |  |
| `PlaceableBunkerSilo:getPlacementRotation(superFunc: any, x: any, y: any, z: any)` | 305 |  |
| `PlaceableBunkerSilo:getPlacementPosition(superFunc: any, x: any, y: any, z: any)` | 319 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 25 |
| registerEventListener | `onDelete` | 26 |
| registerEventListener | `onFinalizePlacement` | 27 |
| registerEventListener | `onReadStream` | 28 |
| registerEventListener | `onWriteStream` | 29 |
| registerEventListener | `onSell` | 30 |
| registerFunction | `updateBunkerSiloWalls` | 36 |
| registerFunction | `setWallVisibility` | 37 |
| registerFunction | `getIsBunkerSiloExtendable` | 38 |
| registerOverwrittenFunction | `getPlacementPosition` | 44 |
| registerOverwrittenFunction | `getPlacementRotation` | 45 |
| registerOverwrittenFunction | `getHasOverlap` | 46 |
| registerOverwrittenFunction | `startPlacementCheck` | 47 |
| registerOverwrittenFunction | `canBeSold` | 48 |
| registerOverwrittenFunction | `setOwnerFarmId` | 49 |
