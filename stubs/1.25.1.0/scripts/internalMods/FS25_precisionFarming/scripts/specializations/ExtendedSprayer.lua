---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayer.lua (generated stub, FS25 Lua Atlas)

---@class ExtendedSprayer
ExtendedSprayer = {}

---@param specializations table
---@return boolean
function ExtendedSprayer.prerequisitesPresent(specializations) end

function ExtendedSprayer.initSpecialization() end

---@param savegame any
function ExtendedSprayer:onPostLoad(savegame) end

function ExtendedSprayer:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function ExtendedSprayer:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function ExtendedSprayer:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function ExtendedSprayer:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function ExtendedSprayer:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function ExtendedSprayer:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ExtendedSprayer:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ExtendedSprayer:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param fillUnitIndex any
---@param fillTypeIndex any
---@param oldFillTypeIndex any
function ExtendedSprayer:onChangedFillType(fillUnitIndex, fillTypeIndex, oldFillTypeIndex) end

function ExtendedSprayer:onTurnedOn() end

function ExtendedSprayer:onTurnedOff() end

---@param state any
---@param data any
function ExtendedSprayer:onStateChange(state, data) end

function ExtendedSprayer:onVariableWorkWidthSectionChanged() end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function ExtendedSprayer:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
function ExtendedSprayer.getValidSprayerToUse(self) end

---@param vehicle any
function ExtendedSprayer.getIsVehicleValid(vehicle) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function ExtendedSprayer.actionEventToggleAuto(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function ExtendedSprayer.actionEventChangeSprayAmount(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function ExtendedSprayer.actionEventChangeDefaultFruitRequirement(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
function ExtendedSprayer.updateActionEventState(self) end

---@param self any
function ExtendedSprayer.updateActionEventAutoModeDefault(self) end

---@param sprayer any
function ExtendedSprayer.getFillTypeSourceVehicle(sprayer) end

function ExtendedSprayer:getCurrentSprayerMode() end

---@param lastChangeLevels any
function ExtendedSprayer:getCurrentNitrogenLevelOffset(lastChangeLevels) end

---@param lastChangeLevels any
function ExtendedSprayer:getCurrentNitrogenUsageLevelOffset(lastChangeLevels) end

function ExtendedSprayer:getUseExtendedSprayerHudExtension() end

function ExtendedSprayer:getShowExtendedSprayerHudExtension() end

function ExtendedSprayer:getIsUsingExactNitrogenAmount() end

---@param self any
function ExtendedSprayer.updateMinimapActiveState(self) end

function ExtendedSprayer:getIsPrecisionSprayingRequired() end

---@param self any
---@param force any
function ExtendedSprayer.updateSprayerEffectState(self, force) end

---@param superFunc integer
---@param workAreaIndex integer
---@param workArea any
function ExtendedSprayer:updateWorkAreaWidth(superFunc, workAreaIndex, workArea) end

---@param superFunc any
---@param fillType any
---@param dt any
function ExtendedSprayer:getSprayerUsage(superFunc, fillType, dt) end

---@param superFunc any
---@param workArea any
---@param dt any
function ExtendedSprayer:processSprayerArea(superFunc, workArea, dt) end

---@param superFunc any
function ExtendedSprayer:changeSeedIndex(superFunc, ...) end

---@param superFunc any
---@param sprayTypeIndex any
function ExtendedSprayer:getSprayerDoubledAmountActive(superFunc, sprayTypeIndex) end

---@param superFunc any
---@param force any
function ExtendedSprayer:updateSprayerEffects(superFunc, force) end

---@param superFunc any
---@param effectData any
---@param dt any
---@param isTurnedOn any
---@param lastSpeed any
function ExtendedSprayer:updateExtendedSprayerNozzleEffectState(superFunc, effectData, dt, isTurnedOn, lastSpeed) end

---@param superFunc any
---@param fillType any
function ExtendedSprayer:setSprayerAITerrainDetailProhibitedRange(superFunc, fillType) end

---@param workArea any
---@param dt any
function ExtendedSprayer:preProcessExtUnderRootFertilizerArea(workArea, dt) end

---@param dt any
---@param hasProcessed any
function ExtendedSprayer:onEndWorkAreaProcessing(dt, hasProcessed) end

---@param state any
---@param noEventSend any
function ExtendedSprayer:setSprayAmountAutoMode(state, noEventSend) end

---@param value any
---@param noEventSend any
function ExtendedSprayer:setSprayAmountManualValue(value, noEventSend) end

---@param index any
function ExtendedSprayer:setSprayAmountAutoFruitTypeIndex(index) end

---@param index any
---@param noEventSend any
function ExtendedSprayer:setSprayAmountDefaultFruitRequirementIndex(index, noEventSend) end

---@param values any
function ExtendedSprayer:updateDebugValues(values) end
