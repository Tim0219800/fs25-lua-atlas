---@meta
-- FS25 1.25.1.0 : player/events/PlayerSwitchedFarmEvent.lua (generated stub, FS25 Lua Atlas)

---@class PlayerSwitchedFarmEvent : Event
PlayerSwitchedFarmEvent = {}

---@return table
function PlayerSwitchedFarmEvent.emptyNew() end

---@param streamId integer
---@param connection table
function PlayerSwitchedFarmEvent:writeStream(streamId, connection) end

---@param streamId integer
---@param connection table
function PlayerSwitchedFarmEvent:readStream(streamId, connection) end

---@param connection table
function PlayerSwitchedFarmEvent:run(connection) end
