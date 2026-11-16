# player/stateMachine/PlayerStateFall.lua

*[Version française](../../../fr/scripts/player/stateMachine/PlayerStateFall.md)*

Source: `dataS/scripts/player/stateMachine/PlayerStateFall.lua` — FS25 1.25.1.0

✍ On-foot player state for being airborne long enough to count as falling, and not submerged. Constants such as the thresholds and speeds are defined outside the dump (UNVERIFIED values).

- **PlayerStateFall** inherits from `BaseStateMachineState` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerStateFall.new(player: Player, stateMachine: StateMachine) → BaseStateMachineState` | 31 | ✍ Creates the falling state for the given player and state machine. |
| `PlayerStateFall:calculateIfFalling() → boolean` | 48 | ✍ True if the player is not submerged and the mover's current fall time has reached the fall threshold. |
| `PlayerStateFall:calculateIfLanding() → boolean` | 56 | ✍ True if the distance to the ground is within the landing distance. |
| `PlayerStateFall:updateAsCurrent(dt: number)` | 63 | ✍ Each frame, asks the state machine to determine a new state unless this state is forced by calculateIfShouldBeForced (defined in the base class, not in the dump). |
| `PlayerStateFall:calculateDesiredHorizontalVelocity(directionX: number, directionZ: number) → number, number` | 79 | ✍ Returns the air control velocity: input direction times the fall maximum speed, scaled by the super speed factor when the super speed command is on. |
