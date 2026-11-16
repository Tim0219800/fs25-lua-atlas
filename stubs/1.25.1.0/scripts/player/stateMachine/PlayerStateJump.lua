---@meta
-- FS25 1.25.1.0 : player/stateMachine/PlayerStateJump.lua (generated stub, FS25 Lua Atlas)

--- On-foot player state for being airborne after a jump, before it counts as falling. It tracks time jumping and time spent descending and hands over to the falling state. Constants such as the thresholds and speeds are defined outside the dump (UNVERIFIED values).
---@class PlayerStateJump : BaseStateMachineState
PlayerStateJump = {}

--- Creates the state with the time-jumping and time-falling-down timers at zero.
---@param player Player
---@param stateMachine StateMachine
---@return BaseStateMachineState
function PlayerStateJump.new(player, stateMachine) end

--- Adds the transition from jumping to falling.
function PlayerStateJump:createTransitions() end

--- True once the time spent descending has reached this state's own fall threshold, so the rising part of a jump never counts as a fall.
---@return boolean
function PlayerStateJump:calculateIfFalling() end

--- Owner: true if jump input times the jump multiplier is positive and the player has been grounded long enough. Others: true on upward vertical velocity with the same ground-time condition.
---@return boolean
function PlayerStateJump:calculateIfJumping() end

--- True while jump time is within the take-off threshold and vertical velocity is still upward.
---@return boolean
function PlayerStateJump:calculateIfTakingOff() end

--- True when the ground distance is within the landing distance and the player is no longer taking off.
---@return boolean
function PlayerStateJump:calculateIfLanding() end

--- Sets the mover's vertical velocity to the jump up-force times the player's jump multiplier and resets the timers.
---@param previousState PlayerStateBase
function PlayerStateJump:onStateEntered(previousState) end

--- Clears the mover's current up force and resets the timers.
---@param previousState BaseStateMachineState
function PlayerStateJump:onStateExited(previousState) end

--- Zeroes the descending-time and jump-time timers.
function PlayerStateJump:resetTimers() end

--- Accumulates jump time and, while moving downward, descent time (both in seconds). Re-determines the state once grounded and past take-off; otherwise tries the valid transitions.
---@param dt number
function PlayerStateJump:updateAsCurrent(dt) end

--- Returns the horizontal velocity in m/s: input direction times a smoothed speed up to the jump maximum, scaled by the super speed factor when that command is on.
---@param directionX number
---@param directionZ number
---@return number
---@return number
function PlayerStateJump:calculateDesiredHorizontalVelocity(directionX, directionZ) end
