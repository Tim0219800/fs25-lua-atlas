# player/stateMachine/PlayerStateJump.lua

Source: `dataS/scripts/player/stateMachine/PlayerStateJump.lua` — FS25 1.25.1.0

- **PlayerStateJump** inherits from `BaseStateMachineState` (l.12)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlayerStateJump.new(player: Player, stateMachine: StateMachine) → BaseStateMachineState` | 37 |  |
| `PlayerStateJump:createTransitions()` | 55 |  |
| `PlayerStateJump:calculateIfFalling() → boolean` | 63 |  |
| `PlayerStateJump:calculateIfJumping() → boolean` | 70 |  |
| `PlayerStateJump:calculateIfTakingOff() → boolean` | 81 |  |
| `PlayerStateJump:calculateIfLanding() → boolean` | 88 |  |
| `PlayerStateJump:onStateEntered(previousState: PlayerStateBase)` | 95 |  |
| `PlayerStateJump:onStateExited(previousState: BaseStateMachineState)` | 107 |  |
| `PlayerStateJump:resetTimers()` | 118 |  |
| `PlayerStateJump:updateAsCurrent(dt: number)` | 128 |  |
| `PlayerStateJump:calculateDesiredHorizontalVelocity(directionX: number, directionZ: number) → number, number` | 154 |  |
