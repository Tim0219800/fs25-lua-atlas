---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AIJobVehicle.lua (generated stub, FS25 Lua Atlas)

---@class AIJobVehicle
AIJobVehicle = {}

---@param specializations table
---@return boolean
function AIJobVehicle.prerequisitesPresent(specializations) end

function AIJobVehicle.initSpecialization() end

---@param vehicleType any
function AIJobVehicle.registerEvents(vehicleType) end

---@param vehicleType any
function AIJobVehicle.registerFunctions(vehicleType) end

---@param vehicleType any
function AIJobVehicle.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function AIJobVehicle.registerEventListeners(vehicleType) end

---@param savegame table
function AIJobVehicle:onLoad(savegame) end

---@param streamId integer
---@param connection Connection
function AIJobVehicle:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AIJobVehicle:onWriteStream(streamId, connection) end

---@param aiMode any
function AIJobVehicle:onAIModeChanged(aiMode) end

---@return boolean
function AIJobVehicle:getShowAIToggleActionEvent() end

---@param superFunc any
---@param connection any
function AIJobVehicle:getIsInUse(superFunc, connection) end

---@param superFunc any
function AIJobVehicle:getIsActive(superFunc) end

---@param superFunc any
function AIJobVehicle:getIsAIActive(superFunc) end

function AIJobVehicle:toggleAIVehicle() end

---@return boolean
function AIJobVehicle:getCanToggleAIVehicle() end

---@return boolean
function AIJobVehicle:getCanStartAIVehicle() end

---@param aiJobName any
---@return boolean
function AIJobVehicle:getIsAIJobSupported(aiJobName) end

---@param superFunc any
---@return boolean
function AIJobVehicle:getDeactivateLightsOnLeave(superFunc) end
