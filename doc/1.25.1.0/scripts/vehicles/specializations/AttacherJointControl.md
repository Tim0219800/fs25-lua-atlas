# vehicles/specializations/AttacherJointControl.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AttacherJointControl.md)*

Source: `dataS/scripts/vehicles/specializations/AttacherJointControl.lua` — FS25 1.25.1.0

✍ Specialization for implements whose attacher joint height and tilt can be adjusted continuously by the player (analog axis or lift/lower key) instead of a simple up/down toggle. It requires Attachable and reads its settings from vehicle.attacherJointControl in the XML (max tilt angle, optional Y damping, one control entry per axis, hydraulic sound). It changes the tractor-side joint while attached, backs up and restores the joint's values on detach, and synchronises the control values in multiplayer with 0..1 alpha values compressed into a stream. The ALPHA_NUM_BITS and ALPHA_MAX_VALUE constants are not visible in this dump (UNVERIFIED).

- **AttacherJointControl** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `AttacherJointControl.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Prerequisite check: returns true only if the vehicle type already includes the Attachable specialization. |
| `AttacherJointControl.initSpecialization()` | 26 | ✍ Declares the XML schema for vehicle.attacherJointControl (tilt angle, damping, control entries with function, axis, icon, invert and mouse factor, hydraulic sound) and the isControllable flag on input attacher joints and their configurations. |
| `AttacherJointControl.registerFunctions(vehicleType: any)` | 50 | ✍ Registers the functions added by this specialization: controlAttacherJoint, controlAttacherJointHeight, controlAttacherJointTilt, getControlAttacherJointDirection and getIsAttacherJointControlDampingAllowed. |
| `AttacherJointControl.registerOverwrittenFunctions(vehicleType: any)` | 60 | ✍ Registers overrides of Attachable functions: loadInputAttacherJoint, registerLoweringActionEvent, getLoweringActionEventState and getCanBeSelected. |
| `AttacherJointControl.registerEventListeners(vehicleType: any)` | 69 | ✍ Subscribes to load, delete, stream read/write, update, action event registration, post-attach and pre-detach events. |
| `AttacherJointControl:onLoad(savegame: table)` | 85 | ✍ Loads the max tilt angle, damping options and each control entry (function name, input action, icon, invert, mouse factor). An unknown function or axis logs a warning and stops loading further controls. Loads the hydraulic sound on the client, creates two dirty flags, and removes most listeners when no control exists. |
| `AttacherJointControl:onDelete()` | 181 | ✍ Deletes the hydraulic sound sample on the client. |
| `AttacherJointControl:onReadStream(streamId: integer, connection: Connection)` | 192 | ✍ Client side on join: when the server flag is set, reads the stored alpha of every control and applies it with controlAttacherJoint without sending events. |
| `AttacherJointControl:onWriteStream(streamId: integer, connection: Connection)` | 208 | ✍ Server side on join: writes whether a joint is currently controlled and, if so, the alpha of each control. |
| `AttacherJointControl:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 224 | ✍ Reads incoming alpha values of every control from the update stream, from client to server or from server to client, and applies them without re-sending events. |
| `AttacherJointControl:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 248 | ✍ Writes the alpha of every control when the dirty flag matching the direction is set: the client flag when sending to the server, the server flag (damping changes) when sending to clients. |
| `AttacherJointControl:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 270 | ✍ Per-frame update. Moves the height alpha toward its target at the joint's move speed. On the server, with damping enabled, it also compensates vertical velocity at the damping reference point and can nudge the tilt. Plays the hydraulic sound for a short time after the last move. Note: spec.samples and spec.lastMoveTime are only set on the client, so a server without a client part may fail here (UNVERIFIED). |
| `AttacherJointControl:controlAttacherJoint(control: table, moveAlpha: number, automaticControl: any, noEventSend: any)` | 344 | ✍ Sets a control's alpha. On the server it calls the control function, updates the joint rotation and joint frame. It stores the clamped 0..1 value, records the manual time for damping, and raises a client or server dirty flag when the change is large enough, unless noEventSend is set. |
| `AttacherJointControl:controlAttacherJointHeight(moveAlpha: number) → number` | 386 | ✍ Height control function: clamps the alpha between the joint's upper and lower alpha, updates the attacher joint rotation nodes and rotation, and returns the limited alpha. Uses the joint's current alpha when called with nil. |
| `AttacherJointControl:controlAttacherJointTilt(moveAlpha: number) → number` | 409 | ✍ Tilt control function: clamps the alpha to 0..1 (0.5 when nil), converts it to an angle around neutral using the max tilt angle, and offsets the joint's upper and lower rotation offsets from their backups. Returns the limited alpha. |
| `AttacherJointControl:getControlAttacherJointDirection() → boolean` | 428 | ✍ Returns true when the next lift/lower press should lower the implement: based on the current target if one is set, else on whether the height is closer to the upper position. |
| `AttacherJointControl:getIsAttacherJointControlDampingAllowed() → boolean` | 441 | ✍ Returns whether Y damping may run: false if the attacher vehicle's last speed is below 0.5 or the implement is not moving forward. |
| `AttacherJointControl:loadInputAttacherJoint(superFunc: table, xmlFile: any, key: any, inputAttacherJoint: any, i: any)` | 457 | ✍ Override: after the base loads an input attacher joint, also reads its isControllable flag. Returns false if the base fails. |
| `AttacherJointControl:registerLoweringActionEvent(superFunc: any, actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any)` | 469 | ✍ Override: when a height controller exists, registers the lift/lower action with the set-point callback and high text priority, and stops there if the requested action is the lowering action. Otherwise defers to the base. |
| `AttacherJointControl:getLoweringActionEventState(superFunc: any)` | 485 | ✍ Override: with a height controller, the action is shown only while a joint is controlled and its text says lower or lift according to the control direction; otherwise defers to the base. |
| `AttacherJointControl:getCanBeSelected(superFunc: any)` | 507 | ✍ Override: the vehicle can always be selected; returns true. |
| `AttacherJointControl:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 513 | ✍ Client only: clears the action events and, when the vehicle is active for input and a joint is controlled, registers one powered analog action event per control using its input action and axis icon. |
| `AttacherJointControl:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer, loadFromSavegame: any)` | 534 | ✍ If the active input joint is controllable and the tractor joint has a height range, disables its normal lowering, backs up its rotation offsets, stores it as the controlled joint and resets the controls. It then lifts the implement (targets upper alpha, or applies it at once when loaded from a savegame). |
| `AttacherJointControl:onPreDetach(attacherVehicle: table, implement: table)` | 577 | ✍ Before detaching, restores the tractor joint's allowsLowering flag and rotation offsets from their backups and clears the controlled joint. |
| `AttacherJointControl.actionEventAttacherJointControl(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 590 | ✍ Input callback for an analog control axis: scales the input by the mouse factor (and a fixed 0.025), inverts it if configured, applies it to the control's alpha as a manual change and cancels any height target. |
| `AttacherJointControl.actionEventAttacherJointControlSetPoint(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 608 | ✍ Input callback for the lift/lower key: sets the height target to the lower or upper alpha depending on the current direction and delays damping updates by the joint's move time. |

## Specialization

| Type | Name | Line |
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
