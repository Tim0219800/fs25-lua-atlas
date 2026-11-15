# animals/husbandry/placeables/PlaceableHusbandry.lua

Source : `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandry.lua` — FS25 1.25.1.0

- **PlaceableHusbandry** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHusbandry.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableHusbandry.registerEvents(placeableType: any)` | 24 |  |
| `PlaceableHusbandry.registerFunctions(placeableType: any)` | 31 |  |
| `PlaceableHusbandry.registerOverwrittenFunctions(placeableType: any)` | 55 |  |
| `PlaceableHusbandry.registerEventListeners(placeableType: any)` | 65 |  |
| `PlaceableHusbandry.registerXMLPaths(schema: any, basePath: any)` | 79 |  |
| `PlaceableHusbandry.registerSavegameXMLPaths(schema: any, basePath: any)` | 94 |  |
| `PlaceableHusbandry:onLoad(savegame: table)` | 106 |  |
| `PlaceableHusbandry:onDelete()` | 169 |  |
| `PlaceableHusbandry:onFinalizePlacement()` | 206 |  |
| `PlaceableHusbandry:onReadStream(streamId: any, connection: any)` | 273 |  |
| `PlaceableHusbandry:onWriteStream(streamId: any, connection: any)` | 300 |  |
| `PlaceableHusbandry:onReadUpdateStream(streamId: any, connection: any)` | 327 |  |
| `PlaceableHusbandry:onWriteUpdateStream(streamId: any, connection: any)` | 336 |  |
| `PlaceableHusbandry:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 345 |  |
| `PlaceableHusbandry:loadFromXMLFile(xmlFile: any, key: any)` | 357 |  |
| `PlaceableHusbandry:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 368 |  |
| `PlaceableHusbandry:collectPickObjects(superFunc: any, node: any, target: any)` | 408 |  |
| `PlaceableHusbandry:getCanBePlacedAt(superFunc: any, x: any, y: any, z: any, farmId: any)` | 432 |  |
| `PlaceableHusbandry:canBuy(superFunc: any)` | 442 |  |
| `PlaceableHusbandry:onHourChanged(currentHour: any)` | 452 |  |
| `PlaceableHusbandry:onBuy()` | 480 |  |
| `PlaceableHusbandry:getNeedHourChanged(superFunc: any)` | 502 |  |
| `PlaceableHusbandry:updateFeeding()` | 508 |  |
| `PlaceableHusbandry:updateProduction(foodFactor: any)` | 514 |  |
| `PlaceableHusbandry:updateOutput(foodFactor: any, productionFactor: any, globalProductionFactor: any)` | 522 |  |
| `PlaceableHusbandry:getGlobalProductionFactor()` | 527 |  |
| `PlaceableHusbandry:getConditionInfos()` | 539 |  |
| `PlaceableHusbandry:getFoodInfos()` | 545 |  |
| `PlaceableHusbandry:getAnimalInfos()` | 551 |  |
| `PlaceableHusbandry:getAnimalDescription(cluster: any)` | 557 |  |
| `PlaceableHusbandry:getHusbandryCapacity(fillTypeIndex: any, farmId: any)` | 563 |  |
| `PlaceableHusbandry:getHusbandryFreeCapacity(fillTypeIndex: any, farmId: any)` | 573 |  |
| `PlaceableHusbandry:addHusbandryFillLevelFromTool(farmId: any, deltaFillLevel: any, fillTypeIndex: any, fillPositionData: any, toolType: any, extraAttributes: any)` | 583 |  |
| `PlaceableHusbandry:removeHusbandryFillLevel(farmId: integer, deltaFillLevel: number, fillTypeIndex: integer) → number` | 597 |  |
| `PlaceableHusbandry:getHusbandryFillLevel(fillTypeIndex: any, farmId: any)` | 607 |  |
| `PlaceableHusbandry:getHusbandryIsFillTypeSupported(fillTypeIndex: any)` | 617 |  |
| `PlaceableHusbandry:onAddedStorageToLoadingStation(storage: any, loadingStation: any)` | 627 |  |
| `PlaceableHusbandry:onRemovedStorageFromLoadingStation(storage: any, loadingStation: any)` | 636 |  |
| `PlaceableHusbandry:onAddedStorageToUnloadingStation(storage: any, unloadingStation: any)` | 645 |  |
| `PlaceableHusbandry:onRemovedStorageFromUnloadingStation(storage: any, unloadingStation: any)` | 654 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onHusbandryFillLevelChanged` | 25 |
| registerEvent | `onFinishedFeeding` | 26 |
| registerFunction | `onAddedStorageToLoadingStation` | 32 |
| registerFunction | `onRemovedStorageFromLoadingStation` | 33 |
| registerFunction | `onAddedStorageToUnloadingStation` | 34 |
| registerFunction | `onRemovedStorageFromUnloadingStation` | 35 |
| registerFunction | `updateFeeding` | 36 |
| registerFunction | `updateProduction` | 37 |
| registerFunction | `updateOutput` | 38 |
| registerFunction | `getGlobalProductionFactor` | 39 |
| registerFunction | `getProductionFactor` | 40 |
| registerFunction | `getConditionInfos` | 41 |
| registerFunction | `getFoodInfos` | 42 |
| registerFunction | `getAnimalInfos` | 43 |
| registerFunction | `getAnimalDescription` | 44 |
| registerFunction | `getHusbandryCapacity` | 45 |
| registerFunction | `getHusbandryFreeCapacity` | 46 |
| registerFunction | `addHusbandryFillLevelFromTool` | 47 |
| registerFunction | `removeHusbandryFillLevel` | 48 |
| registerFunction | `getHusbandryFillLevel` | 49 |
| registerFunction | `getHusbandryIsFillTypeSupported` | 50 |
| registerOverwrittenFunction | `setOwnerFarmId` | 56 |
| registerOverwrittenFunction | `collectPickObjects` | 57 |
| registerOverwrittenFunction | `getCanBePlacedAt` | 58 |
| registerOverwrittenFunction | `canBuy` | 59 |
| registerOverwrittenFunction | `getNeedHourChanged` | 60 |
| registerEventListener | `onLoad` | 66 |
| registerEventListener | `onDelete` | 67 |
| registerEventListener | `onFinalizePlacement` | 68 |
| registerEventListener | `onReadStream` | 69 |
| registerEventListener | `onWriteStream` | 70 |
| registerEventListener | `onReadUpdateStream` | 71 |
| registerEventListener | `onWriteUpdateStream` | 72 |
| registerEventListener | `onHourChanged` | 73 |
| registerEventListener | `onBuy` | 74 |

## Messages

- écoute `MessageType.STORAGE_ADDED_TO_LOADING_STATION` (l.209)
- écoute `MessageType.STORAGE_REMOVED_FROM_LOADING_STATION` (l.210)
- écoute `MessageType.STORAGE_ADDED_TO_UNLOADING_STATION` (l.211)
- écoute `MessageType.STORAGE_REMOVED_FROM_UNLOADING_STATION` (l.212)
