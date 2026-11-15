---@meta
-- FS25 1.25.1.0 : player/stateMachine/PlayerStateIdle.lua (generated stub, FS25 Lua Atlas)

---@class PlayerStateIdle : BaseStateMachineState
PlayerStateIdle = {}

---@param player Player
---@param stateMachine StateMachine
---@return BaseStateMachineState
function PlayerStateIdle.new(player, stateMachine) end

function PlayerStateIdle:createTransitions() end

---@return boolean
function PlayerStateIdle:calculateIfValidEntryState() end

---@return boolean
function PlayerStateIdle:calculateIfIdle() end
