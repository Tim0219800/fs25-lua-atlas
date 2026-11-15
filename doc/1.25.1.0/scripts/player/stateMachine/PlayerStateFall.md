# player/stateMachine/PlayerStateFall.lua

Source: `dataS/scripts/player/stateMachine/PlayerStateFall.lua` — FS25 1.25.1.0

- **PlayerStateFall** inherits from `BaseStateMachineState` (l.12)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlayerStateFall.new(player: Player, stateMachine: StateMachine) → BaseStateMachineState` | 31 |  |
| `PlayerStateFall:calculateIfFalling() → boolean` | 48 |  |
| `PlayerStateFall:calculateIfLanding() → boolean` | 56 |  |
| `PlayerStateFall:updateAsCurrent(dt: number)` | 63 |  |
| `PlayerStateFall:calculateDesiredHorizontalVelocity(directionX: number, directionZ: number) → number, number` | 79 |  |
