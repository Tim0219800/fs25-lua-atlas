---@meta
-- FS25 1.25.1.0 : vehicles/specializations/WorkMode.lua (generated stub, FS25 Lua Atlas)

---@class WorkMode
WorkMode = {}

---@param specializations table
---@return boolean
function WorkMode.prerequisitesPresent(specializations) end

function WorkMode.initSpecialization() end

---@param schema any
---@param basePath any
function WorkMode.registerWorkModeXMLPaths(schema, basePath) end

---@param vehicleType table
function WorkMode.registerEvents(vehicleType) end

---@param vehicleType any
function WorkMode.registerFunctions(vehicleType) end

---@param vehicleType any
function WorkMode.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function WorkMode.registerEventListeners(vehicleType) end

---@param savegame table
function WorkMode:onLoad(savegame) end

---@param savegame any
function WorkMode:onPostLoad(savegame) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function WorkMode:saveToXMLFile(xmlFile, key, usedModNames) end

function WorkMode:onDelete() end

---@param streamId integer
---@param connection Connection
function WorkMode:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function WorkMode:onWriteStream(streamId, connection) end

---@param streamId integer
---@param timestamp integer
---@param connection table
function WorkMode:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function WorkMode:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt number
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function WorkMode:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function WorkMode:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function WorkMode:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function WorkMode:onDeactivate() end

function WorkMode:deactivateWindrowerEffects() end

---@param xmlFile any
---@param key any
---@param workMode any
function WorkMode:loadWorkModeFromXML(xmlFile, key, workMode) end

---@param state integer
---@param noEventSend boolean
function WorkMode:setWorkMode(state, noEventSend) end

---@param superFunc any
---@param workArea any
function WorkMode:getIsWorkAreaActive(superFunc, workArea) end

---@param superFunc any
function WorkMode:getCanBeSelected(superFunc) end

---@param superFunc any
function WorkMode:getAllowsLowering(superFunc) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param sprayType any
function WorkMode:loadSprayTypeFromXML(superFunc, xmlFile, key, sprayType) end

---@param superFunc any
---@param sprayType any
function WorkMode:getIsSprayTypeActive(superFunc, sprayType) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function WorkMode:loadMovingToolFromXML(superFunc, xmlFile, key, entry) end

---@param superFunc any
---@param movingTool any
function WorkMode:getIsMovingToolActive(superFunc, movingTool) end

---@param superFunc any
function WorkMode:getAreEffectsVisible(superFunc) end

---@return boolean
function WorkMode:getIsWorkModeChangeAllowed() end

function WorkMode:onTurnedOff() end

function WorkMode:onTurnedOn() end

---@param lowered boolean
function WorkMode:onSetLowered(lowered) end

---@param direction integer
---@param moveToMiddle any
function WorkMode:onFoldStateChanged(direction, moveToMiddle) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function WorkMode:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function WorkMode.actionEventWorkModeChange(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function WorkMode.actionEventWorkModeChangeDirect(self, actionName, inputValue, callbackState, isAnalog) end
