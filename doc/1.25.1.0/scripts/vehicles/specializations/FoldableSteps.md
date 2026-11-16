# vehicles/specializations/FoldableSteps.lua

*[Version française](../../../fr/scripts/vehicles/specializations/FoldableSteps.md)*

Source: `dataS/scripts/vehicles/specializations/FoldableSteps.lua` — FS25 1.25.1.0

✍ Specialization for tools with a discrete, multi-step folding animation (for example a header trailer with several positions). It plays one AnimatedVehicle animation up to the time of a chosen state, offers full-fold and next/previous-state inputs with per-state texts and contexts, and can restrict turning on, HUD info and filling per state. State and target are synced with FoldableStepsChangeStateEvent and saved. Requires AnimatedVehicle and relies on Foldable's getIsFoldAllowed.


## Functions

| Function | Line | Description |
|---|---|---|
| `FoldableSteps.prerequisitesPresent(specializations: table) → boolean` | 24 | ✍ Requires the AnimatedVehicle specialization on the vehicle type. |
| `FoldableSteps.initSpecialization()` | 30 | ✍ Declares the vehicle.foldableSteps XML keys (animation name and speed, fill unit, controls, state list with texts, contexts and allow flags) and the lock position extension used by DynamicMountAttacher. Also registers the savegame keys animTime, state and targetState. |
| `FoldableSteps.registerFunctions(vehicleType: table)` | 79 | ✍ Registers setFoldableStepsFoldState on the vehicle type. |
| `FoldableSteps.registerOverwrittenFunctions(vehicleType: table)` | 86 | ✍ Registers overrides for turn-on checks, power requirement, HUD info trigger, fill unit tool types, brake force and dynamic lock positions. |
| `FoldableSteps.registerEventListeners(vehicleType: table)` | 100 | ✍ Subscribes to load, post load, network stream, update tick, draw and action event registration events. |
| `FoldableSteps:onLoad(savegame: table)` | 114 | ✍ Reads the foldableSteps node: animation, input actions and texts, then the list of states (animation time converted from seconds to normalized time, texts, contexts, allow flags). Restores animTime, state and targetState from the savegame. If no animationName exists it removes its listeners. |
| `FoldableSteps:onPostLoad(savegame: table)` | 202 | ✍ Applies the animation time loaded from the savegame to the animation, if any. |
| `FoldableSteps:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 211 | ✍ Writes the animation time, current state index and target state index to the savegame when an animation is defined. |
| `FoldableSteps:onReadStream(streamId: any, connection: any)` | 222 | ✍ Client join: reads animation time, state index and target state index, sets the animation time and calls setFoldableStepsFoldState with noEventSend. |
| `FoldableSteps:onWriteStream(streamId: any, connection: any)` | 235 | ✍ Writes animation time, state index and target state index for a joining client; counterpart of onReadStream. |
| `FoldableSteps:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 248 | ✍ While the state index differs from the target, waits for the animation to stop, then sets the state to the target and refreshes the action texts. Keeps the vehicle active during the movement. |
| `FoldableSteps:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 262 | ✍ Displays the extra info text of the target state on screen when that state defines one. |
| `FoldableSteps:onRegisterActionEvents(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean)` | 274 | ✍ Client: registers the full fold action (if allowed) and the optional next/previous state actions as powered action events, then updates their texts. |
| `FoldableSteps:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 303 | ✍ Registers external action events for the trigger names foldableStepsFull, foldableStepsNextPos and foldableStepsNextNeg (the last two only if the matching input action is configured). |
| `FoldableSteps:setFoldableStepsFoldState(stateTargetIndex: any, noEventSend: any)` | 319 | ✍ Sets the target state index (clamped to 1..maxState), plays the animation toward that state's time at the configured speed, refreshes action texts and sends FoldableStepsChangeStateEvent unless noEventSend is set. |
| `FoldableSteps.updateActionEvents(self: any, actionEvents: any)` | 339 | ✍ Updates the texts and active flags of the full, next and previous state actions according to the current state and whether the animation is moving. |
| `FoldableSteps.actionEventFold(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 386 | ✍ Input callback for the full fold action: picks the first or last state depending on the current state and movement, and applies it if updateFoldStateChangeAllowed agrees. |
| `FoldableSteps.actionEventFoldPos(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 410 | ✍ Input callback moving to the next state (target + 1), checking permission with the current input context. |
| `FoldableSteps.actionEventFoldNeg(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 420 | ✍ Input callback moving to the previous state (target - 1), checking permission with the current input context. |
| `FoldableSteps.updateFoldStateChangeAllowed(self: any, stateTargetIndex: any, context: any)` | 430 | ✍ Checks that a state change is allowed: Foldable's getIsFoldAllowed, vehicle power and, when a context is given, the state's posContext/negContext; shows a blinking warning otherwise. Note: the ternary passed to getIsFoldAllowed returns the same value in both branches. |
| `FoldableSteps.externalActionEventFoldRegister(data: any, vehicle: any)` | 465 | ✍ Registers the external full-fold action: on press it tries to start the motor and then runs actionEventFold. |
| `FoldableSteps.externalActionEventFoldUpdate(data: any, vehicle: any)` | 480 | ✍ Updates the text and visibility of the external full-fold action from the current state. |
| `FoldableSteps.externalActionEventFoldPosRegister(data: any, vehicle: any)` | 491 | ✍ Registers the external next-state action: tries to start the motor, then runs actionEventFoldPos. |
| `FoldableSteps.externalActionEventFoldPosUpdate(data: any, vehicle: any)` | 506 | ✍ Updates the external next-state action text, shown only when the animation is idle and the current state has a positive text. |
| `FoldableSteps.externalActionEventFoldNegRegister(data: any, vehicle: any)` | 524 | ✍ Registers the external previous-state action: tries to start the motor, then runs actionEventFoldNeg. |
| `FoldableSteps.externalActionEventFoldNegUpdate(data: any, vehicle: any)` | 539 | ✍ Updates the external previous-state action text, shown only when the animation is idle and the current state has a negative text. |
| `FoldableSteps:getCanBeTurnedOn(superFunc: any)` | 557 | ✍ Override returning false while the state is changing or if the current state does not allow turning on; otherwise defers to the parent. |
| `FoldableSteps:getTurnedOnNotAllowedWarning(superFunc: any)` | 571 | ✍ Override returning the "unfold the tool first" warning in the same cases as getCanBeTurnedOn; otherwise defers to the parent. |
| `FoldableSteps:getRequiresPower(superFunc: any)` | 585 | ✍ Override returning true while the state is changing, otherwise the parent value. |
| `FoldableSteps:getAllowHudInfoTrigger(superFunc: any)` | 598 | ✍ Override returning false when the current state does not allow the info HUD; otherwise defers to the parent. |
| `FoldableSteps:getFillUnitSupportsToolType(superFunc: any, fillUnitIndex: any, toolType: any)` | 612 | ✍ Override that refuses any defined tool type on the configured fill unit when the current state does not allow filling; otherwise defers to the parent. |
| `FoldableSteps:getBrakeForce(superFunc: any)` | 631 | ✍ Override returning 0 while the state is changing if releaseBrakesWhileFolding is set; otherwise defers to the parent. |
| `FoldableSteps:loadDynamicLockPositionFromXML(superFunc: any, xmlFile: any, key: any, lockPosition: any)` | 646 | ✍ Override that, after the parent succeeds, reads the foldableSteps#states list of a dynamic lock position into a lookup table. |
| `FoldableSteps:getIsDynamicLockPositionActive(superFunc: any, lockPosition: any)` | 664 | ✍ Override returning false when the lock position is restricted to certain states and the current state is not one of them; otherwise defers to the parent. |

## Specialization

| Type | Name | Line |
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
