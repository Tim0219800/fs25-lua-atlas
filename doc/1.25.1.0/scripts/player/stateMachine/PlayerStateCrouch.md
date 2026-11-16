# player/stateMachine/PlayerStateCrouch.lua

*[Version française](../../../fr/scripts/player/stateMachine/PlayerStateCrouch.md)*

Source: `dataS/scripts/player/stateMachine/PlayerStateCrouch.lua` — FS25 1.25.1.0

✍ On-foot player state active while the crouch input is held. It lowers the capsule, applies a smoothed camera offset and limits the move speed. Constants such as the thresholds and speeds are defined outside the dump (UNVERIFIED values).

- **PlayerStateCrouch** inherits from `BaseStateMachineState` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerStateCrouch.new(player: Player, stateMachine: StateMachine) → BaseStateMachineState` | 31 | ✍ Creates the state with a zero camera offset, crouch timer and transition timer. |
| `PlayerStateCrouch:createTransitions()` | 52 | ✍ Adds transitions from crouching to idle, walking and jumping, using those states' check functions. |
| `PlayerStateCrouch:calculateIfValidEntryState() → Returns` | 62 | ✍ True if the player is crouching, grounded and not submerged enough to swim. Used to pick this state after a forced state or vehicle. |
| `PlayerStateCrouch:calculateIfCrouching() → Returns` | 69 | ✍ For the owner: true if crouch is pressed, any held hand tool allows crouching and water submersion is below 1. For non-owners it always returns false (crouching over the network is marked TODO in the code). |
| `PlayerStateCrouch:onStateEntered(previousState: PlayerStateBase)` | 83 | ✍ Sets the mover to crouching and resets the timers. |
| `PlayerStateCrouch:onStateExited(nextState: BaseStateMachineState)` | 93 | ✍ Clears the mover's crouching flag and resets the timers. |
| `PlayerStateCrouch:resetTimers()` | 102 | ✍ Zeroes the crouch timer, transition timer and camera y offset. |
| `PlayerStateCrouch:updateAsCurrent(dt: number)` | 115 | ✍ Sets the capsule height to crouched or standing depending on input, advances or rewinds the smoothing timer and derives the camera offset from the progress. Allows leaving the state only once fully standing again with the transition timer at zero. |
| `PlayerStateCrouch:calculateDesiredHorizontalVelocity(directionX: number, directionZ: number) → number, number` | 161 | ✍ Returns the desired x and z velocity in m/s: the input direction times a smoothed speed capped at the crouch maximum. |
