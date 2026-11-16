---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/WaterTrailerSetIsFillingEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes whether a water trailer is currently filling, between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class WaterTrailerSetIsFillingEvent : Event
WaterTrailerSetIsFillingEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function WaterTrailerSetIsFillingEvent.emptyNew() end

--- Builds the event with the data to send (a node object and a boolean filling flag); stored on the instance for `writeStream`.
---@param vehicle table
---@param isFilling boolean
function WaterTrailerSetIsFillingEvent.new(vehicle, isFilling) end

--- Reads a node object and a boolean filling flag from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function WaterTrailerSetIsFillingEvent:readStream(streamId, connection) end

--- Writes a node object and a boolean filling flag to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function WaterTrailerSetIsFillingEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: on the server re-broadcasts itself, then calls `setIsWaterTrailerFilling(flag, true)` on the vehicle if synchronized.
---@param connection Connection
function WaterTrailerSetIsFillingEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param vehicle table
---@param isFilling boolean
---@param noEventSend boolean
function WaterTrailerSetIsFillingEvent.sendEvent(vehicle, isFilling, noEventSend) end
