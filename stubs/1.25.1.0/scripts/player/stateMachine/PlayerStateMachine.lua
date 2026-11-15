---@meta
-- FS25 1.25.1.0 : player/stateMachine/PlayerStateMachine.lua (stub généré, atlas Lua FS25)

---@class PlayerStateMachine : StateMachine
PlayerStateMachine = {}

---@param player Player
---@return PlayerStateMachine
function PlayerStateMachine.new(player) end

---@param dt number
---@param isInGui boolean
---@param isFrozen boolean
function PlayerStateMachine:updateWhilePaused(dt, isInGui, isFrozen) end
