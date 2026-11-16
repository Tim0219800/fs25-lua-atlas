---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableObjectStorage.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for storage buildings that hold bales and pallets as abstract objects (grouped into object infos), with spawn areas to unload them and storage areas where visual copies are shown. Players open an unload dialog through an activatable, objects enter via an object trigger (automatically or by a manual store action), and the server spawns objects back after an overlap check. Network sync uses read/write streams plus a dirty flag. The dump omits several pieces this file relies on (PlaceableObjectStorage constants, ABSTRACT_OBJECTS tables, getNextSpawnAreaAndOffset, onObjectStorageObjectTriggerCallback, onPendingObjectDelete, and the AbstractBaleObject methods): UNVERIFIED.
---@class PlaceableObjectStorage
PlaceableObjectStorage = {}

--- Placeable specialization for storage buildings that hold bales and pallets as abstract objects (grouped into object infos), with spawn areas to unload them and storage areas where visual copies are shown. Players open an unload dialog through an activatable, objects enter via an object trigger (automatically or by a manual store action), and the server spawns objects back after an overlap check. Network sync uses read/write streams plus a dirty flag. The dump omits several pieces this file relies on (PlaceableObjectStorage constants, ABSTRACT_OBJECTS tables, getNextSpawnAreaAndOffset, onObjectStorageObjectTriggerCallback, onPendingObjectDelete, and the AbstractBaleObject methods): UNVERIFIED.
---@class AbstractBaleObject
AbstractBaleObject = {}

--- Placeable specialization for storage buildings that hold bales and pallets as abstract objects (grouped into object infos), with spawn areas to unload them and storage areas where visual copies are shown. Players open an unload dialog through an activatable, objects enter via an object trigger (automatically or by a manual store action), and the server spawns objects back after an overlap check. Network sync uses read/write streams plus a dirty flag. The dump omits several pieces this file relies on (PlaceableObjectStorage constants, ABSTRACT_OBJECTS tables, getNextSpawnAreaAndOffset, onObjectStorageObjectTriggerCallback, onPendingObjectDelete, and the AbstractBaleObject methods): UNVERIFIED.
---@class PlaceableObjectStorageActivatable
PlaceableObjectStorageActivatable = {}

--- Placeable specialization for storage buildings that hold bales and pallets as abstract objects (grouped into object infos), with spawn areas to unload them and storage areas where visual copies are shown. Players open an unload dialog through an activatable, objects enter via an object trigger (automatically or by a manual store action), and the server spawns objects back after an overlap check. Network sync uses read/write streams plus a dirty flag. The dump omits several pieces this file relies on (PlaceableObjectStorage constants, ABSTRACT_OBJECTS tables, getNextSpawnAreaAndOffset, onObjectStorageObjectTriggerCallback, onPendingObjectDelete, and the AbstractBaleObject methods): UNVERIFIED.
---@class PlaceableObjectStorageManualStoreActivatable
PlaceableObjectStorageManualStoreActivatable = {}

--- Always returns true: no prerequisite specialization is required.
---@param specializations table
---@return boolean
function PlaceableObjectStorage.prerequisitesPresent(specializations) end

--- Overrides canBeSold and updateInfo on the placeable type.
---@param placeableType any
function PlaceableObjectStorage.registerOverwrittenFunctions(placeableType) end

--- Registers the object storage functions (support checks, add/remove of abstract objects, spawning, object infos, visual areas, manual store, trigger callbacks) on the placeable type.
---@param placeableType any
function PlaceableObjectStorage.registerFunctions(placeableType) end

--- Subscribes to onLoad, onDelete, onReadStream, onWriteStream, onReadUpdateStream, onWriteUpdateStream and onUpdate.
---@param placeableType any
function PlaceableObjectStorage.registerEventListeners(placeableType) end

--- Declares the objectStorage XML keys: player/object trigger nodes, supported fill types and categories, bale/pallet support, supportedObject entries, capacity (default 250), max size limits, maxUnloadAmount (default 25), spawn areas and storage areas (max stack height default 3).
---@param schema any
---@param basePath any
function PlaceableObjectStorage.registerXMLPaths(schema, basePath) end

--- Registers the savegame keys for stored objects: a className per object plus the keys of every abstract object class in PlaceableObjectStorage.ABSTRACT_OBJECTS.
---@param schema any
---@param basePath any
function PlaceableObjectStorage.registerSavegameXMLPaths(schema, basePath) end

--- Registers the shop spec types objectStorageCapacity and objectStorageFillTypes for placeables.
function PlaceableObjectStorage.initSpecialization() end

--- Loads triggers (object trigger on the server only), supported fill types/objects, capacity and size limits, spawn and storage areas, state tables, texts, both activatables and the dirty flag. Warns if the player or object trigger is missing.
---@param savegame table
function PlaceableObjectStorage:onLoad(savegame) end

