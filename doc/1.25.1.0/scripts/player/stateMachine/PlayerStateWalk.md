# player/stateMachine/PlayerStateWalk.lua

Source : `dataS/scripts/player/stateMachine/PlayerStateWalk.lua` — FS25 1.25.1.0

- **PlayerStateWalk** hérite de `BaseStateMachineState` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerStateWalk.new(player: Player, stateMachine: StateMachine) → BaseStateMachineState` | 24 |  |
| `PlayerStateWalk:createTransitions()` | 39 |  |
| `PlayerStateWalk:calculateIfValidEntryState() → boolean` | 49 |  |
| `PlayerStateWalk:calculateIfWalking() → boolean` | 64 |  |
| `PlayerStateWalk:calculateIfRunning() → boolean` | 71 |  |
| `PlayerStateWalk:calculateDesiredHorizontalVelocity(directionX: number, directionZ: number) → number, number` | 135 |  |
