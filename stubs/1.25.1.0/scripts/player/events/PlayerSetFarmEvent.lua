---@meta
-- FS25 1.25.1.0 : player/events/PlayerSetFarmEvent.lua (generated stub, FS25 Lua Atlas)

--- Event used to change the farm a player belongs to. A client sends it to the server, which checks the farm password (master users bypass it), updates the player and farm user lists, and answers with `PlayerSetFarmAnswerEvent` and a `PlayerSwitchedFarmEvent` broadcast.
---@class PlayerSetFarmEvent : Event
PlayerSetFarmEvent = {}

--- Creates an empty event instance for stream reading.
---@return table
function PlayerSetFarmEvent.emptyNew() end

--- Builds the event with the player, target farm id and optional password.
---@param player table
---@param farmId integer
---@param password any
---@return table
function PlayerSetFarmEvent.new(player, farmId, password) end

--- Writes the player node object, the farm id, and an optional password behind a boolean flag.
---@param streamId integer
---@param connection table
function PlayerSetFarmEvent:writeStream(streamId, connection) end

--- Reads player, farm id and optional password, then runs the event.
---@param streamId integer
---@param connection table
function PlayerSetFarmEvent:readStream(streamId, connection) end

--- Server: if the farm exists and the user is a master user or the password matches (or is unset), moves the user, updates the hotspot owner, publishes `PLAYER_FARM_CHANGED`, resets the finance counter and replies OK; otherwise replies PASSWORD_REQUIRED. Client: applies the farm id locally and publishes the message. Note: the server does not nil-check the old farm.
---@param connection table
function PlayerSetFarmEvent:run(connection) end

--- Unless `noEventSend` is true, the server broadcasts the event (excluding the player's own connection) and a client sends it to the server. No password argument is passed here.
---@param player table
---@param farmId integer
---@param noEventSend boolean?
function PlayerSetFarmEvent.sendEvent(player, farmId, noEventSend) end
