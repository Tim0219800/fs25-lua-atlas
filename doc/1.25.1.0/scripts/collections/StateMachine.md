# collections/StateMachine.lua

*[Version française](../../fr/scripts/collections/StateMachine.md)*

Source: `dataS/scripts/collections/StateMachine.lua` — FS25 1.25.1.0

✍ Abstract base for a state machine that manages BaseStateMachineState objects stored in a `states` table. It tracks the current and default state, a passive flag that stops automatic transitions, and per-frame updates in which a state may force a switch. A machine can also act as a state by copying the state interface. Subclasses must fill states and defaultState; some helpers used here (initialiseStateNames, getHasMappings, createStateIndexNameMapping) are not defined in this file (UNVERIFIED).

- **StateMachine** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `StateMachine.new(custom_mt: table) → StateMachine` | 22 | ✍ Creates a machine with no current or default state, an empty states table and passive set to false. Intended to be called by a derived class. |
| `StateMachine:implementStateInterface()` | 73 | ✍ Called on a class table to copy every BaseStateMachineState member it does not already define, so the machine can itself be used as a state of another machine. |
| `StateMachine:changeState(newState: BaseStateMachineState, ...: any)` | 87 | ✍ Sets the new current state, calls onStateExited on the previous one and onStateEntered on the new one with extra arguments. Errors if there is no current state yet, since the previous state is called without a nil check. |
| `StateMachine:initialiseStateTransitions(...: any)` | 110 | ✍ Calls createTransitions on every state, forwarding the given arguments. Not called automatically by the base class. |
| `StateMachine:determineState()` | 118 | ✍ Switches to the first state whose calculateIfValidEntryState returns true (in unspecified `pairs` order), else to the default state. |
| `StateMachine:resolveCurrentState() → BaseStateMachineState` | 135 | ✍ Returns the current state, or when that state is itself a machine with resolveCurrentState, the deepest resolved state. |
| `StateMachine:getCurrentStateName() → string` | 144 | ✍ Returns the name of the current state through getNameOfState. |
| `StateMachine:getNameOfState(state: BaseStateMachineState) → string` | 152 | ✍ Returns the state's name, or the text "No state" for nil. If the name is empty it first calls initialiseStateNames, which is not defined in this file (UNVERIFIED). |
| `StateMachine:getCurrentStateIndex() → number` | 170 | ✍ Returns the index of the current state in the alphabetically sorted state list, via getIndexOfState. |
| `StateMachine:getIndexOfState(state: BaseStateMachineState) → integer` | 178 | ✍ Returns the index of a state in the sorted state list, or nil if absent. It first builds the mappings through createStateIndexNameMapping if missing, defined outside this file (UNVERIFIED). |
| `StateMachine:getStateByIndex(index: integer) → BaseStateMachineState` | 200 | ✍ Returns the state at a given index of the sorted state list, or nil. Builds the index mappings first if needed (helper defined elsewhere, UNVERIFIED). |
| `StateMachine:getIsPassive() → boolean` | 220 | ✍ Returns whether the machine is passive, meaning it does not change state on its own during updates. |
| `StateMachine:setIsPassive(isPassive: boolean)` | 227 | ✍ Sets the passive flag; only the value true enables it, anything else becomes false. |
| `StateMachine:update(dt: number)` | 234 | ✍ Per-frame update (dt in ms). When not passive, switches to the first other state whose calculateIfShouldBeForced is true; then calls updateAsCurrent on the current state and updateAsInactive on all others. |
| `StateMachine:callStateFunction(functionName: string, ...: any)` | 269 | ✍ Calls the method with the given name on every state that has it, passing the extra arguments. Return values are ignored. |
