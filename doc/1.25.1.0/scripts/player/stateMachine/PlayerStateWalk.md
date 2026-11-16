# player/stateMachine/PlayerStateWalk.lua

*[Version française](../../../fr/scripts/player/stateMachine/PlayerStateWalk.md)*

Source: `dataS/scripts/player/stateMachine/PlayerStateWalk.lua` — FS25 1.25.1.0

✍ On-foot player state for moving on the ground, walking or running depending on the run input. It transitions to idle, jumping or crouching. Speed (calculateDesiredSpeed) and calculateIfMoving are defined outside this file.

- **PlayerStateWalk** inherits from `BaseStateMachineState` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerStateWalk.new(player: Player, stateMachine: StateMachine) → BaseStateMachineState` | 24 | ✍ Creates the walking state with the walk and run axes at zero. |
| `PlayerStateWalk:createTransitions()` | 39 | ✍ Adds transitions from walking to idle, jumping and crouching. |
| `PlayerStateWalk:calculateIfValidEntryState() → boolean` | 49 | ✍ True if the player is moving, grounded and not submerged; used to re-enter on foot after a forced state. |
| `PlayerStateWalk:calculateIfWalking() → boolean` | 64 | ✍ True if the player is moving and the run axis is zero. It does not itself test the crouch input. |
| `PlayerStateWalk:calculateIfRunning() → boolean` | 71 | ✍ True if the player is moving, the run axis is positive and the player's run multiplier is above zero. |
| `PlayerStateWalk:calculateDesiredHorizontalVelocity(directionX: number, directionZ: number) → number, number` | 135 | ✍ Returns the input direction times the speed from calculateDesiredSpeed (outside the dump), in m/s. |
