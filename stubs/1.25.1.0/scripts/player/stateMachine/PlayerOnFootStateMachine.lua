---@meta
-- FS25 1.25.1.0 : player/stateMachine/PlayerOnFootStateMachine.lua (generated stub, FS25 Lua Atlas)

---@class PlayerOnFootStateMachine : StateMachine
PlayerOnFootStateMachine = {}

---@param player Player
---@return PlayerOnFootStateMachine
function PlayerOnFootStateMachine.new(player) end

---@param previousState BaseStateMachineState
function PlayerOnFootStateMachine:onStateEntered(previousState) end

---@param nextState BaseStateMachineState
function PlayerOnFootStateMachine:onStateExited(nextState) end

---@param dt number
function PlayerOnFootStateMachine:updateAsCurrent(dt) end
