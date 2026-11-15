---@meta
-- FS25 1.25.1.0 : player/networking/PlayerNetworkComponent.lua (generated stub, FS25 Lua Atlas)

---@class PlayerNetworkComponent
PlayerNetworkComponent = {}

---@param player Player
---@param custom_mt table
---@return PlayerNetworkComponent
function PlayerNetworkComponent.new(player, custom_mt) end

---@param dt number
function PlayerNetworkComponent:update(dt) end

---@param dt number
function PlayerNetworkComponent:updateTick(dt) end

---@param streamId integer
---@param connection Connection
---@param dirtyMask integer
function PlayerNetworkComponent:writeUpdateStream(streamId, connection, dirtyMask) end

---@param streamId integer
---@param connection Connection
---@param timestamp integer
function PlayerNetworkComponent:readUpdateStream(streamId, connection, timestamp) end

---@param x number
---@param y number
---@param textSize number
---@return number
function PlayerNetworkComponent:debugDraw(x, y, textSize) end
