# vehicles/specializations/Mountable.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Mountable.md)*

Source: `dataS/scripts/vehicles/specializations/Mountable.lua` — FS25 1.25.1.0

✍ Specialization for objects that can be mounted onto another object: kinematically or by default (linked into the scene graph), or dynamically through a physics joint (for example on a fork). It has no prerequisites. It keeps the mount type and the mount object, raises onDynamicMountTypeChanged, syncs the type via MountableSetMountTypeEvent, and delegates the joint work to DynamicMountUtil (not in this dump, UNVERIFIED). Most mounting logic runs on the server.

- **Mountable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Mountable.prerequisitesPresent(specializations: any)` | 20 | ✍ Always returns true: no other specialization is required. |
| `Mountable.initSpecialization()` | 26 | ✍ Registers the XML paths under vehicle.dynamicMount: force limit scale, trigger and joint nodes, trigger force acceleration, free axes, folding, joint offsets, extra mount distance, mass reduction and lockPosition entries. |
| `Mountable.registerEvents(vehicleType: any)` | 56 | ✍ Declares the onDynamicMountTypeChanged event for the vehicle type. |
| `Mountable.registerFunctions(vehicleType: any)` | 62 | ✍ Registers the mount and unmount functions (default, kinematic, dynamic), mount type queries, mass handling, listeners and the force limit raycast helpers. |
| `Mountable.registerOverwrittenFunctions(vehicleType: any)` | 90 | ✍ Overrides getIsActive, getOwnerConnection, findRootVehicle, map hotspot visibility, additional component mass, setWorldPositionQuaternion, addToPhysics, removeFromPhysics and getIsFoldAllowed. Note: Mountable.addToPhysics and Mountable.removeFromPhysics are registered here but not defined in this file. |
| `Mountable.registerEventListeners(vehicleType: any)` | 104 | ✍ Subscribes to load, delete, stream read/write, update and pre-attach events. |
| `Mountable:onLoad(savegame: any)` | 115 | ✍ Reads the dynamicMount XML. On the server it registers the mount trigger and creates a dynamic joint node under the component. It also initialises the force limit update state, mass reduction flag, lock positions and the mount type NONE. |
| `Mountable:onDelete()` | 190 | ✍ Notifies the mount object, removes the dynamic joint and its break report, removes this object from the mount object's dynamic list and removes the trigger. |
| `Mountable:onReadStream(streamId: any, connection: any)` | 212 | ✍ Client on join: reads the mount type from the stream and applies it without sending an event. |
| `Mountable:onWriteStream(streamId: any, connection: any)` | 218 | ✍ Server on join: writes the mount type. Note: it reads spec_mountable.dynamicMountType, while the mount type is stored on the vehicle (self.dynamicMountType), so the spec field looks never set. |
| `Mountable:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 224 | ✍ Server only: unmounts dynamically once the mount trigger has no overlap left (waiting until the object has moved clear of the joint reference), and refreshes the joint force limit when allowed. |
| `Mountable:getSupportsMountDynamic()` | 253 | ✍ Returns true if a force limit scale is set, which is the default value 1 unless XML overrides it. |
| `Mountable:getSupportsMountKinematic()` | 260 | ✍ Returns true only for single-component vehicles. |
| `Mountable:onDynamicMountJointBreak(jointIndex: any, breakingImpulse: any)` | 266 | ✍ Joint break callback: unmounts dynamically if the broken joint is the mount joint and returns false so the engine does not delete the joint itself. |
| `Mountable:mountableTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 278 | ✍ Server trigger callback: when an object with a dynamic mount attacher enters, mounts dynamically as fork type (or remounts onto a new actor) and counts overlapping shapes; on leave it decrements and unmounts at zero if no joint node exists. |
| `Mountable:mount(object: any, node: any, x: any, y: any, z: any, rx: any, ry: any, rz: any)` | 318 | ✍ Default mount: cancels any dynamic mount, removes the component from physics if it was free, links it to the target node at the given offset and sets type DEFAULT. |
| `Mountable:unmount(noEventSend: any)` | 339 | ✍ Undoes a DEFAULT mount: notifies the mount object, relinks the component to the root keeping world pose, re-adds physics and sets type NONE. Returns true if it was mounted by default, false otherwise. |
| `Mountable:mountKinematic(object: any, node: any, x: any, y: any, z: any, rx: any, ry: any, rz: any)` | 366 | ✍ Kinematic mount: links the component to the node, makes the rigid body kinematic on the server and disables collision between it and the mount object's dynamic component. Sets type KINEMATIC. |
| `Mountable:unmountKinematic()` | 403 | ✍ Undoes a kinematic mount: restores collision, notifies the mount object, relinks to the root keeping world pose and makes the body dynamic again on the server. Returns true if it was kinematically mounted. |
| `Mountable:mountDynamic(object: any, objectActorId: any, jointNode: any, mountType: any, forceAcceleration: any)` | 447 | ✍ Tries to mount through a physics joint via DynamicMountUtil (UNVERIFIED internals). It refuses if already mounted, if both share the same root vehicle, or if a lateral joint would be too steep. Returns true and sets type DYNAMIC on success. |
| `Mountable:unmountDynamic(isDelete: any)` | 530 | ✍ Resets the mount type to NONE, notifies the mount object and asks DynamicMountUtil to remove the joint; the optional flag marks a deletion. |
| `Mountable:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 568 | ✍ Blocks folding with a warning text while the object is mounted, unless XML allows folding while mounted; otherwise defers to the parent. |
| `Mountable:getAdditionalMountingDistance()` | 578 | ✍ Returns the configured additional mount distance (object height, used when counting stacked objects). |
| `Mountable:getAdditionalMountingMass()` | 584 | ✍ Always returns 0; kept as an empty function for compatibility. |
| `Mountable:updateDynamicMountJointForceLimit(dt: any)` | 590 | ✍ Periodically starts an asynchronous upward raycast over dynamic objects to find objects stacked on this one; the result adjusts the joint force limit through the callback. |
| `Mountable:additionalMountingMassRaycastCallback(hitObjectId: integer, x: number, y: number, z: number, distance: number, nx: number, ny: number, nz: number, subShapeIndex: integer, shapeId: integer, isLast: boolean) → boolean` | 623 | ✍ Raycast callback: adds the mass of each stacked vehicle found at the expected spacing, and on the last hit sets the joint linear drive force limit scaled by total mass over base mass. Returns true to continue. |
| `Mountable:getIsActive(superFunc: any)` | 658 | ✍ Returns true if the vehicle is active itself or if the object it is mounted on is active. |
| `Mountable:getMountObject()` | 671 | ✍ Returns the object it is mounted on for non-dynamic mounts (default or kinematic); returns nil for a dynamic mount or when unmounted. |
| `Mountable:getDynamicMountObject()` | 681 | ✍ Resolves the stored network id to the mount object of any mount type, or nil. |
| `Mountable:setReducedComponentMass(state: any)` | 691 | ✍ Turns the reduced component mass flag on or off when mass reduction is allowed, marking mass dirty on change. Returns whether reduction is allowed. |
| `Mountable:getAllowComponentMassReduction()` | 707 | ✍ Returns whether the mount object may reduce this component's mass. |
| `Mountable:getDefaultAllowComponentMassReduction()` | 713 | ✍ Default for mass reduction when the XML does not set it: false. |
| `Mountable:getMountableLockPositions()` | 719 | ✍ Returns the table of lock positions loaded from XML (xmlFilename, joint node, offsets). |
| `Mountable:setDynamicMountType(mountType: any, mountObject: any, noEventSend: any)` | 725 | ✍ Changes the mount type and mount object id; on change it resets reduced mass for NONE, calls registered listeners, raises onDynamicMountTypeChanged and sends MountableSetMountTypeEvent unless suppressed. |
| `Mountable:addMountStateChangeListener(object: any, callbackFunc: any)` | 756 | ✍ Adds a mount state listener (object plus method name or function, default name onObjectMountStateChanged); duplicates are ignored. |
| `Mountable:removeMountStateChangeListener(object: any, callbackFunc: any)` | 773 | ✍ Removes a previously added mount state listener matching object and callback. |
| `Mountable:getOwnerConnection(superFunc: any)` | 793 | ✍ Returns the owner connection of the (non-dynamic) mount object if it has one, otherwise the parent's result. |
| `Mountable:findRootVehicle(superFunc: any)` | 806 | ✍ If the vehicle has no attacher root of its own, follows the mount object to find its root vehicle; falls back to itself. |
| `Mountable:getIsMapHotspotVisible(superFunc: any)` | 824 | ✍ Hides the map hotspot while the object is mounted on another object, otherwise uses the parent's answer. |
| `Mountable:getAdditionalComponentMass(superFunc: any, component: any)` | 838 | ✍ While reduced mass is active, returns an adjustment that leaves the component with only about 0.1 mass; otherwise the parent value. |
| `Mountable:setWorldPositionQuaternion(superFunc: number, x: number, y: number, z: number, qx: number, qy: number, qz: number, qw: number, i: integer, changeInterp: boolean)` | 860 | ✍ On clients, ignores received world positions while a non-dynamic mount object exists, since the pose follows the mount object; otherwise defers to the parent. |
| `Mountable:onPreAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 878 | ✍ Before being attached as an implement, drops any dynamic mount. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onDynamicMountTypeChanged` | 57 |
| registerFunction | `getSupportsMountDynamic` | 63 |
| registerFunction | `getSupportsMountKinematic` | 64 |
| registerFunction | `onDynamicMountJointBreak` | 65 |
| registerFunction | `mountableTriggerCallback` | 66 |
| registerFunction | `mount` | 67 |
| registerFunction | `unmount` | 68 |
| registerFunction | `mountKinematic` | 69 |
| registerFunction | `unmountKinematic` | 70 |
| registerFunction | `mountDynamic` | 71 |
| registerFunction | `unmountDynamic` | 72 |
| registerFunction | `getAdditionalMountingDistance` | 73 |
| registerFunction | `getAdditionalMountingMass` | 74 |
| registerFunction | `updateDynamicMountJointForceLimit` | 75 |
| registerFunction | `additionalMountingMassRaycastCallback` | 76 |
| registerFunction | `getMountObject` | 77 |
| registerFunction | `getDynamicMountObject` | 78 |
| registerFunction | `setReducedComponentMass` | 79 |
| registerFunction | `getAllowComponentMassReduction` | 80 |
| registerFunction | `getDefaultAllowComponentMassReduction` | 81 |
| registerFunction | `getMountableLockPositions` | 82 |
| registerFunction | `setDynamicMountType` | 83 |
| registerFunction | `addMountStateChangeListener` | 84 |
| registerFunction | `removeMountStateChangeListener` | 85 |
| registerOverwrittenFunction | `getIsActive` | 91 |
| registerOverwrittenFunction | `getOwnerConnection` | 92 |
| registerOverwrittenFunction | `findRootVehicle` | 93 |
| registerOverwrittenFunction | `getIsMapHotspotVisible` | 94 |
| registerOverwrittenFunction | `getAdditionalComponentMass` | 95 |
| registerOverwrittenFunction | `setWorldPositionQuaternion` | 96 |
| registerOverwrittenFunction | `addToPhysics` | 97 |
| registerOverwrittenFunction | `removeFromPhysics` | 98 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 99 |
| registerEventListener | `onLoad` | 105 |
| registerEventListener | `onDelete` | 106 |
| registerEventListener | `onReadStream` | 107 |
| registerEventListener | `onWriteStream` | 108 |
| registerEventListener | `onUpdate` | 109 |
| registerEventListener | `onPreAttach` | 110 |
