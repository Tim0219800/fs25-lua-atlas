---@meta
-- FS25 1.25.1.0 : player/stateMachine/PlayerStateFall.lua (stub généré, atlas Lua FS25)

---@class PlayerStateFall : BaseStateMachineState
PlayerStateFall = {}

---@param player Player
---@param stateMachine StateMachine
---@return BaseStateMachineState
function PlayerStateFall.new(player, stateMachine) end

---@return boolean
function PlayerStateFall:calculateIfFalling() end

---@return boolean
function PlayerStateFall:calculateIfLanding() end

---@param dt number
function PlayerStateFall:updateAsCurrent(dt) end

---@param directionX number
---@param directionZ number
---@return number
---@return number
function PlayerStateFall:calculateDesiredHorizontalVelocity(directionX, directionZ) end
