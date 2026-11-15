---@meta
-- FS25 1.25.1.0 : player/stateMachine/PlayerStateWalk.lua (stub généré, atlas Lua FS25)

---@class PlayerStateWalk : BaseStateMachineState
PlayerStateWalk = {}

---@param player Player
---@param stateMachine StateMachine
---@return BaseStateMachineState
function PlayerStateWalk.new(player, stateMachine) end

function PlayerStateWalk:createTransitions() end

---@return boolean
function PlayerStateWalk:calculateIfValidEntryState() end

---@return boolean
function PlayerStateWalk:calculateIfWalking() end

---@return boolean
function PlayerStateWalk:calculateIfRunning() end

---@param directionX number
---@param directionZ number
---@return number
---@return number
function PlayerStateWalk:calculateDesiredHorizontalVelocity(directionX, directionZ) end
