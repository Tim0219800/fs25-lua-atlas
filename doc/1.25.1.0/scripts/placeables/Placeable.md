# placeables/Placeable.lua

Source: `dataS/scripts/placeables/Placeable.lua` — FS25 1.25.1.0

- **Placeable** inherits from `Object` (l.18)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Placeable.registerEvents(placeableType: any)` | 68 |  |
| `Placeable.registerFunctions(placeableType: any)` | 103 |  |
| `Placeable.init()` | 145 |  |
| `Placeable.postInit()` | 206 |  |
| `Placeable.new(isServer: any, isClient: any, customMt: any)` | 227 |  |
| `Placeable:setFilename(filename: any)` | 260 |  |
| `Placeable:setConfigurations(configurations: any, boughtConfigurations: any, configurationData: any)` | 269 |  |
| `Placeable:setType(typeDef: any)` | 289 |  |
| `Placeable:setLoadCallback(loadCallbackFunction: any, loadCallbackFunctionTarget: any, loadCallbackFunctionArguments: any)` | 311 |  |
| `Placeable:loadCallback()` | 319 |  |
| `Placeable:load(placeableLoadingData: any)` | 329 |  |
| `Placeable:i3dFileLoaded(i3dNode: any, failedReason: any, args: any, i3dLoadingId: any)` | 463 |  |
| `Placeable:onFinishedLoading()` | 610 |  |
| `Placeable:onLoadingError(msg: any, ...: any)` | 702 |  |
| `Placeable:createLoadingTask(target: any) → table` | 719 |  |
| `Placeable:finishLoadingTask(task: table)` | 726 |  |
| `Placeable:finalizePlacement()` | 732 |  |
| `Placeable:delete(immediate: any)` | 780 |  |
| `Placeable:readStream(streamId: integer, connection: table, objectId: any)` | 865 |  |
| `Placeable:writeStream(streamId: integer, connection: table)` | 925 |  |
| `Placeable:postReadStream(streamId: integer, connection: table)` | 951 |  |
| `Placeable:postWriteStream(streamId: integer, connection: table)` | 989 |  |
| `Placeable:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 1021 |  |
| `Placeable:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 1041 |  |
| `Placeable:saveToXMLFile(xmlFile: string, key: any, usedModNames: any) → string, string` | 1061 |  |
| `Placeable:setPropertyState(state: any)` | 1121 |  |
| `Placeable:getPropertyState()` | 1127 |  |
| `Placeable:setVisibility(state: any)` | 1173 |  |
| `Placeable:getIsSynchronized()` | 1181 |  |
| `Placeable:getNeedsSaving()` | 1191 |  |
| `Placeable:getUniqueId() → string` | 1198 |  |
| `Placeable:setUniqueId(uniqueId: string)` | 1205 |  |
| `Placeable:update(dt: any)` | 1213 |  |
| `Placeable:updateTick(dt: any)` | 1219 |  |
| `Placeable:draw()` | 1225 |  |
| `Placeable:drawDebug()` | 1231 |  |
| `Placeable:getName() → string` | 1238 |  |
| `Placeable:getImageFilename()` | 1244 |  |
| `Placeable:getCanBeRenamedByFarm(farmId: any)` | 1250 |  |
| `Placeable:setName(name: string, noEventSend: boolean) → boolean` | 1259 |  |
| `Placeable:setNameL10nKey(nameL10nKey: string)` | 1278 |  |
| `Placeable:onBuy()` | 1289 |  |
| `Placeable:onSell()` | 1304 |  |
| `Placeable:getPrice()` | 1311 |  |
| `Placeable:canBuy() → boolean` | 1319 |  |
| `Placeable:getCanBePlacedAt(x: any, y: any, z: any, farmId: any)` | 1335 |  |
| `Placeable:canBeSold()` | 1341 |  |
| `Placeable:getDestructionMethod()` | 1347 |  |
| `Placeable:previewNodeDestructionNodes(node: any)` | 1353 |  |
| `Placeable:performNodeDestruction(node: integer) → boolean, boolean` | 1362 |  |
| `Placeable:onFarmlandStateChanged(farmlandId: any, farmId: any, loadFromSavegame: any)` | 1368 |  |
| `Placeable:register(alreadySent: any)` | 1381 |  |
| `Placeable:setOwnerFarmId(farmId: any, noEventSend: any)` | 1394 |  |
| `Placeable:setLoadingState(loadingState: any)` | 1441 |  |
| `Placeable:collectPickObjects(node: integer)` | 1455 |  |
| `Placeable:setLoadingStep(loadingStep: SpecializationLoadStep)` | 1468 |  |
| `Placeable:setOverlayColor(r: any, g: any, b: any, alpha: any)` | 1474 |  |
| `Placeable:setOverlayColorNodes(node: integer, nodeTable: table)` | 1489 |  |
| `Placeable:getDailyUpkeep() → integer` | 1503 |  |
| `Placeable:getSellPrice() → integer, boolean` | 1519 |  |
| `Placeable:getSellAction() → integer` | 1544 |  |
| `Placeable:addToPhysics()` | 1563 |  |
| `Placeable:removeFromPhysics()` | 1571 |  |
| `Placeable:setPreviewPosition(x: any, y: any, z: any, rotX: any, rotY: any, rotZ: any)` | 1579 |  |
| `Placeable:getNeedWeatherChanged()` | 1586 |  |
| `Placeable:weatherChanged()` | 1592 |  |
| `Placeable:getNeedHourChanged()` | 1598 |  |
| `Placeable:hourChanged(hour: any)` | 1604 |  |
| `Placeable:getNeedMinuteChanged()` | 1610 |  |
| `Placeable:minuteChanged(minute: any)` | 1616 |  |
| `Placeable:getNeedDayChanged()` | 1622 |  |
| `Placeable:dayChanged(day: any)` | 1628 |  |
| `Placeable:periodChanged(period: any)` | 1634 |  |
| `Placeable.getSpecValueSlots(storeItem: any, realItem: any)` | 1641 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onPreLoad` | 69 |
| registerEvent | `onLoad` | 70 |
| registerEvent | `onPostLoad` | 71 |
| registerEvent | `onPreLoadFinished` | 72 |
| registerEvent | `onLoadFinished` | 73 |
| registerEvent | `onRegistered` | 74 |
| registerEvent | `onPreDelete` | 75 |
| registerEvent | `onDelete` | 76 |
| registerEvent | `onSave` | 77 |
| registerEvent | `onReadStream` | 78 |
| registerEvent | `onWriteStream` | 79 |
| registerEvent | `onReadUpdateStream` | 80 |
| registerEvent | `onWriteUpdateStream` | 81 |
| registerEvent | `onDirtyMaskCleared` | 82 |
| registerEvent | `onPreFinalizePlacement` | 83 |
| registerEvent | `onFinalizePlacement` | 84 |
| registerEvent | `onPostFinalizePlacement` | 85 |
| registerEvent | `onUpdate` | 86 |
| registerEvent | `onUpdateTick` | 87 |
| registerEvent | `onDraw` | 88 |
| registerEvent | `onDrawDebug` | 89 |
| registerEvent | `onHourChanged` | 90 |
| registerEvent | `onMinuteChanged` | 91 |
| registerEvent | `onDayChanged` | 92 |
| registerEvent | `onPeriodChanged` | 93 |
| registerEvent | `onWeatherChanged` | 94 |
| registerEvent | `onFarmlandStateChanged` | 95 |
| registerEvent | `onBuy` | 96 |
| registerEvent | `onSell` | 97 |
| registerEvent | `onOwnerChanged` | 98 |
| registerFunction | `register` | 104 |
| registerFunction | `getPosition` | 105 |
| registerFunction | `getIsOnFarmland` | 106 |
| registerFunction | `getFarmlandId` | 107 |
| registerFunction | `setPose` | 108 |
| registerFunction | `setOwnerFarmId` | 109 |
| registerFunction | `setLoadingStep` | 110 |
| registerFunction | `setLoadingState` | 111 |
| registerFunction | `addToPhysics` | 112 |
| registerFunction | `removeFromPhysics` | 113 |
| registerFunction | `collectPickObjects` | 114 |
| registerFunction | `getNeedWeatherChanged` | 115 |
| registerFunction | `getNeedHourChanged` | 116 |
| registerFunction | `getNeedMinuteChanged` | 117 |
| registerFunction | `getNeedDayChanged` | 118 |
| registerFunction | `getName` | 119 |
| registerFunction | `getImageFilename` | 120 |
| registerFunction | `getCanBeRenamedByFarm` | 121 |
| registerFunction | `setName` | 122 |
| registerFunction | `getPrice` | 123 |
| registerFunction | `canBuy` | 124 |
| registerFunction | `getCanBePlacedAt` | 125 |
| registerFunction | `canBeSold` | 126 |
| registerFunction | `getDestructionMethod` | 127 |
| registerFunction | `previewNodeDestructionNodes` | 128 |
| registerFunction | `performNodeDestruction` | 129 |
| registerFunction | `updateOwnership` | 130 |
| registerFunction | `setOverlayColor` | 131 |
| registerFunction | `setOverlayColorNodes` | 132 |
| registerFunction | `getDailyUpkeep` | 133 |
| registerFunction | `getSellPrice` | 134 |
| registerFunction | `setPreviewPosition` | 135 |
| registerFunction | `setPropertyState` | 136 |
| registerFunction | `getPropertyState` | 137 |
| registerFunction | `setVisibility` | 138 |
| registerFunction | `getIsSynchronized` | 139 |
| registerFunction | `getIsPreplaced` | 140 |

## Messages

- subscribes `MessageType.FARMLAND_OWNER_CHANGED` (l.754)
- subscribes `MessageType.DAY_NIGHT_CHANGED` (l.761)
- subscribes `MessageType.HOUR_CHANGED` (l.764)
- subscribes `MessageType.MINUTE_CHANGED` (l.767)
- subscribes `MessageType.DAY_CHANGED` (l.770)
- subscribes `MessageType.PERIOD_CHANGED` (l.772)
- publishes `MessageType.FARM_PROPERTY_CHANGED` (l.774)
- publishes `MessageType.PLACEABLE_PRE_DELETE` (l.822)
- publishes `MessageType.UNLOADING_STATIONS_CHANGED` (l.1268)
- publishes `MessageType.LOADING_STATIONS_CHANGED` (l.1269)
- publishes `MessageType.FARM_PROPERTY_CHANGED` (l.1305)
