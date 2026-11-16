---@meta
-- FS25 1.25.1.0 : ai/parameters/AIParameterPositionAngle.lua (generated stub, FS25 Lua Atlas)

--- AI job parameter that stores a map position plus a heading angle (radians). It extends AIParameterPosition, adds XML and network persistence of the angle, and snaps the angle to a configurable step. Validation requires an angle in addition to the position checks of the parent.
---@class AIParameterPositionAngle : AIParameterPosition
AIParameterPositionAngle = {}

--- Creates the parameter with type POSITION_ANGLE, no angle yet, and a snapping step (absolute value of the argument, default 5 degrees in radians).
---@param snappingAngle any
---@param customMt any
function AIParameterPositionAngle.new(snappingAngle, customMt) end

--- Calls the parent save, then writes the angle to the `#angle` attribute of the key if one is set.
---@param xmlFile any
---@param key any
---@param usedModNames any
function AIParameterPositionAngle:saveToXMLFile(xmlFile, key, usedModNames) end

--- Calls the parent load, then reads `#angle` from the key, keeping the current value if the attribute is absent.
---@param xmlFile any
---@param key any
function AIParameterPositionAngle:loadFromXMLFile(xmlFile, key) end

--- Reads the parent data, then an optional angle sent as a 9-bit integer in degrees, converted to radians via setAngle.
---@param streamId any
---@param connection any
function AIParameterPositionAngle:readStream(streamId, connection) end

--- Writes the parent data, then a presence flag and the angle converted to degrees as a 9-bit integer. Precision is limited to whole degrees (UNVERIFIED rounding in the engine write call).
---@param streamId any
---@param connection any
function AIParameterPositionAngle:writeStream(streamId, connection) end

--- Normalizes the angle to the range 0 to 2 pi, then rounds it to the nearest multiple of the snapping step when that step is above zero, and stores it.
---@param angleRad any
function AIParameterPositionAngle:setAngle(angleRad) end

--- Returns the stored angle in radians, or nil if none was set.
function AIParameterPositionAngle:getAngle() end

--- Returns the x and z components of the unit direction for the stored angle (via MathUtil), or nil, nil when no angle is set.
function AIParameterPositionAngle:getDirection() end

--- Sets the snapping step in radians, stored as an absolute value. It does not re-snap an angle already stored.
---@param angle any
function AIParameterPositionAngle:setSnappingAngle(angle) end

--- Returns the current snapping step in radians.
function AIParameterPositionAngle:getSnappingAngle() end

--- Builds a display string with the x and z coordinates and the angle in degrees. Note: it formats the angle unconditionally, so it errors if no angle is set.
function AIParameterPositionAngle:getString() end

--- Runs the parent validation first, then fails with the localized no-angle message if the angle is nil. Returns a boolean and an optional error text.
---@param fillTypeIndex any
---@param farmId any
function AIParameterPositionAngle:validate(fillTypeIndex, farmId) end