--- Savegame loading: for each object entry, finds the abstract object class by its className and lets it load itself, then marks object infos dirty. Note: the warning for a nil className prints that nil name.
---@param xmlFile any
---@param key any
function PlaceableObjectStorage:loadFromXMLFile(xmlFile, key) end

--- Savegame saving: writes each stored abstract object's REFERENCE_CLASS_NAME and lets it save its own data under an indexed object key.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableObjectStorage:saveToXMLFile(xmlFile, key, usedModNames) end

--- Removes the triggers, deletes all stored abstract objects, clears pending objects and their delete listeners, and removes both activatables.
function PlaceableObjectStorage:onDelete() end

--- Client side: rebuilds objectInfos from the stream (count, amount and abstract object per info), recomputes the stored total and refreshes the visual areas.
---@param streamId any
---@param connection any
function PlaceableObjectStorage:onReadStream(streamId, connection) end

--- Server side: writes the object infos, for each its amount, the abstract object type id and the first object's stream data.
---@param streamId any
---@param connection any
function PlaceableObjectStorage:onWriteStream(streamId, connection) end

--- Client side: if the dirty bit is set, re-reads the full object info stream; then adds or removes the manual store activatable according to the transmitted flag.
---@param streamId any
---@param timestamp any
---@param connection any
function PlaceableObjectStorage:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: writes a bool for the dirty flag and, if set, the full object info stream, then a bool for pending manual store objects.
---@param streamId any
---@param connection any
---@param dirtyMask any
function PlaceableObjectStorage:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Per-frame: on the server drives object spawning (one object per overlap check) and stores pending objects that can now be accepted; on all sides counts down the 1000 ms info refresh timer (updating infos, visuals and the dirty flag) and processes pending visual area updates, calling raiseActive while work remains.
---@param dt any
function PlaceableObjectStorage:onUpdate(dt) end

--- Returns true if the fill type is in the supported list, or if the list is empty (all allowed); a nil or unknown fill type is accepted only when the list is empty.
---@param fillTypeIndex any
function PlaceableObjectStorage:getObjectStorageSupportsFillType(fillTypeIndex) end

