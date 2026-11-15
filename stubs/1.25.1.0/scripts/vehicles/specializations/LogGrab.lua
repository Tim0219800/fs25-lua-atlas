---@meta
-- FS25 1.25.1.0 : vehicles/specializations/LogGrab.lua (generated stub, FS25 Lua Atlas)

---@param specializations table
---@return boolean
function LogGrab.prerequisitesPresent(specializations) end

function LogGrab.initSpecialization() end

---@param schema any
---@param basePath any
function LogGrab.registerLogGrabXMLPaths(schema, basePath) end

---@param vehicleType table
function LogGrab.registerEvents(vehicleType) end

---@param vehicleType table
function LogGrab.registerFunctions(vehicleType) end

---@param vehicleType table
function LogGrab.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType table
function LogGrab.registerEventListeners(vehicleType) end

---@param savegame table
function LogGrab:onLoad(savegame) end

---@param savegame table
function LogGrab:onPostLoad(savegame) end

function LogGrab:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function LogGrab:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function LogGrab:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function LogGrab:onWriteStream(streamId, connection) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function LogGrab:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param xmlFile any
---@param key any
---@param logGrab any
function LogGrab:loadLogGrabFromXML(xmlFile, key, logGrab) end

---@param claw any
---@param dt any
---@param ignoreTiming any
---@param forceDirty any
function LogGrab:updateLogGrabClawState(claw, dt, ignoreTiming, forceDirty) end

---@param radius any
---@param isNewTree any
function LogGrab:onCutTree(radius, isNewTree) end

function LogGrab:onTurnedOn() end

function LogGrab:onTurnedOff() end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function LogGrab:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function LogGrab.actionEventClawAnimation(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
function LogGrab.updateActionEvents(self) end

---@param superFunc any
---@param jointDesc any
---@param anchorActor any
function LogGrab:setComponentJointFrame(superFunc, jointDesc, anchorActor) end

---@param superFunc any
---@param movingTool any
function LogGrab:getMovingToolMoveValue(superFunc, movingTool) end

---@param superFunc any
---@param state any
function LogGrab:onDelimbTree(superFunc, state, ...) end

---@param grab any
---@param shapeId any
function LogGrab:getGrabCanMountSplitShape(grab, shapeId) end

---@param grab any
---@param shapeId any
function LogGrab:mountSplitShape(grab, shapeId) end

---@param grab any
---@param shapeId any
---@param jointIndex any
---@param jointTransform any
---@param isDeleting any
function LogGrab:unmountSplitShape(grab, shapeId, jointIndex, jointTransform, isDeleting) end

---@param grab any
function LogGrab:onLogGrabMountedTreesChanged(grab) end

---@param direction any
---@param moveToMiddle any
function LogGrab:onFoldStateChanged(direction, moveToMiddle) end

---@param time any
function LogGrab:onFoldTimeChanged(time) end

---@param grabIndex any
function LogGrab:getIsLogGrabClawStateChangeAllowed(grabIndex) end

---@param grabIndex any
---@param state any
---@param noEventSend any
function LogGrab:setLogGrabClawState(grabIndex, state, noEventSend) end

---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function LogGrab:logGrabTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

---@param superFunc any
---@param list any
function LogGrab:addNodeObjectMapping(superFunc, list) end

---@param superFunc any
---@param list any
function LogGrab:removeNodeObjectMapping(superFunc, list) end

---@param values any
function LogGrab:updateDebugValues(values) end
