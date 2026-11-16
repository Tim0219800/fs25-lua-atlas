---@meta
-- FS25 1.25.1.0 : player/networking/PlayerPositionalInterpolator.lua (generated stub, FS25 Lua Atlas)

--- Smooths the player's position, yaw, speed and velocity between network or physics updates using time, position, angle and value interpolators. It can drive either the player's root node (mover) or only a graphical node whose interpolated position is queried by others. Some methods used here (such as startNetworkNewPhase and setTargetPhysicsIndex) are absent from the dump.
---@class PlayerPositionalInterpolator
PlayerPositionalInterpolator = {}

--- Creates the interpolator for a player and a target node type (root or graphical), initialised on the player's current position, yaw, speed and vertical velocity. Registers a listener on the mover's teleport event.
---@param player Player
---@param targetNodeType integer
---@return PlayerPositionalInterpolator
function PlayerPositionalInterpolator.new(player, targetNodeType) end

--- Per-frame step: advances the time interpolator with the unclamped physics delta, computes interpolated position, yaw, speed (output x1000) and velocity. In root-node mode it also pushes them into the player's mover.
---@param dt number
function PlayerPositionalInterpolator:update(dt) end

--- Per-tick step, graphical-node mode only: takes the mover position as new target (snapping to the old target when within 0.001), starts a new 75 ms phase and updates the target yaw. For non-owners it waits for the physics index to be simulated.
---@param dt number
function PlayerPositionalInterpolator:updateTick(dt) end

--- Sets the position the interpolator moves toward.
---@param targetPositionX number
---@param targetPositionY number
---@param targetPositionZ number
function PlayerPositionalInterpolator:setTargetPosition(targetPositionX, targetPositionY, targetPositionZ) end

--- Returns the last computed interpolated x, y, z position.
---@return number
---@return number
---@return number
function PlayerPositionalInterpolator:getInterpolatedPosition() end

--- Sets the target yaw, first clamped to a valid angle range with MathUtil.getValidLimit.
---@param targetYaw number
function PlayerPositionalInterpolator:setTargetYaw(targetYaw) end
