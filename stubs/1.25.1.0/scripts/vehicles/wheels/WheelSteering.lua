---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelSteering.lua (generated stub, FS25 Lua Atlas)

---@class WheelSteering
WheelSteering = {}

---@param wheel any
function WheelSteering.new(wheel) end

---@param xmlObject any
function WheelSteering:loadFromXML(xmlObject) end

---@param rotMin any
---@param rotMax any
---@param rotSpeed any
---@param rotSpeedNeg any
---@param inverted any
function WheelSteering:setSteeringValues(rotMin, rotMax, rotSpeed, rotSpeedNeg, inverted) end

---@param x any
---@param y any
---@param z any
---@param xDrive any
---@param suspensionLength any
---@param steeringAngle any
---@param changed any
function WheelSteering:update(x, y, z, xDrive, suspensionLength, steeringAngle, changed) end

---@param schema any
---@param key any
function WheelSteering.registerXMLPaths(schema, key) end
