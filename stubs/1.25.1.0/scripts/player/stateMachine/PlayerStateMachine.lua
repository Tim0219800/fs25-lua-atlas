---@meta
-- FS25 1.25.1.0 : player/stateMachine/PlayerStateMachine.lua (generated stub, FS25 Lua Atlas)

--- Top-level state machine of a player. It holds the on-foot sub-machine plus the driving, passenger and rollercoaster states, starts on foot and is passive: the state changes are driven by player events, not by transitions. The driving, passenger and rollercoaster classes are not in this file.
---@class PlayerStateMachine : StateMachine
PlayerStateMachine = {}

--- Creates the machine with its four states (onFoot, driving, passenger, rollercoaster), builds the transitions, sets onFoot as current and default, and marks the machine passive.
---@param player Player
---@return PlayerStateMachine
function PlayerStateMachine.new(player) end

--- Forwards an updateWhilePaused call to the current state, with the delta time and whether the player is in a GUI or frozen. What the states do with it is UNVERIFIED.
---@param dt number
---@param isInGui boolean
---@param isFrozen boolean
function PlayerStateMachine:updateWhilePaused(dt, isInGui, isFrozen) end
