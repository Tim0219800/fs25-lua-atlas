---@meta
-- FS25 1.25.1.0 : vehicles/VehicleLeaveEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event signalling that a user left a vehicle. Clients send it to the server, which clears the owner connection and controller farm and rebroadcasts it; every machine then calls `leaveVehicle` on the matching player. `sendEvent` is the entry point used by game code. Main channel.
---@class VehicleLeaveEvent : Event
VehicleLeaveEvent = {}

--- Creates an empty event instance on the main network channel.
---@return table
function VehicleLeaveEvent.emptyNew() end

--- Builds the event from the vehicle and the id of the user leaving it.
---@param vehicle table
---@param userId any
---@return table
function VehicleLeaveEvent.new(vehicle, userId) end

--- Reads the vehicle object and the user id from the stream, then calls `run`.
---@param streamId integer
---@param connection Connection
function VehicleLeaveEvent:readStream(streamId, connection) end

--- Writes the vehicle object and the user id to the stream.
---@param streamId integer
---@param connection Connection
function VehicleLeaveEvent:writeStream(streamId, connection) end

--- Ignored if the vehicle is missing or unsynchronized. On the server it resets owner connection and `controllerFarmId` and rebroadcasts to other clients. Everywhere it calls `leaveVehicle(vehicle, true)` on the player found by user id.
---@param connection Connection
function VehicleLeaveEvent:run(connection) end

--- Static helper: unless `noEventSend` is true, the server broadcasts the event to clients and a client sends it to the server connection.
---@param vehicle any
---@param userId any
---@param noEventSend any
function VehicleLeaveEvent.sendEvent(vehicle, userId, noEventSend) end
