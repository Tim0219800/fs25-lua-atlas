---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AttacherJoints.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization that gives a vehicle attacher joints (three-point hitch, drawbar, trailer coupling...) so that implements can be attached to it. It owns the list of joint descriptors loaded from `vehicle.attacherJoints.attacherJoint(?)`, the list of attached implements, the physics joint creation, the lowering/lifting animation of bottom arms, top arms and rotation nodes, hard attach, smooth attach, the attach range search, action events and the savegame/stream sync of attachments. It has no prerequisite (always present) and works with the `Attachable` specialization on the implement side, plus the `VehicleLowerImplementEvent`, `VehicleDetachEvent` and `VehicleAttachRequestEvent` network events. Several functions registered here (for example `attachImplement`, `getAttachableInfo`, `setAttacherJointBlocked`, `getAttachControlBarActionAccessible`) and constants such as `LOWER_LINK_WIDTH_BY_CATEGORY` have no body in this SDK dump (UNVERIFIED).
---@class AttacherJoints
AttacherJoints = {}

--- Returns the key of the lower link category whose width (from `LOWER_LINK_WIDTH_BY_CATEGORY`, defined outside this dump, UNVERIFIED) is nearest to the given width. Falls back to 1 if the table is empty.
---@param width any
---@return integer
function AttacherJoints.getClosestLowerLinkCategoryIndex(width) end

--- Registers the `attacherJoint` vehicle configuration type, the XML schema paths (joints, sounds, combo duration, hose and PTO config ids, dashboard keys, delayed paths for hoses, tip sides and fill units) and the savegame schema keys for attached implements and blocked joints.
function AttacherJoints.initSpecialization() end

--- Registers every XML attribute of one `attacherJoint(?)` element under the given base path: node, joint type, limits, springs, bottom arm, top arm, steering bars, visuals, object changes, schema overlay and so on. Uses shared registration so other specializations can reuse the paths.
---@param schema any
---@param baseName any
function AttacherJoints.registerAttacherJointXMLPaths(schema, baseName) end

--- Registers a new attacher joint type by name: creates the `JOINTTYPE_<NAME>` constant with the next integer and maps the name to it. Does nothing if the constant already exists. Returns the integer value.
---@param name string
function AttacherJoints.registerJointType(name) end

--- Always returns true: this specialization has no prerequisite on other specializations.
---@param specializations any
function AttacherJoints.prerequisitesPresent(specializations) end

--- Registers the vehicle events raised by this specialization: `onPreAttachImplement`, `onPostAttachImplement`, `onPreDetachImplement`, `onPostDetachImplement` and `onRequiresTopLightsChanged`.
---@param vehicleType any
function AttacherJoints.registerEvents(vehicleType) end

--- Registers the functions this specialization adds to the vehicle type (attach/detach, joint lookup, lowering, graphics update, sounds, combos, attach checks...). Some registered functions are not defined in this dump (UNVERIFIED).
---@param vehicleType any
function AttacherJoints.registerFunctions(vehicleType) end

--- Registers the overrides of base vehicle functions. Most of them forward the call to every attached implement (mass, AI, lights, cameras, fill levels, selection) or add joint-dependent conditions (fold, detach, fill units, tip sides, dashboards).
---@param vehicleType any
function AttacherJoints.registerOverwrittenFunctions(vehicleType) end

--- Subscribes this specialization to the vehicle lifecycle and state events it handles (load, delete, streams, updates, action events, lights, brake, turn on/off, activate, reverse direction...).
---@param vehicleType any
function AttacherJoints.registerEventListeners(vehicleType) end

--- Initialises the per-vehicle spec: empty attached implements list, no selected implement and the round-robin index used by the attach range search.
---@param savegame table
function AttacherJoints:onPreLoad(savegame) end

--- Reads combo duration and update distance, loads every attacher joint from XML into `spec.attacherJoints`, prepares attach info tables, client sounds, texts, the ground height raycast data and the dirty flag. In the development version it warns about missing attach/hydraulic sounds.
---@param savegame table
function AttacherJoints:onLoad(savegame) end

--- Finishes joint setup after load: stores original joint transforms, computes translation node limits, links dependent bottom arms, sets start rotations, precomputes offsets to input joints and the AI root node, builds the combo list, applies default bottom arm width and restores the combo direction from the savegame. If there are no joints, removes most event listeners.
---@param savegame table
function AttacherJoints:onPostLoad(savegame) end

--- Restores saved attachments: attaches implements whose vehicle is already loaded (by unique id) and queues the others, restores blocked joints, and subscribes to `VEHICLE_LOADED` while some attachments are still pending. Skipped when the savegame resets vehicles, unless the position is kept.
---@param savegame table
function AttacherJoints:onLoadFinished(savegame) end

