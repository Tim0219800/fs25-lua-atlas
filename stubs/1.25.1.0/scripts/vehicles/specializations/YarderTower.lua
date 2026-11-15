---@meta
-- FS25 1.25.1.0 : vehicles/specializations/YarderTower.lua (stub généré, atlas Lua FS25)

---@param specializations table
---@return boolean
function YarderTower.prerequisitesPresent(specializations) end

function YarderTower.initSpecialization() end

---@param schema any
---@param baseKey any
function YarderTower.registerRopeXMLPaths(schema, baseKey) end

---@param vehicleType any
function YarderTower.registerEvents(vehicleType) end

---@param vehicleType any
function YarderTower.registerFunctions(vehicleType) end

---@param vehicleType any
function YarderTower.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function YarderTower.registerEventListeners(vehicleType) end

---@param savegame any
function YarderTower:onLoad(savegame) end

---@param savegame table
function YarderTower:onLoadEnd(savegame) end

function YarderTower:onPreDelete() end

function YarderTower:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function YarderTower:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function YarderTower:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function YarderTower:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function YarderTower:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function YarderTower:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function YarderTower:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param treeId any
function YarderTower:onYarderCarriageTreeAttached(treeId) end

---@param attacherVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function YarderTower:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

---@param i3dNode any
---@param failedReason any
---@param hookData any
function YarderTower:onHookI3DLoaded(i3dNode, failedReason, hookData) end

---@param i3dNode any
---@param failedReason any
---@param ropeData any
function YarderTower:onRopeI3DLoaded(i3dNode, failedReason, ropeData) end

function YarderTower:getIsSetupModeChangeAllowed() end

---@param state any
---@param canceled any
function YarderTower:setYarderSetupModeState(state, canceled) end

---@param state any
---@param noEventSend any
function YarderTower:setYarderTargetActive(state, noEventSend) end

---@param state any
---@param connection any
---@param noEventSend any
function YarderTower:setYarderCarriageFollowMode(state, connection, noEventSend) end

---@param direction any
function YarderTower:setYarderCarriageMoveInput(direction) end

---@param direction any
function YarderTower:setYarderCarriageLiftInput(direction) end

function YarderTower:onYarderCarriageAttach() end

function YarderTower:onYarderCarriageDetach() end

function YarderTower:setupSupportRopes() end

---@param vehicles any
---@param vehicleLoadState any
---@param arguments any
function YarderTower:onCreateCarriageFinished(vehicles, vehicleLoadState, arguments) end

---@param rope any
---@param state any
function YarderTower:onCarriageVehicleDeleted(rope, state) end

---@param rope any
---@param state any
function YarderTower:setYarderRopeState(rope, state) end

---@param rope any
---@param tx any
---@param ty any
---@param tz any
---@param dt any
---@param isSupportRope any
---@param emissiveColor any
function YarderTower:updateYarderRope(rope, tx, ty, tz, dt, isSupportRope, emissiveColor) end

---@param rope any
---@param length any
function YarderTower:updateYarderRopeLengthNodes(rope, length) end

---@param x any
---@param y any
---@param z any
---@param maxRadius any
function YarderTower:getTreeAtPosition(x, y, z, maxRadius) end

function YarderTower:getIsPlayerInYarderRange() end

---@param x any
---@param y any
---@param z any
function YarderTower:getIsPlayerInYarderControlRange(x, y, z) end

function YarderTower:getYarderIsSetUp() end

function YarderTower:getYarderStatusInfo() end

function YarderTower:getYarderMainRopeLength() end

function YarderTower:getYarderCarriageLastSpeed() end

---@param shape any
function YarderTower:getIsTreeShapeUsedForYarderSetup(shape) end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function YarderTower:onYarderControlTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

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
function YarderTower:onYarderTreeRaycastCallback(hitObjectId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end

---@param ropeNode any
---@param treeId any
---@param ex any
---@param ey any
---@param ez any
---@param maxAngle any
---@param maxLength any
---@param clearance any
---@param minTreeDiameter any
---@param callbackData any
function YarderTower:doRopePlacementValidation(ropeNode, treeId, ex, ey, ez, maxAngle, maxLength, clearance, minTreeDiameter, callbackData) end

---@param callbackData any
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
function YarderTower.onYarderMainTreeRaycastCallback(callbackData, hitObjectId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end

---@param isValid any
---@param x any
---@param y any
---@param z any
---@param reason any
function YarderTower:onMainRopePlacementValidated(isValid, x, y, z, reason) end

---@param supportRope any
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
function YarderTower.onYarderSupportTerrainRaycastCallback(supportRope, hitObjectId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end

---@param objectId any
function YarderTower:onSupportRopeTreeOverlapCallback(objectId, ...) end

function YarderTower:onYarderTowerPlayerDeleted() end

---@param superFunc any
---@return boolean
function YarderTower:isDetachAllowed(superFunc) end

---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function YarderTower:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

---@param superFunc any
function YarderTower:getAllowsLowering(superFunc) end

---@param superFunc any
---@return boolean
function YarderTower:getDoConsumePtoPower(superFunc) end

---@param superFunc any
function YarderTower:getConsumingLoad(superFunc) end

---@param superFunc any
function YarderTower:getIsPowerTakeOffActive(superFunc) end

---@param superFunc any
---@return number
function YarderTower:getDirtMultiplier(superFunc) end

---@param superFunc any
---@return number
function YarderTower:getWearMultiplier(superFunc) end

---@param superFunc any
function YarderTower:getUsageCausesDamage(superFunc) end

---@param superFunc any
function YarderTower:addToPhysics(superFunc) end

---@param superFunc any
function YarderTower:removeFromPhysics(superFunc) end

---@param self any
function YarderTower.getIsVehicleControlAllowed(self) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function YarderTower.loadSpecValueMaxLength(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function YarderTower.getSpecValueMaxLength(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function YarderTower.loadSpecValueMaxMass(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function YarderTower.getSpecValueMaxMass(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
