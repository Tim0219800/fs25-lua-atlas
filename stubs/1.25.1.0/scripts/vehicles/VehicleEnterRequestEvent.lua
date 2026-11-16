---@meta
-- FS25 1.25.1.0 : vehicles/VehicleEnterRequestEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event a client sends to the server to ask to enter a vehicle, with the player style, farm id and a force flag. The server validates the request, records the controller (owner connection, farm, user) and answers with `VehicleEnterResponseEvent`. Sent on the main channel.
---@class VehicleEnterRequestEvent : Event
VehicleEnterRequestEvent = {}

--- Creates an empty event instance on the main network channel.
---@return table
function VehicleEnterRequestEvent.emptyNew() end

--- Builds the request from vehicle, `playerStyle`, `farmId` and optional `force` (defaults to false); also stores the vehicle's network object id.
---@param object table
---@param playerStyle table
---@param farmId integer
---@param force boolean?
---@return VehicleEnterRequestEvent
function VehicleEnterRequestEvent.new(object, playerStyle, farmId, force) end

--- Writes the vehicle object id, the farm id, the player style and the force flag.
---@param streamId integer
---@param connection Connection
function VehicleEnterRequestEvent:writeStream(streamId, connection) end

--- Reads object id, farm id, player style (creating a `PlayerStyle` if needed) and force flag, resolves the vehicle and calls `run`.
---@param streamId integer
---@param connection Connection
function VehicleEnterRequestEvent:readStream(streamId, connection) end

--- Server side: ignores the request if the vehicle is unsynchronized, not yet a ghost object for that connection (unless forced), lacks `spec_enterable` or is already controlled. Otherwise sets owner connection, farm and user, then sends `VehicleEnterResponseEvent` to the requester (owner) and broadcasts one to the others.
---@param connection Connection
function VehicleEnterRequestEvent:run(connection) end