--- Returns whether the object is supported at all: its abstract class must accept it and it must not already be stored (compared with each stored object's real object).
---@param object any
function PlaceableObjectStorage:getObjectStorageSupportsObject(object) end

--- Checks if an object can be stored right now (not while spawning, capacity, supportedObject filename and amount limits, abstract class rules; stricter when automatic). Returns a bool and, for some failures, a PlaceableObjectStorageErrorEvent error id.
---@param object any
---@param automatically any
function PlaceableObjectStorage:getObjectStorageCanStoreObject(object, automatically) end

--- Hook used by bale loaders to ask whether a bale is accepted; forwards to getObjectStorageSupportsObject.
---@param bale any
function PlaceableObjectStorage:getIsBaleSupportedByUnloadTrigger(bale) end

--- Wraps a real bale or pallet in the matching abstract object class (looked up by class name), adds it to storage and registers it. Does nothing if no abstract class matches.
---@param object any
---@param loadedFromSavegame any
function PlaceableObjectStorage:addObjectToObjectStorage(object, loadedFromSavegame) end

--- Appends an already built abstract object to the stored list and updates the stored count (the name is misspelled in the source).
---@param abstractObject any
function PlaceableObjectStorage:addAbstactObjectToObjectStorage(abstractObject) end

--- Server: starts unloading amount objects of an object info for a connection. Ignored if a spawn is running, infos are still refreshing, or the request exceeds the available amount; otherwise resets the spawn state and spawns the first object.
---@param objectInfoIndex any
---@param amount any
---@param connection any
function PlaceableObjectStorage:removeAbstractObjectsFromStorage(objectInfoIndex, amount, connection) end

--- Finds the next free slot in the spawn areas (respecting limited-object slots) and starts an async box overlap test there. When nothing remains or no room is found, ends the spawn run, sends a not-enough-space or limit error event to the requesting connection if objects are left, and marks infos dirty.
---@param lastSuccess any
function PlaceableObjectStorage:spawnNextObjectStorageObject(lastSuccess) end

--- Removes an abstract object from the stored list and asks it to spawn the real object at the given world position and rotation, with onObjectFromStorageSpawned as callback; updates the stored count.
---@param abstractObject any
---@param x any
---@param y any
---@param z any
---@param rx any
---@param ry any
---@param rz any
function PlaceableObjectStorage:removeAbstractObjectFromStorage(abstractObject, x, y, z, rx, ry, rz) end

--- Callback (called with the placeable as first argument): while a spawn run is active, records the freshly spawned object so overlap checks ignore it.
---@param self any
---@param spawnedObject any
function PlaceableObjectStorage.onObjectFromStorageSpawned(self, spawnedObject) end

--- Starts the 1000 ms timer after which object infos, visual areas and the network dirty flag are refreshed, and keeps the placeable active.
function PlaceableObjectStorage:setObjectStorageObjectInfosDirty() end

--- If the refresh timer is running, rebuilds the object infos immediately (the timer keeps running for the visual and network update).
function PlaceableObjectStorage:updateDirtyObjectStorageObjectInfos() end

--- Rebuilds spec.objectInfos by grouping identical stored objects (via getIsIdentical), then sorts the groups by spawn width ascending.
function PlaceableObjectStorage:updateObjectStorageObjectInfos() end

--- Returns the current list of object infos (groups of identical stored objects).
function PlaceableObjectStorage:getObjectStorageObjectInfos() end

--- Rebuilds the visual copies of stored objects: creates a new hidden spawn node, computes positions in the storage areas for every object info and spawns them one info per update, then deletes the old node and shows the new one.
function PlaceableObjectStorage:updateObjectStorageVisualAreas() end

--- Returns true if a pending object cannot be stored automatically but could be stored manually.
function PlaceableObjectStorage:getHasPendingManualStoreObjects() end

--- Stores every pending object that is allowed manually (not automatically), removes its delete listener and refreshes the manual store activatable.
function PlaceableObjectStorage:storePendingManualObjects() end

--- When the pending-manual-objects state changed, adds or removes the manual store activatable and raises the network dirty flag.
function PlaceableObjectStorage:updateManualStoreActivatable() end

--- Player trigger callback: adds the unload activatable when the local player enters and removes it when leaving.
---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
function PlaceableObjectStorage:onObjectStoragePlayerTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

--- Overlap callback for the spawn test: ends the pending overlap and counts non-trigger hits, ignoring objects just spawned in this run.
---@param objectId any
function PlaceableObjectStorage:onObjectStorageSpawnOverlapCallback(objectId) end

--- Override: returns true with a 'storage not empty' warning if any objects are stored, else defers to the parent.
---@param superFunc any
function PlaceableObjectStorage:canBeSold(superFunc) end

--- Override: after the parent, adds a stored/capacity line, then one line per object info (title cut at 32 characters) up to MAX_HUD_INFO_ENTRIES, and a summed 'others' line for the rest.
---@param superFunc any
---@param infoTable any
function PlaceableObjectStorage:updateInfo(superFunc, infoTable) end

--- Shop spec loader: returns the capacity, lowered to the sum of the supportedObject amounts when those limits are used; nil if the placeable has no objectStorage.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function PlaceableObjectStorage.loadSpecValueCapacity(xmlFile, customEnvironment, baseDir) end

--- Returns the capacity formatted as a number of pieces for the shop, or nil if absent.
---@param storeItem any
---@param realItem any
function PlaceableObjectStorage.getSpecValueCapacity(storeItem, realItem) end

--- Shop spec loader: collects the fill type indices named in the fillType attribute of each supportedObject entry.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function PlaceableObjectStorage.loadSpecValueFillTypes(xmlFile, customEnvironment, baseDir) end

--- Returns the list of fill type indices for the shop display, or nil if there are none.
---@param storeItem any
---@param realItem any
function PlaceableObjectStorage.getSpecValueFillTypes(storeItem, realItem) end

--- Creates the activatable that opens the unload menu, with its action text and 'storage is empty' warning text.
---@param objectStorage any
function PlaceableObjectStorageActivatable.new(objectStorage) end

--- True only if the player has access to the storage and no spawn run is currently active.
function PlaceableObjectStorageActivatable:getIsActivatable() end

--- Refreshes the object infos and opens ObjectStorageDialog with them and maxUnloadAmount, or shows a blinking warning for 2000 ms if the storage is empty.
function PlaceableObjectStorageActivatable:run() end

--- Returns the distance to the player trigger node, or math.huge if there is none.
---@param x any
---@param y any
---@param z any
function PlaceableObjectStorageActivatable:getDistance(x, y, z) end

--- Dialog callback: if an info index and amount were chosen, sends PlaceableObjectStorageUnloadEvent to the server.
---@param objectInfoIndex any
---@param amount any
function PlaceableObjectStorageActivatable:onObjectInfoSelected(objectInfoIndex, amount) end

--- Creates the activatable for manually storing pending objects, with the 'unload' button text.
---@param objectStorage any
function PlaceableObjectStorageManualStoreActivatable.new(objectStorage) end

--- True if the player has access to the storage.
function PlaceableObjectStorageManualStoreActivatable:getIsActivatable() end

--- Sends PlaceableObjectStorageStoreEvent for this storage to the server.
function PlaceableObjectStorageManualStoreActivatable:run() end

--- Returns the distance to the object trigger node, or math.huge if there is none (that node only exists on the server, so on clients this is always math.huge).
---@param x any
---@param y any
---@param z any
function PlaceableObjectStorageManualStoreActivatable:getDistance(x, y, z) end
