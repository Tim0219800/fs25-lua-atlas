---@meta
-- FS25 1.25.1.0 : player/stateMachine/PlayerStateSwim.lua (generated stub, FS25 Lua Atlas)

--- On-foot player state used while the player is deep enough in water. It leaves the state by re-determining the best sub-state as soon as it is no longer forced. Speed computation (calculateDesiredSpeed) and the submersion test live outside this file.
---@class PlayerStateSwim : BaseStateMachineState
PlayerStateSwim = {}

--- Creates the swimming state for the given player and state machine.
---@param player Player
---@param stateMachine StateMachine
---@return BaseStateMachineState
function PlayerStateSwim.new(player, stateMachine) end

--- Each frame, asks the state machine to determine a new state unless this state is still forced (calculateIfShouldBeForced, defined outside the dump).
---@param dt number
function PlayerStateSwim:updateAsCurrent(dt) end

--- Returns the input direction multiplied by the speed from calculateDesiredSpeed (defined outside the dump), in m/s.
---@param directionX number
---@param directionZ number
---@return number
---@return number
function PlayerStateSwim:calculateDesiredHorizontalVelocity(directionX, directionZ) end
