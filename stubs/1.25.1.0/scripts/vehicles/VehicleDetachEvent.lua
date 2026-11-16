---@meta
-- FS25 1.25.1.0 : vehicles/VehicleDetachEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event announcing that an implement was detached from a vehicle. Unlike most events here, the work is done directly in `readStream`; `run` is empty. The flag passed to `detachImplementByObject` differs depending on whether the sender is the server.
---@class VehicleDetachEvent : Event
VehicleDetachEvent = {}

--- Creates an empty event instance for stream deserialization.
---@return table
function VehicleDetachEvent.emptyNew() end

--- Builds the event from the vehicle and the implement to detach.
---@param vehicle table
---@param implement table
---@return table
function VehicleDetachEvent.new(vehicle, implement) end

--- Reads vehicle and implement, then, if the vehicle is synchronized, calls `detachImplementByObject`; passes `true` as second argument only when the sender is the server.
---@param streamId integer
---@param connection Connection
function VehicleDetachEvent:readStream(streamId, connection) end

--- Writes the vehicle and implement node objects to the stream.
---@param streamId integer
---@param connection Connection
function VehicleDetachEvent:writeStream(streamId, connection) end

--- Empty: all processing is done in `readStream`.
---@param connection any
function VehicleDetachEvent:run(connection) end
