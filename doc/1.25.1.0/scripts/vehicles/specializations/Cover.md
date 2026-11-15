# vehicles/specializations/Cover.lua

Source : `dataS/scripts/vehicles/specializations/Cover.lua` — FS25 1.25.1.0

- **Cover** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Cover.prerequisitesPresent(specializations: any)` | 21 |  |
| `Cover.initSpecialization()` | 27 |  |
| `Cover.registerFunctions(vehicleType: any)` | 62 |  |
| `Cover.registerOverwrittenFunctions(vehicleType: any)` | 73 |  |
| `Cover.registerEventListeners(vehicleType: any)` | 86 |  |
| `Cover:onLoad(savegame: any)` | 101 |  |
| `Cover:onPostLoad(savegame: any)` | 165 |  |
| `Cover:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 197 |  |
| `Cover:onReadStream(streamId: any, connection: any)` | 207 |  |
| `Cover:onWriteStream(streamId: any, connection: any)` | 224 |  |
| `Cover:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 232 |  |
| `Cover:loadCoverFromXML(xmlFile: any, key: any, cover: any)` | 275 |  |
| `Cover:setCoverState(state: any, noEventSend: any)` | 314 |  |
| `Cover:playCoverAnimation(animation: any)` | 357 |  |
| `Cover:getCoverByFillUnitIndex(fillUnitIndex: any)` | 369 |  |
| `Cover:getIsNextCoverStateAllowed(nextState: any)` | 380 |  |
| `Cover:getIsNextCoverStateAllowedWarning(nextState: any)` | 391 |  |
| `Cover:getFillUnitSupportsToolType(superFunc: any, fillUnitIndex: any, toolType: any)` | 397 |  |
| `Cover:getCanBeSelected(superFunc: any)` | 425 |  |
| `Cover:loadPipeNodes(superFunc: any, pipeNodes: any, xmlFile: any, baseKey: any)` | 431 |  |
| `Cover:getIsPipeStateChangeAllowed(superFunc: any, nextPipeState: any, ...: any)` | 441 |  |
| `Cover:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 457 |  |
| `Cover:onStartTipping(tipSide: any)` | 476 |  |
| `Cover:onOpenBackDoor(tipSide: any)` | 492 |  |
| `Cover:finishedAIDischarge(superFunc: any)` | 508 |  |
| `Cover:aiPrepareLoading(superFunc: any, fillUnitIndex: any, task: any)` | 519 |  |
| `Cover:aiFinishLoading(superFunc: any, fillUnitIndex: any, task: any)` | 530 |  |
| `Cover:setFillUnitInTriggerRange(superFunc: any, fillUnitIndex: any, isInRange: any)` | 541 |  |
| `Cover:onFillUnitTriggerChanged(fillTrigger: any, fillTypeIndex: any, fillUnitIndex: any, numTriggers: any)` | 570 |  |
| `Cover:onRemovedFillUnitTrigger(numTriggers: any)` | 589 |  |
| `Cover.updateActionText(self: any)` | 602 |  |
| `Cover.actionEventToggleCover(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 621 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadCoverFromXML` | 63 |
| registerFunction | `getIsNextCoverStateAllowed` | 64 |
| registerFunction | `getIsNextCoverStateAllowedWarning` | 65 |
| registerFunction | `setCoverState` | 66 |
| registerFunction | `playCoverAnimation` | 67 |
| registerFunction | `getCoverByFillUnitIndex` | 68 |
| registerOverwrittenFunction | `getFillUnitSupportsToolType` | 74 |
| registerOverwrittenFunction | `getCanBeSelected` | 75 |
| registerOverwrittenFunction | `loadPipeNodes` | 76 |
| registerOverwrittenFunction | `getIsPipeStateChangeAllowed` | 77 |
| registerOverwrittenFunction | `aiPrepareLoading` | 78 |
| registerOverwrittenFunction | `aiFinishLoading` | 79 |
| registerOverwrittenFunction | `finishedAIDischarge` | 80 |
| registerOverwrittenFunction | `setFillUnitInTriggerRange` | 81 |
| registerEventListener | `onLoad` | 87 |
| registerEventListener | `onPostLoad` | 88 |
| registerEventListener | `onReadStream` | 89 |
| registerEventListener | `onWriteStream` | 90 |
| registerEventListener | `onUpdate` | 91 |
| registerEventListener | `onRegisterActionEvents` | 92 |
| registerEventListener | `onStartTipping` | 93 |
| registerEventListener | `onOpenBackDoor` | 94 |
| registerEventListener | `onFillUnitTriggerChanged` | 95 |
| registerEventListener | `onRemovedFillUnitTrigger` | 96 |
