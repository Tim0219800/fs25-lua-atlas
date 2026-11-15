# vehicles/specializations/FoldableSteps.lua

Source : `dataS/scripts/vehicles/specializations/FoldableSteps.lua` — FS25 1.25.1.0


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FoldableSteps.prerequisitesPresent(specializations: table) → boolean` | 24 |  |
| `FoldableSteps.initSpecialization()` | 30 |  |
| `FoldableSteps.registerFunctions(vehicleType: table)` | 79 |  |
| `FoldableSteps.registerOverwrittenFunctions(vehicleType: table)` | 86 |  |
| `FoldableSteps.registerEventListeners(vehicleType: table)` | 100 |  |
| `FoldableSteps:onLoad(savegame: table)` | 114 |  |
| `FoldableSteps:onPostLoad(savegame: table)` | 202 |  |
| `FoldableSteps:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 211 |  |
| `FoldableSteps:onReadStream(streamId: any, connection: any)` | 222 |  |
| `FoldableSteps:onWriteStream(streamId: any, connection: any)` | 235 |  |
| `FoldableSteps:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 248 |  |
| `FoldableSteps:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 262 |  |
| `FoldableSteps:onRegisterActionEvents(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean)` | 274 |  |
| `FoldableSteps:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 303 |  |
| `FoldableSteps:setFoldableStepsFoldState(stateTargetIndex: any, noEventSend: any)` | 319 |  |
| `FoldableSteps.updateActionEvents(self: any, actionEvents: any)` | 339 |  |
| `FoldableSteps.actionEventFold(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 386 |  |
| `FoldableSteps.actionEventFoldPos(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 410 |  |
| `FoldableSteps.actionEventFoldNeg(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 420 |  |
| `FoldableSteps.updateFoldStateChangeAllowed(self: any, stateTargetIndex: any, context: any)` | 430 |  |
| `FoldableSteps.externalActionEventFoldRegister(data: any, vehicle: any)` | 465 |  |
| `FoldableSteps.externalActionEventFoldUpdate(data: any, vehicle: any)` | 480 |  |
| `FoldableSteps.externalActionEventFoldPosRegister(data: any, vehicle: any)` | 491 |  |
| `FoldableSteps.externalActionEventFoldPosUpdate(data: any, vehicle: any)` | 506 |  |
| `FoldableSteps.externalActionEventFoldNegRegister(data: any, vehicle: any)` | 524 |  |
| `FoldableSteps.externalActionEventFoldNegUpdate(data: any, vehicle: any)` | 539 |  |
| `FoldableSteps:getCanBeTurnedOn(superFunc: any)` | 557 |  |
| `FoldableSteps:getTurnedOnNotAllowedWarning(superFunc: any)` | 571 |  |
| `FoldableSteps:getRequiresPower(superFunc: any)` | 585 |  |
| `FoldableSteps:getAllowHudInfoTrigger(superFunc: any)` | 598 |  |
| `FoldableSteps:getFillUnitSupportsToolType(superFunc: any, fillUnitIndex: any, toolType: any)` | 612 |  |
| `FoldableSteps:getBrakeForce(superFunc: any)` | 631 |  |
| `FoldableSteps:loadDynamicLockPositionFromXML(superFunc: any, xmlFile: any, key: any, lockPosition: any)` | 646 |  |
| `FoldableSteps:getIsDynamicLockPositionActive(superFunc: any, lockPosition: any)` | 664 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setFoldableStepsFoldState` | 80 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 87 |
| registerOverwrittenFunction | `getTurnedOnNotAllowedWarning` | 88 |
| registerOverwrittenFunction | `getRequiresPower` | 89 |
| registerOverwrittenFunction | `getAllowHudInfoTrigger` | 90 |
| registerOverwrittenFunction | `getFillUnitSupportsToolType` | 91 |
| registerOverwrittenFunction | `getBrakeForce` | 92 |
| registerOverwrittenFunction | `loadDynamicLockPositionFromXML` | 93 |
| registerOverwrittenFunction | `getIsDynamicLockPositionActive` | 94 |
| registerEventListener | `onLoad` | 101 |
| registerEventListener | `onPostLoad` | 102 |
| registerEventListener | `onReadStream` | 103 |
| registerEventListener | `onWriteStream` | 104 |
| registerEventListener | `onUpdateTick` | 105 |
| registerEventListener | `onDraw` | 106 |
| registerEventListener | `onRegisterActionEvents` | 107 |
| registerEventListener | `onRegisterExternalActionEvents` | 108 |
