---@meta
-- FS25 1.25.1.0 : player/stateMachine/PlayerStateCrouch.lua (generated stub, FS25 Lua Atlas)

--- On-foot player state active while the crouch input is held. It lowers the capsule, applies a smoothed camera offset and limits the move speed. Constants such as the thresholds and speeds are defined outside the dump (UNVERIFIED values).
---@class PlayerStateCrouch : BaseStateMachineState
PlayerStateCrouch = {}

--- Creates the state with a zero camera offset, crouch timer and transition timer.
---@param player Player
---@param stateMachine StateMachine
---@return BaseStateMachineState
function PlayerStateCrouch.new(player, stateMachine) end

--- Adds transitions from crouching to idle, walking and jumping, using those states' check functions.
function PlayerStateCrouch:createTransitions() end

--- True if the player is crouching, grounded and not submerged enough to swim. Used to pick this state after a forced state or vehicle.
---@return Returns
function PlayerStateCrouch:calculateIfValidEntryState() end

--- For the owner: true if crouch is pressed, any held hand tool allows crouching and water submersion is below 1. For non-owners it always returns false (crouching over the network is marked TODO in the code).
---@return Returns
function PlayerStateCrouch:calculateIfCrouching() end

--- Sets the mover to crouching and resets the timers.
---@param previousState PlayerStateBase
function PlayerStateCrouch:onStateEntered(previousState) end

--- Clears the mover's crouching flag and resets the timers.
---@param nextState BaseStateMachineState
function PlayerStateCrouch:onStateExited(nextState) end

--- Zeroes the crouch timer, transition timer and camera y offset.
function PlayerStateCrouch:resetTimers() end

--- Sets the capsule height to crouched or standing depending on input, advances or rewinds the smoothing timer and derives the camera offset from the progress. Allows leaving the state only once fully standing again with the transition timer at zero.
---@param dt number
function PlayerStateCrouch:updateAsCurrent(dt) end

--- Returns the desired x and z velocity in m/s: the input direction times a smoothed speed capped at the crouch maximum.
---@param directionX number
---@param directionZ number
---@return number
---@return number
function PlayerStateCrouch:calculateDesiredHorizontalVelocity(directionX, directionZ) end
