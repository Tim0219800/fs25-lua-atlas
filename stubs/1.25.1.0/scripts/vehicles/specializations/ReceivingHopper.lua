---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ReceivingHopper.lua (generated stub, FS25 Lua Atlas)

---@class ReceivingHopper
ReceivingHopper = {}

---@param specializations table
---@return boolean
function ReceivingHopper.prerequisitesPresent(specializations) end

function ReceivingHopper.initSpecialization() end

---@param vehicleType any
function ReceivingHopper.registerFunctions(vehicleType) end

---@param vehicleType any
function ReceivingHopper.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function ReceivingHopper.registerEventListeners(vehicleType) end

---@param savegame table
function ReceivingHopper:onLoad(savegame) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function ReceivingHopper:saveToXMLFile(xmlFile, key, usedModNames) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function ReceivingHopper:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param state boolean
---@param noEventSend boolean
function ReceivingHopper:setCreateBoxes(state, noEventSend) end

function ReceivingHopper:getCanSpawnNextBox() end

---@param transformId any
function ReceivingHopper:collisionTestCallback(transformId) end

function ReceivingHopper:createBox() end

---@param vehicles any
---@param vehicleLoadState any
---@param arguments any
function ReceivingHopper:onCreateBoxFinished(vehicles, vehicleLoadState, arguments) end

---@param superFunc any
---@param dischargeNode any
---@param hitObject any
---@param hitShape any
---@param hitDistance any
---@param hitFillUnitIndex any
---@param hitTerrain any
function ReceivingHopper:handleDischargeRaycast(superFunc, dischargeNode, hitObject, hitShape, hitDistance, hitFillUnitIndex, hitTerrain) end

---@param superFunc any
function ReceivingHopper:getCanBeSelected(superFunc) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function ReceivingHopper:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function ReceivingHopper:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function ReceivingHopper.actionEventToggleBoxCreation(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
function ReceivingHopper.updateActionEvents(self) end
