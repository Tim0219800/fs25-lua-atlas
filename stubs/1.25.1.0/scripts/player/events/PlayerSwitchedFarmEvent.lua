---@meta
-- FS25 1.25.1.0 : player/events/PlayerSwitchedFarmEvent.lua (stub généré, atlas Lua FS25)

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