--- Registers the dashboard value types `bottomArmPosition`, `bottomArmPositionMin` and `bottomArmPositionMax` (0 to 100 percent, derived from the joint move alpha) for a bottom arm selected by node or node list in the dashboard XML.
function AttacherJoints:onRegisterDashboardValueTypes() end

--- Before the vehicle is deleted, detaches every attached implement except additional attachments (those are detached by the leading attachment).
function AttacherJoints:onPreDelete() end

--- Releases attacher joint resources: joint sound samples, top arm objects, shared toolbar i3d requests and the specialization sound samples.
function AttacherJoints:onDelete() end

--- Saves the combo direction, each attached implement (joint index, lowered state, unique id of the implement, input joint index) and the indices of blocked joints into the vehicle savegame XML.
---@param xmlFile any
---@param key any
---@param usedModNames any
function AttacherJoints:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client side, on join: reads the number of implements, then for each one the node object, input and joint indices and lowered flag, and re-attaches it locally (without smooth attach) if the object is already synchronised.
---@param streamId integer
---@param connection Connection
function AttacherJoints:onReadStream(streamId, connection) end

--- Server side, on join: writes the number of attached implements and, for each, the node object, input joint index, joint index and lowered flag. Mirror of `onReadStream`.
---@param streamId integer
---@param connection Connection
function AttacherJoints:onWriteStream(streamId, connection) end

