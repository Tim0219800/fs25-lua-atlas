---@meta
-- FS25 1.25.1.0 : vehicles/specializations/PalletFiller.lua (generated stub, FS25 Lua Atlas)

---@param specializations table
---@return boolean
function PalletFiller.prerequisitesPresent(specializations) end

function PalletFiller.initSpecialization() end

---@param vehicleType any
function PalletFiller.registerFunctions(vehicleType) end

---@param vehicleType any
function PalletFiller.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function PalletFiller.registerEventListeners(vehicleType) end

---@param savegame any
function PalletFiller:onLoad(savegame) end

---@param savegame any
function PalletFiller:onLoadFinished(savegame) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PalletFiller:saveToXMLFile(xmlFile, key, usedModNames) end

function PalletFiller:onDelete() end

---@param streamId integer
---@param connection Connection
function PalletFiller:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PalletFiller:onWriteStream(streamId, connection) end

---@param streamId integer
---@param timestamp integer
---@param connection table
function PalletFiller:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function PalletFiller:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function PalletFiller:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function PalletFiller:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param name any
function PalletFiller:onFinishAnimation(name) end

---@param name any
function PalletFiller:onFoldTimeChanged(name) end

---@param object any
---@param data any
function PalletFiller:loadPalletFillerPallet(object, data) end

---@param object any
function PalletFiller:unloadPalletFillerPallet(object) end

---@param noEventSend any
function PalletFiller:buyPalletFillerPallets(noEventSend) end

---@param self any
---@param vehicles any
---@param vehicleLoadState any
---@param arguments any
function PalletFiller.onCreatePalletFinished(self, vehicles, vehicleLoadState, arguments) end

---@param newState any
function PalletFiller:getCanChangePalletFillerState(newState) end

function PalletFiller:getCanBuyPalletFillerPallets() end

---@param state any
---@param updateAnimations any
---@param noEventSend any
function PalletFiller:setPalletFillerState(state, updateAnimations, noEventSend) end

---@param self any
function PalletFiller.updatePalletFillerDeflectorState(self) end

---@param state any
---@param updateAnimations any
function PalletFiller:setPalletFillerDeflectorState(state, updateAnimations) end

function PalletFiller:getPalletFillerFillStep() end

function PalletFiller:getPalletFillerMovementDirection() end

---@param superFunc any
function PalletFiller:getCanToggleDischargeToObject(superFunc) end

---@param superFunc any
function PalletFiller:getCanToggleDischargeToGround(superFunc) end

---@param superFunc any
function PalletFiller:removeFromPhysics(superFunc) end

---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function PalletFiller:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

---@param superFunc any
---@param display any
function PalletFiller:getFillLevelInformation(superFunc, display) end

---@param superFunc table
---@param object table
---@return boolean
function PalletFiller:getHasObjectMounted(superFunc, object) end

---@param superFunc any
---@param isTurning any
function PalletFiller:getCanAIImplementContinueWork(superFunc, isTurning) end

---@param superFunc any
---@param fruitType any
---@param outputFillType any
function PalletFiller:verifyCombine(superFunc, fruitType, outputFillType, ...) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function PalletFiller:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
function PalletFiller.updateActionEventTexts(self) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function PalletFiller.actionEventLowerPlatformLoad(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function PalletFiller.actionEventLowerPlatformUnload(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function PalletFiller.actionEventBuyPallets(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param object any
function PalletFiller.onObjectDeleted(self, object) end
