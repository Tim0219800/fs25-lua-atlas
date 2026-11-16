---@meta
-- FS25 1.25.1.0 : player/events/PlayerSetNicknameEvent.lua (generated stub, FS25 Lua Atlas)

--- Event that propagates a player's nickname change. Both server and client simply forward the data to `g_currentMission:setPlayerNickname`; the client side passes an extra flag, probably to avoid re-sending (UNVERIFIED, the function lives in a class missing from the dump).
---@class PlayerSetNicknameEvent : Event
PlayerSetNicknameEvent = {}

--- Creates an empty event instance for stream reading.
---@return table
function PlayerSetNicknameEvent.emptyNew() end

--- Builds the event with the player, new nickname and user id.
---@param player any
---@param nickname any
---@param userId any
function PlayerSetNicknameEvent.new(player, nickname, userId) end

--- Writes the player node object, the nickname string and the user id.
---@param streamId integer
---@param connection table
function PlayerSetNicknameEvent:writeStream(streamId, connection) end

--- Reads player, nickname and user id, then runs the event.
---@param streamId integer
---@param connection table
function PlayerSetNicknameEvent:readStream(streamId, connection) end

--- Calls `g_currentMission:setPlayerNickname` with the data; on the client a fourth argument `true` is added. Its further effects are UNVERIFIED.
---@param connection table
function PlayerSetNicknameEvent:run(connection) end
