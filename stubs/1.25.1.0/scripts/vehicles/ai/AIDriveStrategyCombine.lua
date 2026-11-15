---@meta
-- FS25 1.25.1.0 : vehicles/ai/AIDriveStrategyCombine.lua (generated stub, FS25 Lua Atlas)

---@class AIDriveStrategyCombine : AIDriveStrategy
AIDriveStrategyCombine = {}

---@param reconstructionData any
---@param customMt any
function AIDriveStrategyCombine.new(reconstructionData, customMt) end

---@param vehicle any
function AIDriveStrategyCombine:setAIVehicle(vehicle) end

---@param dt any
function AIDriveStrategyCombine:update(dt) end

---@param dt any
---@param vX any
---@param vY any
---@param vZ any
function AIDriveStrategyCombine:getDriveData(dt, vX, vY, vZ) end

---@param dt any
function AIDriveStrategyCombine:updateDriving(dt) end