--- Updates the joint graphics of attached implements when the vehicle is within `maxUpdateDistance` of the camera, and re-raises `onUpdateInterpolation` on hard attached implements because their position follows ours.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AttacherJoints:onUpdateInterpolation(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client: shows the countdown 'attach not allowed' text. Searches for attachable vehicles in range (server with automatic attach, or client with the attach action registered); otherwise clears the attach info.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AttacherJoints:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Forces a graphics update of all attached implements regardless of camera distance just before the vehicle may go to sleep, so the visual state is correct when it comes back into range.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function AttacherJoints:onUpdateEnd(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Main per-tick logic: finishes smooth attach on the server (hard attach then post attach), animates lowering/lifting (move alpha, rotation nodes, joint frame), updates joint rotation/translation limits on the server, drives the hydraulic sound, runs the lower-all combo timeline, refreshes action events and handles mobile automatic attach.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AttacherJoints:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Called once all saved attachments are attached. On the root vehicle, re-applies the selected object (and sub-selection) loaded from the savegame, then clears the stored indices.
function AttacherJoints:loadAttachmentsFinished() end

--- Handles the lower action: resolves the target implement (given, the only one, or the selected one), finds the vehicle it is attached to and asks it to lower or lift via `handleLowerImplementByAttacherJointIndex`.
---@param vehicle any
---@param direction any
function AttacherJoints:handleLowerImplementEvent(vehicle, direction) end

--- Lowers or lifts the implement on the given joint (toggles when direction is nil) if both the implement and the joint allow lowering, via `setJointMoveDown`. Otherwise shows the implement's blinking warning, if any.
---@param attacherJointIndex any
---@param direction any
function AttacherJoints:handleLowerImplementByAttacherJointIndex(attacherJointIndex, direction) end

--- Returns the list of attached implement tables (`object`, `jointDescIndex`, `inputJointDescIndex`...).
function AttacherJoints:getAttachedImplements() end

--- Returns the list of attacher joint descriptors of this vehicle.
function AttacherJoints:getAttacherJoints() end

--- Returns the joint descriptor at the given index, or nil.
---@param jointDescIndex any
function AttacherJoints:getAttacherJointByJointDescIndex(jointDescIndex) end

--- Returns the index of the joint whose transform node equals the given node, or nil if none matches.
---@param node any
function AttacherJoints:getAttacherJointIndexByNode(node) end

--- Returns the joint descriptor whose transform node equals the given node, or nil.
---@param node any
function AttacherJoints:getAttacherJointByNode(node) end

--- Returns the attached implement table using the given joint index, or nil. Same lookup as `getImplementByJointDescIndex`.
---@param attacherJointIndex any
function AttacherJoints:getImplementFromAttacherJointIndex(attacherJointIndex) end

--- Returns the joint index to which the given vehicle is attached, or nil if it is not attached here.
---@param object any
function AttacherJoints:getAttacherJointIndexFromObject(object) end

--- Returns the joint descriptor to which the given vehicle is attached, or nil.
---@param object any
function AttacherJoints:getAttacherJointDescFromObject(object) end

--- Returns the joint index used by the implement at the given position in the attached implements list, or nil.
---@param implementIndex any
function AttacherJoints:getAttacherJointIndexFromImplementIndex(implementIndex) end

--- Returns the vehicle of the implement at the given position in the attached implements list, or nil.
---@param implementIndex any
function AttacherJoints:getObjectFromImplementIndex(implementIndex) end

--- Visual update for one attached implement: aims the bottom arm at the implement's input joint (with smoothing during attach), stretches its translation node, positions the joint position node, orients the toolbar, updates moving parts, the top arm and visual align nodes.
---@param implement table
---@param dt number
---@param forceUpdate any
function AttacherJoints:updateAttacherJointGraphics(implement, dt, forceUpdate) end

--- Computes the upper and lower move alpha (0 to 1) of a joint for an implement from distance-to-ground values, using height nodes and an asynchronous terrain raycast when available. Returns two equal values when lowering is not allowed (depends on default lowered state).
---@param jointDesc table
---@param object table
---@param initial boolean
function AttacherJoints:calculateAttacherJointMoveUpperLowerAlpha(jointDesc, object, initial) end

--- Starts the next step of the ground height check: for the current height node, computes the upper and lower world positions and launches an asynchronous terrain raycast. If the node is disabled it moves on to the next one or finishes.
function AttacherJoints:doGroundHeightNodeCheck() end

--- Ends the height node check: from the shortest ray distance found it derives upper and lower alpha (with a correction because the arm rotates on a circle while the ray is straight), clamps them to 0..1 and resets the check index.
function AttacherJoints:finishGroundHeightNodeCheck() end

--- Raycast callback for the height check. Only static rigid bodies count; keeps the closest hit and its ray data, ignores other bodies unless it is the last hit, then advances to the next node or finishes. Returns false to stop, or true to continue past a non-static hit.
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
function AttacherJoints:groundHeightNodeCheckCallback(hitObjectId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end

--- Rotates the joint transform around its local Z axis by the difference between the implement's and the vehicle's interpolated rotation offsets for the current move alpha.
---@param jointDesc table
---@param object table
function AttacherJoints:updateAttacherJointRotation(jointDesc, object) end

--- Sets the joint's rotation node and second rotation node by interpolating between their upper and lower rotations with the given alpha (0 = upper, 1 = lower).
---@param jointDesc any
---@param alpha any
function AttacherJoints:updateAttacherJointRotationNodes(jointDesc, alpha) end

--- Recomputes, on demand, the joint limits, the rotation offset (also setting the joint frame on the server) and/or the distance to ground alpha values for the joint holding the given vehicle. Refreshes the min/max bottom arm dashboards on the client.
---@param vehicle any
---@param updateLimit any
---@param updateRotationOffset any
---@param updateDistanceToGround any
function AttacherJoints:updateAttacherJointSettingsByObject(vehicle, updateLimit, updateRotationOffset, updateDistanceToGround) end

--- Sets the bottom arm spread of a joint to the given width (default width if nil) by aiming or translating the left and right arms, and shows only the toolbar mesh of the closest category. No effect without a variable width bottom arm.
---@param jointDescIndex any
---@param width any
function AttacherJoints:setAttacherJointBottomArmWidth(jointDescIndex, width) end

--- Attaches the implement described by an attach info table (vehicle, joint indices, attachable) if the target joint is free. Handles multi-attachment resolving, blocks a second implement in the same direction on mobile, and returns true if it attached.
---@param info any
function AttacherJoints:attachImplementFromInfo(info) end

--- Final step of an attach: activates the top arm, shows bottom arm and toolbar, aligns left/right nodes and visual nodes, applies delayed object changes, plays the attach sound (not when loaded from savegame), raises `onPostAttachImplement`, calls `postAttach` on the implement and raises the ATTACH state change on the root vehicle.
---@param implement any
function AttacherJoints:postAttachImplement(implement) end

--- Server only: builds the physics joint between the vehicle's joint and the implement's input joint with rotation/translation limits, springs, damping and force limits, optionally with smooth attach, and manages pair collisions. On clients it only sets the joint index to 1 so that the joint counts as in use.
---@param implement table
---@param noSmoothAttach boolean
function AttacherJoints:createAttachmentJoint(implement, noSmoothAttach) end

--- Rigidly merges the implement's component into ours: temporarily detaches its own implements, removes vehicles from physics, makes it a compound child linked to the joint, relinks visuals, re-adds physics, updates joint root nodes, reattaches the sub-implements and marks the mass dirty. Returns true.
---@param implement table
function AttacherJoints:hardAttachImplement(implement) end

--- Reverses a hard attach: restores joint root nodes, turns the implement's component back into a standalone compound linked to the scene root at its world pose, restores its visual node, redoes physics for the chain, clears the hard attached flag and marks mass dirty. Returns true.
---@param implement table
function AttacherJoints:hardDetachImplement(implement) end

--- Detaches the implement at the given list index. Without `noEventSend`, the server broadcasts `VehicleDetachEvent` and a client sends a request and returns. Removes the physics joint, restores visuals, bottom/top arms and sounds, raises pre/post detach events, updates selection and top lights, and returns true.
---@param implementIndex integer
---@param noEventSend boolean
---@return boolean
function AttacherJoints:detachImplement(implementIndex, noEventSend) end

--- Detaches the implement matching the given vehicle by finding its list index and calling `detachImplement`. Always returns true, even when nothing was found.
---@param object table
---@param noEventSend boolean
---@return boolean
function AttacherJoints:detachImplementByObject(object, noEventSend) end

--- Stores the implement entry of the given vehicle as the selected implement of this vehicle.
---@param object any
function AttacherJoints:setSelectedImplementByObject(object) end

--- Returns the selected implement, or nil if it is no longer attached to this vehicle.
function AttacherJoints:getSelectedImplement() end

--- Returns true by default; overridable hook deciding whether the attach/detach input is available.
function AttacherJoints:getCanToggleAttach() end

--- Tells whether the attach/detach control bar action should be shown: false while AI drives, true if the selected vehicle is attached to something, if nothing is selected while attach info exists, or if an attachable is in range of this vehicle.
function AttacherJoints:getShowAttachControlBarAction() end

--- Triggers the attach/detach action handler (`actionEventAttach`) if toggling is currently possible.
function AttacherJoints:detachAttachedImplement() end

--- Starts the lower-all combo by flipping its direction and marking it running, unless one is already running and `force` is not set.
---@param force any
function AttacherJoints:startAttacherJointCombo(force) end

--- Returns whether a joint is free to take an implement: false if already in use, blocked, or disabled because an implement sits on one of its `disabledByAttacherJoints` joints.
---@param attacherJoint any
function AttacherJoints:getIsAttachingAllowed(attacherJoint) end

--- Overridable compatibility hook; returns true by default. Called at the end of `getAttacherJointCompatibility`; may return false plus a warning text.
---@param vehicle any
---@param attacherJoint any
---@param inputAttacherVehicle any
---@param inputAttacherJoint any
function AttacherJoints:getIsAttacherJointCompatible(vehicle, attacherJoint, inputAttacherVehicle, inputAttacherJoint) end

--- Returns true if the joint holding the given attachable has steering bar nodes or forces steering axle usage, meaning this vehicle can steer the implement's axle.
---@param attachable table
---@return boolean
function AttacherJoints:getCanSteerAttachable(attachable) end

--- Message callback for `VEHICLE_LOADED`: attaches any pending saved attachment matching the loaded vehicle's unique id; when none are left it calls `loadAttachmentsFinished` and unsubscribes.
---@param vehicle table
function AttacherJoints:onAttacherJointsVehicleLoaded(vehicle) end

--- Empty hook in this specialization (no body logic); other specializations can override it to register their own lowering action event.
---@param actionEventsTable any
---@param inputAction any
---@param target any
---@param callback any
---@param triggerUp any
---@param triggerDown any
---@param triggerAlways any
---@param startActive any
---@param callbackState any
---@param customIconName any
---@param ignoreCollisions any
function AttacherJoints:registerSelfLoweringActionEvent(actionEventsTable, inputAction, target, callback, triggerUp, triggerDown, triggerAlways, startActive, callbackState, customIconName, ignoreCollisions) end

--- Client only: plays the joint's own attach sample, or the vehicle's default attach sample. Returns true.
---@param jointDesc table
---@return boolean
function AttacherJoints:playAttachSound(jointDesc) end

--- Client only: plays the joint's detach sample, else the vehicle's detach sample, else falls back to an attach sample. Returns true.
---@param jointDesc table
---@return boolean
function AttacherJoints:playDetachSound(jointDesc) end

--- Returns true if the selected vehicle is an attached implement whose attacher vehicle lists it and which currently allows detaching.
---@return boolean
function AttacherJoints:detachingIsPossible() end

--- When an implement declares an additional attachment, loads that store item at the opposite-direction joint of matching joint type (if all joints in that direction are free) and attaches it afterwards via `additionalAttachmentLoaded`.
---@param jointDesc any
---@param inputJointDesc any
---@param object any
function AttacherJoints:attachAdditionalAttachment(jointDesc, inputJointDesc, object) end

--- On detach, if an additional attachment was created for that joint, detaches it and deletes the vehicle (unless the game is exiting).
---@param jointDesc any
---@param inputJointDesc any
function AttacherJoints:detachAdditionalAttachment(jointDesc, inputJointDesc) end

--- Async callback after loading an additional attachment: logs a warning on failure, positions the vehicle at the joint above terrain, attaches it, flags it as additional attachment, copies dirt from the main implement and updates selection. Note: the sixth argument is a filename string but the warnings read `.xmlFilename` on it as if it were a table, so the logged name is probably nil.
---@param vehicles any
---@param vehicleLoadState any
---@param asyncCallbackArguments any
function AttacherJoints:additionalAttachmentLoaded(vehicles, vehicleLoadState, asyncCallbackArguments) end

--- Returns the position in the attached implements list of the implement using the given joint index, or nil.
---@param jointDescIndex integer
---@return integer
function AttacherJoints:getImplementIndexByJointDescIndex(jointDescIndex) end

--- Returns the attached implement table using the given joint index, or nil.
---@param jointDescIndex integer
---@return table
function AttacherJoints:getImplementByJointDescIndex(jointDescIndex) end

--- Returns the position in the attached implements list of the given vehicle, or nil.
---@param object table
---@return integer
function AttacherJoints:getImplementIndexByObject(object) end

--- Returns the attached implement table of the given vehicle, or nil.
---@param object table
---@return table
function AttacherJoints:getImplementByObject(object) end

--- Calls the named function with the extra arguments on each directly attached implement that has it. Return values are discarded.
---@param functionName any
function AttacherJoints:callFunctionOnAllImplements(functionName, ...) end

--- Calls `activate` on every attached implement.
function AttacherJoints:activateAttachments() end

--- Calls `deactivate` on every attached implement.
function AttacherJoints:deactivateAttachments() end

--- Calls `deactivateLights` on every attached implement that defines it.
function AttacherJoints:deactivateAttachmentsLights() end

--- Sets the lowered state of a joint: if it changed and lowering is allowed, starts the movement and calls `setLowered` on the implement. Sends `VehicleLowerImplementEvent` for the change unless `noEventSend`. Returns true.
---@param jointDescIndex integer
---@param moveDown boolean
---@param noEventSend boolean
---@return boolean
function AttacherJoints:setJointMoveDown(jointDescIndex, moveDown, noEventSend) end

--- Returns the lowered state of the joint, always false if the joint does not allow lowering.
---@param jointDescIndex integer
---@return boolean
function AttacherJoints:getJointMoveDown(jointDescIndex) end

--- Returns the joint's `supportsHardAttach` flag.
---@param jointDescIndex integer
---@return boolean
function AttacherJoints:getIsHardAttachAllowed(jointDescIndex) end

--- Hook that decides whether the smooth attach progress may advance for an implement; returns true by default.
---@param implement any
function AttacherJoints:getIsSmoothAttachUpdateAllowed(implement) end

--- Loads one joint descriptor from XML into the given table: node, type, restrictions, rotation/translation nodes, distance to ground, limits, springs, bottom arm (with width range and toolbar i3d), top arm, steering bars, visuals, object changes, direction, schema overlay and sounds. Returns false (with a warning) if the node is missing.
---@param attacherJoint table
---@param xmlFile integer
---@param baseName string
---@param index integer
function AttacherJoints:loadAttacherJointFromXML(attacherJoint, xmlFile, baseName, index) end

--- Async callback after the toolbar i3d is loaded: links its root under the bottom arm reference node, hides it, selects the child mesh matching the default width category, stores the toolbar nodes and deletes the temporary i3d root.
---@param i3dNode integer
---@param failedReason table
---@param args table
function AttacherJoints:onBottomArmToolbarI3DLoaded(i3dNode, failedReason, args) end

--- Override: wakes the vehicle and also raises active every attached implement.
---@param superFunc any
function AttacherJoints:raiseActive(superFunc) end

--- Override: after the base registration, first registers the selected object's vehicle action events (so they get priority), then those of every attached implement. Note: it calls `printCallstack` and then dereferences the selection if no object is selected.
---@param superFunc any
---@param excludedVehicle any
function AttacherJoints:registerActionEvents(superFunc, excludedVehicle) end

--- Override: removes this vehicle's action events and those of every attached implement.
---@param superFunc any
function AttacherJoints:removeActionEvents(superFunc) end

--- Override: adds the vehicle to physics, then recreates the joint for each soft attached implement (without smooth attach) or calls `addToPhysics` on hard attached ones. Returns false if the base call fails.
---@param superFunc any
---@return boolean
function AttacherJoints:addToPhysics(superFunc) end

--- Override: resets the joint index of soft attached implements (hard attached ones are removed from physics themselves) before the base removal. Returns false if the base call fails.
---@param superFunc any
---@return boolean
function AttacherJoints:removeFromPhysics(superFunc) end

--- Override: adds the total mass of every attached implement to the base mass, unless `onlyGivenVehicle` is true.
---@param superFunc boolean
---@param onlyGivenVehicle boolean
---@return number
function AttacherJoints:getTotalMass(superFunc, onlyGivenVehicle) end

--- Override: for the root component, adds the own mass of hard attached implements, since they are merged into this component.
---@param superFunc any
---@param component any
function AttacherJoints:getAdditionalComponentMass(superFunc, component) end

--- Override: collects the child vehicles of every attached implement into the list before calling the base function.
---@param superFunc table
---@param vehicles table
---@param rootVehicle any
function AttacherJoints:addChildVehicles(superFunc, vehicles, rootVehicle) end

--- Override: adds the air consumption reported by attached implements to the base usage.
---@param superFunc any
---@return number
function AttacherJoints:getAirConsumerUsage(superFunc) end

--- Override: returns true as soon as one attached implement requires power, otherwise the base value.
---@param superFunc any
function AttacherJoints:getRequiresPower(superFunc) end

--- Override: calls the base function then lets each attached implement add itself to the AI implement list.
---@param superFunc any
---@param list any
function AttacherJoints:addVehicleToAIImplementList(superFunc, list) end

--- Override: collects AI agent attachments from each attached implement and starts a new attachment chain after each one.
---@param superFunc any
---@param aiDrivableVehicle any
function AttacherJoints:collectAIAgentAttachments(superFunc, aiDrivableVehicle) end

--- Override: also marks the AI obstacle state dirty on every attached implement.
---@param superFunc any
function AttacherJoints:setAIVehicleObstacleStateDirty(superFunc) end

--- Override: accumulates the direction snap angle of attached implements onto the base value. Note: `math.max` is given one argument (the sum), so it does not select a maximum.
---@param superFunc any
function AttacherJoints:getDirectionSnapAngle(superFunc) end

--- Override: also gathers fill level information from each attached implement into the display.
---@param superFunc any
---@param display any
function AttacherJoints:getFillLevelInformation(superFunc, display) end

--- Override: returns true if the base check passes or any attached implement (recursively) has the given object mounted.
---@param superFunc table
---@param object table
---@return boolean
function AttacherJoints:getHasObjectMounted(superFunc, object) end

--- Override: also adds the tool cameras of every attached implement.
---@param superFunc any
function AttacherJoints:attachableAddToolCameras(superFunc) end

--- Override: also removes the tool cameras of every attached implement.
---@param superFunc any
function AttacherJoints:attachableRemoveToolCameras(superFunc) end

--- Override: also lets every attached implement register its selectable objects.
---@param superFunc any
---@param selectableObjects any
function AttacherJoints:registerSelectableObjects(superFunc, selectableObjects) end

--- Override: returns false if any attached implement is not ready for automated train travel, otherwise the base result.
---@param superFunc any
function AttacherJoints:getIsReadyForAutomatedTrainTravel(superFunc) end

--- Override: forbids automatic shifting at low speed (below 2) while an attach is in progress or a joint is moving, and when any attached implement forbids it; otherwise the base result.
---@param superFunc any
function AttacherJoints:getIsAutomaticShiftingAllowed(superFunc) end

--- Override: after the base load, reads `#attacherJointIndices` and `#attacherJointNodes` of a dashboard group so it can be limited to certain attacher joints.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param group any
function AttacherJoints:loadDashboardGroupFromXML(superFunc, xmlFile, key, group) end

--- Override: converts pending joint nodes of a group to indices once loaded, then returns false if none of the group's joints has an implement; otherwise the base result.
---@param superFunc any
---@param group any
function AttacherJoints:getIsDashboardGroupActive(superFunc, group) end

--- Override: reads `#disablingAttacherJointIndices` for a height node, then calls the base loader.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param heightNode any
---@param attacherJointNode any
function AttacherJoints:loadAttacherJointHeightNode(superFunc, xmlFile, key, heightNode, attacherJointNode) end

--- Override: returns false if an implement is attached to any joint that disables this height node, otherwise the base result.
---@param superFunc any
---@param heightNode any
function AttacherJoints:getIsAttacherJointHeightNodeActive(superFunc, heightNode) end

--- Override: after the base load, reads `#disablingAttacherJointNodes` of a tip side (stored only when non-empty). Returns false if the base load fails.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function AttacherJoints:loadTipSide(superFunc, xmlFile, key, entry) end

--- Override: a tip side becomes unavailable when an implement is attached to one of the joints listed as disabling it (nodes resolved lazily to indices). Uses `spec_trailer`, so it assumes the Trailer specialization is present.
---@param superFunc any
---@param sideIndex any
function AttacherJoints:getIsTipSideAvailable(superFunc, sideIndex) end

--- Override: after the base load, reads `#disablingAttacherJointNodes` of a fill unit (stored only when non-empty). Returns false if the base load fails.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
---@param index any
function AttacherJoints:loadFillUnitFromXML(superFunc, xmlFile, key, entry, index) end

--- Override: a fill unit stops supporting the tool type when an implement is attached to a joint listed as disabling it. Relies on `spec_fillUnit`.
---@param superFunc any
---@param fillUnitIndex any
---@param toolType any
function AttacherJoints:getFillUnitSupportsToolType(superFunc, fillUnitIndex, toolType) end

--- Override: refuses detaching when a joint with `allowDetachingWhileLifted` false holds an implement that is not lowered (unless the implement forces it), returning false and the 'lower implement first' warning with the implement type.
---@param superFunc any
---@return boolean
function AttacherJoints:isDetachAllowed(superFunc) end

--- Override: refuses folding (false plus warning text) while an implement is attached to a joint with `allowFoldingWhileAttached` false; otherwise the base result.
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function AttacherJoints:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- Override: wheels may not destroy foliage if the base refuses or any attached implement blocks foliage destruction.
---@param superFunc any
---@param wheel any
---@return boolean
function AttacherJoints:getIsWheelFoliageDestructionAllowed(superFunc, wheel) end

--- Override: controlled actions are refused (with the warning) if the base or any attached implement refuses them, or while an attach is in progress.
---@param superFunc any
---@return boolean
---@return string
function AttacherJoints:getAreControlledActionsAllowed(superFunc) end

--- Override: returns the connection hose configuration index from `vehicle.attacherJoints#connectionHoseConfigId`, overridden by the selected attacherJoint configuration entry if any.
---@param superFunc any
function AttacherJoints:getConnectionHoseConfigIndex(superFunc) end

--- Override: returns the power take off configuration index from `vehicle.attacherJoints#powerTakeOffConfigId`, overridden by the selected attacherJoint configuration entry if any.
---@param superFunc any
function AttacherJoints:getPowerTakeOffConfigIndex(superFunc) end

--- Override: after the base load, reads `#blockedByAttacherJointNodes` of a hose target and stores it as `blockedByAttacherJointIndices` (still nodes at that point, resolved later).
---@param superFunc any
---@param xmlFile any
---@param targetKey any
---@param entry any
function AttacherJoints:loadHoseTargetNode(superFunc, xmlFile, targetKey, entry) end

--- Override: a hose connection target counts as used if the base says so or if an implement is attached to a joint that blocks it.
---@param superFunc any
---@param desc any
function AttacherJoints:getIsConnectionTargetUsed(superFunc, desc) end

--- Client: rebuilds this vehicle's action events when active for input (ignoring selection): lower selected implement, lower all, attach and detach. Registers the self-lowering event if this vehicle is selected, with a fallback to the single implement.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function AttacherJoints:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Activates all attached implements when the vehicle is activated.
function AttacherJoints:onActivate() end

--- Deactivates all attached implements and, on the client, stops the hydraulic sound.
function AttacherJoints:onDeactivate() end

--- Recomputes each combo joint time: mirrored against the combo duration when the reverser points backwards, otherwise reset to its initial time.
---@param direction any
function AttacherJoints:onReverseDirectionChanged(direction) end

--- Forwards the vehicle state change to every attached implement; on LOWER_ALL_IMPLEMENTS it starts the lower-all combo if the vehicle has joints.
---@param state any
---@param data any
function AttacherJoints:onStateChange(state, data) end

--- Server only: copies the light types mask to every attached implement that supports it.
---@param lightsTypesMask any
function AttacherJoints:onLightsTypesMaskChanged(lightsTypesMask) end

--- Forwards the turn light state to attached implements that support turn lights.
---@param state any
function AttacherJoints:onTurnLightStateChanged(state) end

--- Forwards brake light visibility to attached implements that support it.
---@param visibility any
function AttacherJoints:onBrakeLightsVisibilityChanged(visibility) end

--- Forwards reverse light visibility to attached implements that support it.
---@param visibility any
function AttacherJoints:onReverseLightsVisibilityChanged(visibility) end

--- Forwards beacon light visibility to attached implements that support it.
---@param visibility any
function AttacherJoints:onBeaconLightsVisibilityChanged(visibility) end

--- Forwards the brake pedal value to attached implements that have a `brake` function.
---@param brakePedal any
function AttacherJoints:onBrake(brakePedal) end

--- Turns on attached implements whose TurnOnVehicle spec is flagged as turned on by the attacher vehicle.
function AttacherJoints:onTurnedOn() end

--- Turns off attached implements whose TurnOnVehicle spec is flagged as turned on by the attacher vehicle.
function AttacherJoints:onTurnedOff() end

--- Raises `onLeaveRootVehicle` on each attached implement when the player leaves this vehicle.
function AttacherJoints:onLeaveVehicle() end

--- Checks whether an implement joint can couple to a vehicle joint: forced direction, blocked state, sub type match, brand and vehicle path restrictions, then the overridable `getIsAttacherJointCompatible`. Returns true, or false with an optional warning text.
---@param vehicle any
---@param attacherJoint any
---@param inputAttacherVehicle any
---@param inputAttacherJoint any
function AttacherJoints.getAttacherJointCompatibility(vehicle, attacherJoint, inputAttacherVehicle, inputAttacherJoint) end

--- Deprecated stub: only logs a message pointing to `updateVehiclesInAttachRange`. Returns nothing.
function AttacherJoints.findVehicleInAttachRange() end

--- Finds the nearest compatible free input joint within distance and angle for the vehicle and its implements, spreading the scan over frames unless `fullUpdate`. Returns attacher vehicle, joint index, attachable, its joint index and warning. Note: it calls the global `getAttacherJointCompatibility`, not the `AttacherJoints.` one.
---@param vehicle any
---@param maxDistanceSq any
---@param maxAngle any
---@param fullUpdate any
function AttacherJoints.updateVehiclesInAttachRange(vehicle, maxDistanceSq, maxAngle, fullUpdate) end

--- Input callback for the attach action: if an attachable is in range it checks ownership and attaches on the server or sends `VehicleAttachRequestEvent` from a client; otherwise it starts detaching the selected implement, or shows a warning when not allowed.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AttacherJoints.actionEventAttach(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback for the detach action: starts the detach process of the selected implement if allowed, otherwise shows the warning (or a default text).
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AttacherJoints.actionEventDetach(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback for lowering: called with the implement as `self`, it forwards to the attacher vehicle's `handleLowerImplementEvent`.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AttacherJoints.actionEventLowerImplement(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback for lowering all implements: starts the combo (forced) and raises the LOWER_ALL_IMPLEMENTS state change on the root vehicle.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AttacherJoints.actionEventLowerAllImplements(self, actionName, inputValue, callbackState, isAnalog) end

--- Client: updates the attach action text, visibility and priority (attach vs detach, ownership check, warnings) and the lower action state and text from the selected implement.
---@param self any
function AttacherJoints.updateActionEvents(self) end

--- Computes the rotation and translation limits for one axis from the joint's and the input joint's limits and scales (zero if fixed rotation), stores them on the implement, and returns the current limits interpolated by move alpha. Local names `upperTransLimit`/`lowerTransLimit` are swapped but used consistently.
---@param implement any
---@param attacherJointDesc any
---@param inputAttacherJointDesc any
---@param axis any
function AttacherJoints.updateAttacherJointLimits(implement, attacherJointDesc, inputAttacherJointDesc, axis) end

--- Interpolates the rotation limit of one axis by alpha and, if it changed noticeably (or forced), applies it to the physics joint, honouring lock up/down and dynamic lower limit options on axis 3.
---@param implement any
---@param attacherJointDesc any
---@param axis any
---@param force any
---@param alpha any
function AttacherJoints.updateAttacherJointRotationLimit(implement, attacherJointDesc, axis, force, alpha) end

--- Interpolates the translation limit of one axis by alpha and, if it changed noticeably (or forced), applies it to the physics joint, honouring lock up/down options on axis 2.
---@param implement any
---@param attacherJointDesc any
---@param axis any
---@param force any
---@param alpha any
function AttacherJoints.updateAttacherJointTranslationLimit(implement, attacherJointDesc, axis, force, alpha) end

--- Checks whether any attached implement uses a joint and input joint both flagged for top lights and raises `onRequiresTopLightsChanged` with the result.
---@param self any
function AttacherJoints.updateRequiredTopLightsState(self) end

--- Console command that sets the bottom arm width of all joints of the current vehicle chain to a category width or explicit width and logs the resulting category. Does nothing if there is no current vehicle.
---@param _ any
---@param category any
---@param width any
function AttacherJoints.consoleCommandBottomArmWidth(_, category, width) end
