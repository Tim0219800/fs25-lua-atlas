---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Mountable.lua (generated stub, FS25 Lua Atlas)

---@class Mountable
Mountable = {}

---@param specializations any
function Mountable.prerequisitesPresent(specializations) end

function Mountable.initSpecialization() end

---@param vehicleType any
function Mountable.registerEvents(vehicleType) end

---@param vehicleType any
function Mountable.registerFunctions(vehicleType) end

---@param vehicleType any
function Mountable.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function Mountable.registerEventListeners(vehicleType) end

---@param savegame any
function Mountable:onLoad(savegame) end

function Mountable:onDelete() end

---@param streamId any
---@param connection any
function Mountable:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function Mountable:onWriteStream(streamId, connection) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Mountable:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function Mountable:getSupportsMountDynamic() end

function Mountable:getSupportsMountKinematic() end

---@param jointIndex any
---@param breakingImpulse any
function Mountable:onDynamicMountJointBreak(jointIndex, breakingImpulse) end

---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function Mountable:mountableTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

---@param object any
---@param node any
---@param x any
---@param y any
---@param z any
---@param rx any
---@param ry any
---@param rz any
function Mountable:mount(object, node, x, y, z, rx, ry, rz) end

---@param noEventSend any
function Mountable:unmount(noEventSend) end

---@param object any
---@param node any
---@param x any
---@param y any
---@param z any
---@param rx any
---@param ry any
---@param rz any
function Mountable:mountKinematic(object, node, x, y, z, rx, ry, rz) end

function Mountable:unmountKinematic() end

---@param object any
---@param objectActorId any
---@param jointNode any
---@param mountType any
---@param forceAcceleration any
function Mountable:mountDynamic(object, objectActorId, jointNode, mountType, forceAcceleration) end

---@param isDelete any
function Mountable:unmountDynamic(isDelete) end

---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function Mountable:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

function Mountable:getAdditionalMountingDistance() end

function Mountable:getAdditionalMountingMass() end

---@param dt any
function Mountable:updateDynamicMountJointForceLimit(dt) end

---@param hitObjectId integer
---@param x number
---@param y number
---@param z number
---@param distance number
---@param nx number
---@param ny number
---@param nz number
---@param subShapeIndex integer
---@param shapeId integer
---@param isLast boolean
---@return boolean
function Mountable:additionalMountingMassRaycastCallback(hitObjectId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end

---@param superFunc any
function Mountable:getIsActive(superFunc) end

function Mountable:getMountObject() end

function Mountable:getDynamicMountObject() end

---@param state any
function Mountable:setReducedComponentMass(state) end

function Mountable:getAllowComponentMassReduction() end

function Mountable:getDefaultAllowComponentMassReduction() end

function Mountable:getMountableLockPositions() end

---@param mountType any
---@param mountObject any
---@param noEventSend any
function Mountable:setDynamicMountType(mountType, mountObject, noEventSend) end

---@param object any
---@param callbackFunc any
function Mountable:addMountStateChangeListener(object, callbackFunc) end

---@param object any
---@param callbackFunc any
function Mountable:removeMountStateChangeListener(object, callbackFunc) end

---@param superFunc any
function Mountable:getOwnerConnection(superFunc) end

---@param superFunc any
function Mountable:findRootVehicle(superFunc) end

---@param superFunc any
function Mountable:getIsMapHotspotVisible(superFunc) end

---@param superFunc any
---@param component any
function Mountable:getAdditionalComponentMass(superFunc, component) end

---@param superFunc number
---@param x number
---@param y number
---@param z number
---@param qx number
---@param qy number
---@param qz number
---@param qw number
---@param i integer
---@param changeInterp boolean
function Mountable:setWorldPositionQuaternion(superFunc, x, y, z, qx, qy, qz, qw, i, changeInterp) end

---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
function Mountable:onPreAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end
