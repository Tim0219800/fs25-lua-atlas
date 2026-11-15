---@meta
-- FS25 1.25.1.0 : player/stateMachine/PlayerStateSwim.lua (generated stub, FS25 Lua Atlas)

---@class PlayerStateSwim : BaseStateMachineState
PlayerStateSwim = {}

---@param player Player
---@param stateMachine StateMachine
---@return BaseStateMachineState
function PlayerStateSwim.new(player, stateMachine) end

---@param dt number
function PlayerStateSwim:updateAsCurrent(dt) end

---@param directionX number
---@param directionZ number
---@return number
---@return number
function PlayerStateSwim:calculateDesiredHorizontalVelocity(directionX, directionZ) end
