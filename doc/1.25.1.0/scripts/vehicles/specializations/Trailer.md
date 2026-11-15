# vehicles/specializations/Trailer.lua

Source : `dataS/scripts/vehicles/specializations/Trailer.lua` — FS25 1.25.1.0

- **Trailer** (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Trailer.prerequisitesPresent(specializations: any)` | 27 |  |
| `Trailer.initSpecialization()` | 35 |  |
| `Trailer.registerEvents(vehicleType: any)` | 114 |  |
| `Trailer.registerFunctions(vehicleType: any)` | 124 |  |
| `Trailer.registerOverwrittenFunctions(vehicleType: any)` | 143 |  |
| `Trailer.registerEventListeners(vehicleType: any)` | 161 |  |
| `Trailer:onLoad(savegame: any)` | 179 |  |
| `Trailer:onPostLoad(savegame: any)` | 234 |  |
| `Trailer:onLoadFinished(savegame: any)` | 278 |  |
| `Trailer:onDelete()` | 289 |  |
| `Trailer:onReadStream(streamId: integer, connection: Connection)` | 303 |  |
| `Trailer:onWriteStream(streamId: integer, connection: Connection)` | 358 |  |
| `Trailer:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 392 |  |
| `Trailer:loadTipSide(xmlFile: any, key: any, entry: any)` | 488 |  |
| `Trailer:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 580 |  |
| `Trailer:getCanTogglePreferdTipSide()` | 598 |  |
| `Trailer:getIsTipSideAvailable(sideIndex: any)` | 605 |  |
| `Trailer:getNextAvailableTipSide(index: any)` | 624 |  |
| `Trailer:setPreferedTipSide(index: any, noEventSend: any)` | 648 |  |
| `Trailer:setTipSideUpdateDirty()` | 700 |  |
| `Trailer:startTipping(tipSideIndex: any, noEventSend: any)` | 707 |  |
| `Trailer:stopTipping(noEventSend: any)` | 746 |  |
| `Trailer:endTipping(noEventSend: any)` | 785 |  |
| `Trailer:setTrailerDoorState(tipSideIndex: any, state: any, noEventSend: any, instantUpdate: any)` | 805 |  |
| `Trailer:getAllowTrailerDoorToggle(tipSideIndex: any)` | 836 |  |
| `Trailer:getTipState()` | 865 |  |
| `Trailer:setTipState(isOpen: any)` | 871 |  |
| `Trailer:updateTrailerAutomaticRedischarge()` | 897 |  |
| `Trailer:getDischargeNodeEmptyFactor(superFunc: any, dischargeNode: any)` | 945 |  |
| `Trailer:getCanDischargeToGround(superFunc: any, dischargeNode: any)` | 974 |  |
| `Trailer:getCanDischargeToObject(superFunc: any, dischargeNode: any)` | 997 |  |
| `Trailer:getIsNextCoverStateAllowed(superFunc: any, nextState: any)` | 1015 |  |
| `Trailer:getCanBeSelected(superFunc: any)` | 1048 |  |
| `Trailer:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1054 |  |
| `Trailer:onDischargeStateChanged(dischargeState: any)` | 1083 |  |
| `Trailer:onDeactivate()` | 1106 |  |
| `Trailer:getAIHasFinishedDischarge(superFunc: any, dischargeNode: any)` | 1121 |  |
| `Trailer:startAIDischarge(superFunc: any, dischargeNode: any, task: any)` | 1131 |  |
| `Trailer:loadPickupFromXML(superFunc: any, xmlFile: any, key: any, spec: any)` | 1143 |  |
| `Trailer:getCanChangePickupState(superFunc: any, spec: any, newState: any)` | 1151 |  |
| `Trailer:loadTurnedOnAnimationFromXML(superFunc: any, xmlFile: any, key: any, turnedOnAnimation: any)` | 1165 |  |
| `Trailer:getRequiresPower(superFunc: any)` | 1173 |  |
| `Trailer:setManualDischargeState(superFunc: any, state: any, noEventSend: any)` | 1184 |  |
| `Trailer:getIsTurnedOnAnimationActive(superFunc: any, turnedOnAnimation: any)` | 1198 |  |
| `Trailer:onRegisterAnimationValueTypes()` | 1208 |  |
| `Trailer:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 1299 |  |
| `Trailer.externalActionEventDoorToggleRegister(data: any, vehicle: any)` | 1308 |  |
| `Trailer.externalActionEventDoorToggleUpdate(data: any, vehicle: any)` | 1330 |  |
| `Trailer:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 1357 |  |
| `Trailer.actionEventToggleTipSide(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1387 |  |
| `Trailer.actionEventManualToggleTip(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1397 |  |
| `Trailer.actionEventManualToggleDoor(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1410 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onStartTipping` | 115 |
| registerEvent | `onOpenBackDoor` | 116 |
| registerEvent | `onStopTipping` | 117 |
| registerEvent | `onCloseBackDoor` | 118 |
| registerEvent | `onEndTipping` | 119 |
| registerFunction | `loadTipSide` | 125 |
| registerFunction | `getCanTogglePreferdTipSide` | 126 |
| registerFunction | `getIsTipSideAvailable` | 127 |
| registerFunction | `getNextAvailableTipSide` | 128 |
| registerFunction | `setPreferedTipSide` | 129 |
| registerFunction | `setTipSideUpdateDirty` | 130 |
| registerFunction | `startTipping` | 131 |
| registerFunction | `stopTipping` | 132 |
| registerFunction | `endTipping` | 133 |
| registerFunction | `setTrailerDoorState` | 134 |
| registerFunction | `getAllowTrailerDoorToggle` | 135 |
| registerFunction | `getTipState` | 136 |
| registerFunction | `setTipState` | 137 |
| registerFunction | `updateTrailerAutomaticRedischarge` | 138 |
| registerOverwrittenFunction | `getDischargeNodeEmptyFactor` | 144 |
| registerOverwrittenFunction | `getCanDischargeToGround` | 145 |
| registerOverwrittenFunction | `getCanDischargeToObject` | 146 |
| registerOverwrittenFunction | `getIsNextCoverStateAllowed` | 147 |
| registerOverwrittenFunction | `getCanBeSelected` | 148 |
| registerOverwrittenFunction | `getAIHasFinishedDischarge` | 149 |
| registerOverwrittenFunction | `startAIDischarge` | 150 |
| registerOverwrittenFunction | `loadPickupFromXML` | 151 |
| registerOverwrittenFunction | `getCanChangePickupState` | 152 |
| registerOverwrittenFunction | `getIsTurnedOnAnimationActive` | 153 |
| registerOverwrittenFunction | `loadTurnedOnAnimationFromXML` | 154 |
| registerOverwrittenFunction | `getRequiresPower` | 155 |
| registerOverwrittenFunction | `setManualDischargeState` | 156 |
| registerEventListener | `onLoad` | 162 |
| registerEventListener | `onPostLoad` | 163 |
| registerEventListener | `onLoadFinished` | 164 |
| registerEventListener | `onDelete` | 165 |
| registerEventListener | `onReadStream` | 166 |
| registerEventListener | `onWriteStream` | 167 |
| registerEventListener | `onUpdate` | 168 |
| registerEventListener | `onRegisterActionEvents` | 169 |
| registerEventListener | `onDischargeStateChanged` | 170 |
| registerEventListener | `onDeactivate` | 171 |
| registerEventListener | `onRegisterAnimationValueTypes` | 172 |
| registerEventListener | `onRegisterExternalActionEvents` | 173 |
| registerEventListener | `onFillUnitFillLevelChanged` | 174 |
