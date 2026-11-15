---@meta
-- FS25 1.25.1.0 : vehicles/ai/AIDriveStrategy.lua (stub généré, atlas Lua FS25)

---@class AIDriveStrategy
AIDriveStrategy = {}

---@param reconstructionData any
---@param customMt any
function AIDriveStrategy.new(reconstructionData, customMt) end

function AIDriveStrategy:delete() end

---@param vehicle any
function AIDriveStrategy:setAIVehicle(vehicle) end

---@param dt any
function AIDriveStrategy:update(dt) end

---@param dt any
---@param vX any
---@param vY any
---@param vZ any
function AIDriveStrategy:getDriveData(dt, vX, vY, vZ) end

---@param dt any
function AIDriveStrategy:updateDriving(dt) end

---@param text any
function AIDriveStrategy:debugPrint(text, ...) end
