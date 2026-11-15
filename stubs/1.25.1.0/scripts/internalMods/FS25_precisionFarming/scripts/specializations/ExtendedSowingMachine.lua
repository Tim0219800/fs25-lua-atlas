---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSowingMachine.lua (generated stub, FS25 Lua Atlas)

---@class ExtendedSowingMachine
ExtendedSowingMachine = {}

---@param specializations table
---@return boolean
function ExtendedSowingMachine.prerequisitesPresent(specializations) end

function ExtendedSowingMachine:onDelete() end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ExtendedSowingMachine:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt any
---@param hasProcessed any
function ExtendedSowingMachine:onEndWorkAreaProcessing(dt, hasProcessed) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function ExtendedSowingMachine:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param state any
---@param noEventSend any
function ExtendedSowingMachine:setSeedRateAutoMode(state, noEventSend) end

---@param seedRate any
---@param noEventSend any
function ExtendedSowingMachine:setManualSeedRate(seedRate, noEventSend) end

function ExtendedSowingMachine:onTramlinesChanged() end

---@param superFunc any
---@param workArea any
---@param dt any
function ExtendedSowingMachine:processSowingMachineArea(superFunc, workArea, dt) end

---@param superFunc any
---@param workArea any
---@param dt any
function ExtendedSowingMachine:processOverSeedingArea(superFunc, workArea, dt) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function ExtendedSowingMachine.actionEventToggleAuto(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function ExtendedSowingMachine.actionEventChangeSeedRate(self, actionName, inputValue, callbackState, isAnalog, ...) end

---@param self any
function ExtendedSowingMachine.updateActionEventState(self) end
