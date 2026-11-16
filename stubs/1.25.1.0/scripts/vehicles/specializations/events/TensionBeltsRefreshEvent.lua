---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TensionBeltsRefreshEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event asking all peers to recompute the tension belts of a vehicle; it carries no data beyond the vehicle. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class TensionBeltsRefreshEvent : Event
TensionBeltsRefreshEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function TensionBeltsRefreshEvent.emptyNew() end

--- Builds the event with the data to send (only the node object); stored on the instance for `writeStream`.
---@param object table
function TensionBeltsRefreshEvent.new(object) end

--- Reads only the node object from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function TensionBeltsRefreshEvent:readStream(streamId, connection) end

--- Writes only the node object to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function TensionBeltsRefreshEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: on the server re-broadcasts itself, then calls `refreshTensionBelts()` on the object if synchronized.
---@param connection Connection
function TensionBeltsRefreshEvent:run(connection) end
