---@meta
-- FS25 1.25.1.0 : collections/BaseStateMachineState.lua (generated stub, FS25 Lua Atlas)

---@class BaseStateMachineState
BaseStateMachineState = {}

---@param stateMachine StateMachine
---@param custom_mt table
---@return BaseStateMachineState
function BaseStateMachineState.new(stateMachine, custom_mt) end

---@return BaseStateMachineState?
function BaseStateMachineState:trySwitchToValidTransition() end

function BaseStateMachineState:createTransitions() end

---@param conditionFunction function
---@param targetState BaseStateMachineState
---@param contextObject table
function BaseStateMachineState:addTransition(conditionFunction, targetState, contextObject) end

---@return boolean
function BaseStateMachineState:calculateIfShouldBeForced() end

---@return boolean
function BaseStateMachineState:calculateIfValidEntryState() end

---@param previousState BaseStateMachineState
function BaseStateMachineState:onStateEntered(previousState) end

---@param nextState BaseStateMachineState
function BaseStateMachineState:onStateExited(nextState) end

---@param dt number
function BaseStateMachineState:updateAsCurrent(dt) end

---@param dt number
function BaseStateMachineState:updateAsInactive(dt) end

---@param x number
---@param y number
---@param width number
---@param height number
function BaseStateMachineState:caclulateDebugScreenBounds(x, y, width, height) end

---@param x number
---@param y number
---@param width number
---@param height number
---@param textSize number
---@param color any
function BaseStateMachineState:debugDraw(x, y, width, height, textSize, color) end
