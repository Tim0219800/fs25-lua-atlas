---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FoldableSteps.lua (generated stub, FS25 Lua Atlas)

---@param specializations table
---@return boolean
function FoldableSteps.prerequisitesPresent(specializations) end

function FoldableSteps.initSpecialization() end

---@param vehicleType table
function FoldableSteps.registerFunctions(vehicleType) end

---@param vehicleType table
function FoldableSteps.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType table
function FoldableSteps.registerEventListeners(vehicleType) end

---@param savegame table
function FoldableSteps:onLoad(savegame) end

---@param savegame table
function FoldableSteps:onPostLoad(savegame) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function FoldableSteps:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId any
---@param connection any
function FoldableSteps:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function FoldableSteps:onWriteStream(streamId, connection) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function FoldableSteps:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function FoldableSteps:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
function FoldableSteps:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param trigger any
---@param name any
---@param xmlFile any
---@param key any
function FoldableSteps:onRegisterExternalActionEvents(trigger, name, xmlFile, key) end

---@param stateTargetIndex any
---@param noEventSend any
function FoldableSteps:setFoldableStepsFoldState(stateTargetIndex, noEventSend) end

---@param self any
---@param actionEvents any
function FoldableSteps.updateActionEvents(self, actionEvents) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function FoldableSteps.actionEventFold(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function FoldableSteps.actionEventFoldPos(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function FoldableSteps.actionEventFoldNeg(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param stateTargetIndex any
---@param context any
function FoldableSteps.updateFoldStateChangeAllowed(self, stateTargetIndex, context) end

---@param data any
---@param vehicle any
function FoldableSteps.externalActionEventFoldRegister(data, vehicle) end

---@param data any
---@param vehicle any
function FoldableSteps.externalActionEventFoldUpdate(data, vehicle) end

---@param data any
---@param vehicle any
function FoldableSteps.externalActionEventFoldPosRegister(data, vehicle) end

---@param data any
---@param vehicle any
function FoldableSteps.externalActionEventFoldPosUpdate(data, vehicle) end

---@param data any
---@param vehicle any
function FoldableSteps.externalActionEventFoldNegRegister(data, vehicle) end

---@param data any
---@param vehicle any
function FoldableSteps.externalActionEventFoldNegUpdate(data, vehicle) end

---@param superFunc any
function FoldableSteps:getCanBeTurnedOn(superFunc) end

---@param superFunc any
function FoldableSteps:getTurnedOnNotAllowedWarning(superFunc) end

---@param superFunc any
function FoldableSteps:getRequiresPower(superFunc) end

---@param superFunc any
function FoldableSteps:getAllowHudInfoTrigger(superFunc) end

---@param superFunc any
---@param fillUnitIndex any
---@param toolType any
function FoldableSteps:getFillUnitSupportsToolType(superFunc, fillUnitIndex, toolType) end

---@param superFunc any
function FoldableSteps:getBrakeForce(superFunc) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param lockPosition any
function FoldableSteps:loadDynamicLockPositionFromXML(superFunc, xmlFile, key, lockPosition) end

---@param superFunc any
---@param lockPosition any
function FoldableSteps:getIsDynamicLockPositionActive(superFunc, lockPosition) end
