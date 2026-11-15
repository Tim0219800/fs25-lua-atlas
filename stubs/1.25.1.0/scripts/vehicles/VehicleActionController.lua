---@meta
-- FS25 1.25.1.0 : vehicles/VehicleActionController.lua (generated stub, FS25 Lua Atlas)

---@class VehicleActionController
VehicleActionController = {}

---@param vehicle any
---@param customMt any
function VehicleActionController.new(vehicle, customMt) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function VehicleActionController:saveToXMLFile(xmlFile, key, usedModNames) end

---@param savegame any
function VehicleActionController:load(savegame) end

---@param name any
---@param inputAction any
---@param prio any
function VehicleActionController:registerAction(name, inputAction, prio) end

---@param action any
function VehicleActionController:addAction(action) end

---@param action any
function VehicleActionController:removeAction(action) end

function VehicleActionController:updateSortedActions() end

function VehicleActionController:activate() end

function VehicleActionController:deactivate() end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function VehicleActionController:registerActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param actionName any
---@param inputValue any
---@param actionIndex any
---@param isAnalog any
function VehicleActionController:actionEvent(actionName, inputValue, actionIndex, isAnalog) end

---@param actionIndex any
---@param customTable any
---@param direction any
function VehicleActionController:doAction(actionIndex, customTable, direction) end

function VehicleActionController:actionSequenceEvent() end

---@param force any
function VehicleActionController:startActionSequence(force) end

function VehicleActionController:continueActionSequence() end

function VehicleActionController:stopActionSequence() end

---@param actionIndex any
---@param customTable any
function VehicleActionController:getActionsByIndex(actionIndex, customTable) end

function VehicleActionController:getAreControlledActionsAvailable() end

function VehicleActionController:getAreControlledActionsAccessible() end

function VehicleActionController:getControlledActionIcons() end

function VehicleActionController:playControlledActions() end

function VehicleActionController:resetCurrentState() end

function VehicleActionController:getActionControllerDirection() end

---@param dt any
function VehicleActionController:update(dt) end

---@param dt any
function VehicleActionController:updateForAI(dt) end

---@param sourceVehicle any
---@param eventName any
function VehicleActionController:onAIEvent(sourceVehicle, eventName) end

function VehicleActionController:drawDebugRendering() end

---@param schema any
---@param basePath any
function VehicleActionController.registerXMLPaths(schema, basePath) end
