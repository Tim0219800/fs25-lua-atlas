# placeables/specializations/PlaceableBoatyard.lua

Source: `dataS/scripts/placeables/specializations/PlaceableBoatyard.lua` — FS25 1.25.1.0

- **PlaceableBoatyard** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableBoatyard.prerequisitesPresent(specializations: table) → boolean` | 26 |  |
| `PlaceableBoatyard.registerFunctions(placeableType: any)` | 32 |  |
| `PlaceableBoatyard.registerOverwrittenFunctions(placeableType: any)` | 50 |  |
| `PlaceableBoatyard.registerEventListeners(placeableType: any)` | 58 |  |
| `PlaceableBoatyard.registerXMLPaths(schema: any, basePath: any)` | 70 |  |
| `PlaceableBoatyard.registerSavegameXMLPaths(schema: any, basePath: any)` | 109 |  |
| `PlaceableBoatyard:onLoad(savegame: table)` | 121 |  |
| `PlaceableBoatyard:collectPickObjects(superFunc: any, node: any)` | 365 |  |
| `PlaceableBoatyard:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 381 |  |
| `PlaceableBoatyard:loadFromXMLFile(xmlFile: any, key: any)` | 398 |  |
| `PlaceableBoatyard:onReadStream(streamId: any, connection: any)` | 420 |  |
| `PlaceableBoatyard:onWriteStream(streamId: any, connection: any)` | 458 |  |
| `PlaceableBoatyard:setOwnerFarmId(superFunc: any, farmId: any)` | 615 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onBoatI3DFileLoaded` | 33 |
| registerFunction | `setMeshProgress` | 34 |
| registerFunction | `setState` | 35 |
| registerFunction | `setSplineTime` | 36 |
| registerFunction | `addSplineDistanceDelta` | 37 |
| registerFunction | `getSplineTime` | 38 |
| registerFunction | `releaseBoat` | 39 |
| registerFunction | `createBoat` | 40 |
| registerFunction | `setWindValues` | 41 |
| registerFunction | `getFillLevel` | 42 |
| registerFunction | `removeFillLevel` | 43 |
| registerFunction | `playerTriggerCallback` | 44 |
| registerFunction | `buyRequest` | 45 |
| registerOverwrittenFunction | `collectPickObjects` | 51 |
| registerOverwrittenFunction | `updateInfo` | 52 |
| registerOverwrittenFunction | `setOwnerFarmId` | 53 |
| registerEventListener | `onLoad` | 59 |
| registerEventListener | `onDelete` | 60 |
| registerEventListener | `onUpdate` | 61 |
| registerEventListener | `onReadStream` | 62 |
| registerEventListener | `onWriteStream` | 63 |
| registerEventListener | `onReadUpdateStream` | 64 |
| registerEventListener | `onWriteUpdateStream` | 65 |
