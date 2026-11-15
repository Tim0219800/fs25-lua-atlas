---@meta
-- FS25 1.25.1.0 : vehicles/specializations/TurnOnVehicle.lua (stub généré, atlas Lua FS25)

---@class TurnOnVehicle
TurnOnVehicle = {}

---@param specializations any
function TurnOnVehicle.prerequisitesPresent(specializations) end

function TurnOnVehicle.initSpecialization() end

---@param vehicleType any
function TurnOnVehicle.registerEvents(vehicleType) end

---@param vehicleType any
function TurnOnVehicle.registerFunctions(vehicleType) end

---@param vehicleType any
function TurnOnVehicle.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function TurnOnVehicle.registerEventListeners(vehicleType) end

---@param savegame table
function TurnOnVehicle:onLoad(savegame) end

function TurnOnVehicle:onRegisterDashboardValueTypes() end

function TurnOnVehicle:onDelete() end

---@param streamId integer
---@param connection Connection
function TurnOnVehicle:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function TurnOnVehicle:onWriteStream(streamId, connection) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TurnOnVehicle:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TurnOnVehicle:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isTurnedOn boolean
---@param noEventSend boolean
function TurnOnVehicle:setIsTurnedOn(isTurnedOn, noEventSend) end

function TurnOnVehicle:onTurnedOn() end

function TurnOnVehicle:onTurnedOff() end

---@return boolean
function TurnOnVehicle:getIsTurnedOn() end

---@return boolean
function TurnOnVehicle:getCanBeTurnedOn() end

---@return boolean
function TurnOnVehicle:getCanBeTurnedOnAll() end

---@return boolean
function TurnOnVehicle:getCanToggleTurnedOn() end

---@return string
function TurnOnVehicle:getTurnedOnNotAllowedWarning() end

function TurnOnVehicle:getAIRequiresTurnOn() end

function TurnOnVehicle:getRequiresTurnOn() end

function TurnOnVehicle:getAIRequiresTurnOffOnHeadland() end

---@param xmlFile any
---@param key any
---@param turnedOnAnimation any
function TurnOnVehicle:loadTurnedOnAnimationFromXML(xmlFile, key, turnedOnAnimation) end

---@param turnedOnAnimation any
function TurnOnVehicle:getIsTurnedOnAnimationActive(turnedOnAnimation) end

---@param superFunc any
function TurnOnVehicle:getUseTurnedOnSchema(superFunc) end

---@param superFunc table
---@param xmlFile any
---@param key any
---@param inputAttacherJoint any
---@param i any
function TurnOnVehicle:loadInputAttacherJoint(superFunc, xmlFile, key, inputAttacherJoint, i) end

---@param superFunc table
---@param workArea table
---@param xmlFile XMLFile
---@param key string
function TurnOnVehicle:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

---@param superFunc table
---@param workArea table
---@return boolean
function TurnOnVehicle:getIsWorkAreaActive(superFunc, workArea) end

---@param superFunc any
---@param isTurning any
---@return boolean
function TurnOnVehicle:getCanAIImplementContinueWork(superFunc, isTurning) end

---@param superFunc any
---@return boolean
function TurnOnVehicle:getIsOperating(superFunc) end

---@param superFunc any
---@param alarmTrigger any
function TurnOnVehicle:getAlarmTriggerIsActive(superFunc, alarmTrigger) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param alarmTrigger any
---@param fillUnit any
function TurnOnVehicle:loadAlarmTrigger(superFunc, xmlFile, key, alarmTrigger, fillUnit) end

---@param superFunc any
---@param fillUnitIndex any
function TurnOnVehicle:getIsFillUnitActive(superFunc, fillUnitIndex) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param shovelNode any
function TurnOnVehicle:loadShovelNode(superFunc, xmlFile, key, shovelNode) end

---@param superFunc any
---@param shovelNode any
function TurnOnVehicle:getShovelNodeIsActive(superFunc, shovelNode) end

---@param superFunc any
function TurnOnVehicle:getIsSeedChangeAllowed(superFunc) end

---@param superFunc any
function TurnOnVehicle:getCanBeSelected(superFunc) end

---@param superFunc any
function TurnOnVehicle:getIsPowerTakeOffActive(superFunc) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function TurnOnVehicle:loadDischargeNode(superFunc, xmlFile, key, entry) end

---@param superFunc any
---@param dischargeNode any
function TurnOnVehicle:getIsDischargeNodeActive(superFunc, dischargeNode) end

---@param superFunc any
---@param xmlFile any
---@param key any
function TurnOnVehicle:loadBunkerSiloCompactorFromXML(superFunc, xmlFile, key) end

---@param superFunc any
function TurnOnVehicle:getBunkerSiloCompacterScale(superFunc) end

---@param superFunc any
function TurnOnVehicle:getIsWorkModeChangeAllowed(superFunc) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function TurnOnVehicle:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param trigger any
---@param name any
---@param xmlFile any
---@param key any
function TurnOnVehicle:onRegisterExternalActionEvents(trigger, name, xmlFile, key) end

---@param alarmTrigger any
---@param state any
function TurnOnVehicle:onAlarmTriggerChanged(alarmTrigger, state) end

function TurnOnVehicle:onSetBroken() end

---@param state any
---@param data any
function TurnOnVehicle:onStateChange(state, data) end

function TurnOnVehicle:onDeactivate() end

---@param attacherVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
function TurnOnVehicle:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

---@param attacherVehicle table
---@param implement table
function TurnOnVehicle:onPreDetach(attacherVehicle, implement) end

---@param rootVehicle table
function TurnOnVehicle:onRootVehicleChanged(rootVehicle) end

---@param self any
---@param direction any
function TurnOnVehicle.actionControllerTurnOnEvent(self, direction) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function TurnOnVehicle.actionEventTurnOn(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function TurnOnVehicle.actionEventTurnOnAll(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
function TurnOnVehicle.updateActionEvents(self) end

---@param data any
---@param vehicle any
function TurnOnVehicle.externalActionEventRegister(data, vehicle) end

---@param data any
---@param vehicle any
function TurnOnVehicle.externalActionEventUpdate(data, vehicle) end

function TurnOnVehicle:getTurnedOnSpeedFactor() end

---@param self any
---@param xmlFile any
---@param key any
---@param dashboard any
---@param isActive any
function TurnOnVehicle.dashboardRpmAttributes(self, xmlFile, key, dashboard, isActive) end

---@param self any
---@param dashboard any
function TurnOnVehicle.dashboardRpmValue(self, dashboard) end
