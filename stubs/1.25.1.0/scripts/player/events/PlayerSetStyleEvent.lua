---@meta
-- FS25 1.25.1.0 : player/events/PlayerSetStyleEvent.lua (stub généré, atlas Lua FS25)

---@class PlayerSetStyleEvent : Event
PlayerSetStyleEvent = {}

---@return table
function PlayerSetStyleEvent.emptyNew() end

---@param player any
---@param style any
---@param playerObjectId any
function PlayerSetStyleEvent.new(player, style, playerObjectId) end

---@param streamId integer
---@param connection table
function PlayerSetStyleEvent:writeStream(streamId, connection) end

---@param streamId integer
---@param connection table
function PlayerSetStyleEvent:readStream(streamId, connection) end

---@param connection table
function PlayerSetStyleEvent:run(connection) end

---@param player Player
---@param style PlayerStyle
---@param playerObjectId integer?
---@param noEventSend boolean?
function PlayerSetStyleEvent.sendEvent(player, style, playerObjectId, noEventSend) end
