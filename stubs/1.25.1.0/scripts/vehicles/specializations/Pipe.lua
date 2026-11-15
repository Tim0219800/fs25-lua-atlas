---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Pipe.lua (generated stub, FS25 Lua Atlas)

---@class Pipe
Pipe = {}

---@param specializations any
function Pipe.prerequisitesPresent(specializations) end

function Pipe.initSpecialization() end

---@param schema any
---@param basePath any
function Pipe.registers(schema, basePath) end

---@param vehicleType any
function Pipe.registerFunctions(vehicleType) end

---@param vehicleType any
function Pipe.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function Pipe.registerEventListeners(vehicleType) end

---@param savegame any
function Pipe:onLoad(savegame) end

---@param savegame any
function Pipe:onPostLoad(savegame) end

function Pipe:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function Pipe:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId any
---@param connection any
function Pipe:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function Pipe:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function Pipe:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function Pipe:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Pipe:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Pipe:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param unloadingTriggers any
---@param xmlFile any
---@param baseKey any
function Pipe:loadUnloadingTriggers(unloadingTriggers, xmlFile, baseKey) end

---@param pipeNodes any
---@param xmlFile any
---@param baseKey any
function Pipe:loadPipeNodes(pipeNodes, xmlFile, baseKey) end

---@param pipeState any
function Pipe:getIsPipeStateChangeAllowed(pipeState) end

---@param pipeState any
---@param noEventSend any
function Pipe:setPipeState(pipeState, noEventSend) end

function Pipe:getCurrentPipeState() end

---@param dt any
function Pipe:updatePipeNodes(dt) end

---@param pipeNode any
---@param distance any
function Pipe:updateBendingRegulationNodes(pipeNode, distance) end

---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function Pipe:unloadingTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

function Pipe:updateNearestObjectInTriggers() end

function Pipe:updateActionEventText() end

---@param superFunc any
---@param dischargeNode any
function Pipe:getIsDischargeNodeActive(superFunc, dischargeNode) end

---@param superFunc any
function Pipe:getCanBeTurnedOn(superFunc) end

---@param superFunc any
function Pipe:getTurnedOnNotAllowedWarning(superFunc) end

---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function Pipe:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

---@param superFunc any
---@param dischargeNode any
---@param dischargedLiters any
---@param minDropReached any
---@param hasMinDropFillLevel any
function Pipe:handleDischarge(superFunc, dischargeNode, dischargedLiters, minDropReached, hasMinDropFillLevel) end

---@param superFunc any
---@param dischargeNode any
---@param hitObject any
---@param hitShape any
---@param hitDistance any
---@param hitFillUnitIndex any
---@param hitTerrain any
function Pipe:handleDischargeRaycast(superFunc, dischargeNode, hitObject, hitShape, hitDistance, hitFillUnitIndex, hitTerrain) end

---@param superFunc any
function Pipe:getCanToggleDischargeToObject(superFunc) end

---@param superFunc any
function Pipe:getCanToggleDischargeToGround(superFunc) end

---@param superFunc any
function Pipe:getRequiresPower(superFunc) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function Pipe:loadMovingToolFromXML(superFunc, xmlFile, key, entry) end

---@param superFunc any
---@param movingTool any
function Pipe:getIsMovingToolActive(superFunc, movingTool) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param cover any
function Pipe:loadCoverFromXML(superFunc, xmlFile, key, cover) end

---@param superFunc any
---@param nextState any
function Pipe:getIsNextCoverStateAllowed(superFunc, nextState) end

---@param object any
function Pipe:onDeletePipeObject(object) end

---@param state any
function Pipe:getPipeDischargeNodeIndex(state) end

---@param state any
---@param noEventSend any
function Pipe:setPipeDischargeToGround(state, noEventSend) end

---@param superFunc any
function Pipe:getCanBeSelected(superFunc) end

---@param superFunc any
function Pipe:getIsAIReadyToDrive(superFunc) end

---@param superFunc any
function Pipe:getIsAIPreparingToDrive(superFunc) end

---@param tool any
---@param transSpeed any
---@param dt any
function Pipe:onMovingToolChanged(tool, transSpeed, dt) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Pipe:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param state any
function Pipe:onDischargeStateChanged(state) end

---@param direction integer
---@param moveToMiddle boolean
function Pipe:onFoldStateChanged(direction, moveToMiddle) end

function Pipe:onAIImplementPrepareForTransport() end

---@param rootVehicle table
function Pipe:onRootVehicleChanged(rootVehicle) end

---@param self any
---@param direction any
function Pipe.actionControllerPipeEvent(self, direction) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Pipe.actionEventTogglePipe(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Pipe.actionEventToggleDischargeToGround(self, actionName, inputValue, callbackState, isAnalog) end
