---@meta
-- FS25 1.25.1.0 : player/networking/PlayerRemoteNetworkComponent.lua (generated stub, FS25 Lua Atlas)

--- Client-side network component for players controlled by someone else. It reads the server's position, yaw and state flags and feeds them to the positional interpolator so the remote avatar moves smoothly.
---@class PlayerRemoteNetworkComponent : PlayerNetworkComponent
PlayerRemoteNetworkComponent = {}

--- Constructor. Creates the component for the given player.
---@param player Player
---@return PlayerRemoteNetworkComponent
function PlayerRemoteNetworkComponent.new(player) end

--- Reads controlled/skip flags, position, compressed yaw, grounded, first-person, crouch and visibility. Applies visibility and crouch state, sets the interpolator targets and starts a new network interpolation phase.
---@param streamId integer
---@param connection Connection
---@param timestamp integer
function PlayerRemoteNetworkComponent:readUpdateStream(streamId, connection, timestamp) end
