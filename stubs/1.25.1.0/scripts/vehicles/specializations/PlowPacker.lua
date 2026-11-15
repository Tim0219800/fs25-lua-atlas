---@meta
-- FS25 1.25.1.0 : vehicles/specializations/PlowPacker.lua (stub généré, atlas Lua FS25)

---@class PlowPacker
PlowPacker = {}

function PlowPacker.initSpecialization() end

---@param specializations any
function PlowPacker.prerequisitesPresent(specializations) end

---@param vehicleType any
function PlowPacker.registerFunctions(vehicleType) end

---@param vehicleType any
function PlowPacker.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function PlowPacker.registerEventListeners(vehicleType) end

---@param savegame any
function PlowPacker:onLoad(savegame) end

---@param savegame any
function PlowPacker:onPostLoad(savegame) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlowPacker:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function PlowPacker:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlowPacker:onWriteStream(streamId, connection) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function PlowPacker:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function PlowPacker:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param superFunc any
---@param rotationMax any
---@param noEventSend any
---@param turnAnimationTime any
function PlowPacker:setRotationMax(superFunc, rotationMax, noEventSend, turnAnimationTime) end

---@param superFunc any
---@param excludedGroundTypes any
function PlowPacker:setPlowAIRequirements(superFunc, excludedGroundTypes) end

---@param superFunc any
---@param direction any
---@param moveToMiddle any
---@param noEventSend any
function PlowPacker:setFoldState(superFunc, direction, moveToMiddle, noEventSend) end

---@param superFunc any
---@param workArea any
---@param dt any
function PlowPacker:processCultivatorArea(superFunc, workArea, dt) end

---@param superFunc any
---@return boolean
function PlowPacker:getUseCultivatorAIRequirements(superFunc) end

---@param newState any
---@param updateAnimations any
---@param noEventSend any
function PlowPacker:setPackerState(newState, updateAnimations, noEventSend) end

function PlowPacker:getIsPackerAllowed() end

---@param lowered any
function PlowPacker:onSetLowered(lowered) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function PlowPacker:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
function PlowPacker.updateActionEventText(self) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function PlowPacker.actionEventPackerDeactivate(self, actionName, inputValue, callbackState, isAnalog, isMouse) end
