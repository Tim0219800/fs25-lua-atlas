---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AIConveyorBelt.lua (stub généré, atlas Lua FS25)

---@class AIConveyorBelt
AIConveyorBelt = {}

---@param specializations table
---@return boolean
function AIConveyorBelt.prerequisitesPresent(specializations) end

function AIConveyorBelt.initSpecialization() end

---@param vehicleType any
function AIConveyorBelt.registerFunctions(vehicleType) end

---@param vehicleType any
function AIConveyorBelt.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function AIConveyorBelt.registerEventListeners(vehicleType) end

---@param savegame table
function AIConveyorBelt:onLoad(savegame) end

---@param savegame any
function AIConveyorBelt:onPostLoad(savegame) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function AIConveyorBelt:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function AIConveyorBelt:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AIConveyorBelt:onWriteStream(streamId, connection) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AIConveyorBelt:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AIConveyorBelt:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param angle any
---@param noEventSend any
function AIConveyorBelt:setAIConveyorBeltAngle(angle, noEventSend) end

---@param direction any
---@param minAngle any
---@param maxAngle any
function AIConveyorBelt:getDirectionAndSpeedToTargetAngle(direction, minAngle, maxAngle) end

---@param superFunc any
function AIConveyorBelt:getCanStartAIVehicle(superFunc) end

function AIConveyorBelt:getCanStartFieldWork() end

---@param superFunc any
function AIConveyorBelt:getStartableAIJob(superFunc) end

---@param superFunc any
function AIConveyorBelt:getHasStartableAIJob(superFunc) end

---@param superFunc any
function AIConveyorBelt:getCanBeSelected(superFunc) end

---@param superFunc any
function AIConveyorBelt:getAINeedsTrafficCollisionBox(superFunc) end

function AIConveyorBelt:onAIFieldWorkerStart() end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function AIConveyorBelt:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AIConveyorBelt.actionEventChangeAngle(self, actionName, inputValue, callbackState, isAnalog) end
