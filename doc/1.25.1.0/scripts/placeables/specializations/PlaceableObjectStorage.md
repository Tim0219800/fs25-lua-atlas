# placeables/specializations/PlaceableObjectStorage.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableObjectStorage.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableObjectStorage.lua` — FS25 1.25.1.0

✍ Placeable specialization for storage buildings that hold bales and pallets as abstract objects (grouped into object infos), with spawn areas to unload them and storage areas where visual copies are shown. Players open an unload dialog through an activatable, objects enter via an object trigger (automatically or by a manual store action), and the server spawns objects back after an overlap check. Network sync uses read/write streams plus a dirty flag. The dump omits several pieces this file relies on (PlaceableObjectStorage constants, ABSTRACT_OBJECTS tables, getNextSpawnAreaAndOffset, onObjectStorageObjectTriggerCallback, onPendingObjectDelete, and the AbstractBaleObject methods): UNVERIFIED.

- **PlaceableObjectStorage** (l.11)
- **AbstractBaleObject** (l.1131)
- **PlaceableObjectStorageActivatable** (l.1857)
- **PlaceableObjectStorageManualStoreActivatable** (l.1919)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableObjectStorage.prerequisitesPresent(specializations: table) → boolean` | 30 | ✍ Always returns true: no prerequisite specialization is required. |
| `PlaceableObjectStorage.registerOverwrittenFunctions(placeableType: any)` | 36 | ✍ Overrides canBeSold and updateInfo on the placeable type. |
| `PlaceableObjectStorage.registerFunctions(placeableType: any)` | 43 | ✍ Registers the object storage functions (support checks, add/remove of abstract objects, spawning, object infos, visual areas, manual store, trigger callbacks) on the placeable type. |
| `PlaceableObjectStorage.registerEventListeners(placeableType: any)` | 68 | ✍ Subscribes to onLoad, onDelete, onReadStream, onWriteStream, onReadUpdateStream, onWriteUpdateStream and onUpdate. |
| `PlaceableObjectStorage.registerXMLPaths(schema: any, basePath: any)` | 80 | ✍ Declares the objectStorage XML keys: player/object trigger nodes, supported fill types and categories, bale/pallet support, supportedObject entries, capacity (default 250), max size limits, maxUnloadAmount (default 25), spawn areas and storage areas (max stack height default 3). |
| `PlaceableObjectStorage.registerSavegameXMLPaths(schema: any, basePath: any)` | 117 | ✍ Registers the savegame keys for stored objects: a className per object plus the keys of every abstract object class in PlaceableObjectStorage.ABSTRACT_OBJECTS. |
| `PlaceableObjectStorage.initSpecialization()` | 126 | ✍ Registers the shop spec types objectStorageCapacity and objectStorageFillTypes for placeables. |
| `PlaceableObjectStorage:onLoad(savegame: table)` | 134 | ✍ Loads triggers (object trigger on the server only), supported fill types/objects, capacity and size limits, spawn and storage areas, state tables, texts, both activatables and the dirty flag. Warns if the player or object trigger is missing. |
| `PlaceableObjectStorage:loadFromXMLFile(xmlFile: any, key: any)` | 245 | ✍ Savegame loading: for each object entry, finds the abstract object class by its className and lets it load itself, then marks object infos dirty. Note: the warning for a nil className prints that nil name. |
| `PlaceableObjectStorage:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 263 | ✍ Savegame saving: writes each stored abstract object's REFERENCE_CLASS_NAME and lets it save its own data under an indexed object key. |
| `PlaceableObjectStorage:onDelete()` | 278 | ✍ Removes the triggers, deletes all stored abstract objects, clears pending objects and their delete listeners, and removes both activatables. |
| `PlaceableObjectStorage:onReadStream(streamId: any, connection: any)` | 310 | ✍ Client side: rebuilds objectInfos from the stream (count, amount and abstract object per info), recomputes the stored total and refreshes the visual areas. |
| `PlaceableObjectStorage:onWriteStream(streamId: any, connection: any)` | 338 | ✍ Server side: writes the object infos, for each its amount, the abstract object type id and the first object's stream data. |
| `PlaceableObjectStorage:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 356 | ✍ Client side: if the dirty bit is set, re-reads the full object info stream; then adds or removes the manual store activatable according to the transmitted flag. |
| `PlaceableObjectStorage:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 373 | ✍ Server side: writes a bool for the dirty flag and, if set, the full object info stream, then a bool for pending manual store objects. |
| `PlaceableObjectStorage:onUpdate(dt: any)` | 385 | ✍ Per-frame: on the server drives object spawning (one object per overlap check) and stores pending objects that can now be accepted; on all sides counts down the 1000 ms info refresh timer (updating infos, visuals and the dirty flag) and processes pending visual area updates, calling raiseActive while work remains. |
| `PlaceableObjectStorage:getObjectStorageSupportsFillType(fillTypeIndex: any)` | 453 | ✍ Returns true if the fill type is in the supported list, or if the list is empty (all allowed); a nil or unknown fill type is accepted only when the list is empty. |
| `PlaceableObjectStorage:getObjectStorageSupportsObject(object: any)` | 475 | ✍ Returns whether the object is supported at all: its abstract class must accept it and it must not already be stored (compared with each stored object's real object). |
| `PlaceableObjectStorage:getObjectStorageCanStoreObject(object: any, automatically: any)` | 496 | ✍ Checks if an object can be stored right now (not while spawning, capacity, supportedObject filename and amount limits, abstract class rules; stricter when automatic). Returns a bool and, for some failures, a PlaceableObjectStorageErrorEvent error id. |
| `PlaceableObjectStorage:getIsBaleSupportedByUnloadTrigger(bale: any)` | 552 | ✍ Hook used by bale loaders to ask whether a bale is accepted; forwards to getObjectStorageSupportsObject. |
| `PlaceableObjectStorage:addObjectToObjectStorage(object: any, loadedFromSavegame: any)` | 558 | ✍ Wraps a real bale or pallet in the matching abstract object class (looked up by class name), adds it to storage and registers it. Does nothing if no abstract class matches. |
| `PlaceableObjectStorage:addAbstactObjectToObjectStorage(abstractObject: any)` | 569 | ✍ Appends an already built abstract object to the stored list and updates the stored count (the name is misspelled in the source). |
| `PlaceableObjectStorage:removeAbstractObjectsFromStorage(objectInfoIndex: any, amount: any, connection: any)` | 577 | ✍ Server: starts unloading amount objects of an object info for a connection. Ignored if a spawn is running, infos are still refreshing, or the request exceeds the available amount; otherwise resets the spawn state and spawns the first object. |
| `PlaceableObjectStorage:spawnNextObjectStorageObject(lastSuccess: any)` | 652 | ✍ Finds the next free slot in the spawn areas (respecting limited-object slots) and starts an async box overlap test there. When nothing remains or no room is found, ends the spawn run, sends a not-enough-space or limit error event to the requesting connection if objects are left, and marks infos dirty. |
| `PlaceableObjectStorage:removeAbstractObjectFromStorage(abstractObject: any, x: any, y: any, z: any, rx: any, ry: any, rz: any)` | 712 | ✍ Removes an abstract object from the stored list and asks it to spawn the real object at the given world position and rotation, with onObjectFromStorageSpawned as callback; updates the stored count. |
| `PlaceableObjectStorage.onObjectFromStorageSpawned(self: any, spawnedObject: any)` | 727 | ✍ Callback (called with the placeable as first argument): while a spawn run is active, records the freshly spawned object so overlap checks ignore it. |
| `PlaceableObjectStorage:setObjectStorageObjectInfosDirty()` | 736 | ✍ Starts the 1000 ms timer after which object infos, visual areas and the network dirty flag are refreshed, and keeps the placeable active. |
| `PlaceableObjectStorage:updateDirtyObjectStorageObjectInfos()` | 744 | ✍ If the refresh timer is running, rebuilds the object infos immediately (the timer keeps running for the visual and network update). |
| `PlaceableObjectStorage:updateObjectStorageObjectInfos()` | 753 | ✍ Rebuilds spec.objectInfos by grouping identical stored objects (via getIsIdentical), then sorts the groups by spawn width ascending. |
| `PlaceableObjectStorage:getObjectStorageObjectInfos()` | 790 | ✍ Returns the current list of object infos (groups of identical stored objects). |
| `PlaceableObjectStorage:updateObjectStorageVisualAreas()` | 796 | ✍ Rebuilds the visual copies of stored objects: creates a new hidden spawn node, computes positions in the storage areas for every object info and spawns them one info per update, then deletes the old node and shows the new one. |
| `PlaceableObjectStorage:getHasPendingManualStoreObjects()` | 870 | ✍ Returns true if a pending object cannot be stored automatically but could be stored manually. |
| `PlaceableObjectStorage:storePendingManualObjects()` | 889 | ✍ Stores every pending object that is allowed manually (not automatically), removes its delete listener and refreshes the manual store activatable. |
| `PlaceableObjectStorage:updateManualStoreActivatable()` | 912 | ✍ When the pending-manual-objects state changed, adds or removes the manual store activatable and raises the network dirty flag. |
| `PlaceableObjectStorage:onObjectStoragePlayerTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 930 | ✍ Player trigger callback: adds the unload activatable when the local player enters and removes it when leaving. |
| `PlaceableObjectStorage:onObjectStorageSpawnOverlapCallback(objectId: any)` | 998 | ✍ Overlap callback for the spawn test: ends the pending overlap and counts non-trigger hits, ignoring objects just spawned in this run. |
| `PlaceableObjectStorage:canBeSold(superFunc: any)` | 1017 | ✍ Override: returns true with a 'storage not empty' warning if any objects are stored, else defers to the parent. |
| `PlaceableObjectStorage:updateInfo(superFunc: any, infoTable: any)` | 1028 | ✍ Override: after the parent, adds a stored/capacity line, then one line per object info (title cut at 32 characters) up to MAX_HUD_INFO_ENTRIES, and a summed 'others' line for the rest. |
| `PlaceableObjectStorage.loadSpecValueCapacity(xmlFile: any, customEnvironment: any, baseDir: any)` | 1059 | ✍ Shop spec loader: returns the capacity, lowered to the sum of the supportedObject amounts when those limits are used; nil if the placeable has no objectStorage. |
| `PlaceableObjectStorage.getSpecValueCapacity(storeItem: any, realItem: any)` | 1082 | ✍ Returns the capacity formatted as a number of pieces for the shop, or nil if absent. |
| `PlaceableObjectStorage.loadSpecValueFillTypes(xmlFile: any, customEnvironment: any, baseDir: any)` | 1092 | ✍ Shop spec loader: collects the fill type indices named in the fillType attribute of each supportedObject entry. |
| `PlaceableObjectStorage.getSpecValueFillTypes(storeItem: any, realItem: any)` | 1110 | ✍ Returns the list of fill type indices for the shop display, or nil if there are none. |
| `PlaceableObjectStorageActivatable.new(objectStorage: any)` | 1861 | ✍ Creates the activatable that opens the unload menu, with its action text and 'storage is empty' warning text. |
| `PlaceableObjectStorageActivatable:getIsActivatable()` | 1873 | ✍ True only if the player has access to the storage and no spawn run is currently active. |
| `PlaceableObjectStorageActivatable:run()` | 1887 | ✍ Refreshes the object infos and opens ObjectStorageDialog with them and maxUnloadAmount, or shows a blinking warning for 2000 ms if the storage is empty. |
| `PlaceableObjectStorageActivatable:getDistance(x: any, y: any, z: any)` | 1900 | ✍ Returns the distance to the player trigger node, or math.huge if there is none. |
| `PlaceableObjectStorageActivatable:onObjectInfoSelected(objectInfoIndex: any, amount: any)` | 1911 | ✍ Dialog callback: if an info index and amount were chosen, sends PlaceableObjectStorageUnloadEvent to the server. |
| `PlaceableObjectStorageManualStoreActivatable.new(objectStorage: any)` | 1923 | ✍ Creates the activatable for manually storing pending objects, with the 'unload' button text. |
| `PlaceableObjectStorageManualStoreActivatable:getIsActivatable()` | 1934 | ✍ True if the player has access to the storage. |
| `PlaceableObjectStorageManualStoreActivatable:run()` | 1944 | ✍ Sends PlaceableObjectStorageStoreEvent for this storage to the server. |
| `PlaceableObjectStorageManualStoreActivatable:getDistance(x: any, y: any, z: any)` | 1950 | ✍ Returns the distance to the object trigger node, or math.huge if there is none (that node only exists on the server, so on clients this is always math.huge). |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `canBeSold` | 37 |
| registerOverwrittenFunction | `updateInfo` | 38 |
| registerFunction | `getObjectStorageSupportsFillType` | 44 |
| registerFunction | `getObjectStorageSupportsObject` | 45 |
| registerFunction | `getObjectStorageCanStoreObject` | 46 |
| registerFunction | `getIsBaleSupportedByUnloadTrigger` | 47 |
| registerFunction | `addObjectToObjectStorage` | 48 |
| registerFunction | `addAbstactObjectToObjectStorage` | 49 |
| registerFunction | `removeAbstractObjectsFromStorage` | 50 |
| registerFunction | `spawnNextObjectStorageObject` | 51 |
| registerFunction | `removeAbstractObjectFromStorage` | 52 |
| registerFunction | `setObjectStorageObjectInfosDirty` | 53 |
| registerFunction | `updateDirtyObjectStorageObjectInfos` | 54 |
| registerFunction | `updateObjectStorageObjectInfos` | 55 |
| registerFunction | `getObjectStorageObjectInfos` | 56 |
| registerFunction | `updateObjectStorageVisualAreas` | 57 |
| registerFunction | `getHasPendingManualStoreObjects` | 58 |
| registerFunction | `storePendingManualObjects` | 59 |
| registerFunction | `updateManualStoreActivatable` | 60 |
| registerFunction | `onObjectStoragePlayerTriggerCallback` | 61 |
| registerFunction | `onObjectStorageObjectTriggerCallback` | 62 |
| registerFunction | `onObjectStorageSpawnOverlapCallback` | 63 |
| registerEventListener | `onLoad` | 69 |
| registerEventListener | `onDelete` | 70 |
| registerEventListener | `onReadStream` | 71 |
| registerEventListener | `onWriteStream` | 72 |
| registerEventListener | `onReadUpdateStream` | 73 |
| registerEventListener | `onWriteUpdateStream` | 74 |
| registerEventListener | `onUpdate` | 75 |
