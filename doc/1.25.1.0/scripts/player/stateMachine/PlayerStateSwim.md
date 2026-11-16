# player/stateMachine/PlayerStateSwim.lua

*[Version française](../../../fr/scripts/player/stateMachine/PlayerStateSwim.md)*

Source: `dataS/scripts/player/stateMachine/PlayerStateSwim.lua` — FS25 1.25.1.0

✍ On-foot player state used while the player is deep enough in water. It leaves the state by re-determining the best sub-state as soon as it is no longer forced. Speed computation (calculateDesiredSpeed) and the submersion test live outside this file.

- **PlayerStateSwim** inherits from `BaseStateMachineState` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerStateSwim.new(player: Player, stateMachine: StateMachine) → BaseStateMachineState` | 34 | ✍ Creates the swimming state for the given player and state machine. |
| `PlayerStateSwim:updateAsCurrent(dt: number)` | 83 | ✍ Each frame, asks the state machine to determine a new state unless this state is still forced (calculateIfShouldBeForced, defined outside the dump). |
| `PlayerStateSwim:calculateDesiredHorizontalVelocity(directionX: number, directionZ: number) → number, number` | 117 | ✍ Returns the input direction multiplied by the speed from calculateDesiredSpeed (defined outside the dump), in m/s. |
