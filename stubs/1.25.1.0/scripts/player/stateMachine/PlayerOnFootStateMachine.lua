---@meta
-- FS25 1.25.1.0 : player/stateMachine/PlayerOnFootStateMachine.lua (generated stub, FS25 Lua Atlas)

--- Sub-state machine of PlayerStateMachine used while the player walks around on foot. It owns the idle, walking, swimming, falling, jumping and crouching states and, while current, runs the whole on-foot frame: input, targeter, camera, capsule controller, mover, interpolator, graphics and network component.
---@class PlayerOnFootStateMachine : StateMachine
PlayerOnFootStateMachine = {}

--- Creates the machine with its six states, builds their transitions, starts on idle (also the default) and allows hand tools. Registers its leave handler for the vehicle, passenger and rollercoaster leave events (the handler itself is not in the dump).
---@param player Player
---@return PlayerOnFootStateMachine
function PlayerOnFootStateMachine.new(player) end

--- Entered when the player becomes on foot (for instance leaving a vehicle): resets network and graphics state, zeroes speed, and on the server shows the player. For the owner it restores the player input context, activates activatable objects, tells the HUD and picks the right sub-state.
---@param previousState BaseStateMachineState
function PlayerOnFootStateMachine:onStateEntered(previousState) end

--- Called when leaving the on-foot state: resets network and graphics state and places the model at the graphical position. For the owner it also stops movement, unequips any hand tool and deactivates activatable objects.
---@param nextState BaseStateMachineState
function PlayerOnFootStateMachine:onStateExited(nextState) end

--- Per-frame on-foot update, in a fixed order: input, targeter, network pre-update, camera rotation, capsule controller, sub-state update, horizontal movement from the current state, mover, camera offset, interpolator, graphics, camera position, activatable-object position (owner), input reset, network update.
---@param dt number
function PlayerOnFootStateMachine:updateAsCurrent(dt) end
