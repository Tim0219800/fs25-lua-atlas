---@meta
-- FS25 1.25.1.0 : player/stateMachine/PlayerStateIdle.lua (generated stub, FS25 Lua Atlas)

--- On-foot player state used when the player stands still without movement input. It transitions to walking, jumping or crouching.
---@class PlayerStateIdle : BaseStateMachineState
PlayerStateIdle = {}

--- Creates the idle state for the given player and state machine.
---@param player Player
---@param stateMachine StateMachine
---@return BaseStateMachineState
function PlayerStateIdle.new(player, stateMachine) end

--- Adds transitions from idle to walking, jumping and crouching.
function PlayerStateIdle:createTransitions() end

--- True if the player is idle and grounded; used to re-enter on foot after a forced state.
---@return boolean
function PlayerStateIdle:calculateIfValidEntryState() end

--- True if speed is at most 0.01 and not crouching; for the owner it also requires no movement inputs.
---@return boolean
function PlayerStateIdle:calculateIfIdle() end
