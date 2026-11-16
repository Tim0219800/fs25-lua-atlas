---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Mountable.lua (generated stub, FS25 Lua Atlas)

--- Specialization for objects that can be mounted onto another object: kinematically or by default (linked into the scene graph), or dynamically through a physics joint (for example on a fork). It has no prerequisites. It keeps the mount type and the mount object, raises onDynamicMountTypeChanged, syncs the type via MountableSetMountTypeEvent, and delegates the joint work to DynamicMountUtil (not in this dump, UNVERIFIED). Most mounting logic runs on the server.
---@class Mountable
Mountable = {}

--- Always returns true: no other specialization is required.
---@param specializations any
function Mountable.prerequisitesPresent(specializations) end

--- Registers the XML paths under vehicle.dynamicMount: force limit scale, trigger and joint nodes, trigger force acceleration, free axes, folding, joint offsets, extra mount distance, mass reduction and lockPosition entries.
function Mountable.initSpecialization() end

--- Declares the onDynamicMountTypeChanged event for the vehicle type.
---@param vehicleType any
function Mountable.registerEvents(vehicleType) end

--- Registers the mount and unmount functions (default, kinematic, dynamic), mount type queries, mass handling, listeners and the force limit raycast helpers.
---@param vehicleType any
function Mountable.registerFunctions(vehicleType) end

--- Overrides getIsActive, getOwnerConnection, findRootVehicle, map hotspot visibility, additional component mass, setWorldPositionQuaternion, addToPhysics, removeFromPhysics and getIsFoldAllowed. Note: Mountable.addToPhysics and Mountable.removeFromPhysics are registered here but not defined in this file.
---@param vehicleType any
function Mountable.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, delete, stream read/write, update and pre-attach events.
---@param vehicleType any
function Mountable.registerEventListeners(vehicleType) end

--- Reads the dynamicMount XML. On the server it registers the mount trigger and creates a dynamic joint node under the component. It also initialises the force limit update state, mass reduction flag, lock positions and the mount type NONE.
---@param savegame any
function Mountable:onLoad(savegame) end

--- Notifies the mount object, removes the dynamic joint and its break report, removes this object from the mount object's dynamic list and removes the trigger.
function Mountable:onDelete() end

--- Client on join: reads the mount type from the stream and applies it without sending an event.
---@param streamId any
---@param connection any
function Mountable:onReadStream(streamId, connection) end

--- Server on join: writes the mount type. Note: it reads spec_mountable.dynamicMountType, while the mount type is stored on the vehicle (self.dynamicMountType), so the spec field looks never set.
---@param streamId any
---@param connection any
function Mountable:onWriteStream(streamId, connection) end

--- Server only: unmounts dynamically once the mount trigger has no overlap left (waiting until the object has moved clear of the joint reference), and refreshes the joint force limit when allowed.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Mountable:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Returns true if a force limit scale is set, which is the default value 1 unless XML overrides it.
function Mountable:getSupportsMountDynamic() end

--- Returns true only for single-component vehicles.
function Mountable:getSupportsMountKinematic() end

--- Joint break callback: unmounts dynamically if the broken joint is the mount joint and returns false so the engine does not delete the joint itself.
---@param jointIndex any
---@param breakingImpulse any
function Mountable:onDynamicMountJointBreak(jointIndex, breakingImpulse) end

--- Server trigger callback: when an object with a dynamic mount attacher enters, mounts dynamically as fork type (or remounts onto a new actor) and counts overlapping shapes; on leave it decrements and unmounts at zero if no joint node exists.
---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function Mountable:mountableTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

--- Default mount: cancels any dynamic mount, removes the component from physics if it was free, links it to the target node at the given offset and sets type DEFAULT.
---@param object any
---@param node any
---@param x any
---@param y any
---@param z any
---@param rx any
---@param ry any
---@param rz any
function Mountable:mount(object, node, x, y, z, rx, ry, rz) end

--- Undoes a DEFAULT mount: notifies the mount object, relinks the component to the root keeping world pose, re-adds physics and sets type NONE. Returns true if it was mounted by default, false otherwise.
---@param noEventSend any
function Mountable:unmount(noEventSend) end

--- Kinematic mount: links the component to the node, makes the rigid body kinematic on the server and disables collision between it and the mount object's dynamic component. Sets type KINEMATIC.
---@param object any
---@param node any
---@param x any
---@param y any
---@param z any
---@param rx any
---@param ry any
---@param rz any
function Mountable:mountKinematic(object, node, x, y, z, rx, ry, rz) end

