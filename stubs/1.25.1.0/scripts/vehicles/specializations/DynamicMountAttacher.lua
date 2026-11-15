---@meta
-- FS25 1.25.1.0 : vehicles/specializations/DynamicMountAttacher.lua (stub généré, atlas Lua FS25)

---@class DynamicMountAttacher
DynamicMountAttacher = {}

---@param specializations any
function DynamicMountAttacher.prerequisitesPresent(specializations) end

function DynamicMountAttacher.initSpecialization() end

---@param vehicleType any
function DynamicMountAttacher.registerFunctions(vehicleType) end

---@param vehicleType any
function DynamicMountAttacher.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function DynamicMountAttacher.registerEventListeners(vehicleType) end

---@param savegame any
function DynamicMountAttacher:onLoad(savegame) end

function DynamicMountAttacher:onDelete() end

---@param streamId any
---@param timestamp any
---@param connection any
function DynamicMountAttacher:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function DynamicMountAttacher:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function DynamicMountAttacher:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param object any
---@param x any
---@param y any
---@param z any
---@param rx any
---@param ry any
---@param rz any
function DynamicMountAttacher:lockDynamicMountedObject(object, x, y, z, rx, ry, rz) end

---@param object any
function DynamicMountAttacher:addDynamicMountedObject(object) end

---@param object any
---@param isDeleting any
function DynamicMountAttacher:removeDynamicMountedObject(object, isDeleting) end

---@param object any
function DynamicMountAttacher:onUnmountObject(object) end

---@param state any
function DynamicMountAttacher:setDynamicMountAnimationState(state) end

---@param xmlFile any
---@param key any
---@param lockPosition any
function DynamicMountAttacher:loadDynamicLockPositionFromXML(xmlFile, key, lockPosition) end

---@param lockPosition any
function DynamicMountAttacher:getIsDynamicLockPositionActive(lockPosition) end

---@param streamId any
---@param objects any
function DynamicMountAttacher:writeDynamicMountObjectsToStream(streamId, objects) end

---@param streamId any
---@param objects any
function DynamicMountAttacher:readDynamicMountObjectsFromStream(streamId, objects) end

function DynamicMountAttacher:getAllowDynamicMountObjects() end

---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function DynamicMountAttacher:dynamicMountTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

function DynamicMountAttacher:getAllowDynamicMountFillLevelInfo() end

---@param xmlFile any
---@param key any
---@param entry any
function DynamicMountAttacher:loadDynamicMountGrabFromXML(xmlFile, key, entry) end

---@param grab any
function DynamicMountAttacher:getIsDynamicMountGrabOpened(grab) end

function DynamicMountAttacher:getDynamicMountTimeToMount() end

function DynamicMountAttacher:getHasDynamicMountedObjects() end

---@param onlyBales any
function DynamicMountAttacher:forceDynamicMountPendingObjects(onlyBales) end

function DynamicMountAttacher:forceUnmountDynamicMountedObjects() end

---@param node any
function DynamicMountAttacher:getDynamicMountAttacherSettingsByNode(node) end

---@param transformId any
function DynamicMountAttacher:dynamicMountLockPositionOverlapCallback(transformId) end

---@param superFunc any
---@param display any
function DynamicMountAttacher:getFillLevelInformation(superFunc, display) end

---@param superFunc table
---@param object table
---@return boolean
function DynamicMountAttacher:getHasObjectMounted(superFunc, object) end

---@param superFunc any
---@param xmlFile any
---@param baseName any
---@param entry any
function DynamicMountAttacher:loadExtraDependentParts(superFunc, xmlFile, baseName, entry) end

---@param superFunc any
---@param part any
---@param dt any
function DynamicMountAttacher:updateExtraDependentParts(superFunc, part, dt) end

---@param superFunc any
---@param vehicle any
function DynamicMountAttacher:getIsAttachedTo(superFunc, vehicle) end

---@param superFunc any
---@param component any
function DynamicMountAttacher:getAdditionalComponentMass(superFunc, component) end

---@param superFunc any
---@param direction any
---@param onAiTurnOn any
---@return boolean
function DynamicMountAttacher:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function DynamicMountAttacher:loadMovingToolFromXML(superFunc, xmlFile, key, entry) end

---@param superFunc any
---@param movingTool any
function DynamicMountAttacher:getIsMovingToolActive(superFunc, movingTool) end

---@param object any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function DynamicMountAttacher:onPreAttachImplement(object, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

---@param values any
function DynamicMountAttacher:updateDebugValues(values) end
