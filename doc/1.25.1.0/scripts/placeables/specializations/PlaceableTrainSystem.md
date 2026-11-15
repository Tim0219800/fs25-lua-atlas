# placeables/specializations/PlaceableTrainSystem.lua

Source: `dataS/scripts/placeables/specializations/PlaceableTrainSystem.lua` — FS25 1.25.1.0

- **PlaceableTrainSystem** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableTrainSystem.prerequisitesPresent(specializations: table) → boolean` | 20 |  |
| `PlaceableTrainSystem.registerFunctions(placeableType: any)` | 26 |  |
| `PlaceableTrainSystem.registerOverwrittenFunctions(placeableType: any)` | 60 |  |
| `PlaceableTrainSystem.registerEventListeners(placeableType: any)` | 66 |  |
| `PlaceableTrainSystem.registerXMLPaths(schema: any, basePath: any)` | 80 |  |
| `PlaceableTrainSystem.registerSavegameXMLPaths(schema: any, basePath: any)` | 104 |  |
| `PlaceableTrainSystem:onLoad(savegame: table)` | 118 |  |
| `PlaceableTrainSystem:onDelete()` | 304 |  |
| `PlaceableTrainSystem:onFinalizePlacement()` | 324 |  |
| `PlaceableTrainSystem:onReadStream(streamId: any, connection: any)` | 353 |  |
| `PlaceableTrainSystem:onWriteStream(streamId: any, connection: any)` | 384 |  |
| `PlaceableTrainSystem:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 410 |  |
| `PlaceableTrainSystem:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 433 |  |
| `PlaceableTrainSystem:loadFromXMLFile(xmlFile: any, key: any)` | 454 |  |
| `PlaceableTrainSystem:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 485 |  |
| `PlaceableTrainSystem:onUpdate(dt: any)` | 510 |  |
| `PlaceableTrainSystem:updateRailroadVehiclePositions(dt: any)` | 636 |  |
| `PlaceableTrainSystem:createVehicles()` | 703 |  |
| `PlaceableTrainSystem:railroadVehicleLoaded(vehicles: any, vehicleLoadState: any, args: any)` | 745 |  |
| `PlaceableTrainSystem:finalizeTrain(attachVehicles: any)` | 771 |  |
| `PlaceableTrainSystem:setIsTrainTabbable(isTabbable: any)` | 806 |  |
| `PlaceableTrainSystem:getIsTrainInDriveableRange()` | 824 |  |
| `PlaceableTrainSystem:getSplineTime()` | 830 |  |
| `PlaceableTrainSystem:setSplineTime(startTime: any, endTime: any)` | 836 |  |
| `PlaceableTrainSystem:addSplinePositionUpdateListener(listener: any)` | 896 |  |
| `PlaceableTrainSystem:removeSplinePositionUpdateListener(listener: any)` | 905 |  |
| `PlaceableTrainSystem:updateTrainPositionByLocomotiveSpeed(dt: any, speed: any)` | 914 |  |
| `PlaceableTrainSystem:updateTrainPositionByLocomotiveSplinePosition(splinePosition: any)` | 925 |  |
| `PlaceableTrainSystem:updateTrainLength(splinePosition: any)` | 934 |  |
| `PlaceableTrainSystem:toggleRent(farmId: any, position: any)` | 945 |  |
| `PlaceableTrainSystem:rentRailroad(farmId: any, position: any, noEventSend: any)` | 959 |  |
| `PlaceableTrainSystem:returnRailroad(noEventSend: any)` | 982 |  |
| `PlaceableTrainSystem:onDayChanged()` | 1009 |  |
| `PlaceableTrainSystem:getIsRented()` | 1022 |  |
| `PlaceableTrainSystem:getCanBeRented(farmId: any)` | 1029 |  |
| `PlaceableTrainSystem:onDeleteObject(object: any)` | 1043 |  |
| `PlaceableTrainSystem:getSplineLength()` | 1052 |  |
| `PlaceableTrainSystem:getElectricitySpline()` | 1059 |  |
| `PlaceableTrainSystem:getElectricitySplineLength()` | 1066 |  |
| `PlaceableTrainSystem:getNeedDayChanged(superFunc: any)` | 1073 |  |
| `PlaceableTrainSystem:getLengthSplineTime()` | 1079 |  |
| `PlaceableTrainSystem:getSpline()` | 1086 |  |
| `PlaceableTrainSystem:updateDriveableState(newSplineTime: any)` | 1093 |  |
| `PlaceableTrainSystem:gsIsTrainFilled()` | 1166 |  |
| `PlaceableTrainSystem:onSellGoodsQuestion(yes: any)` | 1184 |  |
| `PlaceableTrainSystem:sellGoods()` | 1192 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `updateRailroadVehiclePositions` | 27 |
| registerFunction | `createVehicles` | 28 |
| registerFunction | `railroadVehicleLoaded` | 29 |
| registerFunction | `finalizeTrain` | 30 |
| registerFunction | `setIsTrainTabbable` | 31 |
| registerFunction | `getIsTrainInDriveableRange` | 32 |
| registerFunction | `getSplineTime` | 33 |
| registerFunction | `setSplineTime` | 34 |
| registerFunction | `addSplinePositionUpdateListener` | 35 |
| registerFunction | `removeSplinePositionUpdateListener` | 36 |
| registerFunction | `updateTrainPositionByLocomotiveSpeed` | 37 |
| registerFunction | `updateTrainPositionByLocomotiveSplinePosition` | 38 |
| registerFunction | `updateTrainLength` | 39 |
| registerFunction | `toggleRent` | 40 |
| registerFunction | `getCanBeRented` | 41 |
| registerFunction | `rentRailroad` | 42 |
| registerFunction | `returnRailroad` | 43 |
| registerFunction | `onDeleteObject` | 44 |
| registerFunction | `getIsRented` | 45 |
| registerFunction | `getSplineLength` | 46 |
| registerFunction | `getElectricitySpline` | 47 |
| registerFunction | `getElectricitySplineLength` | 48 |
| registerFunction | `getLengthSplineTime` | 49 |
| registerFunction | `getSpline` | 50 |
| registerFunction | `updateDriveableState` | 51 |
| registerFunction | `gsIsTrainFilled` | 52 |
| registerFunction | `onSellGoodsQuestion` | 53 |
| registerFunction | `sellGoods` | 54 |
| registerFunction | `getTrainPosition` | 55 |
| registerOverwrittenFunction | `getNeedDayChanged` | 61 |
| registerEventListener | `onLoad` | 67 |
| registerEventListener | `onDelete` | 68 |
| registerEventListener | `onFinalizePlacement` | 69 |
| registerEventListener | `onReadStream` | 70 |
| registerEventListener | `onWriteStream` | 71 |
| registerEventListener | `onReadUpdateStream` | 72 |
| registerEventListener | `onWriteUpdateStream` | 73 |
| registerEventListener | `onUpdate` | 74 |
| registerEventListener | `onDayChanged` | 75 |
