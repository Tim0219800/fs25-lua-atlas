---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AIAutomaticSteeringLineEndEvent.lua (generated stub, FS25 Lua Atlas)

---@class AIAutomaticSteeringLineEndEvent : Event
AIAutomaticSteeringLineEndEvent = {}

---@return table
function AIAutomaticSteeringLineEndEvent.emptyNew() end

---@param vehicle table
---@param state integer
---@param segmentIndex any
---@param segmentIsLeft any
function AIAutomaticSteeringLineEndEvent.new(vehicle, state, segmentIndex, segmentIsLeft) end

---@param streamId integer
---@param connection Connection
function AIAutomaticSteeringLineEndEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AIAutomaticSteeringLineEndEvent:writeStream(streamId, connection) end

---@param connection Connection
function AIAutomaticSteeringLineEndEvent:run(connection) end
