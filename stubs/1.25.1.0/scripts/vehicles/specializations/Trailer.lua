---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Trailer.lua (generated stub, FS25 Lua Atlas)

---@class Trailer
Trailer = {}

---@param specializations any
function Trailer.prerequisitesPresent(specializations) end

function Trailer.initSpecialization() end

---@param vehicleType any
function Trailer.registerEvents(vehicleType) end

---@param vehicleType any
function Trailer.registerFunctions(vehicleType) end

---@param vehicleType any
function Trailer.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function Trailer.registerEventListeners(vehicleType) end

---@param savegame any
function Trailer:onLoad(savegame) end

---@param savegame any
function Trailer:onPostLoad(savegame) end

---@param savegame any
function Trailer:onLoadFinished(savegame) end

function Trailer:onDelete() end

---@param streamId integer
---@param connection Connection
function Trailer:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function Trailer:onWriteStream(streamId, connection) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Trailer:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param xmlFile any
---@param key any
---@param entry any
function Trailer:loadTipSide(xmlFile, key, entry) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function Trailer:saveToXMLFile(xmlFile, key, usedModNames) end

function Trailer:getCanTogglePreferdTipSide() end

---@param sideIndex any
function Trailer:getIsTipSideAvailable(sideIndex) end

---@param index any
function Trailer:getNextAvailableTipSide(index) end

---@param index any
---@param noEventSend any
function Trailer:setPreferedTipSide(index, noEventSend) end

function Trailer:setTipSideUpdateDirty() end

---@param tipSideIndex any
---@param noEventSend any
function Trailer:startTipping(tipSideIndex, noEventSend) end

---@param noEventSend any
function Trailer:stopTipping(noEventSend) end

---@param noEventSend any
function Trailer:endTipping(noEventSend) end

---@param tipSideIndex any
---@param state any
---@param noEventSend any
---@param instantUpdate any
function Trailer:setTrailerDoorState(tipSideIndex, state, noEventSend, instantUpdate) end

---@param tipSideIndex any
function Trailer:getAllowTrailerDoorToggle(tipSideIndex) end

function Trailer:getTipState() end

---@param isOpen any
function Trailer:setTipState(isOpen) end

function Trailer:updateTrailerAutomaticRedischarge() end

---@param superFunc any
---@param dischargeNode any
function Trailer:getDischargeNodeEmptyFactor(superFunc, dischargeNode) end

---@param superFunc any
---@param dischargeNode any
function Trailer:getCanDischargeToGround(superFunc, dischargeNode) end

---@param superFunc any
---@param dischargeNode any
function Trailer:getCanDischargeToObject(superFunc, dischargeNode) end

---@param superFunc any
---@param nextState any
function Trailer:getIsNextCoverStateAllowed(superFunc, nextState) end

---@param superFunc any
function Trailer:getCanBeSelected(superFunc) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Trailer:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param dischargeState any
function Trailer:onDischargeStateChanged(dischargeState) end

function Trailer:onDeactivate() end

---@param superFunc any
---@param dischargeNode any
function Trailer:getAIHasFinishedDischarge(superFunc, dischargeNode) end

---@param superFunc any
---@param dischargeNode any
---@param task any
function Trailer:startAIDischarge(superFunc, dischargeNode, task) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param spec any
function Trailer:loadPickupFromXML(superFunc, xmlFile, key, spec) end

---@param superFunc any
---@param spec any
---@param newState any
function Trailer:getCanChangePickupState(superFunc, spec, newState) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param turnedOnAnimation any
function Trailer:loadTurnedOnAnimationFromXML(superFunc, xmlFile, key, turnedOnAnimation) end

---@param superFunc any
function Trailer:getRequiresPower(superFunc) end

---@param superFunc any
---@param state any
---@param noEventSend any
function Trailer:setManualDischargeState(superFunc, state, noEventSend) end

---@param superFunc any
---@param turnedOnAnimation any
function Trailer:getIsTurnedOnAnimationActive(superFunc, turnedOnAnimation) end

function Trailer:onRegisterAnimationValueTypes() end

---@param trigger any
---@param name any
---@param xmlFile any
---@param key any
function Trailer:onRegisterExternalActionEvents(trigger, name, xmlFile, key) end

---@param data any
---@param vehicle any
function Trailer.externalActionEventDoorToggleRegister(data, vehicle) end

---@param data any
---@param vehicle any
function Trailer.externalActionEventDoorToggleUpdate(data, vehicle) end

---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function Trailer:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Trailer.actionEventToggleTipSide(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Trailer.actionEventManualToggleTip(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Trailer.actionEventManualToggleDoor(self, actionName, inputValue, callbackState, isAnalog) end
