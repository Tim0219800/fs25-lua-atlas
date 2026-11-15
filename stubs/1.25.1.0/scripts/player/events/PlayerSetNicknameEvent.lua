---@meta
-- FS25 1.25.1.0 : player/events/PlayerSetNicknameEvent.lua (generated stub, FS25 Lua Atlas)

---@class PlayerSetNicknameEvent : Event
PlayerSetNicknameEvent = {}

---@return table
function PlayerSetNicknameEvent.emptyNew() end

---@param player any
---@param nickname any
---@param userId any
function PlayerSetNicknameEvent.new(player, nickname, userId) end

---@param streamId integer
---@param connection table
function PlayerSetNicknameEvent:writeStream(streamId, connection) end

---@param streamId integer
---@param connection table
function PlayerSetNicknameEvent:readStream(streamId, connection) end

---@param connection table
function PlayerSetNicknameEvent:run(connection) end
