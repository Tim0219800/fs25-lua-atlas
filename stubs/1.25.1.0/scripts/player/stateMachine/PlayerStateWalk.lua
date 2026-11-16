---@meta
-- FS25 1.25.1.0 : player/stateMachine/PlayerStateWalk.lua (generated stub, FS25 Lua Atlas)

--- On-foot player state for moving on the ground, walking or running depending on the run input. It transitions to idle, jumping or crouching. Speed (calculateDesiredSpeed) and calculateIfMoving are defined outside this file.
---@class PlayerStateWalk : BaseStateMachineState
PlayerStateWalk = {}

--- Creates the walking state with the walk and run axes at zero.
---@param player Player
---@param stateMachine StateMachine
---@return BaseStateMachineState
function PlayerStateWalk.new(player, stateMachine) end

--- Adds transitions from walking to idle, jumping and crouching.
function PlayerStateWalk:createTransitions() end

--- True if the player is moving, grounded and not submerged; used to re-enter on foot after a forced state.
---@return boolean
function PlayerStateWalk:calculateIfValidEntryState() end

--- True if the player is moving and the run axis is zero. It does not itself test the crouch input.
---@return boolean
function PlayerStateWalk:calculateIfWalking() end

--- True if the player is moving, the run axis is positive and the player's run multiplier is above zero.
---@return boolean
function PlayerStateWalk:calculateIfRunning() end

--- Returns the input direction times the speed from calculateDesiredSpeed (outside the dump), in m/s.
---@param directionX number
---@param directionZ number
---@return number
---@return number
function PlayerStateWalk:calculateDesiredHorizontalVelocity(directionX, directionZ) end
