# vehicles/specializations/Pipe.lua

Source: `dataS/scripts/vehicles/specializations/Pipe.lua` — FS25 1.25.1.0

- **Pipe** (l.14)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Pipe.prerequisitesPresent(specializations: any)` | 18 |  |
| `Pipe.initSpecialization()` | 24 |  |
| `Pipe.registers(schema: any, basePath: any)` | 51 |  |
| `Pipe.registerFunctions(vehicleType: any)` | 111 |  |
| `Pipe.registerOverwrittenFunctions(vehicleType: any)` | 130 |  |
| `Pipe.registerEventListeners(vehicleType: any)` | 151 |  |
| `Pipe:onLoad(savegame: any)` | 171 |  |
| `Pipe:onPostLoad(savegame: any)` | 319 |  |
| `Pipe:onDelete()` | 360 |  |
| `Pipe:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 403 |  |
| `Pipe:onReadStream(streamId: any, connection: any)` | 414 |  |
| `Pipe:onWriteStream(streamId: any, connection: any)` | 429 |  |
| `Pipe:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 443 |  |
| `Pipe:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 462 |  |
| `Pipe:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 477 |  |
| `Pipe:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 538 |  |
| `Pipe:loadUnloadingTriggers(unloadingTriggers: any, xmlFile: any, baseKey: any)` | 590 |  |
| `Pipe:loadPipeNodes(pipeNodes: any, xmlFile: any, baseKey: any)` | 614 |  |
| `Pipe:getIsPipeStateChangeAllowed(pipeState: any)` | 732 |  |
| `Pipe:setPipeState(pipeState: any, noEventSend: any)` | 758 |  |
| `Pipe:getCurrentPipeState()` | 789 |  |
| `Pipe:updatePipeNodes(dt: any)` | 795 |  |
| `Pipe:updateBendingRegulationNodes(pipeNode: any, distance: any)` | 1003 |  |
| `Pipe:unloadingTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1026 |  |
| `Pipe:updateNearestObjectInTriggers()` | 1104 |  |
| `Pipe:updateActionEventText()` | 1154 |  |
| `Pipe:getIsDischargeNodeActive(superFunc: any, dischargeNode: any)` | 1194 |  |
| `Pipe:getCanBeTurnedOn(superFunc: any)` | 1206 |  |
| `Pipe:getTurnedOnNotAllowedWarning(superFunc: any)` | 1229 |  |
| `Pipe:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 1252 |  |
| `Pipe:handleDischarge(superFunc: any, dischargeNode: any, dischargedLiters: any, minDropReached: any, hasMinDropFillLevel: any)` | 1266 |  |
| `Pipe:handleDischargeRaycast(superFunc: any, dischargeNode: any, hitObject: any, hitShape: any, hitDistance: any, hitFillUnitIndex: any, hitTerrain: any)` | 1280 |  |
| `Pipe:getCanToggleDischargeToObject(superFunc: any)` | 1310 |  |
| `Pipe:getCanToggleDischargeToGround(superFunc: any)` | 1321 |  |
| `Pipe:getRequiresPower(superFunc: any)` | 1332 |  |
| `Pipe:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1354 |  |
| `Pipe:getIsMovingToolActive(superFunc: any, movingTool: any)` | 1366 |  |
| `Pipe:loadCoverFromXML(superFunc: any, xmlFile: any, key: any, cover: any)` | 1381 |  |
| `Pipe:getIsNextCoverStateAllowed(superFunc: any, nextState: any)` | 1390 |  |
| `Pipe:onDeletePipeObject(object: any)` | 1408 |  |
| `Pipe:getPipeDischargeNodeIndex(state: any)` | 1423 |  |
| `Pipe:setPipeDischargeToGround(state: any, noEventSend: any)` | 1439 |  |
| `Pipe:getCanBeSelected(superFunc: any)` | 1459 |  |
| `Pipe:getIsAIReadyToDrive(superFunc: any)` | 1465 |  |
| `Pipe:getIsAIPreparingToDrive(superFunc: any)` | 1478 |  |
| `Pipe:onMovingToolChanged(tool: any, transSpeed: any, dt: any)` | 1491 |  |
| `Pipe:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1503 |  |
| `Pipe:onDischargeStateChanged(state: any)` | 1528 |  |
| `Pipe:onFoldStateChanged(direction: integer, moveToMiddle: boolean)` | 1552 |  |
| `Pipe:onAIImplementPrepareForTransport()` | 1573 |  |
| `Pipe:onRootVehicleChanged(rootVehicle: table)` | 1585 |  |
| `Pipe.actionControllerPipeEvent(self: any, direction: any)` | 1614 |  |
| `Pipe.actionEventTogglePipe(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1628 |  |
| `Pipe.actionEventToggleDischargeToGround(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1644 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadUnloadingTriggers` | 112 |
| registerFunction | `loadPipeNodes` | 113 |
| registerFunction | `getIsPipeStateChangeAllowed` | 114 |
| registerFunction | `setPipeState` | 115 |
| registerFunction | `getCurrentPipeState` | 116 |
| registerFunction | `updatePipeNodes` | 117 |
| registerFunction | `updateBendingRegulationNodes` | 118 |
| registerFunction | `unloadingTriggerCallback` | 119 |
| registerFunction | `updateNearestObjectInTriggers` | 120 |
| registerFunction | `updateActionEventText` | 121 |
| registerFunction | `onDeletePipeObject` | 122 |
| registerFunction | `getPipeDischargeNodeIndex` | 123 |
| registerFunction | `setPipeDischargeToGround` | 124 |
| registerFunction | `setIsPipeStateChangeAllowed` | 125 |
| registerOverwrittenFunction | `getIsDischargeNodeActive` | 131 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 132 |
| registerOverwrittenFunction | `getTurnedOnNotAllowedWarning` | 133 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 134 |
| registerOverwrittenFunction | `handleDischarge` | 135 |
| registerOverwrittenFunction | `handleDischargeRaycast` | 136 |
| registerOverwrittenFunction | `getCanToggleDischargeToObject` | 137 |
| registerOverwrittenFunction | `getCanToggleDischargeToGround` | 138 |
| registerOverwrittenFunction | `getRequiresPower` | 139 |
| registerOverwrittenFunction | `loadMovingToolFromXML` | 140 |
| registerOverwrittenFunction | `getIsMovingToolActive` | 141 |
| registerOverwrittenFunction | `loadCoverFromXML` | 142 |
| registerOverwrittenFunction | `getIsNextCoverStateAllowed` | 143 |
| registerOverwrittenFunction | `getCanBeSelected` | 144 |
| registerOverwrittenFunction | `getIsAIReadyToDrive` | 145 |
| registerOverwrittenFunction | `getIsAIPreparingToDrive` | 146 |
| registerEventListener | `onLoad` | 152 |
| registerEventListener | `onPostLoad` | 153 |
| registerEventListener | `onDelete` | 154 |
| registerEventListener | `onReadStream` | 155 |
| registerEventListener | `onWriteStream` | 156 |
| registerEventListener | `onReadUpdateStream` | 157 |
| registerEventListener | `onWriteUpdateStream` | 158 |
| registerEventListener | `onUpdate` | 159 |
| registerEventListener | `onUpdateTick` | 160 |
| registerEventListener | `onMovingToolChanged` | 161 |
| registerEventListener | `onRegisterActionEvents` | 162 |
| registerEventListener | `onDischargeStateChanged` | 163 |
| registerEventListener | `onFoldStateChanged` | 164 |
| registerEventListener | `onAIImplementPrepareForTransport` | 165 |
| registerEventListener | `onRootVehicleChanged` | 166 |
