---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/VehiclePlayerStyleChangedEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event used to synchronize the player style (character look) displayed in a vehicle. The data is applied directly while reading, so `run` is empty. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class VehiclePlayerStyleChangedEvent : Event
VehiclePlayerStyleChangedEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function VehiclePlayerStyleChangedEvent.emptyNew() end

--- Builds the event with the data to send (a node object followed by a serialized PlayerStyle); stored on the instance for `writeStream`.
---@param vehicle table
---@param playerStyle table
---@return table
function VehiclePlayerStyleChangedEvent.new(vehicle, playerStyle) end

--- Reads a node object followed by a serialized PlayerStyle from the stream and applies it directly when the object is synchronized; does not call `run`.
---@param streamId integer
---@param connection Connection
function VehiclePlayerStyleChangedEvent:readStream(streamId, connection) end

--- Writes a node object followed by a serialized PlayerStyle to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function VehiclePlayerStyleChangedEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: empty; the work is done in `readStream`.
---@param connection Connection
function VehiclePlayerStyleChangedEvent:run(connection) end
