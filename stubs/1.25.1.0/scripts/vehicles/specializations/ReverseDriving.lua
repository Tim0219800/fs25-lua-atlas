---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ReverseDriving.lua (stub généré, atlas Lua FS25)

---@class ReverseDriving
ReverseDriving = {}

---@param specializations table
---@return boolean
function ReverseDriving.prerequisitesPresent(specializations) end

function ReverseDriving.initSpecialization() end

function ReverseDriving.postInitSpecialization() end

---@param vehicleType any
function ReverseDriving.registerEvents(vehicleType) end

---@param vehicleType any
function ReverseDriving.registerFunctions(vehicleType) end

---@param vehicleType any
function ReverseDriving.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function ReverseDriving.registerEventListeners(vehicleType) end

---@param savegame table
function ReverseDriving:onLoad(savegame) end

---@param savegame table
function ReverseDriving:onPostLoad(savegame) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function ReverseDriving:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function ReverseDriving:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function ReverseDriving:onWriteStream(streamId, connection) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function ReverseDriving:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param direction number
function ReverseDriving:reverseDirectionChanged(direction) end

---@param isReverseDriving boolean
---@param noEventSend boolean
---@param forceUpdate any
function ReverseDriving:setIsReverseDriving(isReverseDriving, noEventSend, forceUpdate) end

---@param newState any
function ReverseDriving:getIsReverseDrivingAllowed(newState) end

---@param superFunc any
---@param steeringWheel any
---@param dt any
---@param direction any
function ReverseDriving:updateSteeringWheel(superFunc, steeringWheel, dt, direction) end

---@param superFunc any
function ReverseDriving:getSteeringDirection(superFunc) end

---@param superFunc any
function ReverseDriving:getAllowCharacterVisibilityUpdate(superFunc) end

---@param superFunc any
---@param jobClass any
function ReverseDriving:getCanStartAIVehicle(superFunc, jobClass) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param group any
function ReverseDriving:loadDashboardGroupFromXML(superFunc, xmlFile, key, group) end

---@param superFunc any
---@param group any
function ReverseDriving:getIsDashboardGroupActive(superFunc, group) end

---@param superFunc any
function ReverseDriving:getCanBeSelected(superFunc) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param light any
function ReverseDriving:loadAdditionalLightAttributesFromXML(superFunc, xmlFile, key, light) end

---@param superFunc any
---@param light any
function ReverseDriving:getIsLightActive(superFunc, light) end

---@param superFunc any
function ReverseDriving:getAIDirectionNode(superFunc) end

---@param superFunc any
function ReverseDriving:getAIRootNode(superFunc) end

---@param superFunc any
function ReverseDriving:getAIImplementCollisionTrigger(superFunc) end

---@param character any
function ReverseDriving:onVehicleCharacterChanged(character) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function ReverseDriving:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function ReverseDriving.actionEventToggleReverseDriving(self, actionName, inputValue, callbackState, isAnalog) end
