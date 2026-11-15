---@meta
-- FS25 1.25.1.0 : vehicles/specializations/RidgeMarker.lua (stub généré, atlas Lua FS25)

---@class RidgeMarker
RidgeMarker = {}

function RidgeMarker.initSpecialization() end

---@param schema any
---@param baseKey any
function RidgeMarker.registerRidgeMarkerXMLPaths(schema, baseKey) end

---@param schema any
---@param baseKey any
function RidgeMarker.registerRidgeMarkerAreaXMLPaths(schema, baseKey) end

---@param specializations table
---@return boolean
function RidgeMarker.prerequisitesPresent(specializations) end

---@param vehicleType any
function RidgeMarker.registerFunctions(vehicleType) end

---@param vehicleType any
function RidgeMarker.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function RidgeMarker.registerEventListeners(vehicleType) end

---@param savegame table
function RidgeMarker:onLoad(savegame) end

---@param savegame any
function RidgeMarker:onPostLoad(savegame) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function RidgeMarker:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function RidgeMarker:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function RidgeMarker:onWriteStream(streamId, connection) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function RidgeMarker:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param xmlFile any
---@param key any
---@param ridgeMarker any
function RidgeMarker:loadRidgeMarker(xmlFile, key, ridgeMarker) end

---@param state integer
---@param noEventSend boolean
function RidgeMarker:setRidgeMarkerState(state, noEventSend) end

---@param state integer
---@return boolean
function RidgeMarker:canFoldRidgeMarker(state) end

---@param workArea any
---@param dt any
function RidgeMarker:processRidgeMarkerArea(workArea, dt) end

---@param superFunc table
---@param workArea table
---@param xmlFile XMLFile
---@param key string
---@return boolean
function RidgeMarker:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

---@param superFunc table
---@param speedRotatingPart table
---@param xmlFile XMLFile
---@param key string
---@return boolean
function RidgeMarker:loadSpeedRotatingPartFromXML(superFunc, speedRotatingPart, xmlFile, key) end

---@param superFunc table
---@param speedRotatingPart table
---@return boolean
function RidgeMarker:getIsSpeedRotatingPartActive(superFunc, speedRotatingPart) end

---@param superFunc any
function RidgeMarker:getCanBeSelected(superFunc) end

---@param superFunc table
---@param workArea table
---@return boolean
function RidgeMarker:getIsWorkAreaActive(superFunc, workArea) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function RidgeMarker:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param lowered boolean
function RidgeMarker:onSetLowered(lowered) end

---@param direction integer
---@param moveToMiddle boolean
function RidgeMarker:onFoldStateChanged(direction, moveToMiddle) end

function RidgeMarker:onAIImplementStart() end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function RidgeMarker.actionEventToggleRidgeMarkers(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
function RidgeMarker.updateActionEvents(self) end
