---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/WearableRepairEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event requesting a repair of a wearable vehicle, optionally flagged as done at a selling point. The server re-broadcasts it for UI updates and VEHICLE_REPAIRED is published. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class WearableRepairEvent : Event
WearableRepairEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function WearableRepairEvent.emptyNew() end

--- Builds the event with the data to send (a node object and a boolean 'at selling point' flag); stored on the instance for `writeStream`.
---@param vehicle table
---@param atSellingPoint any
function WearableRepairEvent.new(vehicle, atSellingPoint) end

--- Reads a node object and a boolean 'at selling point' flag from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function WearableRepairEvent:readStream(streamId, connection) end

--- Writes a node object and a boolean 'at selling point' flag to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function WearableRepairEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: calls `repairVehicle(atSellingPoint)` if the vehicle has it; on the server it re-broadcasts the event, and it publishes MessageType.VEHICLE_REPAIRED with the flag.
---@param connection Connection
function WearableRepairEvent:run(connection) end
