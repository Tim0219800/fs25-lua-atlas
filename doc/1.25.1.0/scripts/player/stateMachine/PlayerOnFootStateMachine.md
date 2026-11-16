# player/stateMachine/PlayerOnFootStateMachine.lua

*[Version française](../../../fr/scripts/player/stateMachine/PlayerOnFootStateMachine.md)*

Source: `dataS/scripts/player/stateMachine/PlayerOnFootStateMachine.lua` — FS25 1.25.1.0

✍ Sub-state machine of PlayerStateMachine used while the player walks around on foot. It owns the idle, walking, swimming, falling, jumping and crouching states and, while current, runs the whole on-foot frame: input, targeter, camera, capsule controller, mover, interpolator, graphics and network component.

- **PlayerOnFootStateMachine** inherits from `StateMachine` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerOnFootStateMachine.new(player: Player) → PlayerOnFootStateMachine` | 21 | ✍ Creates the machine with its six states, builds their transitions, starts on idle (also the default) and allows hand tools. Registers its leave handler for the vehicle, passenger and rollercoaster leave events (the handler itself is not in the dump). |
| `PlayerOnFootStateMachine:onStateEntered(previousState: BaseStateMachineState)` | 67 | ✍ Entered when the player becomes on foot (for instance leaving a vehicle): resets network and graphics state, zeroes speed, and on the server shows the player. For the owner it restores the player input context, activates activatable objects, tells the HUD and picks the right sub-state. |
| `PlayerOnFootStateMachine:onStateExited(nextState: BaseStateMachineState)` | 107 | ✍ Called when leaving the on-foot state: resets network and graphics state and places the model at the graphical position. For the owner it also stops movement, unequips any hand tool and deactivates activatable objects. |
| `PlayerOnFootStateMachine:updateAsCurrent(dt: number)` | 168 | ✍ Per-frame on-foot update, in a fixed order: input, targeter, network pre-update, camera rotation, capsule controller, sub-state update, horizontal movement from the current state, mover, camera offset, interpolator, graphics, camera position, activatable-object position (owner), input reset, network update. |
