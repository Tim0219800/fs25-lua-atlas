# vehicles/specializations/DynamicMountAttacher.lua

*[Version française](../../../fr/scripts/vehicles/specializations/DynamicMountAttacher.md)*

Source: `dataS/scripts/vehicles/specializations/DynamicMountAttacher.lua` — FS25 1.25.1.0

✍ Vehicle specialization with no prerequisites that lets a vehicle automatically grab loose objects (bales, pallets, mountable vehicles such as cutter trailers) through a trigger and a physics joint, without a normal attacher joint. Objects stay pending until they have been motionless for a delay, then get mounted; optional lock positions snap known vehicles to fixed places. The server does the mounting and sends the mounted and pending object lists to clients through the update stream; it is configured under vehicle.dynamicMountAttacher in the XML.

- **DynamicMountAttacher** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `DynamicMountAttacher.prerequisitesPresent(specializations: any)` | 17 | ✍ Always returns true: no prerequisite specialization is needed. |
| `DynamicMountAttacher.initSpecialization()` | 23 | ✍ Registers the XML schema keys under vehicle.dynamicMountAttacher (node, trigger, joint, mount types, forks, grab, lock positions, animation, folding) and the dynamicMountAttacher entries on Cylindered moving tools and parts. |
| `DynamicMountAttacher.registerFunctions(vehicleType: any)` | 81 | ✍ Registers the vehicle-level functions of this specialization (lock position loading, mount/unmount, stream read/write, grab state, forced mount/unmount, trigger and overlap callbacks). |
| `DynamicMountAttacher.registerOverwrittenFunctions(vehicleType: any)` | 106 | ✍ Overrides getFillLevelInformation, loadExtraDependentParts, updateExtraDependentParts, getIsAttachedTo, getAdditionalComponentMass, getIsFoldAllowed, loadMovingToolFromXML and getIsMovingToolActive. Note: getHasObjectMounted is defined in the file but not registered here. |
| `DynamicMountAttacher.registerEventListeners(vehicleType: any)` | 119 | ✍ Subscribes to onLoad, onDelete, onReadUpdateStream, onWriteUpdateStream, onUpdateTick and onPreAttachImplement. |
| `DynamicMountAttacher:onLoad(savegame: any)` | 130 | ✍ Reads the XML settings; on the server also loads fork nodes (checking their collision group), the mount trigger with its collision-mask checks, transfer-mass option and lock positions. Starts the optional animation and creates the dirty flag for the mounted-object lists. |
| `DynamicMountAttacher:onDelete()` | 235 | ✍ On the server, unmounts every mounted object; then removes the mount trigger and its node-to-object registration. |
| `DynamicMountAttacher:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 252 | ✍ Client side: when the dirty bit is set, reads the mounted objects and the pending objects, and updates the mount animation state according to whether anything is mounted. |
| `DynamicMountAttacher:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 267 | ✍ Server side: when the object-list dirty flag is set, writes the mounted objects and the pending objects to the stream. |
| `DynamicMountAttacher:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 280 | ✍ Server only. When mounting is allowed, mounts pending objects once they have been still for the mount delay (via mountDynamic and a joint node), drops pending ones that cannot be mounted, and unmounts all objects when mounting becomes disallowed. Also switches joint limits when the grab opens or closes. |
| `DynamicMountAttacher:lockDynamicMountedObject(object: any, x: any, y: any, z: any, rx: any, ry: any, rz: any)` | 406 | ✍ Unmounts the object, moves it to the given world position and rotation (removing and re-adding it to physics) and mounts it again on the trigger joint. Returns false and removes the object from the mounted list if the mount fails. |
| `DynamicMountAttacher:addDynamicMountedObject(object: any)` | 430 | ✍ Registers an object as mounted: tries to snap it to a lock position (from the object's own positions or this vehicle's matching ones, with an optional overlap-box collision test), applies mass transfer, disables collisions between mounted objects if configured, starts the animation and flags a network update. |
| `DynamicMountAttacher:removeDynamicMountedObject(object: any, isDeleting: any)` | 535 | ✍ Removes an object from the mounted list (and from the pending list when it is being deleted), frees its lock position and its object changes, restores pair collisions, reverses the animation and flags a network update. |
| `DynamicMountAttacher:onUnmountObject(object: any)` | 576 | ✍ Callback used when an object gets unmounted from outside: removes it from the mounted list if it was there. |
| `DynamicMountAttacher:setDynamicMountAnimationState(state: any)` | 585 | ✍ Plays the configured animation forward (true) or backward (false) from its current time. The code does not guard against a missing animation name here (UNVERIFIED whether playAnimation tolerates nil). |
| `DynamicMountAttacher:loadDynamicLockPositionFromXML(xmlFile: any, key: any, lockPosition: any)` | 597 | ✍ Loads one lock position: xmlFilename (with $data replaced), joint node, optional configuration filters, optional width/length/height for collision checks and object changes. Returns false with a warning when filename or joint node is missing. |
| `DynamicMountAttacher:getIsDynamicLockPositionActive(lockPosition: any)` | 635 | ✍ Returns true when the given lock position is free (not currently holding an object). |
| `DynamicMountAttacher:writeDynamicMountObjectsToStream(streamId: any, objects: any)` | 641 | ✍ Writes the number of objects (capped by the configured bit count) then each object by network node id. Logs a warning if there are too many to send; raise numObjectBits in that case. |
| `DynamicMountAttacher:readDynamicMountObjectsFromStream(streamId: any, objects: any)` | 659 | ✍ Clears the given table, reads the count and the objects from the stream and refills the table. Returns the count read. |
| `DynamicMountAttacher:getAllowDynamicMountObjects()` | 679 | ✍ Returns true by default; other specializations override it to forbid mounting in some states. |
| `DynamicMountAttacher:dynamicMountTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 685 | ✍ Trigger callback. For dynamic rigid bodies it counts overlaps: on enter, mountable objects (bales, tension-belt vehicles) become pending, ignoring the root and attacher vehicles; on leave, the object is dropped from pending and unmounted when its count reaches zero. With limitToKnownObjects, only vehicles matching a free lock position qualify. |
| `DynamicMountAttacher:getAllowDynamicMountFillLevelInfo()` | 774 | ✍ Returns true by default: fill levels of mounted objects are included in this vehicle's fill level information. |
| `DynamicMountAttacher:loadDynamicMountGrabFromXML(xmlFile: any, key: any, entry: any)` | 780 | ✍ Fills a grab entry from the XML: open and closed mount types (defaults fork and auto-attach XYZ, via DynamicMountUtil) and the current type, initialised to open. Always returns true. |
| `DynamicMountAttacher:getIsDynamicMountGrabOpened(grab: any)` | 794 | ✍ Returns true by default (grab open); meant to be overridden by specializations that implement a real grab. |
| `DynamicMountAttacher:getDynamicMountTimeToMount()` | 800 | ✍ Returns the delay in milliseconds an object must stay motionless before being mounted (timeToMount, default 1000). |
| `DynamicMountAttacher:getHasDynamicMountedObjects()` | 806 | ✍ Returns true if at least one object is currently mounted. |
| `DynamicMountAttacher:forceDynamicMountPendingObjects(onlyBales: any)` | 812 | ✍ If mounting is allowed, immediately mounts pending objects without waiting for the delay; with onlyBales set, only Bale objects are affected. |
| `DynamicMountAttacher:forceUnmountDynamicMountedObjects()` | 831 | ✍ Unmounts every mounted object and deletes its additional joint node. |
| `DynamicMountAttacher:getDynamicMountAttacherSettingsByNode(node: any)` | 846 | ✍ Returns the mount type and force limit scale of the fork configured for a node, or fork type and 1 if no fork matches. Fork data exists on the server only. |
| `DynamicMountAttacher:dynamicMountLockPositionOverlapCallback(transformId: any)` | 859 | ✍ Overlap-box callback: sets a collision flag when the hit node belongs to a known object or player other than this vehicle and the vehicle being mounted. |
| `DynamicMountAttacher:getFillLevelInformation(superFunc: any, display: any)` | 870 | ✍ Override: after the parent, adds the fill levels of mounted objects to the display, using their own getFillLevelInformation or else fill type, level and capacity. Skipped if getAllowDynamicMountFillLevelInfo returns false. |
| `DynamicMountAttacher:getHasObjectMounted(superFunc: table, object: table) → boolean` | 898 | ✍ Intended override: true if the parent says so or the object is mounted here, directly or through a mounted object. Note: it is not registered in registerOverwrittenFunctions, so it is likely not called through the override chain (UNVERIFIED). |
| `DynamicMountAttacher:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 921 | ✍ Override: after the parent loads, reads the dynamicMountAttacher#value flag of a dependent part, telling whether it must update the mount joints. |
| `DynamicMountAttacher:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 933 | ✍ Override, server only: for parts flagged to update the attacher, resets the joint frame of every mounted object to its mount joint node. |
| `DynamicMountAttacher:getIsAttachedTo(superFunc: any, vehicle: any)` | 948 | ✍ Override: also returns true when the given vehicle is mounted or pending on this vehicle. |
| `DynamicMountAttacher:getAdditionalComponentMass(superFunc: any, component: any)` | 972 | ✍ Override: when transferMass is on, adds the default mass (minus 0.1) of mounted objects that allow mass reduction to the component holding the trigger. |
| `DynamicMountAttacher:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any) → boolean` | 992 | ✍ Override: refuses folding with a 'tool is full' warning if allowFoldingWhileMounted is false and something is mounted; otherwise defers to the parent. |
| `DynamicMountAttacher:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1004 | ✍ Override: after the parent, reads dynamicMountAttacher#allowedMounted (default true) for the moving tool. |
| `DynamicMountAttacher:getIsMovingToolActive(superFunc: any, movingTool: any)` | 1016 | ✍ Override: a moving tool that is not allowed while mounted is inactive whenever an object is mounted; otherwise defers to the parent. |
| `DynamicMountAttacher:onPreAttachImplement(object: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 1028 | ✍ Server only: when this vehicle is about to be attached to another that has this specialization, removes it from that vehicle's pending list and unmounts it if it was dynamically mounted there. |
| `DynamicMountAttacher:updateDebugValues(values: any)` | 1046 | ✍ Debug helper: appends to the debug value list the remaining mount time, pending and mounted objects (with joint info and a debug point on the server), the allow-mount state and the grab state. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadDynamicLockPositionFromXML` | 82 |
| registerFunction | `getIsDynamicLockPositionActive` | 83 |
| registerFunction | `writeDynamicMountObjectsToStream` | 84 |
| registerFunction | `readDynamicMountObjectsFromStream` | 85 |
| registerFunction | `getAllowDynamicMountObjects` | 86 |
| registerFunction | `dynamicMountTriggerCallback` | 87 |
| registerFunction | `lockDynamicMountedObject` | 88 |
| registerFunction | `addDynamicMountedObject` | 89 |
| registerFunction | `removeDynamicMountedObject` | 90 |
| registerFunction | `onUnmountObject` | 91 |
| registerFunction | `setDynamicMountAnimationState` | 92 |
| registerFunction | `getAllowDynamicMountFillLevelInfo` | 93 |
| registerFunction | `loadDynamicMountGrabFromXML` | 94 |
| registerFunction | `getIsDynamicMountGrabOpened` | 95 |
| registerFunction | `getDynamicMountTimeToMount` | 96 |
| registerFunction | `getHasDynamicMountedObjects` | 97 |
| registerFunction | `forceDynamicMountPendingObjects` | 98 |
| registerFunction | `forceUnmountDynamicMountedObjects` | 99 |
| registerFunction | `getDynamicMountAttacherSettingsByNode` | 100 |
| registerFunction | `dynamicMountLockPositionOverlapCallback` | 101 |
| registerOverwrittenFunction | `getFillLevelInformation` | 107 |
| registerOverwrittenFunction | `loadExtraDependentParts` | 108 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 109 |
| registerOverwrittenFunction | `getIsAttachedTo` | 110 |
| registerOverwrittenFunction | `getAdditionalComponentMass` | 111 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 112 |
| registerOverwrittenFunction | `loadMovingToolFromXML` | 113 |
| registerOverwrittenFunction | `getIsMovingToolActive` | 114 |
| registerEventListener | `onLoad` | 120 |
| registerEventListener | `onDelete` | 121 |
| registerEventListener | `onReadUpdateStream` | 122 |
| registerEventListener | `onWriteUpdateStream` | 123 |
| registerEventListener | `onUpdateTick` | 124 |
| registerEventListener | `onPreAttachImplement` | 125 |
