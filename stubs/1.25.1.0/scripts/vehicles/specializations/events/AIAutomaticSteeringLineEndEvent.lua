---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AIAutomaticSteeringLineEndEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that tells peers a vehicle reached the end of an automatic-steering line, by raising `onAIAutomaticSteeringLineEnd` on the vehicle. It carries only the vehicle reference.
---@class AIAutomaticSteeringLineEndEvent : Event
AIAutomaticSteeringLineEndEvent = {}

--- Creates an empty event instance with the class metatable; used by the network layer before `readStream` fills it.
---@return table
function AIAutomaticSteeringLineEndEvent.emptyNew() end

--- Creates the event for a vehicle. Note: the extra parameters (state, segmentIndex, segmentIsLeft) are accepted but ignored.
---@param vehicle table
---@param state integer
---@param segmentIndex any
---@param segmentIsLeft any
function AIAutomaticSteeringLineEndEvent.new(vehicle, state, segmentIndex, segmentIsLeft) end

--- Reads the vehicle reference and immediately calls `run`.
---@param streamId integer
---@param connection Connection
function AIAutomaticSteeringLineEndEvent:readStream(streamId, connection) end

--- Writes only the vehicle reference.
---@param streamId integer
---@param connection Connection
function AIAutomaticSteeringLineEndEvent:writeStream(streamId, connection) end

--- If the vehicle is synchronized, raises the specialization event `onAIAutomaticSteeringLineEnd` on it. No rebroadcast here.
---@param connection Connection
function AIAutomaticSteeringLineEndEvent:run(connection) end