--- Undoes a kinematic mount: restores collision, notifies the mount object, relinks to the root keeping world pose and makes the body dynamic again on the server. Returns true if it was kinematically mounted.
function Mountable:unmountKinematic() end

--- Tries to mount through a physics joint via DynamicMountUtil (UNVERIFIED internals). It refuses if already mounted, if both share the same root vehicle, or if a lateral joint would be too steep. Returns true and sets type DYNAMIC on success.
---@param object any
---@param objectActorId any
---@param jointNode any
---@param mountType any
---@param forceAcceleration any
function Mountable:mountDynamic(object, objectActorId, jointNode, mountType, forceAcceleration) end

--- Resets the mount type to NONE, notifies the mount object and asks DynamicMountUtil to remove the joint; the optional flag marks a deletion.
---@param isDelete any
function Mountable:unmountDynamic(isDelete) end

--- Blocks folding with a warning text while the object is mounted, unless XML allows folding while mounted; otherwise defers to the parent.
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function Mountable:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- Returns the configured additional mount distance (object height, used when counting stacked objects).
function Mountable:getAdditionalMountingDistance() end

--- Always returns 0; kept as an empty function for compatibility.
function Mountable:getAdditionalMountingMass() end

--- Periodically starts an asynchronous upward raycast over dynamic objects to find objects stacked on this one; the result adjusts the joint force limit through the callback.
---@param dt any
function Mountable:updateDynamicMountJointForceLimit(dt) end

--- Raycast callback: adds the mass of each stacked vehicle found at the expected spacing, and on the last hit sets the joint linear drive force limit scaled by total mass over base mass. Returns true to continue.
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

--- Returns true if the vehicle is active itself or if the object it is mounted on is active.
---@param superFunc any
function Mountable:getIsActive(superFunc) end

--- Returns the object it is mounted on for non-dynamic mounts (default or kinematic); returns nil for a dynamic mount or when unmounted.
function Mountable:getMountObject() end

--- Resolves the stored network id to the mount object of any mount type, or nil.
function Mountable:getDynamicMountObject() end

--- Turns the reduced component mass flag on or off when mass reduction is allowed, marking mass dirty on change. Returns whether reduction is allowed.
---@param state any
function Mountable:setReducedComponentMass(state) end

--- Returns whether the mount object may reduce this component's mass.
function Mountable:getAllowComponentMassReduction() end

--- Default for mass reduction when the XML does not set it: false.
function Mountable:getDefaultAllowComponentMassReduction() end

--- Returns the table of lock positions loaded from XML (xmlFilename, joint node, offsets).
function Mountable:getMountableLockPositions() end

--- Changes the mount type and mount object id; on change it resets reduced mass for NONE, calls registered listeners, raises onDynamicMountTypeChanged and sends MountableSetMountTypeEvent unless suppressed.
---@param mountType any
---@param mountObject any
---@param noEventSend any
function Mountable:setDynamicMountType(mountType, mountObject, noEventSend) end

--- Adds a mount state listener (object plus method name or function, default name onObjectMountStateChanged); duplicates are ignored.
---@param object any
---@param callbackFunc any
function Mountable:addMountStateChangeListener(object, callbackFunc) end

--- Removes a previously added mount state listener matching object and callback.
---@param object any
---@param callbackFunc any
function Mountable:removeMountStateChangeListener(object, callbackFunc) end

--- Returns the owner connection of the (non-dynamic) mount object if it has one, otherwise the parent's result.
---@param superFunc any
function Mountable:getOwnerConnection(superFunc) end

--- If the vehicle has no attacher root of its own, follows the mount object to find its root vehicle; falls back to itself.
---@param superFunc any
function Mountable:findRootVehicle(superFunc) end

--- Hides the map hotspot while the object is mounted on another object, otherwise uses the parent's answer.
---@param superFunc any
function Mountable:getIsMapHotspotVisible(superFunc) end

--- While reduced mass is active, returns an adjustment that leaves the component with only about 0.1 mass; otherwise the parent value.
---@param superFunc any
---@param component any
function Mountable:getAdditionalComponentMass(superFunc, component) end

--- On clients, ignores received world positions while a non-dynamic mount object exists, since the pose follows the mount object; otherwise defers to the parent.
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

--- Before being attached as an implement, drops any dynamic mount.
---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
function Mountable:onPreAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end
