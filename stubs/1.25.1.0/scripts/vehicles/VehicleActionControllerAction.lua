---@meta
-- FS25 1.25.1.0 : vehicles/VehicleActionControllerAction.lua (generated stub, FS25 Lua Atlas)

--- One controlled action owned by a `VehicleActionController`: it wraps an input callback (called with a direction +1/-1), an optional finished-check function, optional availability, accessibility and auto-deactivate functions, icons, an AI event listener list and a flag for savegame persistence. It tracks `lastDirection` and `lastValidDirection`.
---@class VehicleActionControllerAction
VehicleActionControllerAction = {}

--- Creates an action for a parent controller with name, input action and priority. Defaults: direction -1, saved = false, reset on deactivation = true, empty identifier.
---@param parent any
---@param name any
---@param inputAction any
---@param priority any
---@param customMt any
function VehicleActionControllerAction.new(parent, name, inputAction, priority, customMt) end

--- Removes this action from its parent controller.
function VehicleActionControllerAction:remove() end

--- Moves the action to another controller (removing it from the old one and adding it to the new one) when it differs from the current parent.
---@param parent any
function VehicleActionControllerAction:updateParent(parent) end

--- Sets the target and the callbacks for forward and reverse input, and takes the target's `configFileName` as the action identifier (empty string if absent). Only `inputCallback` is invoked by `doAction`.
---@param callbackTarget any
---@param inputCallback any
---@param inputCallbackRev any
function VehicleActionControllerAction:setCallback(callbackTarget, inputCallback, inputCallbackRev) end

--- Sets the function used to know when the action is done, and the values it must return for the positive and the reverse direction (`finishedResult`, `finishedResultRev`).
---@param finishedFunctionTarget any
---@param finishedFunc any
---@param finishedResult any
---@param finishedResultRev any
---@param finishedFuncRev any
function VehicleActionControllerAction:setFinishedFunctions(finishedFunctionTarget, finishedFunc, finishedResult, finishedResultRev, finishedFuncRev) end

--- Sets a function that, while the action is on and returns true (or false if inverted), makes the parent start a new sequence in `update`.
---@param deactivateFunctionTarget any
---@param deactivateFunc any
---@param inverseDeactivateFunc any
function VehicleActionControllerAction:setDeactivateFunction(deactivateFunctionTarget, deactivateFunc, inverseDeactivateFunc) end

--- Sets the function that tells whether the action is currently available.
---@param availableFunc any
function VehicleActionControllerAction:setIsAvailableFunction(availableFunc) end

--- Stores the accessibility function. Note: no method in this dump reads it, although the controller calls `isAccessible()` on actions (UNVERIFIED where it is defined).
---@param accessibleFunc any
function VehicleActionControllerAction:setIsAccessibleFunction(accessibleFunc) end

--- Sets the positive and negative icons and whether the colour changes.
---@param iconPos any
---@param iconNeg any
---@param changeColor any
function VehicleActionControllerAction:setActionIcons(iconPos, iconNeg, changeColor) end

--- Sets whether the action is toggled back when removed from the controller.
---@param resetOnDeactivation any
function VehicleActionControllerAction:setResetOnDeactivation(resetOnDeactivation) end

--- Sets whether this action is written to the savegame.
---@param isSaved any
function VehicleActionControllerAction:setIsSaved(isSaved) end

--- Returns whether this action is saved.
function VehicleActionControllerAction:getIsSaved() end

--- Calls the availability function if set, otherwise returns true.
function VehicleActionControllerAction:isAvailable() end

--- Returns positive icon, negative icon and the colour-change flag.
function VehicleActionControllerAction:getControlledActionIcons() end

--- Returns the last requested direction (+1 or -1).
function VehicleActionControllerAction:getLastDirection() end

--- Returns whether the action is toggled back on removal.
function VehicleActionControllerAction:getDoResetOnDeactivation() end

--- Registers an AI event name to react to, with the direction to apply and a flag to keep forcing it until it succeeds; also records the source vehicle.
---@param sourceVehicle any
---@param eventName any
---@param direction any
---@param forceUntilFinished any
function VehicleActionControllerAction:addAIEventListener(sourceVehicle, eventName, direction, forceUntilFinished) end

--- Does nothing: the body is only commented-out code, so no per-action input event is registered.
---@param target any
---@param vehicle any
---@param actionEvents any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function VehicleActionControllerAction:registerActionEvents(target, vehicle, actionEvents, isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback that runs `doAction()` with the opposite of the last direction.
---@param actionName any
---@param inputValue any
---@param actionIndex any
---@param isAnalog any
function VehicleActionControllerAction:actionEvent(actionName, inputValue, actionIndex, isAnalog) end

--- Sets the direction (default: opposite of the last one) and calls the input callback with target, direction and AI flag. Records `lastValidDirection` on success and returns the callback's result.
---@param direction any
---@param isAIEvent any
function VehicleActionControllerAction:doAction(direction, isAIEvent) end

--- Compares the finished function's result to the expected value for the direction; true when no finished function is set.
---@param direction any
function VehicleActionControllerAction:getIsFinished(direction) end

--- Returns the vehicle set by `addAIEventListener`, or nil.
function VehicleActionControllerAction:getSourceVehicle() end

--- For each listener matching the event name, runs the action with its direction. If it fails and forcing is requested, remembers the direction to retry; otherwise clears a contrary forced direction and stops the parent's sequence.
---@param eventName any
function VehicleActionControllerAction:onAIEvent(eventName) end

--- While the action is on and its deactivate function returns the triggering value, asks the parent to start a sequence, unless one is running or a forced AI direction is pending.
---@param dt any
function VehicleActionControllerAction:update(dt) end

--- Retries the forced AI direction; on success clears it and stops the parent's sequence.
---@param dt any
function VehicleActionControllerAction:updateForAI(dt) end

--- Builds a debug line with priority, vehicle name, action name and current/target finished values. Calls the finished function and `getName()` on the callback target.
function VehicleActionControllerAction:getDebugText() end
