---@meta
-- FS25 1.25.1.0 : vehicles/specializations/CrabSteering.lua (stub généré, atlas Lua FS25)

---@class CrabSteering
CrabSteering = {}

---@param specializations table
---@return boolean
function CrabSteering.prerequisitesPresent(specializations) end

function CrabSteering.initSpecialization() end

---@param schema any
---@param basePath any
function CrabSteering.registerSteeringModeXMLPaths(schema, basePath) end

---@param vehicleType any
function CrabSteering.registerFunctions(vehicleType) end

---@param vehicleType any
function CrabSteering.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function CrabSteering.registerEventListeners(vehicleType) end

---@param savegame table
function CrabSteering:onLoad(savegame) end

---@param savegame any
function CrabSteering:onPostLoad(savegame) end

function CrabSteering:onRegisterDashboardValueTypes() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function CrabSteering:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function CrabSteering:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function CrabSteering:onWriteStream(streamId, connection) end

---@param streamId integer
---@param timestamp integer
---@param connection table
function CrabSteering:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function CrabSteering:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function CrabSteering:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param xmlFile any
---@param key any
---@param mode any
function CrabSteering:loadCrabSteeringModeFromXML(xmlFile, key, mode) end

---@return boolean
---@return string
function CrabSteering:getCanToggleCrabSteering() end

---@param state integer
---@param noEventSend boolean
function CrabSteering:setCrabSteering(state, noEventSend) end

---@param superFunc any
---@param wheel any
function CrabSteering:loadWheelFromXML(superFunc, wheel) end

---@param superFunc table
---@param wheel table
---@param dt number
---@param steeringAngle number
---@return number
function CrabSteering:updateSteeringAngle(superFunc, wheel, dt, steeringAngle) end

---@param steeringAngle number
---@param dt number
---@return number
function CrabSteering:updateArticulatedAxisRotation(steeringAngle, dt) end

---@param superFunc any
function CrabSteering:getCanBeSelected(superFunc) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param wheelConfigurationI any
function CrabSteering:loadWheelsFromXML(superFunc, xmlFile, key, wheelConfigurationI) end

---@param superFunc any
---@param steeringWheel any
---@param dt any
---@param direction any
function CrabSteering:updateSteeringWheel(superFunc, steeringWheel, dt, direction) end

---@param superFunc any
function CrabSteering:startFieldWorker(superFunc) end

---@param superFunc any
function CrabSteering:getAIAutomaticSteeringLookAheadDistance(superFunc) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function CrabSteering:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function CrabSteering.actionEventToggleCrabSteeringModes(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function CrabSteering.actionEventSetCrabSteeringMode(self, actionName, inputValue, callbackState, isAnalog) end
