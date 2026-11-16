---@meta
-- FS25 1.25.1.0 : player/events/PlayerSwitchedFarmEvent.lua (generated stub, FS25 Lua Atlas)

--- Server-to-client notice that a user moved from one farm to another. Clients update the farm user lists and publish `PLAYER_FARM_CHANGED`. It is broadcast by `PlayerSetFarmEvent` on the server.
---@class PlayerSwitchedFarmEvent : Event
PlayerSwitchedFarmEvent = {}

--- Creates an empty event instance for stream reading. Note: this file defines no `new`, although `run` and `PlayerSetFarmEvent` call `PlayerSwitchedFarmEvent.new` (UNVERIFIED whether it is defined elsewhere).
---@return table
function PlayerSwitchedFarmEvent.emptyNew() end

--- Writes the new farm id, the old farm id and the user id.
---@param streamId integer
---@param connection table
function PlayerSwitchedFarmEvent:writeStream(streamId, connection) end

--- Reads new farm id, old farm id and user id, then runs the event.
---@param streamId integer
---@param connection table
function PlayerSwitchedFarmEvent:readStream(streamId, connection) end

--- Client: removes the user from the old farm and adds it to the new one (when valid and found), then publishes `PLAYER_FARM_CHANGED` for that user's player. Server: re-broadcasts to all clients. Note: the broadcast passes the ids in a different order than the constructor call in `PlayerSetFarmEvent`.
---@param connection table
function PlayerSwitchedFarmEvent:run(connection) end
