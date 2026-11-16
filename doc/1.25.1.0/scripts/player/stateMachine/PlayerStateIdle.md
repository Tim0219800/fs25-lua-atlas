# player/stateMachine/PlayerStateIdle.lua

*[Version française](../../../fr/scripts/player/stateMachine/PlayerStateIdle.md)*

Source: `dataS/scripts/player/stateMachine/PlayerStateIdle.lua` — FS25 1.25.1.0

✍ On-foot player state used when the player stands still without movement input. It transitions to walking, jumping or crouching.

- **PlayerStateIdle** inherits from `BaseStateMachineState` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerStateIdle.new(player: Player, stateMachine: StateMachine) → BaseStateMachineState` | 19 | ✍ Creates the idle state for the given player and state machine. |
| `PlayerStateIdle:createTransitions()` | 29 | ✍ Adds transitions from idle to walking, jumping and crouching. |
| `PlayerStateIdle:calculateIfValidEntryState() → boolean` | 39 | ✍ True if the player is idle and grounded; used to re-enter on foot after a forced state. |
| `PlayerStateIdle:calculateIfIdle() → boolean` | 46 | ✍ True if speed is at most 0.01 and not crouching; for the owner it also requires no movement inputs. |
