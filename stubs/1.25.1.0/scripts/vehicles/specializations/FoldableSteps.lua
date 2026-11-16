---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FoldableSteps.lua (generated stub, FS25 Lua Atlas)

--- Requires the AnimatedVehicle specialization on the vehicle type.
---@param specializations table
---@return boolean
function FoldableSteps.prerequisitesPresent(specializations) end

--- Declares the vehicle.foldableSteps XML keys (animation name and speed, fill unit, controls, state list with texts, contexts and allow flags) and the lock position extension used by DynamicMountAttacher. Also registers the savegame keys animTime, state and targetState.
function FoldableSteps.initSpecialization() end

--- Registers setFoldableStepsFoldState on the vehicle type.
---@param vehicleType table
function FoldableSteps.registerFunctions(vehicleType) end

--- Registers overrides for turn-on checks, power requirement, HUD info trigger, fill unit tool types, brake force and dynamic lock positions.
---@param vehicleType table
function FoldableSteps.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, post load, network stream, update tick, draw and action event registration events.
---@param vehicleType table
function FoldableSteps.registerEventListeners(vehicleType) end

--- Reads the foldableSteps node: animation, input actions and texts, then the list of states (animation time converted from seconds to normalized time, texts, contexts, allow flags). Restores animTime, state and targetState from the savegame. If no animationName exists it removes its listeners.
---@param savegame table
function FoldableSteps:onLoad(savegame) end

--- Applies the animation time loaded from the savegame to the animation, if any.
---@param savegame table
function FoldableSteps:onPostLoad(savegame) end

--- Writes the animation time, current state index and target state index to the savegame when an animation is defined.
---@param xmlFile any
---@param key any
---@param usedModNames any
function FoldableSteps:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client join: reads animation time, state index and target state index, sets the animation time and calls setFoldableStepsFoldState with noEventSend.
---@param streamId any
---@param connection any
function FoldableSteps:onReadStream(streamId, connection) end

--- Writes animation time, state index and target state index for a joining client; counterpart of onReadStream.
---@param streamId any
---@param connection any
function FoldableSteps:onWriteStream(streamId, connection) end

--- While the state index differs from the target, waits for the animation to stop, then sets the state to the target and refreshes the action texts. Keeps the vehicle active during the movement.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function FoldableSteps:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Displays the extra info text of the target state on screen when that state defines one.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function FoldableSteps:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client: registers the full fold action (if allowed) and the optional next/previous state actions as powered action events, then updates their texts.
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
function FoldableSteps:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Registers external action events for the trigger names foldableStepsFull, foldableStepsNextPos and foldableStepsNextNeg (the last two only if the matching input action is configured).
---@param trigger any
---@param name any
---@param xmlFile any
---@param key any
function FoldableSteps:onRegisterExternalActionEvents(trigger, name, xmlFile, key) end

--- Sets the target state index (clamped to 1..maxState), plays the animation toward that state's time at the configured speed, refreshes action texts and sends FoldableStepsChangeStateEvent unless noEventSend is set.
---@param stateTargetIndex any
---@param noEventSend any
function FoldableSteps:setFoldableStepsFoldState(stateTargetIndex, noEventSend) end

--- Updates the texts and active flags of the full, next and previous state actions according to the current state and whether the animation is moving.
---@param self any
---@param actionEvents any
function FoldableSteps.updateActionEvents(self, actionEvents) end

--- Input callback for the full fold action: picks the first or last state depending on the current state and movement, and applies it if updateFoldStateChangeAllowed agrees.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function FoldableSteps.actionEventFold(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback moving to the next state (target + 1), checking permission with the current input context.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function FoldableSteps.actionEventFoldPos(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback moving to the previous state (target - 1), checking permission with the current input context.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function FoldableSteps.actionEventFoldNeg(self, actionName, inputValue, callbackState, isAnalog) end

--- Checks that a state change is allowed: Foldable's getIsFoldAllowed, vehicle power and, when a context is given, the state's posContext/negContext; shows a blinking warning otherwise. Note: the ternary passed to getIsFoldAllowed returns the same value in both branches.
---@param self any
---@param stateTargetIndex any
---@param context any
function FoldableSteps.updateFoldStateChangeAllowed(self, stateTargetIndex, context) end

--- Registers the external full-fold action: on press it tries to start the motor and then runs actionEventFold.
---@param data any
---@param vehicle any
function FoldableSteps.externalActionEventFoldRegister(data, vehicle) end

--- Updates the text and visibility of the external full-fold action from the current state.
---@param data any
---@param vehicle any
function FoldableSteps.externalActionEventFoldUpdate(data, vehicle) end

--- Registers the external next-state action: tries to start the motor, then runs actionEventFoldPos.
---@param data any
---@param vehicle any
function FoldableSteps.externalActionEventFoldPosRegister(data, vehicle) end

--- Updates the external next-state action text, shown only when the animation is idle and the current state has a positive text.
---@param data any
---@param vehicle any
function FoldableSteps.externalActionEventFoldPosUpdate(data, vehicle) end

--- Registers the external previous-state action: tries to start the motor, then runs actionEventFoldNeg.
---@param data any
---@param vehicle any
function FoldableSteps.externalActionEventFoldNegRegister(data, vehicle) end

--- Updates the external previous-state action text, shown only when the animation is idle and the current state has a negative text.
---@param data any
---@param vehicle any
function FoldableSteps.externalActionEventFoldNegUpdate(data, vehicle) end

--- Override returning false while the state is changing or if the current state does not allow turning on; otherwise defers to the parent.
---@param superFunc any
function FoldableSteps:getCanBeTurnedOn(superFunc) end

--- Override returning the "unfold the tool first" warning in the same cases as getCanBeTurnedOn; otherwise defers to the parent.
---@param superFunc any
function FoldableSteps:getTurnedOnNotAllowedWarning(superFunc) end

--- Override returning true while the state is changing, otherwise the parent value.
---@param superFunc any
function FoldableSteps:getRequiresPower(superFunc) end

--- Override returning false when the current state does not allow the info HUD; otherwise defers to the parent.
---@param superFunc any
function FoldableSteps:getAllowHudInfoTrigger(superFunc) end

--- Override that refuses any defined tool type on the configured fill unit when the current state does not allow filling; otherwise defers to the parent.
---@param superFunc any
---@param fillUnitIndex any
---@param toolType any
function FoldableSteps:getFillUnitSupportsToolType(superFunc, fillUnitIndex, toolType) end

--- Override returning 0 while the state is changing if releaseBrakesWhileFolding is set; otherwise defers to the parent.
---@param superFunc any
function FoldableSteps:getBrakeForce(superFunc) end

--- Override that, after the parent succeeds, reads the foldableSteps#states list of a dynamic lock position into a lookup table.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param lockPosition any
function FoldableSteps:loadDynamicLockPositionFromXML(superFunc, xmlFile, key, lockPosition) end

--- Override returning false when the lock position is restricted to certain states and the current state is not one of them; otherwise defers to the parent.
---@param superFunc any
---@param lockPosition any
function FoldableSteps:getIsDynamicLockPositionActive(superFunc, lockPosition) end
