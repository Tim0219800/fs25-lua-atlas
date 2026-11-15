---@meta
-- FS25 1.25.1.0 : vehicles/specializations/LiftableAxle.lua (stub généré, atlas Lua FS25)

---@param specializations table
---@return boolean
function LiftableAxle.prerequisitesPresent(specializations) end

function LiftableAxle.initSpecialization() end

---@param schema any
---@param basePath any
function LiftableAxle.registerXMLPaths(schema, basePath) end

---@param vehicleType table
function LiftableAxle.registerFunctions(vehicleType) end

---@param vehicleType table
function LiftableAxle.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType table
function LiftableAxle.registerEventListeners(vehicleType) end

---@param savegame table
function LiftableAxle:onLoad(savegame) end

---@param savegame any
function LiftableAxle:onPostLoad(savegame) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function LiftableAxle:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId any
---@param connection any
function LiftableAxle:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function LiftableAxle:onWriteStream(streamId, connection) end

---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function LiftableAxle:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

---@param object any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function LiftableAxle:onPreAttachImplement(object, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

---@param implement any
function LiftableAxle:onPreDetachImplement(implement) end

---@param attacherVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
function LiftableAxle:onPreAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

---@param attacherVehicle any
---@param implement any
function LiftableAxle:onPreDetach(attacherVehicle, implement) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function LiftableAxle:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function LiftableAxle.actionEvent(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
function LiftableAxle.updateActionEvents(self) end

---@param state any
---@param fixedHeight any
---@param skipAnimation any
---@param noEventSend any
function LiftableAxle:setLiftableAxleState(state, fixedHeight, skipAnimation, noEventSend) end

---@param attacherJointIndex any
function LiftableAxle:getLiftableAxleAttacherJointHeight(attacherJointIndex) end

---@param superFunc any
---@param implement any
function LiftableAxle:getIsSmoothAttachUpdateAllowed(superFunc, implement) end
