---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Pipe.lua (generated stub, FS25 Lua Atlas)

--- Specialization for vehicles that unload through a movable pipe (combines, harvesters, auger wagons). It requires FillUnit and Dischargeable. The pipe has numbered states (1 = folded) driven by pipe nodes and/or an animation, with optional auto-aim at the nearest fillable vehicle found through unloading triggers. It reads vehicle.pipe (optionally per pipe configuration), saves the state, and syncs it with SetPipeStateEvent plus a dirty-flag stream for the nearest target. Registered but not defined in the dump: setIsPipeStateChangeAllowed (UNVERIFIED).
---@class Pipe
Pipe = {}

--- Returns true only if the vehicle type has FillUnit and Dischargeable.
---@param specializations any
function Pipe.prerequisitesPresent(specializations) end

--- Adds the 'pipe' configuration type, registers animation node XML paths, the Cylindered freezingPipeStates key, cover min/max pipe state keys, the pipe XML paths (base and per configuration) and the savegame keys state and isStateChangeAllowed.
function Pipe.initSpecialization() end

--- Registers every pipe XML attribute under a base path: texts, discharge node index, automatic discharge, unloading triggers, animation, states, pipe nodes with per-state transforms, speeds, limits, bending regulation, sounds, fold limits and autoFoldWithFoldable.
---@param schema any
---@param basePath any
function Pipe.registers(schema, basePath) end

--- Adds the pipe API to the vehicle type (loaders, setPipeState, getCurrentPipeState, updatePipeNodes, trigger callback, nearest-object lookup and others). Note: it also registers setIsPipeStateChangeAllowed, which has no body in this dump.
---@param vehicleType any
function Pipe.registerFunctions(vehicleType) end

--- Overrides discharge, turn-on, fold, moving tool, cover, selection and AI readiness functions so the pipe state influences them.
---@param vehicleType any
function Pipe.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, delete, stream, update, moving tool, action events, discharge state, fold state, AI transport and root vehicle change events.
---@param vehicleType any
function Pipe.registerEventListeners(vehicleType) end

--- Loads the pipe settings from the configuration key (fallback vehicle.pipe): unloading triggers (added as engine triggers), animation, states, pipe nodes, unloading/auto-aim/turn-on state sets, discharge node mapping, fold limits, texts, side notification progress bar and dirty flag. Removes the update tick on clients and the fold listener unless autoFoldWithFoldable.
---@param savegame any
function Pipe:onLoad(savegame) end

--- Restores state and isStateChangeAllowed from the savegame and snaps the pipe to that state. Without a savegame and with autoFoldWithFoldable, sets the pipe state from the foldable's current fold position.
---@param savegame any
function Pipe:onPostLoad(savegame) end

--- Removes delete listeners from tracked objects, removes the unloading triggers, deletes pipe move sounds and the side notification progress bar, and deletes the animation nodes.
function Pipe:onDelete() end

--- Saves the current pipe state (clamped to 1..numStates, only if states exist) and isStateChangeAllowed.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Pipe:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client on join: reads the pipe state (2 bits) and applies it without sending an event, then reads the nearest target (object id, fill unit, discharge flag) if present.
---@param streamId any
---@param connection any
function Pipe:onReadStream(streamId, connection) end

--- Server on join: writes the target pipe state (2 bits) and, if one was sent, the nearest target data.
---@param streamId any
---@param connection any
function Pipe:onWriteStream(streamId, connection) end

--- Client: when the dirty flag bit is set, reads the nearest target (object id, fill unit, discharge flag) or clears it.
---@param streamId any
---@param timestamp any
---@param connection any
function Pipe:onReadUpdateStream(streamId, timestamp, connection) end

--- Server: if the pipe dirty flag is set, writes the last sent nearest target data for clients.
---@param streamId any
---@param connection any
---@param dirtyMask any
function Pipe:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Refreshes the action text and moves pipe nodes if the pipe is movable. On the client it shows a side notification progress bar with name, fill level and fill type of the target being filled, kept for 5 seconds after it leaves.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Pipe:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Server only. Updates the nearest target and flags a network dirty state when it changes. If Platform.gameplay.automaticPipeUnfolding is on, there is no auto-aim state and no AI is active, it unfolds the pipe when a target or unload trigger is in range (and the vehicle is filled or running), and folds it back otherwise.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Pipe:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Reads the unloading trigger nodes from XML into a list. A node without the FILLABLE collision mask bit is rejected with a warning.
---@param unloadingTriggers any
---@param xmlFile any
---@param baseKey any
function Pipe:loadUnloadingTriggers(unloadingTriggers, xmlFile, baseKey) end

