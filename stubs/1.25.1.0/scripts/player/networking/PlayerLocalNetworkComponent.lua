---@meta
-- FS25 1.25.1.0 : player/networking/PlayerLocalNetworkComponent.lua (generated stub, FS25 Lua Atlas)

--- Client-side network component that exists only for the player controlled locally. It records per-tick movement history so that, when the server sends back an authoritative position, the client can replay the not-yet-acknowledged movement on top of it (reconciliation).
---@class PlayerLocalNetworkComponent : PlayerNetworkComponent
PlayerLocalNetworkComponent = {}

--- Constructor. Creates the component for the given player with an empty tick history and zeroed accumulated movement.
---@param player Player
---@return PlayerLocalNetworkComponent
function PlayerLocalNetworkComponent.new(player) end

--- Per-frame update. Opens a new history entry if a tick was requested (trimming the history to a maximum length), then accumulates the mover's position delta into both the outgoing total and the current entry.
---@param dt number
function PlayerLocalNetworkComponent:update(dt) end

--- Per-tick hook. It only flags that a new history entry must be created on the next frame update.
---@param dt number
function PlayerLocalNetworkComponent:updateTick(dt) end

--- Sends to the server the current tick index, the accumulated movement, compressed yaw, first-person flag and crouch flag, then resets the accumulated movement. Only valid for the owning player.
---@param streamId integer
---@param connection Connection
---@param dirtyMask integer
function PlayerLocalNetworkComponent:writeUpdateStream(streamId, connection, dirtyMask) end

--- Reads the server's answer (acknowledged tick, controlled/skip flags, authoritative position), sets the mover position, drops acknowledged history and re-applies the remaining history through the capsule controller, aggregated into about five steps.
---@param streamId integer
---@param connection Connection
---@param timestamp integer
function PlayerLocalNetworkComponent:readUpdateStream(streamId, connection, timestamp) end
