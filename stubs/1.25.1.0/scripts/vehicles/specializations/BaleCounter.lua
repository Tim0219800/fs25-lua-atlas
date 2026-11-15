---@meta
-- FS25 1.25.1.0 : vehicles/specializations/BaleCounter.lua (generated stub, FS25 Lua Atlas)

---@param specializations table
---@return boolean
function BaleCounter.prerequisitesPresent(specializations) end

function BaleCounter.initSpecialization() end

---@param vehicleType any
function BaleCounter.registerFunctions(vehicleType) end

---@param vehicleType any
function BaleCounter.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function BaleCounter.registerEventListeners(vehicleType) end

---@param savegame any
function BaleCounter:onLoad(savegame) end

function BaleCounter:onRegisterDashboardValueTypes() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function BaleCounter:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function BaleCounter:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function BaleCounter:onWriteStream(streamId, connection) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function BaleCounter:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param trigger any
---@param name any
---@param xmlFile any
---@param key any
function BaleCounter:onRegisterExternalActionEvents(trigger, name, xmlFile, key) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function BaleCounter.actionEventResetCounter(self, actionName, inputValue, callbackState, isAnalog) end

---@param data any
---@param vehicle any
function BaleCounter.externalActionEventRegister(data, vehicle) end

---@param data any
---@param vehicle any
function BaleCounter.externalActionEventUpdate(data, vehicle) end

---@param noEventSend any
function BaleCounter:doBaleCounterReset(noEventSend) end

---@param superFunc any
---@param baleIndex any
function BaleCounter:dropBale(superFunc, baleIndex) end
