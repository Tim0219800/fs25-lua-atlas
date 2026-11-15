---@meta
-- FS25 1.25.1.0 : player/events/PlayerHoldHandToolEvent.lua (stub généré, atlas Lua FS25)

---@class PlayerHoldHandToolEvent : Event
PlayerHoldHandToolEvent = {}

---@return table
function PlayerHoldHandToolEvent.emptyNew() end

---@param player any
---@param handToolId any
---@param isHolding any
function PlayerHoldHandToolEvent.new(player, handToolId, isHolding) end

---@param streamId integer
---@param connection Connection
function PlayerHoldHandToolEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlayerHoldHandToolEvent:writeStream(streamId, connection) end

---@param connection Connection
function PlayerHoldHandToolEvent:run(connection) end

---@param player table
---@param handToolId integer
---@param noEventSend boolean
function PlayerHoldHandToolEvent.sendEvent(player, handToolId, noEventSend) end
