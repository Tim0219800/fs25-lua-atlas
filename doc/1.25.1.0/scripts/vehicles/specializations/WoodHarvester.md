# vehicles/specializations/WoodHarvester.lua

Source: `dataS/scripts/vehicles/specializations/WoodHarvester.lua` — FS25 1.25.1.0

- **WoodHarvester** (l.18)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `WoodHarvester.prerequisitesPresent(specializations: any)` | 26 |  |
| `WoodHarvester.initSpecialization()` | 32 |  |
| `WoodHarvester.registerEvents(vehicleType: any)` | 97 |  |
| `WoodHarvester.registerFunctions(vehicleType: any)` | 103 |  |
| `WoodHarvester.registerOverwrittenFunctions(vehicleType: any)` | 119 |  |
| `WoodHarvester.registerEventListeners(vehicleType: any)` | 131 |  |
| `WoodHarvester:onLoad(savegame: any)` | 155 |  |
| `WoodHarvester:onPostLoad(savegame: any)` | 305 |  |
| `WoodHarvester:onLoadFinished(savegame: any)` | 321 |  |
| `WoodHarvester:onRegisterDashboardValueTypes()` | 361 |  |
| `WoodHarvester:onDelete()` | 389 |  |
| `WoodHarvester:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 407 |  |
| `WoodHarvester:onReadStream(streamId: any, connection: any)` | 428 |  |
| `WoodHarvester:onWriteStream(streamId: any, connection: any)` | 446 |  |
| `WoodHarvester:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 460 |  |
| `WoodHarvester:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 474 |  |
| `WoodHarvester:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 485 |  |
| `WoodHarvester:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 795 |  |
| `WoodHarvester:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 915 |  |
| `WoodHarvester:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 934 |  |
| `WoodHarvester:onDeactivate()` | 965 |  |
| `WoodHarvester:onTurnedOn()` | 973 |  |
| `WoodHarvester:onTurnedOff()` | 990 |  |
| `WoodHarvester:onStateChange(state: any, data: any)` | 1015 |  |
| `WoodHarvester:getCanSplitShapeBeAccessed(x: any, z: any, shape: any)` | 1029 |  |
| `WoodHarvester:loadWoodHarvesterHeaderTiltFromXML(headerTilt: any, xmlFile: any, key: any)` | 1035 |  |
| `WoodHarvester:getIsWoodHarvesterTiltStateAllowed(headerTilt: any)` | 1050 |  |
| `WoodHarvester:setWoodHarvesterTiltState(state: any, noEventSend: any)` | 1056 |  |
| `WoodHarvester:setWoodHarvesterCutLengthIndex(index: any, noEventSend: any)` | 1073 |  |
| `WoodHarvester:dropWoodHarvesterTree(noEventSend: any)` | 1085 |  |
| `WoodHarvester:findSplitShapesInRange(yOffset: number, skipCutAnimation: boolean)` | 1110 |  |
| `WoodHarvester:cutTree(length: any, noEventSend: any)` | 1186 |  |
| `WoodHarvester:onCutTree(radius: any, isNewTree: any, loadedFromSavegame: any)` | 1222 |  |
| `WoodHarvester:onVehicleSettingChanged(gameSettingId: any, state: any)` | 1274 |  |
| `WoodHarvester:onDelimbTree(state: any)` | 1282 |  |
| `WoodHarvester:woodHarvesterSplitShapeCallback(shape: any, isBelow: any, isAbove: any, minY: any, maxY: any, minZ: any, maxZ: any)` | 1303 |  |
| `WoodHarvester:setLastTreeDiameter(diameter: any)` | 1389 |  |
| `WoodHarvester:getCanBeSelected(superFunc: any)` | 1396 |  |
| `WoodHarvester:getDoConsumePtoPower(superFunc: any) → boolean` | 1403 |  |
| `WoodHarvester:getConsumingLoad(superFunc: any)` | 1409 |  |
| `WoodHarvester:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 1424 |  |
| `WoodHarvester:getSupportsAutoTreeAlignment(superFunc: any)` | 1435 |  |
| `WoodHarvester:getIsAutoTreeAlignmentAllowed(superFunc: any)` | 1441 |  |
| `WoodHarvester:getAutoAlignHasValidTree(superFunc: any, radius: any)` | 1452 |  |
| `WoodHarvester.actionEventCutTree(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1459 |  |
| `WoodHarvester.actionEventSetCutlength(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1485 |  |
| `WoodHarvester.actionEventDropTree(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1502 |  |
| `WoodHarvester.actionEventTiltHeader(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1508 |  |
| `WoodHarvester.loadSpecValueMaxTreeSize(xmlFile: any, customEnvironment: any, baseDir: any)` | 1518 |  |
| `WoodHarvester.getSpecValueMaxTreeSize(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 1524 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onCutTree` | 98 |
| registerFunction | `woodHarvesterSplitShapeCallback` | 104 |
| registerFunction | `setLastTreeDiameter` | 105 |
| registerFunction | `findSplitShapesInRange` | 106 |
| registerFunction | `cutTree` | 107 |
| registerFunction | `onDelimbTree` | 108 |
| registerFunction | `getCanSplitShapeBeAccessed` | 109 |
| registerFunction | `loadWoodHarvesterHeaderTiltFromXML` | 110 |
| registerFunction | `getIsWoodHarvesterTiltStateAllowed` | 111 |
| registerFunction | `setWoodHarvesterTiltState` | 112 |
| registerFunction | `setWoodHarvesterCutLengthIndex` | 113 |
| registerFunction | `dropWoodHarvesterTree` | 114 |
| registerOverwrittenFunction | `getCanBeSelected` | 120 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 121 |
| registerOverwrittenFunction | `getConsumingLoad` | 122 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 123 |
| registerOverwrittenFunction | `getSupportsAutoTreeAlignment` | 124 |
| registerOverwrittenFunction | `getIsAutoTreeAlignmentAllowed` | 125 |
| registerOverwrittenFunction | `getAutoAlignHasValidTree` | 126 |
| registerEventListener | `onLoad` | 132 |
| registerEventListener | `onPostLoad` | 133 |
| registerEventListener | `onLoadFinished` | 134 |
| registerEventListener | `onRegisterDashboardValueTypes` | 135 |
| registerEventListener | `onDelete` | 136 |
| registerEventListener | `onReadStream` | 137 |
| registerEventListener | `onWriteStream` | 138 |
| registerEventListener | `onReadUpdateStream` | 139 |
| registerEventListener | `onWriteUpdateStream` | 140 |
| registerEventListener | `onUpdate` | 141 |
| registerEventListener | `onUpdateTick` | 142 |
| registerEventListener | `onDraw` | 143 |
| registerEventListener | `onRegisterActionEvents` | 144 |
| registerEventListener | `onDeactivate` | 145 |
| registerEventListener | `onTurnedOn` | 146 |
| registerEventListener | `onTurnedOff` | 147 |
| registerEventListener | `onStateChange` | 148 |
| registerEventListener | `onCutTree` | 149 |
| registerEventListener | `onVehicleSettingChanged` | 150 |

## Messages

- publishes `MessageType.TREE_SHAPE_MOUNTED` (l.599)
