---@meta
-- FS25 1.25.1.0 : player/stateMachine/PlayerStateFall.lua (generated stub, FS25 Lua Atlas)

--- On-foot player state for being airborne long enough to count as falling, and not submerged. Constants such as the thresholds and speeds are defined outside the dump (UNVERIFIED values).
---@class PlayerStateFall : BaseStateMachineState
PlayerStateFall = {}

--- Creates the falling state for the given player and state machine.
---@param player Player
---@param stateMachine StateMachine
---@return BaseStateMachineState
function PlayerStateFall.new(player, stateMachine) end

--- True if the player is not submerged and the mover's current fall time has reached the fall threshold.
---@return boolean
function PlayerStateFall:calculateIfFalling() end

--- True if the distance to the ground is within the landing distance.
---@return boolean
function PlayerStateFall:calculateIfLanding() end

--- Each frame, asks the state machine to determine a new state unless this state is forced by calculateIfShouldBeForced (defined in the base class, not in the dump).
---@param dt number
function PlayerStateFall:updateAsCurrent(dt) end

--- Returns the air control velocity: input direction times the fall maximum speed, scaled by the super speed factor when the super speed command is on.
---@param directionX number
---@param directionZ number
---@return number
---@return number
function PlayerStateFall:calculateDesiredHorizontalVelocity(directionX, directionZ) end
