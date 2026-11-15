---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AIAutomaticSteeringStateEvent.lua (generated stub, FS25 Lua Atlas)

---@class AIAutomaticSteeringStateEvent : Event
AIAutomaticSteeringStateEvent = {}

---@return table
function AIAutomaticSteeringStateEvent.emptyNew() end

---@param vehicle table
---@param state integer
---@param segmentIndex any
---@param segmentIsLeft any
function AIAutomaticSteeringStateEvent.new(vehicle, state, segmentIndex, segmentIsLeft) end

---@param streamId integer
---@param connection Connection
function AIAutomaticSteeringStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AIAutomaticSteeringStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function AIAutomaticSteeringStateEvent:run(connection) end

---@param vehicle table
---@param state integer
---@param segmentIndex boolean
---@param segmentIsLeft any
---@param noEventSend boolean
function AIAutomaticSteeringStateEvent.sendEvent(vehicle, state, segmentIndex, segmentIsLeft, noEventSend) end
