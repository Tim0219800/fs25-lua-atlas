# player/stateMachine/PlayerStateJump.lua

*[Version française](../../../fr/scripts/player/stateMachine/PlayerStateJump.md)*

Source: `dataS/scripts/player/stateMachine/PlayerStateJump.lua` — FS25 1.25.1.0

✍ On-foot player state for being airborne after a jump, before it counts as falling. It tracks time jumping and time spent descending and hands over to the falling state. Constants such as the thresholds and speeds are defined outside the dump (UNVERIFIED values).

- **PlayerStateJump** inherits from `BaseStateMachineState` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerStateJump.new(player: Player, stateMachine: StateMachine) → BaseStateMachineState` | 37 | ✍ Creates the state with the time-jumping and time-falling-down timers at zero. |
| `PlayerStateJump:createTransitions()` | 55 | ✍ Adds the transition from jumping to falling. |
| `PlayerStateJump:calculateIfFalling() → boolean` | 63 | ✍ True once the time spent descending has reached this state's own fall threshold, so the rising part of a jump never counts as a fall. |
| `PlayerStateJump:calculateIfJumping() → boolean` | 70 | ✍ Owner: true if jump input times the jump multiplier is positive and the player has been grounded long enough. Others: true on upward vertical velocity with the same ground-time condition. |
| `PlayerStateJump:calculateIfTakingOff() → boolean` | 81 | ✍ True while jump time is within the take-off threshold and vertical velocity is still upward. |
| `PlayerStateJump:calculateIfLanding() → boolean` | 88 | ✍ True when the ground distance is within the landing distance and the player is no longer taking off. |
| `PlayerStateJump:onStateEntered(previousState: PlayerStateBase)` | 95 | ✍ Sets the mover's vertical velocity to the jump up-force times the player's jump multiplier and resets the timers. |
| `PlayerStateJump:onStateExited(previousState: BaseStateMachineState)` | 107 | ✍ Clears the mover's current up force and resets the timers. |
| `PlayerStateJump:resetTimers()` | 118 | ✍ Zeroes the descending-time and jump-time timers. |
| `PlayerStateJump:updateAsCurrent(dt: number)` | 128 | ✍ Accumulates jump time and, while moving downward, descent time (both in seconds). Re-determines the state once grounded and past take-off; otherwise tries the valid transitions. |
| `PlayerStateJump:calculateDesiredHorizontalVelocity(directionX: number, directionZ: number) → number, number` | 154 | ✍ Returns the horizontal velocity in m/s: input direction times a smoothed speed up to the jump maximum, scaled by the super speed factor when that command is on. |