--- Loads each pipe node: per-state translation and rotation, speeds (converted from per second to per ms), rotation limits, fold priority, auto-aim flags, sub node ratio, bending regulation nodes and move sounds. Also computes the inverse fold priorities.
---@param pipeNodes any
---@param xmlFile any
---@param baseKey any
function Pipe:loadPipeNodes(pipeNodes, xmlFile, baseKey) end

--- Returns false if state changes are disabled or the foldable's fold animation time is outside foldMinLimit/foldMaxLimit; otherwise true. The pipeState argument is not used.
---@param pipeState any
function Pipe:getIsPipeStateChangeAllowed(pipeState) end

--- Sets the target state (capped at numStates), sends SetPipeStateEvent unless noEventSend, plays the pipe animation forward or backward and selects the discharge node of that state when forced.
---@param pipeState any
---@param noEventSend any
function Pipe:setPipeState(pipeState, noEventSend) end

--- Returns the current pipe state index; it is 0 while the pipe is still moving to a new target.
function Pipe:getCurrentPipeState() end

--- Moves each pipe node toward its target state by translation and rotation speeds, with auto-aim at the nearest target when allowed, rotation limits, fold priorities, bending regulation and move sounds. Marks the state reached when nothing moves anymore.
---@param dt any
function Pipe:updatePipeNodes(dt) end

--- Rotates the regulation nodes by the pipe node's upward direction times its bendingRegulation, and returns the vertical offset (sin of that angle times distance) used to correct auto-aim.
---@param pipeNode any
---@param distance any
function Pipe:updateBendingRegulationNodes(pipeNode, distance) end

--- Trigger callback on enter and leave. Counts vehicles in range that support at least one of the discharged fill types, and UnloadTrigger objects. Registers delete listeners and wakes the vehicle with raiseActive.
---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function Pipe:unloadingTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

--- Finds the closest target in the triggers: a fill unit that accepts the dischargeable tool type and the output fill type and has free capacity. Distance is measured to its auto-aim node or exact-fill root. Fills nearestObjectInTriggers; warns if the discharge node is missing.
function Pipe:updateNearestObjectInTriggers() end

--- Updates the TOGGLE_PIPE action text (pipe in, or pipe out with state number and fill type when several unloading states exist) and shows the action only if the change is allowed.
function Pipe:updateActionEventText() end

--- For the pipe's discharge node, returns true only when the current state is an unloading state; other nodes go to the parent.
---@param superFunc any
---@param dischargeNode any
function Pipe:getIsDischargeNodeActive(superFunc, dischargeNode) end

--- Returns false if turn-on allowed states are defined and the current pipe state is not one of them; otherwise defers to the parent.
---@param superFunc any
function Pipe:getCanBeTurnedOn(superFunc) end

--- Returns the 'set pipe state first' warning when the current state is not a turn-on allowed state; otherwise defers to the parent.
---@param superFunc any
function Pipe:getTurnedOnNotAllowedWarning(superFunc) end

--- Returns false with a warning text if the pipe state is outside foldMinState..foldMaxState; otherwise defers to the parent.
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function Pipe:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- With automaticDischarge, ignores discharge handling for the pipe's own discharge node and lets the parent handle the others. Without it, always defers to the parent.
---@param superFunc any
---@param dischargeNode any
---@param dischargedLiters any
---@param minDropReached any
---@param hasMinDropFillLevel any
function Pipe:handleDischarge(superFunc, dischargeNode, dischargedLiters, minDropReached, hasMinDropFillLevel) end

--- With automaticDischarge, starts object discharge when the vehicle is powered and the hit target accepts the fill type with free capacity, discharges to ground if that mode is enabled, and stops discharging to an object otherwise. Without it, uses the parent.
---@param superFunc any
---@param dischargeNode any
---@param hitObject any
---@param hitShape any
---@param hitDistance any
---@param hitFillUnitIndex any
---@param hitTerrain any
function Pipe:handleDischargeRaycast(superFunc, dischargeNode, hitObject, hitShape, hitDistance, hitFillUnitIndex, hitTerrain) end

--- Returns false when automaticDischarge is set; otherwise defers to the parent.
---@param superFunc any
function Pipe:getCanToggleDischargeToObject(superFunc) end

