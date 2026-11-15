---@meta
-- FS25 1.25.1.0 : vehicles/VehicleActionControllerAction.lua (generated stub, FS25 Lua Atlas)

---@class VehicleActionControllerAction
VehicleActionControllerAction = {}

---@param parent any
---@param name any
---@param inputAction any
---@param priority any
---@param customMt any
function VehicleActionControllerAction.new(parent, name, inputAction, priority, customMt) end

function VehicleActionControllerAction:remove() end

---@param parent any
function VehicleActionControllerAction:updateParent(parent) end

---@param callbackTarget any
---@param inputCallback any
---@param inputCallbackRev any
function VehicleActionControllerAction:setCallback(callbackTarget, inputCallback, inputCallbackRev) end

---@param finishedFunctionTarget any
---@param finishedFunc any
---@param finishedResult any
---@param finishedResultRev any
---@param finishedFuncRev any
function VehicleActionControllerAction:setFinishedFunctions(finishedFunctionTarget, finishedFunc, finishedResult, finishedResultRev, finishedFuncRev) end

---@param deactivateFunctionTarget any
---@param deactivateFunc any
---@param inverseDeactivateFunc any
function VehicleActionControllerAction:setDeactivateFunction(deactivateFunctionTarget, deactivateFunc, inverseDeactivateFunc) end

---@param availableFunc any
function VehicleActionControllerAction:setIsAvailableFunction(availableFunc) end

---@param accessibleFunc any
function VehicleActionControllerAction:setIsAccessibleFunction(accessibleFunc) end

---@param iconPos any
---@param iconNeg any
---@param changeColor any
function VehicleActionControllerAction:setActionIcons(iconPos, iconNeg, changeColor) end

---@param resetOnDeactivation any
function VehicleActionControllerAction:setResetOnDeactivation(resetOnDeactivation) end

---@param isSaved any
function VehicleActionControllerAction:setIsSaved(isSaved) end

function VehicleActionControllerAction:getIsSaved() end

function VehicleActionControllerAction:isAvailable() end

function VehicleActionControllerAction:getControlledActionIcons() end

function VehicleActionControllerAction:getLastDirection() end

function VehicleActionControllerAction:getDoResetOnDeactivation() end

---@param sourceVehicle any
---@param eventName any
---@param direction any
---@param forceUntilFinished any
function VehicleActionControllerAction:addAIEventListener(sourceVehicle, eventName, direction, forceUntilFinished) end

---@param target any
---@param vehicle any
---@param actionEvents any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function VehicleActionControllerAction:registerActionEvents(target, vehicle, actionEvents, isActiveForInput, isActiveForInputIgnoreSelection) end

---@param actionName any
---@param inputValue any
---@param actionIndex any
---@param isAnalog any
function VehicleActionControllerAction:actionEvent(actionName, inputValue, actionIndex, isAnalog) end

---@param direction any
---@param isAIEvent any
function VehicleActionControllerAction:doAction(direction, isAIEvent) end

---@param direction any
function VehicleActionControllerAction:getIsFinished(direction) end

function VehicleActionControllerAction:getSourceVehicle() end

---@param eventName any
function VehicleActionControllerAction:onAIEvent(eventName) end

---@param dt any
function VehicleActionControllerAction:update(dt) end

---@param dt any
function VehicleActionControllerAction:updateForAI(dt) end

function VehicleActionControllerAction:getDebugText() end
