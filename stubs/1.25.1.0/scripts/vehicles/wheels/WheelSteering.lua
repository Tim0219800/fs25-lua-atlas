---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelSteering.lua (generated stub, FS25 Lua Atlas)

--- Visual steering helper of a wheel: moves or rotates a steering node and rotates fenders according to the wheel steering angle, using limits from XML. Also supports a steering axle scale that reuses the limits. Purely visual; created per wheel.
---@class WheelSteering
WheelSteering = {}

--- Creates the steering helper for a wheel with default min/max rotation limits of -1 and 1.
---@param wheel any
function WheelSteering.new(wheel) end

--- Reads the steering node, rotation node, min/max translation and rotation values, the list of fenders with their limits and the steering axle values from the wheel XML. Always returns true.
---@param xmlObject any
function WheelSteering:loadFromXML(xmlObject) end

--- Receives the wheel's physical steering range and fills in missing fender limits and the overall steering node limits. If a steering axle scale is set, it is negated when inverted and takes the range as its limits. The speed arguments are unused.
---@param rotMin any
---@param rotMax any
---@param rotSpeed any
---@param rotSpeedNeg any
---@param inverted any
function WheelSteering:setSteeringValues(rotMin, rotMax, rotSpeed, rotSpeedNeg, inverted) end

--- Applies the steering angle visually: translates and/or rotates the steering node proportionally to the min/max limits, and rotates each fender around Y by the amount the angle exceeds its limits. Other arguments are unused.
---@param x any
---@param y any
---@param z any
---@param xDrive any
---@param suspensionLength any
---@param steeringAngle any
---@param changed any
function WheelSteering:update(x, y, z, xDrive, suspensionLength, steeringAngle, changed) end

--- Registers the XML schema paths for steering node, rotation node, translation/rotation limits, fenders and steering axle.
---@param schema any
---@param key any
function WheelSteering.registerXMLPaths(schema, key) end
