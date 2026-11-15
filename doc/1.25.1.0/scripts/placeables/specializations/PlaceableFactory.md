# placeables/specializations/PlaceableFactory.lua

Source: `dataS/scripts/placeables/specializations/PlaceableFactory.lua` — FS25 1.25.1.0

- **PlaceableFactory** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableFactory.prerequisitesPresent(specializations: table) → boolean` | 19 |  |
| `PlaceableFactory.registerFunctions(placeableType: any)` | 25 |  |
| `PlaceableFactory.registerOverwrittenFunctions(placeableType: any)` | 41 |  |
| `PlaceableFactory.registerEventListeners(placeableType: any)` | 48 |  |
| `PlaceableFactory.registerXMLPaths(schema: any, basePath: any)` | 63 |  |
| `PlaceableFactory.registerSavegameXMLPaths(schema: any, basePath: any)` | 93 |  |
| `PlaceableFactory:onLoad(savegame: table)` | 103 |  |
| `PlaceableFactory:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 340 |  |
| `PlaceableFactory:loadFromXMLFile(xmlFile: any, key: any)` | 353 |  |
| `PlaceableFactory:onReadStream(streamId: any, connection: any)` | 373 |  |
| `PlaceableFactory:onWriteStream(streamId: any, connection: any)` | 394 |  |
| `PlaceableFactory:setOwnerFarmId(superFunc: any, farmId: any)` | 520 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onMeshI3DFileLoaded` | 26 |
| registerFunction | `updateRemainingAmount` | 27 |
| registerFunction | `setMeshProgress` | 28 |
| registerFunction | `createFactoryItem` | 29 |
| registerFunction | `sellFactoryItem` | 30 |
| registerFunction | `getCapacity` | 31 |
| registerFunction | `getFillLevel` | 32 |
| registerFunction | `removeFillLevel` | 33 |
| registerFunction | `playerTriggerCallback` | 34 |
| registerFunction | `buyRequest` | 35 |
| registerFunction | `updateInfoData` | 36 |
| registerOverwrittenFunction | `updateInfo` | 42 |
| registerOverwrittenFunction | `setOwnerFarmId` | 43 |
| registerEventListener | `onLoad` | 49 |
| registerEventListener | `onDelete` | 50 |
| registerEventListener | `onUpdate` | 51 |
| registerEventListener | `onReadStream` | 52 |
| registerEventListener | `onWriteStream` | 53 |
| registerEventListener | `onReadUpdateStream` | 54 |
| registerEventListener | `onWriteUpdateStream` | 55 |
| registerEventListener | `onFinalizePlacement` | 56 |
| registerEventListener | `onInfoTriggerEnter` | 57 |
| registerEventListener | `onInfoTriggerLeave` | 58 |
