---@meta
-- FS25 1.25.1.0 : player/stateMachine/PlayerStateCrouch.lua (generated stub, FS25 Lua Atlas)

---@class PlayerStateCrouch : BaseStateMachineState
PlayerStateCrouch = {}

---@param player Player
---@param stateMachine StateMachine
---@return BaseStateMachineState
function PlayerStateCrouch.new(player, stateMachine) end

function PlayerStateCrouch:createTransitions() end

---@return Returns
function PlayerStateCrouch:calculateIfValidEntryState() end

---@return Returns
function PlayerStateCrouch:calculateIfCrouching() end

---@param previousState PlayerStateBase
function PlayerStateCrouch:onStateEntered(previousState) end

---@param nextState BaseStateMachineState
function PlayerStateCrouch:onStateExited(nextState) end

function PlayerStateCrouch:resetTimers() end

---@param dt number
function PlayerStateCrouch:updateAsCurrent(dt) end

---@param directionX number
---@param directionZ number
---@return number
---@return number
function PlayerStateCrouch:calculateDesiredHorizontalVelocity(directionX, directionZ) end
