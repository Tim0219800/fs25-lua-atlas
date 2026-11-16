# collections/BaseStateMachineState.lua

*[Version française](../../fr/scripts/collections/BaseStateMachineState.md)*

Source: `dataS/scripts/collections/BaseStateMachineState.lua` — FS25 1.25.1.0

✍ Abstract base class for a state used with a StateMachine. A state keeps a table of transitions (condition function plus target state), has empty enter/exit hooks and update hooks for the active and inactive cases, and can draw itself as a colored rectangle for debugging. Concrete states are expected to subclass it and pass their own metatable.

- **BaseStateMachineState** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `BaseStateMachineState.new(stateMachine: StateMachine, custom_mt: table) → BaseStateMachineState` | 27 | ✍ Creates a state bound to its owning state machine, with an empty transitions table and unset debug bounds. Meant to be called from a derived class constructor. |
| `BaseStateMachineState:trySwitchToValidTransition() → BaseStateMachineState?` | 58 | ✍ Evaluates each transition condition (called with its context) in unspecified `pairs` order. On the first true result it calls stateMachine:changeState with the target and returns that state, otherwise nil. |
| `BaseStateMachineState:createTransitions()` | 76 | ✍ Empty hook for subclasses to define transitions once all states exist. The base version does nothing. |
| `BaseStateMachineState:addTransition(conditionFunction: function, targetState: BaseStateMachineState, contextObject: table)` | 85 | ✍ Registers a transition to targetState guarded by conditionFunction; the context passed to the condition defaults to the target state. One transition per target: adding again replaces the earlier one. Returns the transition table. |
| `BaseStateMachineState:calculateIfShouldBeForced() → boolean` | 98 | ✍ Hook telling whether this state must be forced as current. Base version always returns false. |
| `BaseStateMachineState:calculateIfValidEntryState() → boolean` | 105 | ✍ Hook telling whether this state is a valid state to return to after a forced state. Base version always returns false. |
| `BaseStateMachineState:onStateEntered(previousState: BaseStateMachineState)` | 112 | ✍ Empty hook called when the machine enters this state; receives the previous state. |
| `BaseStateMachineState:onStateExited(nextState: BaseStateMachineState)` | 119 | ✍ Empty hook called when the machine leaves this state; receives the next state. |
| `BaseStateMachineState:updateAsCurrent(dt: number)` | 126 | ✍ Per-update hook while this is the current state (dt in ms). Unless the machine is passive, it checks the transitions and may switch state. |
| `BaseStateMachineState:updateAsInactive(dt: number)` | 140 | ✍ Empty per-update hook for states that are not the current one (dt in ms). |
| `BaseStateMachineState:caclulateDebugScreenBounds(x: number, y: number, width: number, height: number)` | 150 | ✍ Converts this state's relative debug position and size into screen-space values scaled by the given area. Returns four nils if any debug bound is unset. Note: the name is misspelled (caclulate) in the source. |
| `BaseStateMachineState:debugDraw(x: number, y: number, width: number, height: number, textSize: number, color: any)` | 167 | ✍ Draws the state's debug rectangle, green for the current state and gray otherwise unless a color is passed, and returns its bounds. Returns four nils if the state has no debug bounds. |
