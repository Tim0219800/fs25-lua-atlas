---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Drivable.lua (stub généré, atlas Lua FS25)

---@class Drivable
Drivable = {}

---@param specializations table
---@return boolean
function Drivable.prerequisitesPresent(specializations) end

function Drivable.initSpecialization() end

---@param vehicleType any
function Drivable.registerFunctions(vehicleType) end

---@param vehicleType any
function Drivable.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function Drivable.registerEvents(vehicleType) end

---@param vehicleType any
function Drivable.registerEventListeners(vehicleType) end

---@param savegame table
function Drivable:onLoad(savegame) end

function Drivable:onRegisterDashboardValueTypes() end

function Drivable:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function Drivable:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function Drivable:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function Drivable:onWriteStream(streamId, connection) end

---@param streamId integer
---@param timestamp integer
---@param connection table
function Drivable:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Drivable:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Drivable:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param state integer
---@param noEventSend boolean
function Drivable:setCruiseControlState(state, noEventSend) end

---@param speed number
---@param speedReverse number
function Drivable:setCruiseControlMaxSpeed(speed, speedReverse) end

---@param steeringWheel any
---@param dt any
---@param direction any
function Drivable:updateSteeringWheel(steeringWheel, dt, direction) end

function Drivable:getCruiseControlState() end

function Drivable:getCruiseControlSpeed() end

function Drivable:getCruiseControlMaxSpeed() end

---@return number
---@return boolean
function Drivable:getCruiseControlDisplayInfo() end

function Drivable:getAxisForward() end

function Drivable:getAccelerationAxis() end

function Drivable:getDecelerationAxis() end

function Drivable:getCruiseControlAxis() end

function Drivable:getAcDecelerationAxis() end

function Drivable:getDashboardSteeringAxis() end

function Drivable:getDashboardCombinedPedalLeft() end

function Drivable:getDashboardCombinedPedalRight() end

---@param reverserDirection any
function Drivable:setReverserDirection(reverserDirection) end

function Drivable:getReverserDirection() end

function Drivable:getSteeringDirection() end

function Drivable:getIsDrivingForward() end

function Drivable:getIsDrivingBackward() end

function Drivable:getDrivingDirection() end

function Drivable:getIsVehicleControlledByPlayer() end

---@return boolean
---@return string
function Drivable:getIsPlayerVehicleControlAllowed() end

---@param vehicle table
---@param func function
function Drivable:registerPlayerVehicleControlAllowedFunction(vehicle, func) end

---@param noEventSend boolean
function Drivable:stopMotor(noEventSend) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Drivable:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param wasEntered any
function Drivable:onLeaveVehicle(wasEntered) end

function Drivable:onSetBroken() end

---@param axisForward number
---@param axisSide number
---@param doHandbrake boolean
---@param dt number
function Drivable:updateVehiclePhysics(axisForward, axisSide, doHandbrake, dt) end

---@param inputValue any
function Drivable:setAccelerationPedalInput(inputValue) end

---@param inputValue any
function Drivable:setBrakePedalInput(inputValue) end

---@param speed any
---@param direction any
function Drivable:setTargetSpeedAndDirection(speed, direction) end

---@param inputValue any
---@param isAnalog any
---@param deviceCategory any
function Drivable:setSteeringInput(inputValue, isAnalog, deviceCategory) end

function Drivable:brakeToStop() end

---@param wheel any
---@param dt any
---@param steeringAngle any
function Drivable:updateSteeringAngle(wheel, dt, steeringAngle) end

---@param superFunc any
function Drivable:getIsManualDirectionChangeAllowed(superFunc) end

---@param superFunc any
---@param isPlayerHotspot any
function Drivable:getMapHotspotRotation(superFunc, isPlayerHotspot) end

---@param superFunc integer
---@param direction integer
function Drivable:setTransmissionDirection(superFunc, direction) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Drivable.actionEventAccelerate(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Drivable.actionEventBrake(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
---@param deviceCategory any
---@param binding any
function Drivable.actionEventSteer(self, actionName, inputValue, callbackState, isAnalog, isMouse, deviceCategory, binding) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Drivable.actionEventCruiseControlState(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Drivable.actionEventCruiseControlValue(self, actionName, inputValue, callbackState, isAnalog) end
