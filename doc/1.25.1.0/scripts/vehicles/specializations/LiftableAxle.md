# vehicles/specializations/LiftableAxle.lua

Source : `dataS/scripts/vehicles/specializations/LiftableAxle.lua` — FS25 1.25.1.0


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LiftableAxle.prerequisitesPresent(specializations: table) → boolean` | 20 |  |
| `LiftableAxle.initSpecialization()` | 26 |  |
| `LiftableAxle.registerXMLPaths(schema: any, basePath: any)` | 44 |  |
| `LiftableAxle.registerFunctions(vehicleType: table)` | 69 |  |
| `LiftableAxle.registerOverwrittenFunctions(vehicleType: table)` | 77 |  |
| `LiftableAxle.registerEventListeners(vehicleType: table)` | 84 |  |
| `LiftableAxle:onLoad(savegame: table)` | 100 |  |
| `LiftableAxle:onPostLoad(savegame: any)` | 195 |  |
| `LiftableAxle:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 211 |  |
| `LiftableAxle:onReadStream(streamId: any, connection: any)` | 224 |  |
| `LiftableAxle:onWriteStream(streamId: any, connection: any)` | 237 |  |
| `LiftableAxle:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 248 |  |
| `LiftableAxle:onPreAttachImplement(object: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 264 |  |
| `LiftableAxle:onPreDetachImplement(implement: any)` | 295 |  |
| `LiftableAxle:onPreAttach(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any)` | 333 |  |
| `LiftableAxle:onPreDetach(attacherVehicle: any, implement: any)` | 375 |  |
| `LiftableAxle:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 413 |  |
| `LiftableAxle.actionEvent(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 427 |  |
| `LiftableAxle.updateActionEvents(self: any)` | 434 |  |
| `LiftableAxle:setLiftableAxleState(state: any, fixedHeight: any, skipAnimation: any, noEventSend: any)` | 445 |  |
| `LiftableAxle:getLiftableAxleAttacherJointHeight(attacherJointIndex: any)` | 481 |  |
| `LiftableAxle:getIsSmoothAttachUpdateAllowed(superFunc: any, implement: any)` | 501 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setLiftableAxleState` | 70 |
| registerFunction | `getLiftableAxleAttacherJointHeight` | 71 |
| registerOverwrittenFunction | `getIsSmoothAttachUpdateAllowed` | 78 |
| registerEventListener | `onLoad` | 85 |
| registerEventListener | `onPostLoad` | 86 |
| registerEventListener | `onReadStream` | 87 |
| registerEventListener | `onWriteStream` | 88 |
| registerEventListener | `onFillUnitFillLevelChanged` | 89 |
| registerEventListener | `onPreAttachImplement` | 90 |
| registerEventListener | `onPreDetachImplement` | 91 |
| registerEventListener | `onPreAttach` | 92 |
| registerEventListener | `onPreDetach` | 93 |
| registerEventListener | `onRegisterActionEvents` | 94 |
