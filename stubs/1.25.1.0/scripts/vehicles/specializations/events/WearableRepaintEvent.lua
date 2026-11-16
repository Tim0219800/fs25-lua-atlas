---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/WearableRepaintEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event requesting a repaint of a wearable vehicle. After repainting, the server re-broadcasts it so clients refresh their UI, and the VEHICLE_REPAINTED message is published. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class WearableRepaintEvent : Event
WearableRepaintEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function WearableRepaintEvent.emptyNew() end

--- Builds the event with the data to send (only the vehicle node object); stored on the instance for `writeStream`.
---@param vehicle table
function WearableRepaintEvent.new(vehicle) end

--- Reads only the vehicle node object from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function WearableRepaintEvent:readStream(streamId, connection) end

--- Writes only the vehicle node object to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function WearableRepaintEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: calls `repaintVehicle()` if the vehicle has it; on the server it re-broadcasts the event, and it publishes MessageType.VEHICLE_REPAINTED on the message center.
---@param connection Connection
function WearableRepaintEvent:run(connection) end
