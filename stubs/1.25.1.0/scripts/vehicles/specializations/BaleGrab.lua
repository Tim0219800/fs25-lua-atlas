---@meta
-- FS25 1.25.1.0 : vehicles/specializations/BaleGrab.lua (generated stub, FS25 Lua Atlas)

--- Specialization for bale grabs (front-loader or telehandler tools) that hold bales by dynamically mounting them once the grab arms are closed. Everything is server-side: a trigger node collects bales in reach, and component-joint offsets (rotation or translation) tell when each grab has closed. Closing is also throttled by a timer and by blocking configured moving tools. It also registers two shop spec values (round and square bale sizes). Reads the `vehicle.baleGrab` XML keys. The constant `BaleGrab.CLOSE_TIMER` is used but not defined in this file (UNVERIFIED where it is set).
---@class BaleGrab
BaleGrab = {}

--- Always returns true: this specialization has no prerequisites on other specializations.
---@param specializations any
function BaleGrab.prerequisitesPresent(specializations) end

--- Registers the `vehicle.baleGrab` XML schema keys (sizes, trigger, mount type, per-grab joint and moving-tool settings) and declares the two shop spec types for round and square bale sizes.
function BaleGrab.initSpecialization() end

--- Adds the grab's vehicle functions: trigger callback, add/remove dynamic mounted object, closed check, and mount/unmount of a bale.
---@param vehicleType any
function BaleGrab.registerFunctions(vehicleType) end

--- Overrides `getMovingToolMoveValue` so that closing moving tools can be blocked while a bale is being gripped.
---@param vehicleType any
function BaleGrab.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onDelete and onUpdateTick.
---@param vehicleType any
function BaleGrab.registerEventListeners(vehicleType) end

--- Server only: reads the trigger, root node, mount type, force acceleration and each grab (joint index, rotation or translation axis and threshold, moving tools). Creates a joint node and the trigger. If no trigger node is set, removes the other listeners.
---@param savegame table
function BaleGrab:onLoad(savegame) end

--- Resolves each grab's moving-tool nodes into real moving tools and drops entries with no match.
---@param savegame any
function BaleGrab:onPostLoad(savegame) end

--- Removes delete and mount-state listeners from pending bales, unmounts every mounted object, and removes the trigger.
function BaleGrab:onDelete() end

--- Server only: per grab, runs the close timer and a joint checksum so that small impacts do not toggle the state. When all grabs are closed, it mounts pending bales and raises joint damping; otherwise it unmounts them and restores the damping.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function BaleGrab:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Override: returns the normal move value, but forces 0 when a bale is pending and the tool is moving in its closing direction while the close timer is running. Also stores the last move value.
---@param superFunc any
---@param movingTool any
function BaleGrab:getMovingToolMoveValue(superFunc, movingTool) end

--- Records an object in the table of objects currently mounted on the grab.
---@param object table
function BaleGrab:addDynamicMountedObject(object) end

--- Calls `unmountDynamic` on the object if it is dynamically mounted and forgets it. With `isDeleting` it is also removed from the pending list.
---@param object table
---@param isDeleting boolean
function BaleGrab:removeDynamicMountedObject(object, isDeleting) end

--- Delete listener: when a pending or mounted object is deleted, removes it from the grab with the deleting flag.
---@param self any
---@param object any
function BaleGrab.onPendingObjectDelete(self, object) end

--- Mount-state listener: if the object gets mounted by something other than this grab, it is released from the grab's pending and mounted tables.
---@param self any
---@param object any
---@param mountState any
---@param mountObject any
function BaleGrab.onPendingObjectMountStateChanged(self, object, mountState, mountObject) end

--- Trigger callback. On enter, counts the shapes of a mountable object (with mount-state listener support) and registers listeners on its first shape. On leave, decrements the count and releases the object at zero.
---@param triggerId integer
---@param otherActorId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function BaleGrab:baleGrabTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

--- Returns true when one grab is closed: false while its moving tools are fully open, otherwise true if the joint offset exceeds the rotation or translation threshold. Updates the cached offsets.
---@param grab any
function BaleGrab:getIsBaleGrabClosed(grab) end

--- Places the joint node at the object's center of mass and calls `mountDynamic`. On success sets the joint springs, registers the object as mounted and returns true.
---@param object table
---@return boolean
function BaleGrab:mountBaleGrabObject(object) end

--- Releases a mounted object from the grab (without the deleting flag). Always returns true.
---@param object table
---@return boolean
function BaleGrab:unmountBaleGrabObject(object) end

--- Server only: adds debug lines to the given table: offset, threshold and state per grab, moving-tool direction (with blocked flag), and the pending or mounted objects.
---@param values any
function BaleGrab:updateDebugValues(values) end

--- Reads a min and max size from two XML keys, rounded to 2 decimals. Returns a table with minSize and maxSize, or nil if both are 0.
---@param xmlFile any
---@param minKey any
---@param maxKey any
function BaleGrab.loadSpecValueMaxSize(xmlFile, minKey, maxKey) end

--- Shop loader for round bale sizes, using `vehicle.baleGrab#minSizeRound` and `#maxSizeRound`.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function BaleGrab.loadSpecValueMaxSizeRound(xmlFile, customEnvironment, baseDir) end

--- Shop loader for square bale sizes, using `vehicle.baleGrab#minSizeSquare` and `#maxSizeSquare`.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function BaleGrab.loadSpecValueMaxSizeSquare(xmlFile, customEnvironment, baseDir) end

--- Formats the stored bale size for the shop, in cm (values multiplied by 100). Returns a text such as a range or a single value, or raw numbers plus the unit when `returnValues` is set.
---@param specName any
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function BaleGrab.getSpecValueMaxSize(specName, storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

--- Shop getter for round bale size; delegates to `getSpecValueMaxSize` with the `baleGrabMaxSizeRound` spec.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function BaleGrab.getSpecValueMaxSizeRound(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

--- Shop getter for square bale size; delegates to `getSpecValueMaxSize` with the `baleGrabMaxSizeSquare` spec.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function BaleGrab.getSpecValueMaxSizeSquare(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
