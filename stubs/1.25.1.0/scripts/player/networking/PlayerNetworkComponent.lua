---@meta
-- FS25 1.25.1.0 : player/networking/PlayerNetworkComponent.lua (generated stub, FS25 Lua Atlas)

--- Abstract base class for the player's network components. It stores the owning player and declares empty hooks (update, updateTick, stream read/write, debugDraw) that the local, remote and server subclasses override.
---@class PlayerNetworkComponent
PlayerNetworkComponent = {}

--- Creates an instance with the given metatable and owning player. Meant to be called only by subclass constructors.
---@param player Player
---@param custom_mt table
---@return PlayerNetworkComponent
function PlayerNetworkComponent.new(player, custom_mt) end

--- Empty per-frame hook, overridden by subclasses.
---@param dt number
function PlayerNetworkComponent:update(dt) end

--- Empty per-tick hook, overridden by subclasses.
---@param dt number
function PlayerNetworkComponent:updateTick(dt) end

--- Empty hook that subclasses override to write their state to the outgoing stream.
---@param streamId integer
---@param connection Connection
---@param dirtyMask integer
function PlayerNetworkComponent:writeUpdateStream(streamId, connection, dirtyMask) end

--- Empty hook that subclasses override to read their state from the incoming stream.
---@param streamId integer
---@param connection Connection
---@param timestamp integer
function PlayerNetworkComponent:readUpdateStream(streamId, connection, timestamp) end

--- Debug hook that draws nothing and returns the unchanged y position; subclasses may override it.
---@param x number
---@param y number
---@param textSize number
---@return number
function PlayerNetworkComponent:debugDraw(x, y, textSize) end
