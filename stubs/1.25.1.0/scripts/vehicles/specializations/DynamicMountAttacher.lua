---@meta
-- FS25 1.25.1.0 : vehicles/specializations/DynamicMountAttacher.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization with no prerequisites that lets a vehicle automatically grab loose objects (bales, pallets, mountable vehicles such as cutter trailers) through a trigger and a physics joint, without a normal attacher joint. Objects stay pending until they have been motionless for a delay, then get mounted; optional lock positions snap known vehicles to fixed places. The server does the mounting and sends the mounted and pending object lists to clients through the update stream; it is configured under vehicle.dynamicMountAttacher in the XML.
---@class DynamicMountAttacher
DynamicMountAttacher = {}

--- Always returns true: no prerequisite specialization is needed.
---@param specializations any
function DynamicMountAttacher.prerequisitesPresent(specializations) end

--- Registers the XML schema keys under vehicle.dynamicMountAttacher (node, trigger, joint, mount types, forks, grab, lock positions, animation, folding) and the dynamicMountAttacher entries on Cylindered moving tools and parts.
function DynamicMountAttacher.initSpecialization() end

--- Registers the vehicle-level functions of this specialization (lock position loading, mount/unmount, stream read/write, grab state, forced mount/unmount, trigger and overlap callbacks).
---@param vehicleType any
function DynamicMountAttacher.registerFunctions(vehicleType) end

--- Overrides getFillLevelInformation, loadExtraDependentParts, updateExtraDependentParts, getIsAttachedTo, getAdditionalComponentMass, getIsFoldAllowed, loadMovingToolFromXML and getIsMovingToolActive. Note: getHasObjectMounted is defined in the file but not registered here.
---@param vehicleType any
function DynamicMountAttacher.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, onReadUpdateStream, onWriteUpdateStream, onUpdateTick and onPreAttachImplement.
---@param vehicleType any
function DynamicMountAttacher.registerEventListeners(vehicleType) end

--- Reads the XML settings; on the server also loads fork nodes (checking their collision group), the mount trigger with its collision-mask checks, transfer-mass option and lock positions. Starts the optional animation and creates the dirty flag for the mounted-object lists.
---@param savegame any
function DynamicMountAttacher:onLoad(savegame) end

--- On the server, unmounts every mounted object; then removes the mount trigger and its node-to-object registration.
function DynamicMountAttacher:onDelete() end

--- Client side: when the dirty bit is set, reads the mounted objects and the pending objects, and updates the mount animation state according to whether anything is mounted.
---@param streamId any
---@param timestamp any
---@param connection any
function DynamicMountAttacher:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: when the object-list dirty flag is set, writes the mounted objects and the pending objects to the stream.
---@param streamId any
---@param connection any
---@param dirtyMask any
function DynamicMountAttacher:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Server only. When mounting is allowed, mounts pending objects once they have been still for the mount delay (via mountDynamic and a joint node), drops pending ones that cannot be mounted, and unmounts all objects when mounting becomes disallowed. Also switches joint limits when the grab opens or closes.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function DynamicMountAttacher:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Unmounts the object, moves it to the given world position and rotation (removing and re-adding it to physics) and mounts it again on the trigger joint. Returns false and removes the object from the mounted list if the mount fails.
---@param object any
---@param x any
---@param y any
---@param z any
---@param rx any
---@param ry any
---@param rz any
function DynamicMountAttacher:lockDynamicMountedObject(object, x, y, z, rx, ry, rz) end

--- Registers an object as mounted: tries to snap it to a lock position (from the object's own positions or this vehicle's matching ones, with an optional overlap-box collision test), applies mass transfer, disables collisions between mounted objects if configured, starts the animation and flags a network update.
---@param object any
function DynamicMountAttacher:addDynamicMountedObject(object) end

--- Removes an object from the mounted list (and from the pending list when it is being deleted), frees its lock position and its object changes, restores pair collisions, reverses the animation and flags a network update.
---@param object any
---@param isDeleting any
function DynamicMountAttacher:removeDynamicMountedObject(object, isDeleting) end

--- Callback used when an object gets unmounted from outside: removes it from the mounted list if it was there.
---@param object any
function DynamicMountAttacher:onUnmountObject(object) end

--- Plays the configured animation forward (true) or backward (false) from its current time. The code does not guard against a missing animation name here (UNVERIFIED whether playAnimation tolerates nil).
---@param state any
function DynamicMountAttacher:setDynamicMountAnimationState(state) end

--- Loads one lock position: xmlFilename (with $data replaced), joint node, optional configuration filters, optional width/length/height for collision checks and object changes. Returns false with a warning when filename or joint node is missing.
---@param xmlFile any
---@param key any
---@param lockPosition any
function DynamicMountAttacher:loadDynamicLockPositionFromXML(xmlFile, key, lockPosition) end

--- Returns true when the given lock position is free (not currently holding an object).
---@param lockPosition any
function DynamicMountAttacher:getIsDynamicLockPositionActive(lockPosition) end

--- Writes the number of objects (capped by the configured bit count) then each object by network node id. Logs a warning if there are too many to send; raise numObjectBits in that case.
---@param streamId any
---@param objects any
function DynamicMountAttacher:writeDynamicMountObjectsToStream(streamId, objects) end

