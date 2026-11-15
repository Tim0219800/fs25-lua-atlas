---@meta
-- FS25 1.25.1.0 : player/networking/PlayerRemoteNetworkComponent.lua (stub généré, atlas Lua FS25)

---@class PlayerRemoteNetworkComponent : PlayerNetworkComponent
PlayerRemoteNetworkComponent = {}

---@param player Player
---@return PlayerRemoteNetworkComponent
function PlayerRemoteNetworkComponent.new(player) end

---@param streamId integer
---@param connection Connection
---@param timestamp integer
function PlayerRemoteNetworkComponent:readUpdateStream(streamId, connection, timestamp) end
