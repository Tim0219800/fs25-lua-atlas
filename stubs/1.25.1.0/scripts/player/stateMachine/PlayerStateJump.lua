---@meta
-- FS25 1.25.1.0 : player/stateMachine/PlayerStateJump.lua (generated stub, FS25 Lua Atlas)

---@class PlayerStateJump : BaseStateMachineState
PlayerStateJump = {}

---@param player Player
---@param stateMachine StateMachine
---@return BaseStateMachineState
function PlayerStateJump.new(player, stateMachine) end

function PlayerStateJump:createTransitions() end

---@return boolean
function PlayerStateJump:calculateIfFalling() end

---@return boolean
function PlayerStateJump:calculateIfJumping() end

---@return boolean
function PlayerStateJump:calculateIfTakingOff() end

---@return boolean
function PlayerStateJump:calculateIfLanding() end

---@param previousState PlayerStateBase
function PlayerStateJump:onStateEntered(previousState) end

---@param previousState BaseStateMachineState
function PlayerStateJump:onStateExited(previousState) end

function PlayerStateJump:resetTimers() end

---@param dt number
function PlayerStateJump:updateAsCurrent(dt) end

---@param directionX number
---@param directionZ number
---@return number
---@return number
function PlayerStateJump:calculateDesiredHorizontalVelocity(directionX, directionZ) end
