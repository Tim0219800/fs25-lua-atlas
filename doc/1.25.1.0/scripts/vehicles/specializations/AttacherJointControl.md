# vehicles/specializations/AttacherJointControl.lua

Source : `dataS/scripts/vehicles/specializations/AttacherJointControl.lua` — FS25 1.25.1.0

- **AttacherJointControl** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AttacherJointControl.prerequisitesPresent(specializations: table) → boolean` | 20 |  |
| `AttacherJointControl.initSpecialization()` | 26 |  |
| `AttacherJointControl.registerFunctions(vehicleType: any)` | 50 |  |
| `AttacherJointControl.registerOverwrittenFunctions(vehicleType: any)` | 60 |  |
| `AttacherJointControl.registerEventListeners(vehicleType: any)` | 69 |  |
| `AttacherJointControl:onLoad(savegame: table)` | 85 |  |
| `AttacherJointControl:onDelete()` | 181 |  |
| `AttacherJointControl:onReadStream(streamId: integer, connection: Connection)` | 192 |  |
| `AttacherJointControl:onWriteStream(streamId: integer, connection: Connection)` | 208 |  |
| `AttacherJointControl:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 224 |  |
| `AttacherJointControl:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 248 |  |
| `AttacherJointControl:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 270 |  |
| `AttacherJointControl:controlAttacherJoint(control: table, moveAlpha: number, automaticControl: any, noEventSend: any)` | 344 |  |
| `AttacherJointControl:controlAttacherJointHeight(moveAlpha: number) → number` | 386 |  |
| `AttacherJointControl:controlAttacherJointTilt(moveAlpha: number) → number` | 409 |  |
| `AttacherJointControl:getControlAttacherJointDirection() → boolean` | 428 |  |
| `AttacherJointControl:getIsAttacherJointControlDampingAllowed() → boolean` | 441 |  |
| `AttacherJointControl:loadInputAttacherJoint(superFunc: table, xmlFile: any, key: any, inputAttacherJoint: any, i: any)` | 457 |  |
| `AttacherJointControl:registerLoweringActionEvent(superFunc: any, actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any)` | 469 |  |
| `AttacherJointControl:getLoweringActionEventState(superFunc: any)` | 485 |  |
| `AttacherJointControl:getCanBeSelected(superFunc: any)` | 507 |  |
| `AttacherJointControl:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 513 |  |
| `AttacherJointControl:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer, loadFromSavegame: any)` | 534 |  |
| `AttacherJointControl:onPreDetach(attacherVehicle: table, implement: table)` | 577 |  |
| `AttacherJointControl.actionEventAttacherJointControl(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 590 |  |
| `AttacherJointControl.actionEventAttacherJointControlSetPoint(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 608 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `controlAttacherJoint` | 51 |
| registerFunction | `controlAttacherJointHeight` | 52 |
| registerFunction | `controlAttacherJointTilt` | 53 |
| registerFunction | `getControlAttacherJointDirection` | 54 |
| registerFunction | `getIsAttacherJointControlDampingAllowed` | 55 |
| registerOverwrittenFunction | `loadInputAttacherJoint` | 61 |
| registerOverwrittenFunction | `registerLoweringActionEvent` | 62 |
| registerOverwrittenFunction | `getLoweringActionEventState` | 63 |
| registerOverwrittenFunction | `getCanBeSelected` | 64 |
| registerEventListener | `onLoad` | 70 |
| registerEventListener | `onDelete` | 71 |
| registerEventListener | `onReadStream` | 72 |
| registerEventListener | `onWriteStream` | 73 |
| registerEventListener | `onReadUpdateStream` | 74 |
| registerEventListener | `onWriteUpdateStream` | 75 |
| registerEventListener | `onUpdate` | 76 |
| registerEventListener | `onRegisterActionEvents` | 77 |
| registerEventListener | `onPostAttach` | 78 |
| registerEventListener | `onPreDetach` | 79 |
