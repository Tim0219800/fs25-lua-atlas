# placeables/specializations/PlaceableDoghouse.lua

Source: `dataS/scripts/placeables/specializations/PlaceableDoghouse.lua` — FS25 1.25.1.0

- **PlaceableDoghouse** (l.15)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableDoghouse.prerequisitesPresent(specializations: table) → boolean` | 22 |  |
| `PlaceableDoghouse.initSpecialization()` | 28 |  |
| `PlaceableDoghouse.registerFunctions(placeableType: any)` | 35 |  |
| `PlaceableDoghouse.registerOverwrittenFunctions(placeableType: any)` | 49 |  |
| `PlaceableDoghouse.registerEventListeners(placeableType: any)` | 58 |  |
| `PlaceableDoghouse.registerXMLPaths(schema: any, basePath: any)` | 69 |  |
| `PlaceableDoghouse.registerSavegameXMLPaths(schema: any, basePath: any)` | 92 |  |
| `PlaceableDoghouse:onLoad(savegame: table)` | 101 |  |
| `PlaceableDoghouse:onDelete()` | 206 |  |
| `PlaceableDoghouse:onFinalizePlacement()` | 240 |  |
| `PlaceableDoghouse:onReadStream(streamId: any, connection: any)` | 252 |  |
| `PlaceableDoghouse:onWriteStream(streamId: integer, connection: table)` | 269 |  |
| `PlaceableDoghouse:loadFromXMLFile(xmlFile: any, key: any)` | 281 |  |
| `PlaceableDoghouse:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 290 |  |
| `PlaceableDoghouse:onPreviewDogLoaded(node: any, failedReason: any, args: any)` | 299 |  |
| `PlaceableDoghouse:dogInteractionTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 319 |  |
| `PlaceableDoghouse:isDoghouseRegistered() → boolean` | 335 |  |
| `PlaceableDoghouse:registerDoghouseToMission() → boolean` | 343 |  |
| `PlaceableDoghouse:unregisterDoghouseToMission() → boolean` | 355 |  |
| `PlaceableDoghouse:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 363 |  |
| `PlaceableDoghouse:setFoodBowlState(isFilled: any, noEventSend: any)` | 380 |  |
| `PlaceableDoghouse:getDog()` | 399 |  |
| `PlaceableDoghouse:getSpawnNode()` | 405 |  |
| `PlaceableDoghouse:getCanBePlacedAt(superFunc: any, x: any, y: any, z: any, farmId: any)` | 411 |  |
| `PlaceableDoghouse:canBuy(superFunc: any)` | 421 |  |
| `PlaceableDoghouse:getNeedHourChanged(superFunc: any)` | 436 |  |
| `PlaceableDoghouse:onHourChanged()` | 442 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `dogInteractionTriggerCallback` | 36 |
| registerFunction | `isDoghouseRegistered` | 37 |
| registerFunction | `registerDoghouseToMission` | 38 |
| registerFunction | `unregisterDoghouseToMission` | 39 |
| registerFunction | `setFoodBowlState` | 40 |
| registerFunction | `getDog` | 41 |
| registerFunction | `getSpawnNode` | 42 |
| registerFunction | `onPreviewDogLoaded` | 43 |
| registerOverwrittenFunction | `setOwnerFarmId` | 50 |
| registerOverwrittenFunction | `canBuy` | 51 |
| registerOverwrittenFunction | `getCanBePlacedAt` | 52 |
| registerOverwrittenFunction | `getNeedHourChanged` | 53 |
| registerEventListener | `onLoad` | 59 |
| registerEventListener | `onDelete` | 60 |
| registerEventListener | `onFinalizePlacement` | 61 |
| registerEventListener | `onWriteStream` | 62 |
| registerEventListener | `onReadStream` | 63 |
| registerEventListener | `onHourChanged` | 64 |
