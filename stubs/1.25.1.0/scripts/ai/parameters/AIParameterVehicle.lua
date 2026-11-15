---@meta
-- FS25 1.25.1.0 : ai/parameters/AIParameterVehicle.lua (stub généré, atlas Lua FS25)

---@class AIParameterVehicle : AIParameter
AIParameterVehicle = {}

---@param customMt any
function AIParameterVehicle.new(customMt) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function AIParameterVehicle:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId any
---@param connection any
function AIParameterVehicle:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AIParameterVehicle:writeStream(streamId, connection) end

function AIParameterVehicle:getCanBeChanged() end

function AIParameterVehicle:getString() end

---@param vehicle any
function AIParameterVehicle:setVehicle(vehicle) end

function AIParameterVehicle:getVehicle() end

---@param needsAITarget any
function AIParameterVehicle:validate(needsAITarget) end
