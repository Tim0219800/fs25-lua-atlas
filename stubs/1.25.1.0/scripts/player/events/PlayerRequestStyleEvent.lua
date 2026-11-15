---@meta
-- FS25 1.25.1.0 : player/events/PlayerRequestStyleEvent.lua (stub généré, atlas Lua FS25)

---@class PlayerRequestStyleEvent : Event
PlayerRequestStyleEvent = {}

---@return table
function PlayerRequestStyleEvent.emptyNew() end

---@param playerObjectId any
function PlayerRequestStyleEvent.new(playerObjectId) end

---@param streamId integer
---@param connection table
function PlayerRequestStyleEvent:writeStream(streamId, connection) end

---@param streamId integer
---@param connection table
function PlayerRequestStyleEvent:readStream(streamId, connection) end

---@param connection table
function PlayerRequestStyleEvent:run(connection) end
