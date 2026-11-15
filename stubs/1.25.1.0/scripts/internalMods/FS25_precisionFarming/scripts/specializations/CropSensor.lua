---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/CropSensor.lua (stub généré, atlas Lua FS25)

---@class CropSensor
CropSensor = {}

---@param specializations table
---@return boolean
function CropSensor.prerequisitesPresent(specializations) end

function CropSensor.initSpecialization() end

---@param savegame any
function CropSensor:onLoad(savegame) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function CropSensor:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function CropSensor:onDraw() end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function CropSensor:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param rootVehicle table
function CropSensor:onRootVehicleChanged(rootVehicle) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function CropSensor.actionEventToggle(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
function CropSensor.updateActionEventTexts(self) end

---@param self any
---@param direction any
function CropSensor.actionControllerToggleEvent(self, direction) end

---@param superFunc any
---@return boolean
function CropSensor:doCheckSpeedLimit(superFunc) end

---@param superFunc any
function CropSensor:getUseTurnedOnSchema(superFunc) end

---@param state any
---@param noEventSend any
function CropSensor:setCropSensorActive(state, noEventSend) end

function CropSensor:updateCropSensorWorkingWidth() end

---@param sensorNode any
---@param workingWidth any
function CropSensor:updateSensorRadius(sensorNode, workingWidth) end

---@param sensorNode any
function CropSensor:updateSensorNode(sensorNode) end

---@param linkData any
function CropSensor:linkCropSensor(linkData) end

---@param sensorVehicle any
function CropSensor.getMaxWorkingWidth(sensorVehicle) end
