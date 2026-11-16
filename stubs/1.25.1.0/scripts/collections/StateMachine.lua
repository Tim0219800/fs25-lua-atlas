---@meta
-- FS25 1.25.1.0 : collections/StateMachine.lua (generated stub, FS25 Lua Atlas)

--- Abstract base for a state machine that manages BaseStateMachineState objects stored in a `states` table. It tracks the current and default state, a passive flag that stops automatic transitions, and per-frame updates in which a state may force a switch. A machine can also act as a state by copying the state interface. Subclasses must fill states and defaultState; some helpers used here (initialiseStateNames, getHasMappings, createStateIndexNameMapping) are not defined in this file (UNVERIFIED).
---@class StateMachine
StateMachine = {}

--- Creates a machine with no current or default state, an empty states table and passive set to false. Intended to be called by a derived class.
---@param custom_mt table
---@return StateMachine
function StateMachine.new(custom_mt) end

--- Called on a class table to copy every BaseStateMachineState member it does not already define, so the machine can itself be used as a state of another machine.
function StateMachine:implementStateInterface() end

--- Sets the new current state, calls onStateExited on the previous one and onStateEntered on the new one with extra arguments. Errors if there is no current state yet, since the previous state is called without a nil check.
---@param newState BaseStateMachineState
function StateMachine:changeState(newState, ...) end

--- Calls createTransitions on every state, forwarding the given arguments. Not called automatically by the base class.
function StateMachine:initialiseStateTransitions(...) end

--- Switches to the first state whose calculateIfValidEntryState returns true (in unspecified `pairs` order), else to the default state.
function StateMachine:determineState() end

--- Returns the current state, or when that state is itself a machine with resolveCurrentState, the deepest resolved state.
---@return BaseStateMachineState
function StateMachine:resolveCurrentState() end

--- Returns the name of the current state through getNameOfState.
---@return string
function StateMachine:getCurrentStateName() end

--- Returns the state's name, or the text "No state" for nil. If the name is empty it first calls initialiseStateNames, which is not defined in this file (UNVERIFIED).
---@param state BaseStateMachineState
---@return string
function StateMachine:getNameOfState(state) end

--- Returns the index of the current state in the alphabetically sorted state list, via getIndexOfState.
---@return number
function StateMachine:getCurrentStateIndex() end

--- Returns the index of a state in the sorted state list, or nil if absent. It first builds the mappings through createStateIndexNameMapping if missing, defined outside this file (UNVERIFIED).
---@param state BaseStateMachineState
---@return integer
function StateMachine:getIndexOfState(state) end

--- Returns the state at a given index of the sorted state list, or nil. Builds the index mappings first if needed (helper defined elsewhere, UNVERIFIED).
---@param index integer
---@return BaseStateMachineState
function StateMachine:getStateByIndex(index) end

--- Returns whether the machine is passive, meaning it does not change state on its own during updates.
---@return boolean
function StateMachine:getIsPassive() end

--- Sets the passive flag; only the value true enables it, anything else becomes false.
---@param isPassive boolean
function StateMachine:setIsPassive(isPassive) end

--- Per-frame update (dt in ms). When not passive, switches to the first other state whose calculateIfShouldBeForced is true; then calls updateAsCurrent on the current state and updateAsInactive on all others.
---@param dt number
function StateMachine:update(dt) end

--- Calls the method with the given name on every state that has it, passing the extra arguments. Return values are ignored.
---@param functionName string
function StateMachine:callStateFunction(functionName, ...) end
