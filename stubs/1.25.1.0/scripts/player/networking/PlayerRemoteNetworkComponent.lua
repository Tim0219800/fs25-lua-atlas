---@meta
-- FS25 1.25.1.0 : player/networking/PlayerRemoteNetworkComponent.lua (generated stub, FS25 Lua Atlas)

---@class PlayerRemoteNetworkComponent : PlayerNetworkComponent
PlayerRemoteNetworkComponent = {}

---@param player Player
---@return PlayerRemoteNetworkComponent
function PlayerRemoteNetworkComponent.new(player) end

---@param streamId integer
---@param connection Connection
---@param timestamp integer
function PlayerRemoteNetworkComponent:readUpdateStream(streamId, connection, timestamp) end
