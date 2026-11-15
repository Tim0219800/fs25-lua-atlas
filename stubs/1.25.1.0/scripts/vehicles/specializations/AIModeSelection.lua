---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AIModeSelection.lua (generated stub, FS25 Lua Atlas)

---@class AIModeSelection
AIModeSelection = {}

---@param specializations table
---@return boolean
function AIModeSelection.prerequisitesPresent(specializations) end

function AIModeSelection.initSpecialization() end

---@param vehicleType any
function AIModeSelection.registerEvents(vehicleType) end

---@param vehicleType any
function AIModeSelection.registerFunctions(vehicleType) end

---@param vehicleType any
function AIModeSelection.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function AIModeSelection.registerEventListeners(vehicleType) end

---@param savegame table
function AIModeSelection:onLoad(savegame) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function AIModeSelection:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function AIModeSelection:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AIModeSelection:onWriteStream(streamId, connection) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function AIModeSelection:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function AIModeSelection:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param state any
---@param data any
function AIModeSelection:onStateChange(state, data) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function AIModeSelection:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
---@param deviceCategory any
---@param binding any
---@param isReset any
function AIModeSelection.actionEventToggleAIState(self, actionName, inputValue, callbackState, isAnalog, isMouse, deviceCategory, binding, isReset) end

---@param aiMode any
---@param noEventSend any
function AIModeSelection:setAIModeSelection(aiMode, noEventSend) end

function AIModeSelection:getAIModeSelection() end

---@param aiMode any
---@param fieldCourseSettings any
function AIModeSelection:aiModeSettingsChanged(aiMode, fieldCourseSettings) end

function AIModeSelection:initializeLoadedAIModeUserSettings() end

function AIModeSelection:getAIModeFieldCourseSettings() end

---@param fieldCourseSettings any
function AIModeSelection:setAIModeFieldCourseSettings(fieldCourseSettings) end

---@param streamId any
---@param connection any
function AIModeSelection.readAIModeSettingsFromStream(streamId, connection) end

---@param data any
function AIModeSelection:applyReadAIModeSettingsFromStream(data) end

---@param streamId any
---@param connection any
function AIModeSelection:writeAIModeSettingsToStream(streamId, connection) end
