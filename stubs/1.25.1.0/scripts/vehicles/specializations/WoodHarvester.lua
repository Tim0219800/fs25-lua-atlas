---@meta
-- FS25 1.25.1.0 : vehicles/specializations/WoodHarvester.lua (stub généré, atlas Lua FS25)

---@class WoodHarvester
WoodHarvester = {}

---@param specializations any
function WoodHarvester.prerequisitesPresent(specializations) end

function WoodHarvester.initSpecialization() end

---@param vehicleType any
function WoodHarvester.registerEvents(vehicleType) end

---@param vehicleType any
function WoodHarvester.registerFunctions(vehicleType) end

---@param vehicleType any
function WoodHarvester.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function WoodHarvester.registerEventListeners(vehicleType) end

---@param savegame any
function WoodHarvester:onLoad(savegame) end

---@param savegame any
function WoodHarvester:onPostLoad(savegame) end

---@param savegame any
function WoodHarvester:onLoadFinished(savegame) end

function WoodHarvester:onRegisterDashboardValueTypes() end

function WoodHarvester:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function WoodHarvester:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId any
---@param connection any
function WoodHarvester:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function WoodHarvester:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function WoodHarvester:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function WoodHarvester:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function WoodHarvester:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function WoodHarvester:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function WoodHarvester:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function WoodHarvester:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

function WoodHarvester:onDeactivate() end

function WoodHarvester:onTurnedOn() end

function WoodHarvester:onTurnedOff() end

---@param state any
---@param data any
function WoodHarvester:onStateChange(state, data) end

---@param x any
---@param z any
---@param shape any
function WoodHarvester:getCanSplitShapeBeAccessed(x, z, shape) end

---@param headerTilt any
---@param xmlFile any
---@param key any
function WoodHarvester:loadWoodHarvesterHeaderTiltFromXML(headerTilt, xmlFile, key) end

---@param headerTilt any
function WoodHarvester:getIsWoodHarvesterTiltStateAllowed(headerTilt) end

---@param state any
---@param noEventSend any
function WoodHarvester:setWoodHarvesterTiltState(state, noEventSend) end

---@param index any
---@param noEventSend any
function WoodHarvester:setWoodHarvesterCutLengthIndex(index, noEventSend) end

---@param noEventSend any
function WoodHarvester:dropWoodHarvesterTree(noEventSend) end

---@param yOffset number
---@param skipCutAnimation boolean
function WoodHarvester:findSplitShapesInRange(yOffset, skipCutAnimation) end

---@param length any
---@param noEventSend any
function WoodHarvester:cutTree(length, noEventSend) end

---@param radius any
---@param isNewTree any
---@param loadedFromSavegame any
function WoodHarvester:onCutTree(radius, isNewTree, loadedFromSavegame) end

---@param gameSettingId any
---@param state any
function WoodHarvester:onVehicleSettingChanged(gameSettingId, state) end

---@param state any
function WoodHarvester:onDelimbTree(state) end

---@param shape any
---@param isBelow any
---@param isAbove any
---@param minY any
---@param maxY any
---@param minZ any
---@param maxZ any
function WoodHarvester:woodHarvesterSplitShapeCallback(shape, isBelow, isAbove, minY, maxY, minZ, maxZ) end

---@param diameter any
function WoodHarvester:setLastTreeDiameter(diameter) end

---@param superFunc any
function WoodHarvester:getCanBeSelected(superFunc) end

---@param superFunc any
---@return boolean
function WoodHarvester:getDoConsumePtoPower(superFunc) end

---@param superFunc any
function WoodHarvester:getConsumingLoad(superFunc) end

---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function WoodHarvester:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

---@param superFunc any
function WoodHarvester:getSupportsAutoTreeAlignment(superFunc) end

---@param superFunc any
function WoodHarvester:getIsAutoTreeAlignmentAllowed(superFunc) end

---@param superFunc any
---@param radius any
function WoodHarvester:getAutoAlignHasValidTree(superFunc, radius) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function WoodHarvester.actionEventCutTree(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function WoodHarvester.actionEventSetCutlength(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function WoodHarvester.actionEventDropTree(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function WoodHarvester.actionEventTiltHeader(self, actionName, inputValue, callbackState, isAnalog) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function WoodHarvester.loadSpecValueMaxTreeSize(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function WoodHarvester.getSpecValueMaxTreeSize(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