--- Clears the given table, reads the count and the objects from the stream and refills the table. Returns the count read.
---@param streamId any
---@param objects any
function DynamicMountAttacher:readDynamicMountObjectsFromStream(streamId, objects) end

--- Returns true by default; other specializations override it to forbid mounting in some states.
function DynamicMountAttacher:getAllowDynamicMountObjects() end

--- Trigger callback. For dynamic rigid bodies it counts overlaps: on enter, mountable objects (bales, tension-belt vehicles) become pending, ignoring the root and attacher vehicles; on leave, the object is dropped from pending and unmounted when its count reaches zero. With limitToKnownObjects, only vehicles matching a free lock position qualify.
---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function DynamicMountAttacher:dynamicMountTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

--- Returns true by default: fill levels of mounted objects are included in this vehicle's fill level information.
function DynamicMountAttacher:getAllowDynamicMountFillLevelInfo() end

--- Fills a grab entry from the XML: open and closed mount types (defaults fork and auto-attach XYZ, via DynamicMountUtil) and the current type, initialised to open. Always returns true.
---@param xmlFile any
---@param key any
---@param entry any
function DynamicMountAttacher:loadDynamicMountGrabFromXML(xmlFile, key, entry) end

--- Returns true by default (grab open); meant to be overridden by specializations that implement a real grab.
---@param grab any
function DynamicMountAttacher:getIsDynamicMountGrabOpened(grab) end

--- Returns the delay in milliseconds an object must stay motionless before being mounted (timeToMount, default 1000).
function DynamicMountAttacher:getDynamicMountTimeToMount() end

--- Returns true if at least one object is currently mounted.
function DynamicMountAttacher:getHasDynamicMountedObjects() end

--- If mounting is allowed, immediately mounts pending objects without waiting for the delay; with onlyBales set, only Bale objects are affected.
---@param onlyBales any
function DynamicMountAttacher:forceDynamicMountPendingObjects(onlyBales) end

--- Unmounts every mounted object and deletes its additional joint node.
function DynamicMountAttacher:forceUnmountDynamicMountedObjects() end

--- Returns the mount type and force limit scale of the fork configured for a node, or fork type and 1 if no fork matches. Fork data exists on the server only.
---@param node any
function DynamicMountAttacher:getDynamicMountAttacherSettingsByNode(node) end

--- Overlap-box callback: sets a collision flag when the hit node belongs to a known object or player other than this vehicle and the vehicle being mounted.
---@param transformId any
function DynamicMountAttacher:dynamicMountLockPositionOverlapCallback(transformId) end

--- Override: after the parent, adds the fill levels of mounted objects to the display, using their own getFillLevelInformation or else fill type, level and capacity. Skipped if getAllowDynamicMountFillLevelInfo returns false.
---@param superFunc any
---@param display any
function DynamicMountAttacher:getFillLevelInformation(superFunc, display) end

--- Intended override: true if the parent says so or the object is mounted here, directly or through a mounted object. Note: it is not registered in registerOverwrittenFunctions, so it is likely not called through the override chain (UNVERIFIED).
---@param superFunc table
---@param object table
---@return boolean
function DynamicMountAttacher:getHasObjectMounted(superFunc, object) end

--- Override: after the parent loads, reads the dynamicMountAttacher#value flag of a dependent part, telling whether it must update the mount joints.
---@param superFunc any
---@param xmlFile any
---@param baseName any
---@param entry any
function DynamicMountAttacher:loadExtraDependentParts(superFunc, xmlFile, baseName, entry) end

--- Override, server only: for parts flagged to update the attacher, resets the joint frame of every mounted object to its mount joint node.
---@param superFunc any
---@param part any
---@param dt any
function DynamicMountAttacher:updateExtraDependentParts(superFunc, part, dt) end

--- Override: also returns true when the given vehicle is mounted or pending on this vehicle.
---@param superFunc any
---@param vehicle any
function DynamicMountAttacher:getIsAttachedTo(superFunc, vehicle) end

--- Override: when transferMass is on, adds the default mass (minus 0.1) of mounted objects that allow mass reduction to the component holding the trigger.
---@param superFunc any
---@param component any
function DynamicMountAttacher:getAdditionalComponentMass(superFunc, component) end

--- Override: refuses folding with a 'tool is full' warning if allowFoldingWhileMounted is false and something is mounted; otherwise defers to the parent.
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
---@return boolean
function DynamicMountAttacher:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- Override: after the parent, reads dynamicMountAttacher#allowedMounted (default true) for the moving tool.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function DynamicMountAttacher:loadMovingToolFromXML(superFunc, xmlFile, key, entry) end

--- Override: a moving tool that is not allowed while mounted is inactive whenever an object is mounted; otherwise defers to the parent.
---@param superFunc any
---@param movingTool any
function DynamicMountAttacher:getIsMovingToolActive(superFunc, movingTool) end

--- Server only: when this vehicle is about to be attached to another that has this specialization, removes it from that vehicle's pending list and unmounts it if it was dynamically mounted there.
---@param object any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function DynamicMountAttacher:onPreAttachImplement(object, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

--- Debug helper: appends to the debug value list the remaining mount time, pending and mounted objects (with joint info and a debug point on the server), the allow-mount state and the grab state.
---@param values any
function DynamicMountAttacher:updateDebugValues(values) end
