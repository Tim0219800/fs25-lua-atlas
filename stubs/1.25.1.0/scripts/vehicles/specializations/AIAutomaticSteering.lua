---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AIAutomaticSteering.lua (generated stub, FS25 Lua Atlas)

---@class AIAutomaticSteering
AIAutomaticSteering = {}

---@param specializations table
---@return boolean
function AIAutomaticSteering.prerequisitesPresent(specializations) end

function AIAutomaticSteering.initSpecialization() end

---@param vehicleType any
function AIAutomaticSteering.registerEvents(vehicleType) end

---@param vehicleType table
function AIAutomaticSteering.registerFunctions(vehicleType) end

---@param vehicleType table
function AIAutomaticSteering.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType table
function AIAutomaticSteering.registerEventListeners(vehicleType) end

---@param savegame table
function AIAutomaticSteering:onLoad(savegame) end

---@param savegame any
function AIAutomaticSteering:onPostLoad(savegame) end

function AIAutomaticSteering:onRegisterDashboardValueTypes() end

function AIAutomaticSteering:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function AIAutomaticSteering:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function AIAutomaticSteering:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AIAutomaticSteering:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function AIAutomaticSteering:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function AIAutomaticSteering:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AIAutomaticSteering:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AIAutomaticSteering:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param state any
---@param data any
function AIAutomaticSteering:onStateChange(state, data) end

---@param aiMode any
function AIAutomaticSteering:onAIModeChanged(aiMode) end

---@param aiMode any
function AIAutomaticSteering:onAIModeSettingsChanged(aiMode) end

function AIAutomaticSteering:onAIAutomaticSteeringLineEnd() end

function AIAutomaticSteering:onActivate() end

---@param wasEntered any
function AIAutomaticSteering:onLeaveVehicle(wasEntered) end

function AIAutomaticSteering:getAttacherToolWorkingWidth() end

function AIAutomaticSteering:getIsAutomaticSteeringAllowed() end

---@param isEnabled any
---@param segmentIndex any
---@param segmentIsLeft any
---@param noEventSend any
function AIAutomaticSteering:setAIAutomaticSteeringEnabled(isEnabled, segmentIndex, segmentIsLeft, noEventSend) end

---@param steeringFieldCourse any
---@param noEventSend any
function AIAutomaticSteering:setAIAutomaticSteeringCourse(steeringFieldCourse, noEventSend) end

---@param x any
---@param z any
---@param fieldCourseSettings any
function AIAutomaticSteering:generateSteeringFieldCourse(x, z, fieldCourseSettings) end

function AIAutomaticSteering:getIsAIAutomaticSteeringAllowed() end

function AIAutomaticSteering:getAIAutomaticSteeringState() end

function AIAutomaticSteering:getAIAutomaticSteeringLookAheadDistance() end

function AIAutomaticSteering:getIsSideOffsetReversed() end

---@param superFunc any
---@param inputValue any
---@param isAnalog any
---@param deviceCategory any
function AIAutomaticSteering:setSteeringInput(superFunc, inputValue, isAnalog, deviceCategory) end

---@param superFunc any
---@param axisForward any
---@param axisSide any
---@param doHandbrake any
---@param dt any
function AIAutomaticSteering:updateVehiclePhysics(superFunc, axisForward, axisSide, doHandbrake, dt) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function AIAutomaticSteering:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AIAutomaticSteering.actionEventSteering(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
function AIAutomaticSteering.updateActionEvents(self) end

---@param self any
function AIAutomaticSteering.actionEventSteeringLines(self) end
