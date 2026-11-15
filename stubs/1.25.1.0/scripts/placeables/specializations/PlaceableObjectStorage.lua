---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableObjectStorage.lua (stub généré, atlas Lua FS25)

---@class PlaceableObjectStorage
PlaceableObjectStorage = {}

---@class AbstractBaleObject
AbstractBaleObject = {}

---@class PlaceableObjectStorageActivatable
PlaceableObjectStorageActivatable = {}

---@class PlaceableObjectStorageManualStoreActivatable
PlaceableObjectStorageManualStoreActivatable = {}

---@param specializations table
---@return boolean
function PlaceableObjectStorage.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableObjectStorage.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableObjectStorage.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableObjectStorage.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableObjectStorage.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableObjectStorage.registerSavegameXMLPaths(schema, basePath) end

function PlaceableObjectStorage.initSpecialization() end

---@param savegame table
function PlaceableObjectStorage:onLoad(savegame) end

---@param xmlFile any
---@param key any
function PlaceableObjectStorage:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableObjectStorage:saveToXMLFile(xmlFile, key, usedModNames) end

function PlaceableObjectStorage:onDelete() end

---@param streamId any
---@param connection any
function PlaceableObjectStorage:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableObjectStorage:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function PlaceableObjectStorage:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function PlaceableObjectStorage:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt any
function PlaceableObjectStorage:onUpdate(dt) end

---@param fillTypeIndex any
function PlaceableObjectStorage:getObjectStorageSupportsFillType(fillTypeIndex) end

---@param object any
function PlaceableObjectStorage:getObjectStorageSupportsObject(object) end

---@param object any
---@param automatically any
function PlaceableObjectStorage:getObjectStorageCanStoreObject(object, automatically) end

---@param bale any
function PlaceableObjectStorage:getIsBaleSupportedByUnloadTrigger(bale) end

---@param object any
---@param loadedFromSavegame any
function PlaceableObjectStorage:addObjectToObjectStorage(object, loadedFromSavegame) end

---@param abstractObject any
function PlaceableObjectStorage:addAbstactObjectToObjectStorage(abstractObject) end

---@param objectInfoIndex any
---@param amount any
---@param connection any
function PlaceableObjectStorage:removeAbstractObjectsFromStorage(objectInfoIndex, amount, connection) end

---@param lastSuccess any
function PlaceableObjectStorage:spawnNextObjectStorageObject(lastSuccess) end

---@param abstractObject any
---@param x any
---@param y any
---@param z any
---@param rx any
---@param ry any
---@param rz any
function PlaceableObjectStorage:removeAbstractObjectFromStorage(abstractObject, x, y, z, rx, ry, rz) end

---@param self any
---@param spawnedObject any
function PlaceableObjectStorage.onObjectFromStorageSpawned(self, spawnedObject) end

function PlaceableObjectStorage:setObjectStorageObjectInfosDirty() end

function PlaceableObjectStorage:updateDirtyObjectStorageObjectInfos() end

function PlaceableObjectStorage:updateObjectStorageObjectInfos() end

function PlaceableObjectStorage:getObjectStorageObjectInfos() end

function PlaceableObjectStorage:updateObjectStorageVisualAreas() end

function PlaceableObjectStorage:getHasPendingManualStoreObjects() end

function PlaceableObjectStorage:storePendingManualObjects() end

function PlaceableObjectStorage:updateManualStoreActivatable() end

---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
function PlaceableObjectStorage:onObjectStoragePlayerTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

---@param objectId any
function PlaceableObjectStorage:onObjectStorageSpawnOverlapCallback(objectId) end

---@param superFunc any
function PlaceableObjectStorage:canBeSold(superFunc) end

---@param superFunc any
---@param infoTable any
function PlaceableObjectStorage:updateInfo(superFunc, infoTable) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function PlaceableObjectStorage.loadSpecValueCapacity(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
function PlaceableObjectStorage.getSpecValueCapacity(storeItem, realItem) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function PlaceableObjectStorage.loadSpecValueFillTypes(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
function PlaceableObjectStorage.getSpecValueFillTypes(storeItem, realItem) end

---@param objectStorage any
function PlaceableObjectStorageActivatable.new(objectStorage) end

function PlaceableObjectStorageActivatable:getIsActivatable() end

function PlaceableObjectStorageActivatable:run() end

---@param x any
---@param y any
---@param z any
function PlaceableObjectStorageActivatable:getDistance(x, y, z) end

---@param objectInfoIndex any
---@param amount any
function PlaceableObjectStorageActivatable:onObjectInfoSelected(objectInfoIndex, amount) end

---@param objectStorage any
function PlaceableObjectStorageManualStoreActivatable.new(objectStorage) end

function PlaceableObjectStorageManualStoreActivatable:getIsActivatable() end

function PlaceableObjectStorageManualStoreActivatable:run() end

---@param x any
---@param y any
---@param z any
function PlaceableObjectStorageManualStoreActivatable:getDistance(x, y, z) end
