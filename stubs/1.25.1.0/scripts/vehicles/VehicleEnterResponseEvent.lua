---@meta
-- FS25 1.25.1.0 : vehicles/VehicleEnterResponseEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event sent by the server in answer to a vehicle enter request. It tells every machine which user entered which vehicle, with the player style, farm id and an `isOwner` flag. On receipt it calls `onEnterVehicle` on the matching player. Sent on the main channel.
---@class VehicleEnterResponseEvent : Event
VehicleEnterResponseEvent = {}

--- Creates an empty event instance on the main network channel.
---@return table
function VehicleEnterResponseEvent.emptyNew() end

--- Builds the response from vehicle object id, `isOwner`, `playerStyle`, `farmId` and `userId`.
---@param id table
---@param isOwner boolean
---@param playerStyle table
---@param farmId integer
---@param userId integer
---@return VehicleEnterResponseEvent
function VehicleEnterResponseEvent.new(id, isOwner, playerStyle, farmId, userId) end

--- Reads object id, owner flag, player style (creating a `PlayerStyle` if needed), farm id and user id, then calls `run`.
---@param streamId integer
---@param connection Connection
function VehicleEnterResponseEvent:readStream(streamId, connection) end

--- Writes object id, owner flag, player style, farm id and user id to the stream.
---@param streamId integer
---@param connection Connection
function VehicleEnterResponseEvent:writeStream(streamId, connection) end

--- Looks up the vehicle and the player by user id; skips with a dev warning if either is missing or the vehicle is unsynchronized. Otherwise calls `player:onEnterVehicle(vehicle)`. The `isOwner` flag is not used here.
---@param connection Connection
function VehicleEnterResponseEvent:run(connection) end
