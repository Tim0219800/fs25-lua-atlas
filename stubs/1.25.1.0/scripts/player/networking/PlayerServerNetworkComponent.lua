---@meta
-- FS25 1.25.1.0 : player/networking/PlayerServerNetworkComponent.lua (stub généré, atlas Lua FS25)

---@class PlayerServerNetworkComponent : PlayerNetworkComponent
PlayerServerNetworkComponent = {}

---@param player Player
---@return PlayerServerNetworkComponent
function PlayerServerNetworkComponent.new(player) end

---@param dt number
function PlayerServerNetworkComponent:update(dt) end

---@param dt number
function PlayerServerNetworkComponent:updateTick(dt) end

---@param streamId integer
---@param connection Connection
---@param dirtyMask integer
function PlayerServerNetworkComponent:writeUpdateStream(streamId, connection, dirtyMask) end

---@param streamId integer
---@param connection Connection
---@param timestamp integer
function PlayerServerNetworkComponent:readUpdateStream(streamId, connection, timestamp) end
