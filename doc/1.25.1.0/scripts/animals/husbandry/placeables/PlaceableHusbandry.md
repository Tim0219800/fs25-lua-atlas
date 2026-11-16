# animals/husbandry/placeables/PlaceableHusbandry.lua

*[Version française](../../../../fr/scripts/animals/husbandry/placeables/PlaceableHusbandry.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandry.lua` — FS25 1.25.1.0

✍ Base placeable specialization shared by all animal husbandries. It optionally loads an UnloadingStation, a Storage and a LoadingStation from the `placeable.husbandry` XML, registers them with the mission storage system and keeps the husbandry listed in husbandrySystem. Every hour on the server it calls updateFeeding, updateProduction and updateOutput (stubs here, meant to be overridden) and moves a global production factor up or down around a threshold. It raises the events onHusbandryFillLevelChanged and onFinishedFeeding.

- **PlaceableHusbandry** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableHusbandry.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: this specialization has no prerequisite specializations. |
| `PlaceableHusbandry.registerEvents(placeableType: any)` | 24 | ✍ Registers the placeable events onHusbandryFillLevelChanged and onFinishedFeeding. |
| `PlaceableHusbandry.registerFunctions(placeableType: any)` | 31 | ✍ Registers the specialization's functions on the placeable type: station callbacks, feeding and production updates, info getters and the fill level helpers. Note: getProductionFactor is registered but no function of that name exists in this file, so it is registered as nil. |
| `PlaceableHusbandry.registerOverwrittenFunctions(placeableType: any)` | 55 | ✍ Overrides setOwnerFarmId, collectPickObjects, getCanBePlacedAt, canBuy and getNeedHourChanged of the placeable. |
| `PlaceableHusbandry.registerEventListeners(placeableType: any)` | 65 | ✍ Subscribes the specialization to onLoad, onDelete, onFinalizePlacement, the four stream events, onHourChanged and onBuy. |
| `PlaceableHusbandry.registerXMLPaths(schema: any, basePath: any)` | 79 | ✍ Registers the `.husbandry` XML paths: saveId, hasStatistics, the production threshold and per-hour increase and decrease rates, plus the nested unloadingStation, storage and loadingStation schemas. |
| `PlaceableHusbandry.registerSavegameXMLPaths(schema: any, basePath: any)` | 94 | ✍ Registers the savegame paths: module names, globalProductionFactor, productionFactor and the storage savegame schema. |
| `PlaceableHusbandry:onLoad(savegame: table)` | 106 | ✍ Creates the unloading station, storage and loading station present in the XML (on failure it logs an error and sets the placeable loading state to ERROR) and reads the production threshold (default 0.25, clamped 0.01 to 0.99) and the hourly increase and decrease. Sets up the fill level callback that raises the fill level event. |
| `PlaceableHusbandry:onDelete()` | 169 | ✍ Removes and deletes the stations and storage from the storage system, removes the liquid manure loading station if supported, unsubscribes the storage messages and removes the placeable from husbandrySystem. |
| `PlaceableHusbandry:onFinalizePlacement()` | 206 | ✍ Subscribes to the storage added or removed messages, registers the stations and storage with the storage system (owner farm EVERYONE becomes NOBODY), links them, adds usable storage extensions in range, and adds the husbandry to husbandrySystem. |
| `PlaceableHusbandry:onReadStream(streamId: any, connection: any)` | 273 | ✍ Client join: reads each existing station and storage with its object id and finishes object registration, then reads the two production factors as bytes divided by 255. |
| `PlaceableHusbandry:onWriteStream(streamId: any, connection: any)` | 300 | ✍ Server join: writes each station and storage with its object id and registers the object in the stream, then both production factors scaled to a byte (times 255). |
| `PlaceableHusbandry:onReadUpdateStream(streamId: any, connection: any)` | 327 | ✍ Reads the two production factors as bytes divided by 100. Note: the join stream uses a scale of 255 while update streams use 100, so the two paths are inconsistent. |
| `PlaceableHusbandry:onWriteUpdateStream(streamId: any, connection: any)` | 336 | ✍ Writes the two production factors as bytes scaled by 100 (see the scale note on onReadUpdateStream). |
| `PlaceableHusbandry:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 345 | ✍ Saves the storage (under `.storage`) and the global and current production factors to the savegame. |
| `PlaceableHusbandry:loadFromXMLFile(xmlFile: any, key: any)` | 357 | ✍ Loads the storage and the two production factors from the savegame, keeping current values as defaults. |
| `PlaceableHusbandry:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 368 | ✍ Override: after the parent call, propagates the owner farm to storage and both stations (EVERYONE maps to NOBODY) and attaches storage extensions in range for a real owner. |
| `PlaceableHusbandry:collectPickObjects(superFunc: any, node: any, target: any)` | 408 | ✍ Override: skips nodes that are the unloading station's exact-fill root nodes or the loading station's trigger nodes, so they are not picked as the placeable; others go to the parent. |
| `PlaceableHusbandry:getCanBePlacedAt(superFunc: any, x: any, y: any, z: any, farmId: any)` | 432 | ✍ Override: returns false with a too-many-husbandries message when the husbandry limit is reached, otherwise defers to the parent. Note: farmId is not passed to the parent. |
| `PlaceableHusbandry:canBuy(superFunc: any)` | 442 | ✍ Override: returns false with a too-many-husbandries message when the husbandry limit is reached, otherwise defers to the parent. |
| `PlaceableHusbandry:onHourChanged(currentHour: any)` | 452 | ✍ Server only. Runs feeding, raises onFinishedFeeding, computes the production factor and moves the global factor up (above the threshold, rate increasePerHour) or down (below, rate decreasePerHour), clamped to 0..1. It then calls updateOutput and flags the update stream. |
| `PlaceableHusbandry:onBuy()` | 480 | ✍ After purchase, attaches usable storage extensions in range to the unloading station and, if present, the loading station. |
| `PlaceableHusbandry:getNeedHourChanged(superFunc: any)` | 502 | ✍ Override that always returns true so the placeable receives hour change events. |
| `PlaceableHusbandry:updateFeeding()` | 508 | ✍ Default feeding step: returns a food factor of 1. Specializations override it with real feeding logic. |
| `PlaceableHusbandry:updateProduction(foodFactor: any)` | 514 | ✍ Default production step: stores the food factor as the current production factor and returns it. Called hourly on the server. |
| `PlaceableHusbandry:updateOutput(foodFactor: any, productionFactor: any, globalProductionFactor: any)` | 522 | ✍ Empty hook called hourly with the food, production and global production factors; overridden by subclasses to produce output. |
| `PlaceableHusbandry:getGlobalProductionFactor()` | 527 | ✍ Returns the slowly changing global production factor (0 to 1). |
| `PlaceableHusbandry:getConditionInfos()` | 539 | ✍ Default condition info list for the animal menu: an empty table. Overridden or extended by other specializations. |
| `PlaceableHusbandry:getFoodInfos()` | 545 | ✍ Default food info list: an empty table, to be overridden. |
| `PlaceableHusbandry:getAnimalInfos()` | 551 | ✍ Default animal info list: an empty table, to be overridden. |
| `PlaceableHusbandry:getAnimalDescription(cluster: any)` | 557 | ✍ Default description text for an animal cluster: an empty string, to be overridden. |
| `PlaceableHusbandry:getHusbandryCapacity(fillTypeIndex: any, farmId: any)` | 563 | ✍ Returns the capacity of the unloading station for a fill type and farm (default owner farm), or 0 without an unloading station. |
| `PlaceableHusbandry:getHusbandryFreeCapacity(fillTypeIndex: any, farmId: any)` | 573 | ✍ Returns the free capacity of the unloading station for a fill type and farm, or 0 without an unloading station. |
| `PlaceableHusbandry:addHusbandryFillLevelFromTool(farmId: any, deltaFillLevel: any, fillTypeIndex: any, fillPositionData: any, toolType: any, extraAttributes: any)` | 583 | ✍ Adds fill to the unloading station from a tool and returns the amount applied; returns 0 without an unloading station. Parameters are passed through to the station. |
| `PlaceableHusbandry:removeHusbandryFillLevel(farmId: integer, deltaFillLevel: number, fillTypeIndex: integer) → number` | 597 | ✍ Removes fill via the loading station and returns the remaining delta; without a loading station it returns the delta unchanged. |
| `PlaceableHusbandry:getHusbandryFillLevel(fillTypeIndex: any, farmId: any)` | 607 | ✍ Returns the unloading station fill level for a fill type and farm, or 0 without an unloading station. |
| `PlaceableHusbandry:getHusbandryIsFillTypeSupported(fillTypeIndex: any)` | 617 | ✍ Returns whether the unloading station supports the fill type; false without an unloading station. |
| `PlaceableHusbandry:onAddedStorageToLoadingStation(storage: any, loadingStation: any)` | 627 | ✍ Message callback: if the loading station is this husbandry's, listens to the storage's fill level changes with the specialization callback. |
| `PlaceableHusbandry:onRemovedStorageFromLoadingStation(storage: any, loadingStation: any)` | 636 | ✍ Message callback: if the loading station is this husbandry's, stops listening to the storage's fill level changes. |
| `PlaceableHusbandry:onAddedStorageToUnloadingStation(storage: any, unloadingStation: any)` | 645 | ✍ Message callback: if the unloading station is this husbandry's, listens to the storage's fill level changes with the specialization callback. |
| `PlaceableHusbandry:onRemovedStorageFromUnloadingStation(storage: any, unloadingStation: any)` | 654 | ✍ Message callback: if the unloading station is this husbandry's, stops listening to the storage's fill level changes. |

## Specialization

| Type | Name | Line |
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

- subscribes `MessageType.STORAGE_ADDED_TO_LOADING_STATION` (l.209)
- subscribes `MessageType.STORAGE_REMOVED_FROM_LOADING_STATION` (l.210)
- subscribes `MessageType.STORAGE_ADDED_TO_UNLOADING_STATION` (l.211)
- subscribes `MessageType.STORAGE_REMOVED_FROM_UNLOADING_STATION` (l.212)
