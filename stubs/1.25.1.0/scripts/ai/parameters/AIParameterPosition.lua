---@meta
-- FS25 1.25.1.0 : ai/parameters/AIParameterPosition.lua (generated stub, FS25 Lua Atlas)

--- AI job parameter holding a 2D world position (x, z). It is saved as XML float attributes, streamed as two float32 values, and validated against the AI system's reachability check. `AIParameterPositionAngle` extends it with a heading.
---@class AIParameterPosition : AIParameter
AIParameterPosition = {}

--- Creates the parameter with type POSITION and no position.
---@param customMt any
function AIParameterPosition.new(customMt) end

--- Writes `#x` and `#z` when a position is set.
---@param xmlFile any
---@param key any
---@param usedModNames any
function AIParameterPosition:saveToXMLFile(xmlFile, key, usedModNames) end

--- Reads `#x` and `#z`, keeping current values if absent.
---@param xmlFile any
---@param key any
function AIParameterPosition:loadFromXMLFile(xmlFile, key) end

--- Reads a presence flag and, if set, x and z as float32.
---@param streamId any
---@param connection any
function AIParameterPosition:readStream(streamId, connection) end

--- Writes a presence flag and, if a position is set, x and z as float32.
---@param streamId any
---@param connection any
function AIParameterPosition:writeStream(streamId, connection) end

--- Stores the x and z world coordinates.
---@param x any
---@param z any
function AIParameterPosition:setPosition(x, z) end

--- Returns x and z, both nil when unset.
function AIParameterPosition:getPosition() end

--- Returns the position formatted as "< x , z >" with one decimal. It errors if the position is nil (no nil check).
function AIParameterPosition:getString() end

--- Returns false with a localized error if the position is missing or `aiSystem:getIsPositionReachable(x, 0, z)` says it is blocked; otherwise true and nil. That AI system method is not in this file (UNVERIFIED).
function AIParameterPosition:validate() end
