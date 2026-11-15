---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AttacherJointControl.lua (generated stub, FS25 Lua Atlas)

---@class AttacherJointControl
AttacherJointControl = {}

---@param specializations table
---@return boolean
function AttacherJointControl.prerequisitesPresent(specializations) end

function AttacherJointControl.initSpecialization() end

---@param vehicleType any
function AttacherJointControl.registerFunctions(vehicleType) end

---@param vehicleType any
function AttacherJointControl.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function AttacherJointControl.registerEventListeners(vehicleType) end

---@param savegame table
function AttacherJointControl:onLoad(savegame) end

function AttacherJointControl:onDelete() end

---@param streamId integer
---@param connection Connection
function AttacherJointControl:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AttacherJointControl:onWriteStream(streamId, connection) end

---@param streamId integer
---@param timestamp integer
---@param connection table
function AttacherJointControl:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function AttacherJointControl:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AttacherJointControl:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param control table
---@param moveAlpha number
---@param automaticControl any
---@param noEventSend any
function AttacherJointControl:controlAttacherJoint(control, moveAlpha, automaticControl, noEventSend) end

---@param moveAlpha number
---@return number
function AttacherJointControl:controlAttacherJointHeight(moveAlpha) end

---@param moveAlpha number
---@return number
function AttacherJointControl:controlAttacherJointTilt(moveAlpha) end

---@return boolean
function AttacherJointControl:getControlAttacherJointDirection() end

---@return boolean
function AttacherJointControl:getIsAttacherJointControlDampingAllowed() end

---@param superFunc table
---@param xmlFile any
---@param key any
---@param inputAttacherJoint any
---@param i any
function AttacherJointControl:loadInputAttacherJoint(superFunc, xmlFile, key, inputAttacherJoint, i) end

---@param superFunc any
---@param actionEventsTable any
---@param inputAction any
---@param target any
---@param callback any
---@param triggerUp any
---@param triggerDown any
---@param triggerAlways any
---@param startActive any
---@param callbackState any
---@param customIconName any
function AttacherJointControl:registerLoweringActionEvent(superFunc, actionEventsTable, inputAction, target, callback, triggerUp, triggerDown, triggerAlways, startActive, callbackState, customIconName) end

---@param superFunc any
function AttacherJointControl:getLoweringActionEventState(superFunc) end

---@param superFunc any
function AttacherJointControl:getCanBeSelected(superFunc) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function AttacherJointControl:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
---@param loadFromSavegame any
function AttacherJointControl:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

---@param attacherVehicle table
---@param implement table
function AttacherJointControl:onPreDetach(attacherVehicle, implement) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AttacherJointControl.actionEventAttacherJointControl(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AttacherJointControl.actionEventAttacherJointControlSetPoint(self, actionName, inputValue, callbackState, isAnalog) end
