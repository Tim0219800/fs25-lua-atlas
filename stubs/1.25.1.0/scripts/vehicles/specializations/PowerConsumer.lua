---@meta
-- FS25 1.25.1.0 : vehicles/specializations/PowerConsumer.lua (generated stub, FS25 Lua Atlas)

---@class PowerConsumer
PowerConsumer = {}

function PowerConsumer.initSpecialization() end

---@param schema any
---@param basePath any
function PowerConsumer.registerPowerConsumerXMLPaths(schema, basePath) end

---@param specializations table
---@return boolean
function PowerConsumer.prerequisitesPresent(specializations) end

---@param vehicleType any
function PowerConsumer.registerFunctions(vehicleType) end

---@param vehicleType any
function PowerConsumer.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function PowerConsumer.registerEventListeners(vehicleType) end

---@param savegame table
function PowerConsumer:onLoad(savegame) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function PowerConsumer:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param xmlFile table
---@param baseKey any
function PowerConsumer:loadPowerSetup(xmlFile, baseKey) end

---@return number
function PowerConsumer:getPtoRpm() end

---@return boolean
function PowerConsumer:getDoConsumePtoPower() end

---@return number
function PowerConsumer:getPowerMultiplier() end

---@param expected any
---@param ignoreTurnOnPeak any
---@return number
function PowerConsumer:getConsumedPtoTorque(expected, ignoreTurnOnPeak) end

function PowerConsumer:getConsumingLoad() end

---@param superFunc any
---@return boolean
function PowerConsumer:getCanBeTurnedOn(superFunc) end

---@param superFunc any
---@return boolean
function PowerConsumer:getCanBeTurnedOnAll(superFunc) end

---@param superFunc any
---@return string
function PowerConsumer:getTurnedOnNotAllowedWarning(superFunc) end

---@param superFunc any
function PowerConsumer:getRawSpeedLimit(superFunc) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param workMode any
function PowerConsumer:loadWorkModeFromXML(superFunc, xmlFile, key, workMode) end

---@param state any
---@param data any
function PowerConsumer:onStateChange(state, data) end

---@param workMode any
---@param oldWorkMode any
function PowerConsumer:onWorkModeChanged(workMode, oldWorkMode) end

function PowerConsumer:onTurnedOn() end

---@param self table?
---@param excludeVehicle table?
---@param expected boolean?
---@param ignoreTurnOnPeak boolean?
---@return number
---@return number
function PowerConsumer.getTotalConsumedPtoTorque(self, excludeVehicle, expected, ignoreTurnOnPeak) end

---@param self any
---@return number
function PowerConsumer.getMaxPtoRpm(self) end

---@param neededMinPtoPower any
---@param neededMaxPtoPower any
---@param forceFactor any
---@param maxForce any
---@param forceDir any
---@param ptoRpm any
function PowerConsumer:consoleSetPowerConsumer(neededMinPtoPower, neededMaxPtoPower, forceFactor, maxForce, forceDir, ptoRpm) end

---@param xmlFile XMLFile
---@param customEnvironment string
---@param baseDir any
---@return number
function PowerConsumer.loadSpecValueNeededPower(xmlFile, customEnvironment, baseDir) end

---@param storeItem table
---@param realItem table
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
---@return string
---@return number
---@return number
function PowerConsumer.getSpecValueNeededPower(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
