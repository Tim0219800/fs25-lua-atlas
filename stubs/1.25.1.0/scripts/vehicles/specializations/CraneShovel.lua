---@meta
-- FS25 1.25.1.0 : vehicles/specializations/CraneShovel.lua (stub généré, atlas Lua FS25)

---@param specializations table
---@return boolean
function CraneShovel.prerequisitesPresent(specializations) end

function CraneShovel.initSpecialization() end

---@param vehicleType table
function CraneShovel.registerFunctions(vehicleType) end

---@param vehicleType table
function CraneShovel.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType table
function CraneShovel.registerEventListeners(vehicleType) end

---@param savegame table
function CraneShovel:onLoad(savegame) end

---@param savegame any
function CraneShovel:onPostLoad(savegame) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function CraneShovel:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId any
---@param connection any
function CraneShovel:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function CraneShovel:onWriteStream(streamId, connection) end

---@param direction any
---@param moveToMiddle any
function CraneShovel:onFoldStateChanged(direction, moveToMiddle) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function CraneShovel:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function CraneShovel.actionEvent(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
function CraneShovel.updateActionEvents(self) end

---@param spec any
---@param xmlFile any
---@param key any
function CraneShovel:loadCraneShovelFromXML(spec, xmlFile, key) end

---@param state any
---@param skipAnimation any
---@param noEventSend any
function CraneShovel:setCraneShovelState(state, skipAnimation, noEventSend) end

---@param spec any
function CraneShovel:getCraneShovelStateChangedAllowed(spec) end

---@param superFunc any
---@param dischargeNode any
function CraneShovel:getIsDischargeNodeActive(superFunc, dischargeNode) end

---@param superFunc any
---@param shovelNode any
function CraneShovel:getShovelNodeIsActive(superFunc, shovelNode) end
