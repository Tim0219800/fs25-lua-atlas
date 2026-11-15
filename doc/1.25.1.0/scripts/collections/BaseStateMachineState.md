# collections/BaseStateMachineState.lua

Source : `dataS/scripts/collections/BaseStateMachineState.lua` — FS25 1.25.1.0

- **BaseStateMachineState** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BaseStateMachineState.new(stateMachine: StateMachine, custom_mt: table) → BaseStateMachineState` | 27 |  |
| `BaseStateMachineState:trySwitchToValidTransition() → BaseStateMachineState?` | 58 |  |
| `BaseStateMachineState:createTransitions()` | 76 |  |
| `BaseStateMachineState:addTransition(conditionFunction: function, targetState: BaseStateMachineState, contextObject: table)` | 85 |  |
| `BaseStateMachineState:calculateIfShouldBeForced() → boolean` | 98 |  |
| `BaseStateMachineState:calculateIfValidEntryState() → boolean` | 105 |  |
| `BaseStateMachineState:onStateEntered(previousState: BaseStateMachineState)` | 112 |  |
| `BaseStateMachineState:onStateExited(nextState: BaseStateMachineState)` | 119 |  |
| `BaseStateMachineState:updateAsCurrent(dt: number)` | 126 |  |
| `BaseStateMachineState:updateAsInactive(dt: number)` | 140 |  |
| `BaseStateMachineState:caclulateDebugScreenBounds(x: number, y: number, width: number, height: number)` | 150 |  |
| `BaseStateMachineState:debugDraw(x: number, y: number, width: number, height: number, textSize: number, color: any)` | 167 |  |
