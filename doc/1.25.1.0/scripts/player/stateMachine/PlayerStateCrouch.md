# player/stateMachine/PlayerStateCrouch.lua

Source : `dataS/scripts/player/stateMachine/PlayerStateCrouch.lua` — FS25 1.25.1.0

- **PlayerStateCrouch** hérite de `BaseStateMachineState` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerStateCrouch.new(player: Player, stateMachine: StateMachine) → BaseStateMachineState` | 31 |  |
| `PlayerStateCrouch:createTransitions()` | 52 |  |
| `PlayerStateCrouch:calculateIfValidEntryState() → Returns` | 62 |  |
| `PlayerStateCrouch:calculateIfCrouching() → Returns` | 69 |  |
| `PlayerStateCrouch:onStateEntered(previousState: PlayerStateBase)` | 83 |  |
| `PlayerStateCrouch:onStateExited(nextState: BaseStateMachineState)` | 93 |  |
| `PlayerStateCrouch:resetTimers()` | 102 |  |
| `PlayerStateCrouch:updateAsCurrent(dt: number)` | 115 |  |
| `PlayerStateCrouch:calculateDesiredHorizontalVelocity(directionX: number, directionZ: number) → number, number` | 161 |  |
