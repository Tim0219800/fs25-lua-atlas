---@meta
-- FS25 1.25.1.0 : collections/BaseStateMachineState.lua (generated stub, FS25 Lua Atlas)

--- Abstract base class for a state used with a StateMachine. A state keeps a table of transitions (condition function plus target state), has empty enter/exit hooks and update hooks for the active and inactive cases, and can draw itself as a colored rectangle for debugging. Concrete states are expected to subclass it and pass their own metatable.
---@class BaseStateMachineState
BaseStateMachineState = {}

--- Creates a state bound to its owning state machine, with an empty transitions table and unset debug bounds. Meant to be called from a derived class constructor.
---@param stateMachine StateMachine
---@param custom_mt table
---@return BaseStateMachineState
function BaseStateMachineState.new(stateMachine, custom_mt) end

--- Evaluates each transition condition (called with its context) in unspecified `pairs` order. On the first true result it calls stateMachine:changeState with the target and returns that state, otherwise nil.
---@return BaseStateMachineState?
function BaseStateMachineState:trySwitchToValidTransition() end

--- Empty hook for subclasses to define transitions once all states exist. The base version does nothing.
function BaseStateMachineState:createTransitions() end

--- Registers a transition to targetState guarded by conditionFunction; the context passed to the condition defaults to the target state. One transition per target: adding again replaces the earlier one. Returns the transition table.
---@param conditionFunction function
---@param targetState BaseStateMachineState
---@param contextObject table
function BaseStateMachineState:addTransition(conditionFunction, targetState, contextObject) end

--- Hook telling whether this state must be forced as current. Base version always returns false.
---@return boolean
function BaseStateMachineState:calculateIfShouldBeForced() end

--- Hook telling whether this state is a valid state to return to after a forced state. Base version always returns false.
---@return boolean
function BaseStateMachineState:calculateIfValidEntryState() end

--- Empty hook called when the machine enters this state; receives the previous state.
---@param previousState BaseStateMachineState
function BaseStateMachineState:onStateEntered(previousState) end

--- Empty hook called when the machine leaves this state; receives the next state.
---@param nextState BaseStateMachineState
function BaseStateMachineState:onStateExited(nextState) end

--- Per-update hook while this is the current state (dt in ms). Unless the machine is passive, it checks the transitions and may switch state.
---@param dt number
function BaseStateMachineState:updateAsCurrent(dt) end

--- Empty per-update hook for states that are not the current one (dt in ms).
---@param dt number
function BaseStateMachineState:updateAsInactive(dt) end

--- Converts this state's relative debug position and size into screen-space values scaled by the given area. Returns four nils if any debug bound is unset. Note: the name is misspelled (caclulate) in the source.
---@param x number
---@param y number
---@param width number
---@param height number
function BaseStateMachineState:caclulateDebugScreenBounds(x, y, width, height) end

--- Draws the state's debug rectangle, green for the current state and gray otherwise unless a color is passed, and returns its bounds. Returns four nils if the state has no debug bounds.
---@param x number
---@param y number
---@param width number
---@param height number
---@param textSize number
---@param color any
function BaseStateMachineState:debugDraw(x, y, width, height, textSize, color) end
