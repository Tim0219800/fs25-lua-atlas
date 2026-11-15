---@meta
-- FS25 1.25.1.0 : gui/hud/SpeedMeterDisplay.lua (stub généré, atlas Lua FS25)

---@class SpeedMeterDisplay : HUDDisplay
SpeedMeterDisplay = {}

function SpeedMeterDisplay.new() end

function SpeedMeterDisplay:storeScaledValues() end

function SpeedMeterDisplay:draw() end

---@param x table
---@param y any
function SpeedMeterDisplay:drawGearText(x, y) end

---@param vehicle table
function SpeedMeterDisplay:setVehicle(vehicle) end

---@param vehicle any
function SpeedMeterDisplay.getVehicleFuelLevelAndCapacity(vehicle) end
