---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Winch.lua (generated stub, FS25 Lua Atlas)

---@param specializations table
---@return boolean
function Winch.prerequisitesPresent(specializations) end

function Winch.initSpecialization() end

---@param schema any
---@param baseKey any
function Winch.registerXMLPaths(schema, baseKey) end

---@param vehicleType any
function Winch.registerFunctions(vehicleType) end

---@param vehicleType any
function Winch.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function Winch.registerEventListeners(vehicleType) end

---@param savegame any
function Winch:onLoad(savegame) end

---@param savegame any
function Winch:onLoadFinished(savegame) end

function Winch:onDelete() end

---@param streamId integer
---@param connection Connection
function Winch:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function Winch:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function Winch:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function Winch:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function Winch:saveToXMLFile(xmlFile, key, usedModNames) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Winch:onPostUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Winch:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Winch.actionEventControl(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Winch.actionEventDetach(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
function Winch.updateActionEvents(self) end

---@param xmlFile any
---@param key any
---@param rope any
function Winch:loadWinchRopeFromXML(xmlFile, key, rope) end

---@param rope any
---@param state any
function Winch:setWinchTreeAttachMode(rope, state) end

---@param rope any
function Winch:getIsWinchAttachModeActive(rope) end

---@param rope any
function Winch:getCanAttachWinchTree(rope) end

---@param rope any
function Winch:onAttachTreeInputEvent(rope) end

---@param param any
function Winch:getWinchRopeSpeedFactor(param) end

---@param ropeIndex any
---@param splitShapeId any
function Winch:getIsWinchTreeAttachAllowed(ropeIndex, splitShapeId) end

---@param ropeIndex any
---@param reason any
function Winch:showWinchTreeMountFailedWarning(ropeIndex, reason) end

---@param splitShapeId any
---@param x any
---@param y any
---@param z any
---@param ropeIndex any
---@param setupRopeData any
---@param noEventSend any
function Winch:attachTreeToWinch(splitShapeId, x, y, z, ropeIndex, setupRopeData, noEventSend) end

---@param ropeIndex any
---@param noEventSend any
function Winch:detachTreeFromWinch(ropeIndex, noEventSend) end

---@param ropeIndex any
---@param direction any
function Winch:setWinchControlInput(ropeIndex, direction) end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function Winch:onWinchPlayerTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

---@param hitObjectId any
---@param x any
---@param y any
---@param z any
---@param distance any
---@param nx any
---@param ny any
---@param nz any
---@param subShapeIndex any
---@param shapeId any
---@param isLast any
function Winch:onWinchTreeRaycastCallback(hitObjectId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end

---@param oldShape any
---@param shape any
function Winch:onWinchTreeShapeCut(oldShape, shape) end

---@param shape any
---@param mountVehicle any
function Winch:onWinchTreeShapeMounted(shape, mountVehicle) end

---@param player Player
function Winch:onPlayerPreTeleport(player) end

---@param superFunc any
---@param xmlFile any
---@param baseName any
---@param entry any
function Winch:loadExtraDependentParts(superFunc, xmlFile, baseName, entry) end

---@param superFunc any
---@param part any
---@param dt any
function Winch:updateExtraDependentParts(superFunc, part, dt) end

---@param superFunc any
---@return boolean
function Winch:getDoConsumePtoPower(superFunc) end

---@param superFunc any
function Winch:getConsumingLoad(superFunc) end

---@param superFunc any
function Winch:getIsPowerTakeOffActive(superFunc) end

---@param superFunc any
function Winch:addToPhysics(superFunc) end

---@param superFunc any
function Winch:removeFromPhysics(superFunc) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Winch.loadSpecValueMaxMass(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Winch.getSpecValueMaxMass(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
