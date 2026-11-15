---@meta
-- FS25 1.25.1.0 : player/networking/PlayerLocalNetworkComponent.lua (stub généré, atlas Lua FS25)

---@class PlayerLocalNetworkComponent : PlayerNetworkComponent
PlayerLocalNetworkComponent = {}

---@param player Player
---@return PlayerLocalNetworkComponent
function PlayerLocalNetworkComponent.new(player) end

---@param dt number
function PlayerLocalNetworkComponent:update(dt) end

---@param dt number
function PlayerLocalNetworkComponent:updateTick(dt) end

---@param streamId integer
---@param connection Connection
---@param dirtyMask integer
function PlayerLocalNetworkComponent:writeUpdateStream(streamId, connection, dirtyMask) end

---@param streamId integer
---@param connection Connection
---@param timestamp integer
function PlayerLocalNetworkComponent:readUpdateStream(streamId, connection, timestamp) end
