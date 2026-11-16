---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/VehicleSetBeaconLightEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the beacon light visibility of a vehicle between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class VehicleSetBeaconLightEvent : Event
VehicleSetBeaconLightEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function VehicleSetBeaconLightEvent.emptyNew() end

--- Builds the event with the data to send (a node object and a boolean active flag); stored on the instance for `writeStream`.
---@param object table
---@param active boolean
function VehicleSetBeaconLightEvent.new(object, active) end

--- Reads a node object and a boolean active flag from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function VehicleSetBeaconLightEvent:readStream(streamId, connection) end

--- Writes a node object and a boolean active flag to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function VehicleSetBeaconLightEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: calls `setBeaconLightsVisibility(active, true, true)` on the object if synchronized, then the server re-broadcasts to the other clients.
---@param connection Connection
function VehicleSetBeaconLightEvent:run(connection) end
