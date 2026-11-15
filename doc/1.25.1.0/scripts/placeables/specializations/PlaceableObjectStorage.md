# placeables/specializations/PlaceableObjectStorage.lua

Source: `dataS/scripts/placeables/specializations/PlaceableObjectStorage.lua` — FS25 1.25.1.0

- **PlaceableObjectStorage** (l.11)
- **AbstractBaleObject** (l.1131)
- **PlaceableObjectStorageActivatable** (l.1857)
- **PlaceableObjectStorageManualStoreActivatable** (l.1919)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableObjectStorage.prerequisitesPresent(specializations: table) → boolean` | 30 |  |
| `PlaceableObjectStorage.registerOverwrittenFunctions(placeableType: any)` | 36 |  |
| `PlaceableObjectStorage.registerFunctions(placeableType: any)` | 43 |  |
| `PlaceableObjectStorage.registerEventListeners(placeableType: any)` | 68 |  |
| `PlaceableObjectStorage.registerXMLPaths(schema: any, basePath: any)` | 80 |  |
| `PlaceableObjectStorage.registerSavegameXMLPaths(schema: any, basePath: any)` | 117 |  |
| `PlaceableObjectStorage.initSpecialization()` | 126 |  |
| `PlaceableObjectStorage:onLoad(savegame: table)` | 134 |  |
| `PlaceableObjectStorage:loadFromXMLFile(xmlFile: any, key: any)` | 245 |  |
| `PlaceableObjectStorage:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 263 |  |
| `PlaceableObjectStorage:onDelete()` | 278 |  |
| `PlaceableObjectStorage:onReadStream(streamId: any, connection: any)` | 310 |  |
| `PlaceableObjectStorage:onWriteStream(streamId: any, connection: any)` | 338 |  |
| `PlaceableObjectStorage:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 356 |  |
| `PlaceableObjectStorage:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 373 |  |
| `PlaceableObjectStorage:onUpdate(dt: any)` | 385 |  |
| `PlaceableObjectStorage:getObjectStorageSupportsFillType(fillTypeIndex: any)` | 453 |  |
| `PlaceableObjectStorage:getObjectStorageSupportsObject(object: any)` | 475 |  |
| `PlaceableObjectStorage:getObjectStorageCanStoreObject(object: any, automatically: any)` | 496 |  |
| `PlaceableObjectStorage:getIsBaleSupportedByUnloadTrigger(bale: any)` | 552 |  |
| `PlaceableObjectStorage:addObjectToObjectStorage(object: any, loadedFromSavegame: any)` | 558 |  |
| `PlaceableObjectStorage:addAbstactObjectToObjectStorage(abstractObject: any)` | 569 |  |
| `PlaceableObjectStorage:removeAbstractObjectsFromStorage(objectInfoIndex: any, amount: any, connection: any)` | 577 |  |
| `PlaceableObjectStorage:spawnNextObjectStorageObject(lastSuccess: any)` | 652 |  |
| `PlaceableObjectStorage:removeAbstractObjectFromStorage(abstractObject: any, x: any, y: any, z: any, rx: any, ry: any, rz: any)` | 712 |  |
| `PlaceableObjectStorage.onObjectFromStorageSpawned(self: any, spawnedObject: any)` | 727 |  |
| `PlaceableObjectStorage:setObjectStorageObjectInfosDirty()` | 736 |  |
| `PlaceableObjectStorage:updateDirtyObjectStorageObjectInfos()` | 744 |  |
| `PlaceableObjectStorage:updateObjectStorageObjectInfos()` | 753 |  |
| `PlaceableObjectStorage:getObjectStorageObjectInfos()` | 790 |  |
| `PlaceableObjectStorage:updateObjectStorageVisualAreas()` | 796 |  |
| `PlaceableObjectStorage:getHasPendingManualStoreObjects()` | 870 |  |
| `PlaceableObjectStorage:storePendingManualObjects()` | 889 |  |
| `PlaceableObjectStorage:updateManualStoreActivatable()` | 912 |  |
| `PlaceableObjectStorage:onObjectStoragePlayerTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 930 |  |
| `PlaceableObjectStorage:onObjectStorageSpawnOverlapCallback(objectId: any)` | 998 |  |
| `PlaceableObjectStorage:canBeSold(superFunc: any)` | 1017 |  |
| `PlaceableObjectStorage:updateInfo(superFunc: any, infoTable: any)` | 1028 |  |
| `PlaceableObjectStorage.loadSpecValueCapacity(xmlFile: any, customEnvironment: any, baseDir: any)` | 1059 |  |
| `PlaceableObjectStorage.getSpecValueCapacity(storeItem: any, realItem: any)` | 1082 |  |
| `PlaceableObjectStorage.loadSpecValueFillTypes(xmlFile: any, customEnvironment: any, baseDir: any)` | 1092 |  |
| `PlaceableObjectStorage.getSpecValueFillTypes(storeItem: any, realItem: any)` | 1110 |  |
| `PlaceableObjectStorageActivatable.new(objectStorage: any)` | 1861 |  |
| `PlaceableObjectStorageActivatable:getIsActivatable()` | 1873 |  |
| `PlaceableObjectStorageActivatable:run()` | 1887 |  |
| `PlaceableObjectStorageActivatable:getDistance(x: any, y: any, z: any)` | 1900 |  |
| `PlaceableObjectStorageActivatable:onObjectInfoSelected(objectInfoIndex: any, amount: any)` | 1911 |  |
| `PlaceableObjectStorageManualStoreActivatable.new(objectStorage: any)` | 1923 |  |
| `PlaceableObjectStorageManualStoreActivatable:getIsActivatable()` | 1934 |  |
| `PlaceableObjectStorageManualStoreActivatable:run()` | 1944 |  |
| `PlaceableObjectStorageManualStoreActivatable:getDistance(x: any, y: any, z: any)` | 1950 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `canBeSold` | 37 |
| registerOverwrittenFunction | `updateInfo` | 38 |
| registerFunction | `getObjectStorageSupportsFillType` | 44 |
| registerFunction | `getObjectStorageSupportsObject` | 45 |
| registerFunction | `getObjectStorageCanStoreObject` | 46 |
| registerFunction | `getIsBaleSupportedByUnloadTrigger` | 47 |
| registerFunction | `addObjectToObjectStorage` | 48 |
| registerFunction | `addAbstactObjectToObjectStorage` | 49 |
| registerFunction | `removeAbstractObjectsFromStorage` | 50 |
| registerFunction | `spawnNextObjectStorageObject` | 51 |
| registerFunction | `removeAbstractObjectFromStorage` | 52 |
| registerFunction | `setObjectStorageObjectInfosDirty` | 53 |
| registerFunction | `updateDirtyObjectStorageObjectInfos` | 54 |
| registerFunction | `updateObjectStorageObjectInfos` | 55 |
| registerFunction | `getObjectStorageObjectInfos` | 56 |
| registerFunction | `updateObjectStorageVisualAreas` | 57 |
| registerFunction | `getHasPendingManualStoreObjects` | 58 |
| registerFunction | `storePendingManualObjects` | 59 |
| registerFunction | `updateManualStoreActivatable` | 60 |
| registerFunction | `onObjectStoragePlayerTriggerCallback` | 61 |
| registerFunction | `onObjectStorageObjectTriggerCallback` | 62 |
| registerFunction | `onObjectStorageSpawnOverlapCallback` | 63 |
| registerEventListener | `onLoad` | 69 |
| registerEventListener | `onDelete` | 70 |
| registerEventListener | `onReadStream` | 71 |
| registerEventListener | `onWriteStream` | 72 |
| registerEventListener | `onReadUpdateStream` | 73 |
| registerEventListener | `onWriteUpdateStream` | 74 |
| registerEventListener | `onUpdate` | 75 |
