---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/SoilSampler.lua (stub généré, atlas Lua FS25)

---@class SoilSampler
SoilSampler = {}

---@param specializations table
---@return boolean
function SoilSampler.prerequisitesPresent(specializations) end

function SoilSampler.initSpecialization() end

---@param savegame any
function SoilSampler:onLoad(savegame) end

---@param savegame any
function SoilSampler:onPostLoad(savegame) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function SoilSampler:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function SoilSampler:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function SoilSampler:onWriteStream(streamId, connection) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function SoilSampler:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param direction any
---@param moveToMiddle any
function SoilSampler:onFoldStateChanged(direction, moveToMiddle) end

function SoilSampler:onLeaveRootVehicle() end

function SoilSampler:onPreDetach() end

---@param noEventSend any
function SoilSampler:startSoilSampling(noEventSend) end

---@param num any
---@param updateVisuals any
function SoilSampler:setNumCollectedSoilSamples(num, updateVisuals) end

function SoilSampler:getNormalizedSampleIndex() end

function SoilSampler:getCanStartSoilSampling() end

function SoilSampler:processSoilSampling() end

---@param noEventSend any
function SoilSampler:sendTakenSoilSamples(noEventSend) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function SoilSampler:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
function SoilSampler.updateActionEventState(self) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function SoilSampler.actionEventStartSample(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function SoilSampler.actionEventSendSamples(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
function SoilSampler.onSendSoilSamplesDialog(self) end

---@param superFunc any
---@return boolean
function SoilSampler:doCheckSpeedLimit(superFunc) end

---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function SoilSampler:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end
