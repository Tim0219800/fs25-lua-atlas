---@meta
-- FS25 1.25.1.0 : collections/StateMachine.lua (stub généré, atlas Lua FS25)

---@class StateMachine
StateMachine = {}

---@param custom_mt table
---@return StateMachine
function StateMachine.new(custom_mt) end

function StateMachine:implementStateInterface() end

---@param newState BaseStateMachineState
function StateMachine:changeState(newState, ...) end

function StateMachine:initialiseStateTransitions(...) end

function StateMachine:determineState() end

---@return BaseStateMachineState
function StateMachine:resolveCurrentState() end

---@return string
function StateMachine:getCurrentStateName() end

---@param state BaseStateMachineState
---@return string
function StateMachine:getNameOfState(state) end

---@return number
function StateMachine:getCurrentStateIndex() end

---@param state BaseStateMachineState
---@return integer
function StateMachine:getIndexOfState(state) end

---@param index integer
---@return BaseStateMachineState
function StateMachine:getStateByIndex(index) end

---@return boolean
function StateMachine:getIsPassive() end

---@param isPassive boolean
function StateMachine:setIsPassive(isPassive) end

---@param dt number
function StateMachine:update(dt) end

---@param functionName string
function StateMachine:callStateFunction(functionName, ...) end
