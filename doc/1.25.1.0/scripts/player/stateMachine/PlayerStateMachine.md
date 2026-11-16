# player/stateMachine/PlayerStateMachine.lua

*[Version française](../../../fr/scripts/player/stateMachine/PlayerStateMachine.md)*

Source: `dataS/scripts/player/stateMachine/PlayerStateMachine.lua` — FS25 1.25.1.0

✍ Top-level state machine of a player. It holds the on-foot sub-machine plus the driving, passenger and rollercoaster states, starts on foot and is passive: the state changes are driven by player events, not by transitions. The driving, passenger and rollercoaster classes are not in this file.

- **PlayerStateMachine** inherits from `StateMachine` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerStateMachine.new(player: Player) → PlayerStateMachine` | 18 | ✍ Creates the machine with its four states (onFoot, driving, passenger, rollercoaster), builds the transitions, sets onFoot as current and default, and marks the machine passive. |
| `PlayerStateMachine:updateWhilePaused(dt: number, isInGui: boolean, isFrozen: boolean)` | 54 | ✍ Forwards an updateWhilePaused call to the current state, with the delta time and whether the player is in a GUI or frozen. What the states do with it is UNVERIFIED. |
