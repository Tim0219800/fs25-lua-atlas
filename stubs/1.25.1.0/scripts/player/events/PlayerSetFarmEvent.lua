---@meta
-- FS25 1.25.1.0 : player/events/PlayerSetFarmEvent.lua (generated stub, FS25 Lua Atlas)

---@class PlayerSetFarmEvent : Event
PlayerSetFarmEvent = {}

---@return table
function PlayerSetFarmEvent.emptyNew() end

---@param player table
---@param farmId integer
---@param password any
---@return table
function PlayerSetFarmEvent.new(player, farmId, password) end

---@param streamId integer
---@param connection table
function PlayerSetFarmEvent:writeStream(streamId, connection) end

---@param streamId integer
---@param connection table
function PlayerSetFarmEvent:readStream(streamId, connection) end

---@param connection table
function PlayerSetFarmEvent:run(connection) end

---@param player table
---@param farmId integer
---@param noEventSend boolean?
function PlayerSetFarmEvent.sendEvent(player, farmId, noEventSend) end
