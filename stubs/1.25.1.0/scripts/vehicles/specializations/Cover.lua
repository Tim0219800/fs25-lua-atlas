---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Cover.lua (generated stub, FS25 Lua Atlas)

---@class Cover
Cover = {}

---@param specializations any
function Cover.prerequisitesPresent(specializations) end

function Cover.initSpecialization() end

---@param vehicleType any
function Cover.registerFunctions(vehicleType) end

---@param vehicleType any
function Cover.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function Cover.registerEventListeners(vehicleType) end

---@param savegame any
function Cover:onLoad(savegame) end

---@param savegame any
function Cover:onPostLoad(savegame) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function Cover:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId any
---@param connection any
function Cover:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function Cover:onWriteStream(streamId, connection) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Cover:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param xmlFile any
---@param key any
---@param cover any
function Cover:loadCoverFromXML(xmlFile, key, cover) end

---@param state any
---@param noEventSend any
function Cover:setCoverState(state, noEventSend) end

---@param animation any
function Cover:playCoverAnimation(animation) end

---@param fillUnitIndex any
function Cover:getCoverByFillUnitIndex(fillUnitIndex) end

---@param nextState any
function Cover:getIsNextCoverStateAllowed(nextState) end

---@param nextState any
function Cover:getIsNextCoverStateAllowedWarning(nextState) end

---@param superFunc any
---@param fillUnitIndex any
---@param toolType any
function Cover:getFillUnitSupportsToolType(superFunc, fillUnitIndex, toolType) end

---@param superFunc any
function Cover:getCanBeSelected(superFunc) end

---@param superFunc any
---@param pipeNodes any
---@param xmlFile any
---@param baseKey any
function Cover:loadPipeNodes(superFunc, pipeNodes, xmlFile, baseKey) end

---@param superFunc any
---@param nextPipeState any
function Cover:getIsPipeStateChangeAllowed(superFunc, nextPipeState, ...) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Cover:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param tipSide any
function Cover:onStartTipping(tipSide) end

---@param tipSide any
function Cover:onOpenBackDoor(tipSide) end

---@param superFunc any
function Cover:finishedAIDischarge(superFunc) end

---@param superFunc any
---@param fillUnitIndex any
---@param task any
function Cover:aiPrepareLoading(superFunc, fillUnitIndex, task) end

---@param superFunc any
---@param fillUnitIndex any
---@param task any
function Cover:aiFinishLoading(superFunc, fillUnitIndex, task) end

---@param superFunc any
---@param fillUnitIndex any
---@param isInRange any
function Cover:setFillUnitInTriggerRange(superFunc, fillUnitIndex, isInRange) end

---@param fillTrigger any
---@param fillTypeIndex any
---@param fillUnitIndex any
---@param numTriggers any
function Cover:onFillUnitTriggerChanged(fillTrigger, fillTypeIndex, fillUnitIndex, numTriggers) end

---@param numTriggers any
function Cover:onRemovedFillUnitTrigger(numTriggers) end

---@param self any
function Cover.updateActionText(self) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Cover.actionEventToggleCover(self, actionName, inputValue, callbackState, isAnalog) end
