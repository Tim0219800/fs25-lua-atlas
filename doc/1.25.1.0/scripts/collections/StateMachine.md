# collections/StateMachine.lua

Source : `dataS/scripts/collections/StateMachine.lua` — FS25 1.25.1.0

- **StateMachine** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `StateMachine.new(custom_mt: table) → StateMachine` | 22 |  |
| `StateMachine:implementStateInterface()` | 73 |  |
| `StateMachine:changeState(newState: BaseStateMachineState, ...: any)` | 87 |  |
| `StateMachine:initialiseStateTransitions(...: any)` | 110 |  |
| `StateMachine:determineState()` | 118 |  |
| `StateMachine:resolveCurrentState() → BaseStateMachineState` | 135 |  |
| `StateMachine:getCurrentStateName() → string` | 144 |  |
| `StateMachine:getNameOfState(state: BaseStateMachineState) → string` | 152 |  |
| `StateMachine:getCurrentStateIndex() → number` | 170 |  |
| `StateMachine:getIndexOfState(state: BaseStateMachineState) → integer` | 178 |  |
| `StateMachine:getStateByIndex(index: integer) → BaseStateMachineState` | 200 |  |
| `StateMachine:getIsPassive() → boolean` | 220 |  |
| `StateMachine:setIsPassive(isPassive: boolean)` | 227 |  |
| `StateMachine:update(dt: number)` | 234 |  |
| `StateMachine:callStateFunction(functionName: string, ...: any)` | 269 |  |
