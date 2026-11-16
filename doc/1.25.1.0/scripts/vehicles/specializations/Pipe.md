# vehicles/specializations/Pipe.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Pipe.md)*

Source: `dataS/scripts/vehicles/specializations/Pipe.lua` — FS25 1.25.1.0

✍ Specialization for vehicles that unload through a movable pipe (combines, harvesters, auger wagons). It requires FillUnit and Dischargeable. The pipe has numbered states (1 = folded) driven by pipe nodes and/or an animation, with optional auto-aim at the nearest fillable vehicle found through unloading triggers. It reads vehicle.pipe (optionally per pipe configuration), saves the state, and syncs it with SetPipeStateEvent plus a dirty-flag stream for the nearest target. Registered but not defined in the dump: setIsPipeStateChangeAllowed (UNVERIFIED).

- **Pipe** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `Pipe.prerequisitesPresent(specializations: any)` | 18 | ✍ Returns true only if the vehicle type has FillUnit and Dischargeable. |
| `Pipe.initSpecialization()` | 24 | ✍ Adds the 'pipe' configuration type, registers animation node XML paths, the Cylindered freezingPipeStates key, cover min/max pipe state keys, the pipe XML paths (base and per configuration) and the savegame keys state and isStateChangeAllowed. |
| `Pipe.registers(schema: any, basePath: any)` | 51 | ✍ Registers every pipe XML attribute under a base path: texts, discharge node index, automatic discharge, unloading triggers, animation, states, pipe nodes with per-state transforms, speeds, limits, bending regulation, sounds, fold limits and autoFoldWithFoldable. |
| `Pipe.registerFunctions(vehicleType: any)` | 111 | ✍ Adds the pipe API to the vehicle type (loaders, setPipeState, getCurrentPipeState, updatePipeNodes, trigger callback, nearest-object lookup and others). Note: it also registers setIsPipeStateChangeAllowed, which has no body in this dump. |
| `Pipe.registerOverwrittenFunctions(vehicleType: any)` | 130 | ✍ Overrides discharge, turn-on, fold, moving tool, cover, selection and AI readiness functions so the pipe state influences them. |
| `Pipe.registerEventListeners(vehicleType: any)` | 151 | ✍ Subscribes to load, delete, stream, update, moving tool, action events, discharge state, fold state, AI transport and root vehicle change events. |
| `Pipe:onLoad(savegame: any)` | 171 | ✍ Loads the pipe settings from the configuration key (fallback vehicle.pipe): unloading triggers (added as engine triggers), animation, states, pipe nodes, unloading/auto-aim/turn-on state sets, discharge node mapping, fold limits, texts, side notification progress bar and dirty flag. Removes the update tick on clients and the fold listener unless autoFoldWithFoldable. |
| `Pipe:onPostLoad(savegame: any)` | 319 | ✍ Restores state and isStateChangeAllowed from the savegame and snaps the pipe to that state. Without a savegame and with autoFoldWithFoldable, sets the pipe state from the foldable's current fold position. |
| `Pipe:onDelete()` | 360 | ✍ Removes delete listeners from tracked objects, removes the unloading triggers, deletes pipe move sounds and the side notification progress bar, and deletes the animation nodes. |
| `Pipe:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 403 | ✍ Saves the current pipe state (clamped to 1..numStates, only if states exist) and isStateChangeAllowed. |
| `Pipe:onReadStream(streamId: any, connection: any)` | 414 | ✍ Client on join: reads the pipe state (2 bits) and applies it without sending an event, then reads the nearest target (object id, fill unit, discharge flag) if present. |
| `Pipe:onWriteStream(streamId: any, connection: any)` | 429 | ✍ Server on join: writes the target pipe state (2 bits) and, if one was sent, the nearest target data. |
| `Pipe:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 443 | ✍ Client: when the dirty flag bit is set, reads the nearest target (object id, fill unit, discharge flag) or clears it. |
| `Pipe:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 462 | ✍ Server: if the pipe dirty flag is set, writes the last sent nearest target data for clients. |
| `Pipe:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 477 | ✍ Refreshes the action text and moves pipe nodes if the pipe is movable. On the client it shows a side notification progress bar with name, fill level and fill type of the target being filled, kept for 5 seconds after it leaves. |
| `Pipe:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 538 | ✍ Server only. Updates the nearest target and flags a network dirty state when it changes. If Platform.gameplay.automaticPipeUnfolding is on, there is no auto-aim state and no AI is active, it unfolds the pipe when a target or unload trigger is in range (and the vehicle is filled or running), and folds it back otherwise. |
| `Pipe:loadUnloadingTriggers(unloadingTriggers: any, xmlFile: any, baseKey: any)` | 590 | ✍ Reads the unloading trigger nodes from XML into a list. A node without the FILLABLE collision mask bit is rejected with a warning. |
| `Pipe:loadPipeNodes(pipeNodes: any, xmlFile: any, baseKey: any)` | 614 | ✍ Loads each pipe node: per-state translation and rotation, speeds (converted from per second to per ms), rotation limits, fold priority, auto-aim flags, sub node ratio, bending regulation nodes and move sounds. Also computes the inverse fold priorities. |
| `Pipe:getIsPipeStateChangeAllowed(pipeState: any)` | 732 | ✍ Returns false if state changes are disabled or the foldable's fold animation time is outside foldMinLimit/foldMaxLimit; otherwise true. The pipeState argument is not used. |
| `Pipe:setPipeState(pipeState: any, noEventSend: any)` | 758 | ✍ Sets the target state (capped at numStates), sends SetPipeStateEvent unless noEventSend, plays the pipe animation forward or backward and selects the discharge node of that state when forced. |
| `Pipe:getCurrentPipeState()` | 789 | ✍ Returns the current pipe state index; it is 0 while the pipe is still moving to a new target. |
| `Pipe:updatePipeNodes(dt: any)` | 795 | ✍ Moves each pipe node toward its target state by translation and rotation speeds, with auto-aim at the nearest target when allowed, rotation limits, fold priorities, bending regulation and move sounds. Marks the state reached when nothing moves anymore. |
| `Pipe:updateBendingRegulationNodes(pipeNode: any, distance: any)` | 1003 | ✍ Rotates the regulation nodes by the pipe node's upward direction times its bendingRegulation, and returns the vertical offset (sin of that angle times distance) used to correct auto-aim. |
| `Pipe:unloadingTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1026 | ✍ Trigger callback on enter and leave. Counts vehicles in range that support at least one of the discharged fill types, and UnloadTrigger objects. Registers delete listeners and wakes the vehicle with raiseActive. |
| `Pipe:updateNearestObjectInTriggers()` | 1104 | ✍ Finds the closest target in the triggers: a fill unit that accepts the dischargeable tool type and the output fill type and has free capacity. Distance is measured to its auto-aim node or exact-fill root. Fills nearestObjectInTriggers; warns if the discharge node is missing. |
| `Pipe:updateActionEventText()` | 1154 | ✍ Updates the TOGGLE_PIPE action text (pipe in, or pipe out with state number and fill type when several unloading states exist) and shows the action only if the change is allowed. |
| `Pipe:getIsDischargeNodeActive(superFunc: any, dischargeNode: any)` | 1194 | ✍ For the pipe's discharge node, returns true only when the current state is an unloading state; other nodes go to the parent. |
| `Pipe:getCanBeTurnedOn(superFunc: any)` | 1206 | ✍ Returns false if turn-on allowed states are defined and the current pipe state is not one of them; otherwise defers to the parent. |
| `Pipe:getTurnedOnNotAllowedWarning(superFunc: any)` | 1229 | ✍ Returns the 'set pipe state first' warning when the current state is not a turn-on allowed state; otherwise defers to the parent. |
| `Pipe:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 1252 | ✍ Returns false with a warning text if the pipe state is outside foldMinState..foldMaxState; otherwise defers to the parent. |
| `Pipe:handleDischarge(superFunc: any, dischargeNode: any, dischargedLiters: any, minDropReached: any, hasMinDropFillLevel: any)` | 1266 | ✍ With automaticDischarge, ignores discharge handling for the pipe's own discharge node and lets the parent handle the others. Without it, always defers to the parent. |
| `Pipe:handleDischargeRaycast(superFunc: any, dischargeNode: any, hitObject: any, hitShape: any, hitDistance: any, hitFillUnitIndex: any, hitTerrain: any)` | 1280 | ✍ With automaticDischarge, starts object discharge when the vehicle is powered and the hit target accepts the fill type with free capacity, discharges to ground if that mode is enabled, and stops discharging to an object otherwise. Without it, uses the parent. |
| `Pipe:getCanToggleDischargeToObject(superFunc: any)` | 1310 | ✍ Returns false when automaticDischarge is set; otherwise defers to the parent. |
| `Pipe:getCanToggleDischargeToGround(superFunc: any)` | 1321 | ✍ Returns false when both automaticDischarge and toggleableDischargeToGround are set; otherwise defers to the parent. |
| `Pipe:getRequiresPower(superFunc: any)` | 1332 | ✍ Returns true while the pipe is moving between states or, with automaticDischarge, while a discharge target exists; otherwise defers to the parent. |
| `Pipe:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1354 | ✍ After the parent loads a moving tool, reads its freezingPipeStates list. Returns false if the parent failed. |
| `Pipe:getIsMovingToolActive(superFunc: any, movingTool: any)` | 1366 | ✍ Returns false for a moving tool when the pipe is in or moving to one of its freezing states, or is in transit (state 0); otherwise defers to the parent. |
| `Pipe:loadCoverFromXML(superFunc: any, xmlFile: any, key: any, cover: any)` | 1381 | ✍ Reads minPipeState and maxPipeState on a cover (defaults 0 and infinity), then calls the parent loader. |
| `Pipe:getIsNextCoverStateAllowed(superFunc: any, nextState: any)` | 1390 | ✍ Refuses a cover state change if the parent does, or if the target cover (other than state 0) requires a pipe state range that does not include the current pipe state. |
| `Pipe:onDeletePipeObject(object: any)` | 1408 | ✍ Delete listener callback: drops a deleted object from the tracked vehicle and unload trigger tables and adjusts the counters. |
| `Pipe:getPipeDischargeNodeIndex(state: any)` | 1423 | ✍ Returns the discharge node index mapped to the given pipe state (default: the current one), or the default discharge node index when no mapping exists. |
| `Pipe:setPipeDischargeToGround(state: any, noEventSend: any)` | 1439 | ✍ Sets or toggles (nil) the discharge-to-ground flag, updates the action text and sends SetPipeDischargeToGroundEvent unless noEventSend. |
| `Pipe:getCanBeSelected(superFunc: any)` | 1459 | ✍ Always returns true, so a vehicle with a pipe can be selected. |
| `Pipe:getIsAIReadyToDrive(superFunc: any)` | 1465 | ✍ For a movable pipe, returns false unless the pipe is folded (state 1); otherwise defers to the parent. |
| `Pipe:getIsAIPreparingToDrive(superFunc: any)` | 1478 | ✍ For a movable pipe, returns true while the pipe has not reached its target state; otherwise defers to the parent. |
| `Pipe:onMovingToolChanged(tool: any, transSpeed: any, dt: any)` | 1491 | ✍ Copies the current translation and rotation of a moving tool to the matching pipe node, keeping both in sync. |
| `Pipe:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1503 | ✍ Client only. For a movable pipe, registers TOGGLE_PIPE (unless autoFoldWithFoldable) and, if toggleable, TOGGLE_TIPSTATE_GROUND with their texts. |
| `Pipe:onDischargeStateChanged(state: any)` | 1528 | ✍ Client only. When the pipe's discharge node changes state, stops the animation nodes if discharge is off, otherwise starts them and sets their fill type. |
| `Pipe:onFoldStateChanged(direction: integer, moveToMiddle: boolean)` | 1552 | ✍ With autoFoldWithFoldable, sets the pipe to its last state when folding toward the turn-on direction, otherwise to state 1. Ignored while lifting to the middle fold position. |
| `Pipe:onAIImplementPrepareForTransport()` | 1573 | ✍ Folds the pipe back to state 1 for AI transport if a movable pipe is present and the change is allowed. |
| `Pipe:onRootVehicleChanged(rootVehicle: table)` | 1585 | ✍ For pipes with auto-aim states, creates or re-parents an action controller entry 'pipe' for the new root vehicle, or removes it when none exists. The AI end listener is added unless autoFoldWithFoldable. |
| `Pipe.actionControllerPipeEvent(self: any, direction: any)` | 1614 | ✍ Action controller callback: sets the first auto-aim state for a positive direction, or state 1 otherwise. Returns true. |
| `Pipe.actionEventTogglePipe(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1628 | ✍ Input callback cycling to the next pipe state (wrapping to 1). If that state is refused, it tries to fold to state 1. |
| `Pipe.actionEventToggleDischargeToGround(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1644 | ✍ Input callback that toggles the discharge-to-ground flag via setPipeDischargeToGround. |

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