--- Returns false when both automaticDischarge and toggleableDischargeToGround are set; otherwise defers to the parent.
---@param superFunc any
function Pipe:getCanToggleDischargeToGround(superFunc) end

--- Returns true while the pipe is moving between states or, with automaticDischarge, while a discharge target exists; otherwise defers to the parent.
---@param superFunc any
function Pipe:getRequiresPower(superFunc) end

--- After the parent loads a moving tool, reads its freezingPipeStates list. Returns false if the parent failed.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function Pipe:loadMovingToolFromXML(superFunc, xmlFile, key, entry) end

--- Returns false for a moving tool when the pipe is in or moving to one of its freezing states, or is in transit (state 0); otherwise defers to the parent.
---@param superFunc any
---@param movingTool any
function Pipe:getIsMovingToolActive(superFunc, movingTool) end

--- Reads minPipeState and maxPipeState on a cover (defaults 0 and infinity), then calls the parent loader.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param cover any
function Pipe:loadCoverFromXML(superFunc, xmlFile, key, cover) end

--- Refuses a cover state change if the parent does, or if the target cover (other than state 0) requires a pipe state range that does not include the current pipe state.
---@param superFunc any
---@param nextState any
function Pipe:getIsNextCoverStateAllowed(superFunc, nextState) end

--- Delete listener callback: drops a deleted object from the tracked vehicle and unload trigger tables and adjusts the counters.
---@param object any
function Pipe:onDeletePipeObject(object) end

--- Returns the discharge node index mapped to the given pipe state (default: the current one), or the default discharge node index when no mapping exists.
---@param state any
function Pipe:getPipeDischargeNodeIndex(state) end

--- Sets or toggles (nil) the discharge-to-ground flag, updates the action text and sends SetPipeDischargeToGroundEvent unless noEventSend.
---@param state any
---@param noEventSend any
function Pipe:setPipeDischargeToGround(state, noEventSend) end

--- Always returns true, so a vehicle with a pipe can be selected.
---@param superFunc any
function Pipe:getCanBeSelected(superFunc) end

--- For a movable pipe, returns false unless the pipe is folded (state 1); otherwise defers to the parent.
---@param superFunc any
function Pipe:getIsAIReadyToDrive(superFunc) end

--- For a movable pipe, returns true while the pipe has not reached its target state; otherwise defers to the parent.
---@param superFunc any
function Pipe:getIsAIPreparingToDrive(superFunc) end

--- Copies the current translation and rotation of a moving tool to the matching pipe node, keeping both in sync.
---@param tool any
---@param transSpeed any
---@param dt any
function Pipe:onMovingToolChanged(tool, transSpeed, dt) end

--- Client only. For a movable pipe, registers TOGGLE_PIPE (unless autoFoldWithFoldable) and, if toggleable, TOGGLE_TIPSTATE_GROUND with their texts.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Pipe:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Client only. When the pipe's discharge node changes state, stops the animation nodes if discharge is off, otherwise starts them and sets their fill type.
---@param state any
function Pipe:onDischargeStateChanged(state) end

--- With autoFoldWithFoldable, sets the pipe to its last state when folding toward the turn-on direction, otherwise to state 1. Ignored while lifting to the middle fold position.
---@param direction integer
---@param moveToMiddle boolean
function Pipe:onFoldStateChanged(direction, moveToMiddle) end

--- Folds the pipe back to state 1 for AI transport if a movable pipe is present and the change is allowed.
function Pipe:onAIImplementPrepareForTransport() end

--- For pipes with auto-aim states, creates or re-parents an action controller entry 'pipe' for the new root vehicle, or removes it when none exists. The AI end listener is added unless autoFoldWithFoldable.
---@param rootVehicle table
function Pipe:onRootVehicleChanged(rootVehicle) end

--- Action controller callback: sets the first auto-aim state for a positive direction, or state 1 otherwise. Returns true.
---@param self any
---@param direction any
function Pipe.actionControllerPipeEvent(self, direction) end

--- Input callback cycling to the next pipe state (wrapping to 1). If that state is refused, it tries to fold to state 1.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Pipe.actionEventTogglePipe(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback that toggles the discharge-to-ground flag via setPipeDischargeToGround.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Pipe.actionEventToggleDischargeToGround(self, actionName, inputValue, callbackState, isAnalog) end
