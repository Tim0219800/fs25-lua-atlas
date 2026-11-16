# vehicles/specializations/AttacherJoints.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AttacherJoints.md)*

Source: `dataS/scripts/vehicles/specializations/AttacherJoints.lua` — FS25 1.25.1.0

✍ Vehicle specialization that gives a vehicle attacher joints (three-point hitch, drawbar, trailer coupling...) so that implements can be attached to it. It owns the list of joint descriptors loaded from `vehicle.attacherJoints.attacherJoint(?)`, the list of attached implements, the physics joint creation, the lowering/lifting animation of bottom arms, top arms and rotation nodes, hard attach, smooth attach, the attach range search, action events and the savegame/stream sync of attachments. It has no prerequisite (always present) and works with the `Attachable` specialization on the implement side, plus the `VehicleLowerImplementEvent`, `VehicleDetachEvent` and `VehicleAttachRequestEvent` network events. Several functions registered here (for example `attachImplement`, `getAttachableInfo`, `setAttacherJointBlocked`, `getAttachControlBarActionAccessible`) and constants such as `LOWER_LINK_WIDTH_BY_CATEGORY` have no body in this SDK dump (UNVERIFIED).

- **AttacherJoints** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `AttacherJoints.getClosestLowerLinkCategoryIndex(width: any) → integer` | 40 | ✍ Returns the key of the lower link category whose width (from `LOWER_LINK_WIDTH_BY_CATEGORY`, defined outside this dump, UNVERIFIED) is nearest to the given width. Falls back to 1 if the table is empty. |
| `AttacherJoints.initSpecialization()` | 55 | ✍ Registers the `attacherJoint` vehicle configuration type, the XML schema paths (joints, sounds, combo duration, hose and PTO config ids, dashboard keys, delayed paths for hoses, tip sides and fill units) and the savegame schema keys for attached implements and blocked joints. |
| `AttacherJoints.registerAttacherJointXMLPaths(schema: any, baseName: any)` | 119 | ✍ Registers every XML attribute of one `attacherJoint(?)` element under the given base path: node, joint type, limits, springs, bottom arm, top arm, steering bars, visuals, object changes, schema overlay and so on. Uses shared registration so other specializations can reuse the paths. |
| `AttacherJoints.registerJointType(name: string)` | 261 | ✍ Registers a new attacher joint type by name: creates the `JOINTTYPE_<NAME>` constant with the next integer and maps the name to it. Does nothing if the constant already exists. Returns the integer value. |
| `AttacherJoints.prerequisitesPresent(specializations: any)` | 297 | ✍ Always returns true: this specialization has no prerequisite on other specializations. |
| `AttacherJoints.registerEvents(vehicleType: any)` | 303 | ✍ Registers the vehicle events raised by this specialization: `onPreAttachImplement`, `onPostAttachImplement`, `onPreDetachImplement`, `onPostDetachImplement` and `onRequiresTopLightsChanged`. |
| `AttacherJoints.registerFunctions(vehicleType: any)` | 313 | ✍ Registers the functions this specialization adds to the vehicle type (attach/detach, joint lookup, lowering, graphics update, sounds, combos, attach checks...). Some registered functions are not defined in this dump (UNVERIFIED). |
| `AttacherJoints.registerOverwrittenFunctions(vehicleType: any)` | 381 | ✍ Registers the overrides of base vehicle functions. Most of them forward the call to every attached implement (mass, AI, lights, cameras, fill levels, selection) or add joint-dependent conditions (fold, detach, fill units, tip sides, dashboards). |
| `AttacherJoints.registerEventListeners(vehicleType: any)` | 423 | ✍ Subscribes this specialization to the vehicle lifecycle and state events it handles (load, delete, streams, updates, action events, lights, brake, turn on/off, activate, reverse direction...). |
| `AttacherJoints:onPreLoad(savegame: table)` | 456 | ✍ Initialises the per-vehicle spec: empty attached implements list, no selected implement and the round-robin index used by the attach range search. |
| `AttacherJoints:onLoad(savegame: table)` | 467 | ✍ Reads combo duration and update distance, loads every attacher joint from XML into `spec.attacherJoints`, prepares attach info tables, client sounds, texts, the ground height raycast data and the dirty flag. In the development version it warns about missing attach/hydraulic sounds. |
| `AttacherJoints:onPostLoad(savegame: table)` | 572 | ✍ Finishes joint setup after load: stores original joint transforms, computes translation node limits, links dependent bottom arms, sets start rotations, precomputes offsets to input joints and the AI root node, builds the combo list, applies default bottom arm width and restores the combo direction from the savegame. If there are no joints, removes most event listeners. |
| `AttacherJoints:onLoadFinished(savegame: table)` | 687 | ✍ Restores saved attachments: attaches implements whose vehicle is already loaded (by unique id) and queues the others, restores blocked joints, and subscribes to `VEHICLE_LOADED` while some attachments are still pending. Skipped when the savegame resets vehicles, unless the position is kept. |
| `AttacherJoints:onRegisterDashboardValueTypes()` | 730 | ✍ Registers the dashboard value types `bottomArmPosition`, `bottomArmPositionMin` and `bottomArmPositionMax` (0 to 100 percent, derived from the joint move alpha) for a bottom arm selected by node or node list in the dashboard XML. |
| `AttacherJoints:onPreDelete()` | 823 | ✍ Before the vehicle is deleted, detaches every attached implement except additional attachments (those are detached by the leading attachment). |
| `AttacherJoints:onDelete()` | 839 | ✍ Releases attacher joint resources: joint sound samples, top arm objects, shared toolbar i3d requests and the specialization sound samples. |
| `AttacherJoints:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 867 | ✍ Saves the combo direction, each attached implement (joint index, lowered state, unique id of the implement, input joint index) and the indices of blocked joints into the vehicle savegame XML. |
| `AttacherJoints:onReadStream(streamId: integer, connection: Connection)` | 905 | ✍ Client side, on join: reads the number of implements, then for each one the node object, input and joint indices and lowered flag, and re-attaches it locally (without smooth attach) if the object is already synchronised. |
| `AttacherJoints:onWriteStream(streamId: integer, connection: Connection)` | 923 | ✍ Server side, on join: writes the number of attached implements and, for each, the node object, input joint index, joint index and lowered flag. Mirror of `onReadStream`. |
| `AttacherJoints:onUpdateInterpolation(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 946 | ✍ Updates the joint graphics of attached implements when the vehicle is within `maxUpdateDistance` of the camera, and re-raises `onUpdateInterpolation` on hard attached implements because their position follows ours. |
| `AttacherJoints:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 976 | ✍ Client: shows the countdown 'attach not allowed' text. Searches for attachable vehicles in range (server with automatic attach, or client with the attach action registered); otherwise clears the attach info. |
| `AttacherJoints:onUpdateEnd(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 1001 | ✍ Forces a graphics update of all attached implements regardless of camera distance just before the vehicle may go to sleep, so the visual state is correct when it comes back into range. |
| `AttacherJoints:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 1019 | ✍ Main per-tick logic: finishes smooth attach on the server (hard attach then post attach), animates lowering/lifting (move alpha, rotation nodes, joint frame), updates joint rotation/translation limits on the server, drives the hydraulic sound, runs the lower-all combo timeline, refreshes action events and handles mobile automatic attach. |
| `AttacherJoints:loadAttachmentsFinished()` | 1214 | ✍ Called once all saved attachments are attached. On the root vehicle, re-applies the selected object (and sub-selection) loaded from the savegame, then clears the stored indices. |
| `AttacherJoints:handleLowerImplementEvent(vehicle: any, direction: any)` | 1231 | ✍ Handles the lower action: resolves the target implement (given, the only one, or the selected one), finds the vehicle it is attached to and asks it to lower or lift via `handleLowerImplementByAttacherJointIndex`. |
| `AttacherJoints:handleLowerImplementByAttacherJointIndex(attacherJointIndex: any, direction: any)` | 1257 | ✍ Lowers or lifts the implement on the given joint (toggles when direction is nil) if both the implement and the joint allow lowering, via `setJointMoveDown`. Otherwise shows the implement's blinking warning, if any. |
| `AttacherJoints:getAttachedImplements()` | 1280 | ✍ Returns the list of attached implement tables (`object`, `jointDescIndex`, `inputJointDescIndex`...). |
| `AttacherJoints:getAttacherJoints()` | 1286 | ✍ Returns the list of attacher joint descriptors of this vehicle. |
| `AttacherJoints:getAttacherJointByJointDescIndex(jointDescIndex: any)` | 1292 | ✍ Returns the joint descriptor at the given index, or nil. |
| `AttacherJoints:getAttacherJointIndexByNode(node: any)` | 1298 | ✍ Returns the index of the joint whose transform node equals the given node, or nil if none matches. |
| `AttacherJoints:getAttacherJointByNode(node: any)` | 1312 | ✍ Returns the joint descriptor whose transform node equals the given node, or nil. |
| `AttacherJoints:getImplementFromAttacherJointIndex(attacherJointIndex: any)` | 1326 | ✍ Returns the attached implement table using the given joint index, or nil. Same lookup as `getImplementByJointDescIndex`. |
| `AttacherJoints:getAttacherJointIndexFromObject(object: any)` | 1339 | ✍ Returns the joint index to which the given vehicle is attached, or nil if it is not attached here. |
| `AttacherJoints:getAttacherJointDescFromObject(object: any)` | 1352 | ✍ Returns the joint descriptor to which the given vehicle is attached, or nil. |
| `AttacherJoints:getAttacherJointIndexFromImplementIndex(implementIndex: any)` | 1365 | ✍ Returns the joint index used by the implement at the given position in the attached implements list, or nil. |
| `AttacherJoints:getObjectFromImplementIndex(implementIndex: any)` | 1376 | ✍ Returns the vehicle of the implement at the given position in the attached implements list, or nil. |
| `AttacherJoints:updateAttacherJointGraphics(implement: table, dt: number, forceUpdate: any)` | 1389 | ✍ Visual update for one attached implement: aims the bottom arm at the implement's input joint (with smoothing during attach), stretches its translation node, positions the joint position node, orients the toolbar, updates moving parts, the top arm and visual align nodes. |
| `AttacherJoints:calculateAttacherJointMoveUpperLowerAlpha(jointDesc: table, object: table, initial: boolean)` | 1527 | ✍ Computes the upper and lower move alpha (0 to 1) of a joint for an implement from distance-to-ground values, using height nodes and an asynchronous terrain raycast when available. Returns two equal values when lowering is not allowed (depends on default lowered state). |
| `AttacherJoints:doGroundHeightNodeCheck()` | 1629 | ✍ Starts the next step of the ground height check: for the current height node, computes the upper and lower world positions and launches an asynchronous terrain raycast. If the node is disabled it moves on to the next one or finishes. |
| `AttacherJoints:finishGroundHeightNodeCheck()` | 1680 | ✍ Ends the height node check: from the shortest ray distance found it derives upper and lower alpha (with a correction because the arm rotates on a circle while the ray is straight), clamps them to 0..1 and resets the check index. |
| `AttacherJoints:groundHeightNodeCheckCallback(hitObjectId: integer, x: number, y: number, z: number, distance: number, nx: number, ny: number, nz: number, subShapeIndex: integer, shapeId: integer, isLast: boolean) → boolean` | 1743 | ✍ Raycast callback for the height check. Only static rigid bodies count; keeps the closest hit and its ray data, ignores other bodies unless it is the last hit, then advances to the next node or finishes. Returns false to stop, or true to continue past a non-static hit. |
| `AttacherJoints:updateAttacherJointRotation(jointDesc: table, object: table)` | 1794 | ✍ Rotates the joint transform around its local Z axis by the difference between the implement's and the vehicle's interpolated rotation offsets for the current move alpha. |
| `AttacherJoints:updateAttacherJointRotationNodes(jointDesc: any, alpha: any)` | 1808 | ✍ Sets the joint's rotation node and second rotation node by interpolating between their upper and lower rotations with the given alpha (0 = upper, 1 = lower). |
| `AttacherJoints:updateAttacherJointSettingsByObject(vehicle: any, updateLimit: any, updateRotationOffset: any, updateDistanceToGround: any)` | 1819 | ✍ Recomputes, on demand, the joint limits, the rotation offset (also setting the joint frame on the server) and/or the distance to ground alpha values for the joint holding the given vehicle. Refreshes the min/max bottom arm dashboards on the client. |
| `AttacherJoints:setAttacherJointBottomArmWidth(jointDescIndex: any, width: any)` | 1857 | ✍ Sets the bottom arm spread of a joint to the given width (default width if nil) by aiming or translating the left and right arms, and shows only the toolbar mesh of the closest category. No effect without a variable width bottom arm. |
| `AttacherJoints:attachImplementFromInfo(info: any)` | 1907 | ✍ Attaches the implement described by an attach info table (vehicle, joint indices, attachable) if the target joint is free. Handles multi-attachment resolving, blocks a second implement in the same direction on mobile, and returns true if it attached. |
| `AttacherJoints:postAttachImplement(implement: any)` | 2214 | ✍ Final step of an attach: activates the top arm, shows bottom arm and toolbar, aligns left/right nodes and visual nodes, applies delayed object changes, plays the attach sound (not when loaded from savegame), raises `onPostAttachImplement`, calls `postAttach` on the implement and raises the ATTACH state change on the root vehicle. |
| `AttacherJoints:createAttachmentJoint(implement: table, noSmoothAttach: boolean)` | 2276 | ✍ Server only: builds the physics joint between the vehicle's joint and the implement's input joint with rotation/translation limits, springs, damping and force limits, optionally with smooth attach, and manages pair collisions. On clients it only sets the joint index to 1 so that the joint counts as in use. |
| `AttacherJoints:hardAttachImplement(implement: table)` | 2448 | ✍ Rigidly merges the implement's component into ours: temporarily detaches its own implements, removes vehicles from physics, makes it a compound child linked to the joint, relinks visuals, re-adds physics, updates joint root nodes, reattaches the sub-implements and marks the mass dirty. Returns true. |
| `AttacherJoints:hardDetachImplement(implement: table)` | 2547 | ✍ Reverses a hard attach: restores joint root nodes, turns the implement's component back into a standalone compound linked to the scene root at its world pose, restores its visual node, redoes physics for the chain, clears the hard attached flag and marks mass dirty. Returns true. |
| `AttacherJoints:detachImplement(implementIndex: integer, noEventSend: boolean) → boolean` | 2605 | ✍ Detaches the implement at the given list index. Without `noEventSend`, the server broadcasts `VehicleDetachEvent` and a client sends a request and returns. Removes the physics joint, restores visuals, bottom/top arms and sounds, raises pre/post detach events, updates selection and top lights, and returns true. |
| `AttacherJoints:detachImplementByObject(object: table, noEventSend: boolean) → boolean` | 2820 | ✍ Detaches the implement matching the given vehicle by finding its list index and calling `detachImplement`. Always returns true, even when nothing was found. |
| `AttacherJoints:setSelectedImplementByObject(object: any)` | 2835 | ✍ Stores the implement entry of the given vehicle as the selected implement of this vehicle. |
| `AttacherJoints:getSelectedImplement()` | 2841 | ✍ Returns the selected implement, or nil if it is no longer attached to this vehicle. |
| `AttacherJoints:getCanToggleAttach()` | 2856 | ✍ Returns true by default; overridable hook deciding whether the attach/detach input is available. |
| `AttacherJoints:getShowAttachControlBarAction()` | 2866 | ✍ Tells whether the attach/detach control bar action should be shown: false while AI drives, true if the selected vehicle is attached to something, if nothing is selected while attach info exists, or if an attachable is in range of this vehicle. |
| `AttacherJoints:detachAttachedImplement()` | 2894 | ✍ Triggers the attach/detach action handler (`actionEventAttach`) if toggling is currently possible. |
| `AttacherJoints:startAttacherJointCombo(force: any)` | 2902 | ✍ Starts the lower-all combo by flipping its direction and marking it running, unless one is already running and `force` is not set. |
| `AttacherJoints:getIsAttachingAllowed(attacherJoint: any)` | 2921 | ✍ Returns whether a joint is free to take an implement: false if already in use, blocked, or disabled because an implement sits on one of its `disabledByAttacherJoints` joints. |
| `AttacherJoints:getIsAttacherJointCompatible(vehicle: any, attacherJoint: any, inputAttacherVehicle: any, inputAttacherJoint: any)` | 2944 | ✍ Overridable compatibility hook; returns true by default. Called at the end of `getAttacherJointCompatibility`; may return false plus a warning text. |
| `AttacherJoints:getCanSteerAttachable(attachable: table) → boolean` | 2952 | ✍ Returns true if the joint holding the given attachable has steering bar nodes or forces steering axle usage, meaning this vehicle can steer the implement's axle. |
| `AttacherJoints:onAttacherJointsVehicleLoaded(vehicle: table)` | 2966 | ✍ Message callback for `VEHICLE_LOADED`: attaches any pending saved attachment matching the loaded vehicle's unique id; when none are left it calls `loadAttachmentsFinished` and unsubscribes. |
| `AttacherJoints:registerSelfLoweringActionEvent(actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any, ignoreCollisions: any)` | 2993 | ✍ Empty hook in this specialization (no body logic); other specializations can override it to register their own lowering action event. |
| `AttacherJoints:playAttachSound(jointDesc: table) → boolean` | 3000 | ✍ Client only: plays the joint's own attach sample, or the vehicle's default attach sample. Returns true. |
| `AttacherJoints:playDetachSound(jointDesc: table) → boolean` | 3018 | ✍ Client only: plays the joint's detach sample, else the vehicle's detach sample, else falls back to an attach sample. Returns true. |
| `AttacherJoints:detachingIsPossible() → boolean` | 3039 | ✍ Returns true if the selected vehicle is an attached implement whose attacher vehicle lists it and which currently allows detaching. |
| `AttacherJoints:attachAdditionalAttachment(jointDesc: any, inputJointDesc: any, object: any)` | 3055 | ✍ When an implement declares an additional attachment, loads that store item at the opposite-direction joint of matching joint type (if all joints in that direction are free) and attaches it afterwards via `additionalAttachmentLoaded`. |
| `AttacherJoints:detachAdditionalAttachment(jointDesc: any, inputJointDesc: any)` | 3103 | ✍ On detach, if an additional attachment was created for that joint, detaches it and deletes the vehicle (unless the game is exiting). |
| `AttacherJoints:additionalAttachmentLoaded(vehicles: any, vehicleLoadState: any, asyncCallbackArguments: any)` | 3121 | ✍ Async callback after loading an additional attachment: logs a warning on failure, positions the vehicle at the joint above terrain, attaches it, flags it as additional attachment, copies dirt from the main implement and updates selection. Note: the sixth argument is a filename string but the warnings read `.xmlFilename` on it as if it were a table, so the logged name is probably nil. |
| `AttacherJoints:getImplementIndexByJointDescIndex(jointDescIndex: integer) → integer` | 3161 | ✍ Returns the position in the attached implements list of the implement using the given joint index, or nil. |
| `AttacherJoints:getImplementByJointDescIndex(jointDescIndex: integer) → table` | 3177 | ✍ Returns the attached implement table using the given joint index, or nil. |
| `AttacherJoints:getImplementIndexByObject(object: table) → integer` | 3193 | ✍ Returns the position in the attached implements list of the given vehicle, or nil. |
| `AttacherJoints:getImplementByObject(object: table) → table` | 3209 | ✍ Returns the attached implement table of the given vehicle, or nil. |
| `AttacherJoints:callFunctionOnAllImplements(functionName: any, ...: any)` | 3223 | ✍ Calls the named function with the extra arguments on each directly attached implement that has it. Return values are discarded. |
| `AttacherJoints:activateAttachments()` | 3236 | ✍ Calls `activate` on every attached implement. |
| `AttacherJoints:deactivateAttachments()` | 3248 | ✍ Calls `deactivate` on every attached implement. |
| `AttacherJoints:deactivateAttachmentsLights()` | 3260 | ✍ Calls `deactivateLights` on every attached implement that defines it. |
| `AttacherJoints:setJointMoveDown(jointDescIndex: integer, moveDown: boolean, noEventSend: boolean) → boolean` | 3276 | ✍ Sets the lowered state of a joint: if it changed and lowering is allowed, starts the movement and calls `setLowered` on the implement. Sends `VehicleLowerImplementEvent` for the change unless `noEventSend`. Returns true. |
| `AttacherJoints:getJointMoveDown(jointDescIndex: integer) → boolean` | 3306 | ✍ Returns the lowered state of the joint, always false if the joint does not allow lowering. |
| `AttacherJoints:getIsHardAttachAllowed(jointDescIndex: integer) → boolean` | 3319 | ✍ Returns the joint's `supportsHardAttach` flag. |
| `AttacherJoints:getIsSmoothAttachUpdateAllowed(implement: any)` | 3327 | ✍ Hook that decides whether the smooth attach progress may advance for an implement; returns true by default. |
| `AttacherJoints:loadAttacherJointFromXML(attacherJoint: table, xmlFile: integer, baseName: string, index: integer)` | 3337 | ✍ Loads one joint descriptor from XML into the given table: node, type, restrictions, rotation/translation nodes, distance to ground, limits, springs, bottom arm (with width range and toolbar i3d), top arm, steering bars, visuals, object changes, direction, schema overlay and sounds. Returns false (with a warning) if the node is missing. |
| `AttacherJoints:onBottomArmToolbarI3DLoaded(i3dNode: integer, failedReason: table, args: table)` | 3791 | ✍ Async callback after the toolbar i3d is loaded: links its root under the bottom arm reference node, hides it, selects the child mesh matching the default width category, stores the toolbar nodes and deletes the temporary i3d root. |
| `AttacherJoints:raiseActive(superFunc: any)` | 3819 | ✍ Override: wakes the vehicle and also raises active every attached implement. |
| `AttacherJoints:registerActionEvents(superFunc: any, excludedVehicle: any)` | 3832 | ✍ Override: after the base registration, first registers the selected object's vehicle action events (so they get priority), then those of every attached implement. Note: it calls `printCallstack` and then dereferences the selection if no object is selected. |
| `AttacherJoints:removeActionEvents(superFunc: any)` | 3855 | ✍ Override: removes this vehicle's action events and those of every attached implement. |
| `AttacherJoints:addToPhysics(superFunc: any) → boolean` | 3870 | ✍ Override: adds the vehicle to physics, then recreates the joint for each soft attached implement (without smooth attach) or calls `addToPhysics` on hard attached ones. Returns false if the base call fails. |
| `AttacherJoints:removeFromPhysics(superFunc: any) → boolean` | 3891 | ✍ Override: resets the joint index of soft attached implements (hard attached ones are removed from physics themselves) before the base removal. Returns false if the base call fails. |
| `AttacherJoints:getTotalMass(superFunc: boolean, onlyGivenVehicle: boolean) → number` | 3917 | ✍ Override: adds the total mass of every attached implement to the base mass, unless `onlyGivenVehicle` is true. |
| `AttacherJoints:getAdditionalComponentMass(superFunc: any, component: any)` | 3935 | ✍ Override: for the root component, adds the own mass of hard attached implements, since they are merged into this component. |
| `AttacherJoints:addChildVehicles(superFunc: table, vehicles: table, rootVehicle: any)` | 3954 | ✍ Override: collects the child vehicles of every attached implement into the list before calling the base function. |
| `AttacherJoints:getAirConsumerUsage(superFunc: any) → number` | 3970 | ✍ Override: adds the air consumption reported by attached implements to the base usage. |
| `AttacherJoints:getRequiresPower(superFunc: any)` | 3986 | ✍ Override: returns true as soon as one attached implement requires power, otherwise the base value. |
| `AttacherJoints:addVehicleToAIImplementList(superFunc: any, list: any)` | 4001 | ✍ Override: calls the base function then lets each attached implement add itself to the AI implement list. |
| `AttacherJoints:collectAIAgentAttachments(superFunc: any, aiDrivableVehicle: any)` | 4014 | ✍ Override: collects AI agent attachments from each attached implement and starts a new attachment chain after each one. |
| `AttacherJoints:setAIVehicleObstacleStateDirty(superFunc: any)` | 4028 | ✍ Override: also marks the AI obstacle state dirty on every attached implement. |
| `AttacherJoints:getDirectionSnapAngle(superFunc: any)` | 4041 | ✍ Override: accumulates the direction snap angle of attached implements onto the base value. Note: `math.max` is given one argument (the sum), so it does not select a maximum. |
| `AttacherJoints:getFillLevelInformation(superFunc: any, display: any)` | 4057 | ✍ Override: also gathers fill level information from each attached implement into the display. |
| `AttacherJoints:getHasObjectMounted(superFunc: table, object: table) → boolean` | 4074 | ✍ Override: returns true if the base check passes or any attached implement (recursively) has the given object mounted. |
| `AttacherJoints:attachableAddToolCameras(superFunc: any)` | 4093 | ✍ Override: also adds the tool cameras of every attached implement. |
| `AttacherJoints:attachableRemoveToolCameras(superFunc: any)` | 4107 | ✍ Override: also removes the tool cameras of every attached implement. |
| `AttacherJoints:registerSelectableObjects(superFunc: any, selectableObjects: any)` | 4121 | ✍ Override: also lets every attached implement register its selectable objects. |
| `AttacherJoints:getIsReadyForAutomatedTrainTravel(superFunc: any)` | 4135 | ✍ Override: returns false if any attached implement is not ready for automated train travel, otherwise the base result. |
| `AttacherJoints:getIsAutomaticShiftingAllowed(superFunc: any)` | 4151 | ✍ Override: forbids automatic shifting at low speed (below 2) while an attach is in progress or a joint is moving, and when any attached implement forbids it; otherwise the base result. |
| `AttacherJoints:loadDashboardGroupFromXML(superFunc: any, xmlFile: any, key: any, group: any)` | 4180 | ✍ Override: after the base load, reads `#attacherJointIndices` and `#attacherJointNodes` of a dashboard group so it can be limited to certain attacher joints. |
| `AttacherJoints:getIsDashboardGroupActive(superFunc: any, group: any)` | 4208 | ✍ Override: converts pending joint nodes of a group to indices once loaded, then returns false if none of the group's joints has an implement; otherwise the base result. |
| `AttacherJoints:loadAttacherJointHeightNode(superFunc: any, xmlFile: any, key: any, heightNode: any, attacherJointNode: any)` | 4246 | ✍ Override: reads `#disablingAttacherJointIndices` for a height node, then calls the base loader. |
| `AttacherJoints:getIsAttacherJointHeightNodeActive(superFunc: any, heightNode: any)` | 4254 | ✍ Override: returns false if an implement is attached to any joint that disables this height node, otherwise the base result. |
| `AttacherJoints:loadTipSide(superFunc: any, xmlFile: any, key: any, entry: any)` | 4266 | ✍ Override: after the base load, reads `#disablingAttacherJointNodes` of a tip side (stored only when non-empty). Returns false if the base load fails. |
| `AttacherJoints:getIsTipSideAvailable(superFunc: any, sideIndex: any)` | 4281 | ✍ Override: a tip side becomes unavailable when an implement is attached to one of the joints listed as disabling it (nodes resolved lazily to indices). Uses `spec_trailer`, so it assumes the Trailer specialization is present. |
| `AttacherJoints:loadFillUnitFromXML(superFunc: any, xmlFile: any, key: any, entry: any, index: any)` | 4317 | ✍ Override: after the base load, reads `#disablingAttacherJointNodes` of a fill unit (stored only when non-empty). Returns false if the base load fails. |
| `AttacherJoints:getFillUnitSupportsToolType(superFunc: any, fillUnitIndex: any, toolType: any)` | 4333 | ✍ Override: a fill unit stops supporting the tool type when an implement is attached to a joint listed as disabling it. Relies on `spec_fillUnit`. |
| `AttacherJoints:isDetachAllowed(superFunc: any) → boolean` | 4370 | ✍ Override: refuses detaching when a joint with `allowDetachingWhileLifted` false holds an implement that is not lowered (unless the implement forces it), returning false and the 'lower implement first' warning with the implement type. |
| `AttacherJoints:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 4396 | ✍ Override: refuses folding (false plus warning text) while an implement is attached to a joint with `allowFoldingWhileAttached` false; otherwise the base result. |
| `AttacherJoints:getIsWheelFoliageDestructionAllowed(superFunc: any, wheel: any) → boolean` | 4412 | ✍ Override: wheels may not destroy foliage if the base refuses or any attached implement blocks foliage destruction. |
| `AttacherJoints:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 4436 | ✍ Override: controlled actions are refused (with the warning) if the base or any attached implement refuses them, or while an attach is in progress. |
| `AttacherJoints:getConnectionHoseConfigIndex(superFunc: any)` | 4464 | ✍ Override: returns the connection hose configuration index from `vehicle.attacherJoints#connectionHoseConfigId`, overridden by the selected attacherJoint configuration entry if any. |
| `AttacherJoints:getPowerTakeOffConfigIndex(superFunc: any)` | 4478 | ✍ Override: returns the power take off configuration index from `vehicle.attacherJoints#powerTakeOffConfigId`, overridden by the selected attacherJoint configuration entry if any. |
| `AttacherJoints:loadHoseTargetNode(superFunc: any, xmlFile: any, targetKey: any, entry: any)` | 4492 | ✍ Override: after the base load, reads `#blockedByAttacherJointNodes` of a hose target and stores it as `blockedByAttacherJointIndices` (still nodes at that point, resolved later). |
| `AttacherJoints:getIsConnectionTargetUsed(superFunc: any, desc: any)` | 4507 | ✍ Override: a hose connection target counts as used if the base says so or if an implement is attached to a joint that blocks it. |
| `AttacherJoints:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 4529 | ✍ Client: rebuilds this vehicle's action events when active for input (ignoring selection): lower selected implement, lower all, attach and detach. Registers the self-lowering event if this vehicle is selected, with a fallback to the single implement. |
| `AttacherJoints:onActivate()` | 4580 | ✍ Activates all attached implements when the vehicle is activated. |
| `AttacherJoints:onDeactivate()` | 4586 | ✍ Deactivates all attached implements and, on the client, stops the hydraulic sound. |
| `AttacherJoints:onReverseDirectionChanged(direction: any)` | 4597 | ✍ Recomputes each combo joint time: mirrored against the combo duration when the reverser points backwards, otherwise reset to its initial time. |
| `AttacherJoints:onStateChange(state: any, data: any)` | 4614 | ✍ Forwards the vehicle state change to every attached implement; on LOWER_ALL_IMPLEMENTS it starts the lower-all combo if the vehicle has joints. |
| `AttacherJoints:onLightsTypesMaskChanged(lightsTypesMask: any)` | 4632 | ✍ Server only: copies the light types mask to every attached implement that supports it. |
| `AttacherJoints:onTurnLightStateChanged(state: any)` | 4648 | ✍ Forwards the turn light state to attached implements that support turn lights. |
| `AttacherJoints:onBrakeLightsVisibilityChanged(visibility: any)` | 4660 | ✍ Forwards brake light visibility to attached implements that support it. |
| `AttacherJoints:onReverseLightsVisibilityChanged(visibility: any)` | 4672 | ✍ Forwards reverse light visibility to attached implements that support it. |
| `AttacherJoints:onBeaconLightsVisibilityChanged(visibility: any)` | 4684 | ✍ Forwards beacon light visibility to attached implements that support it. |
| `AttacherJoints:onBrake(brakePedal: any)` | 4696 | ✍ Forwards the brake pedal value to attached implements that have a `brake` function. |
| `AttacherJoints:onTurnedOn()` | 4708 | ✍ Turns on attached implements whose TurnOnVehicle spec is flagged as turned on by the attacher vehicle. |
| `AttacherJoints:onTurnedOff()` | 4725 | ✍ Turns off attached implements whose TurnOnVehicle spec is flagged as turned on by the attacher vehicle. |
| `AttacherJoints:onLeaveVehicle()` | 4742 | ✍ Raises `onLeaveRootVehicle` on each attached implement when the player leaves this vehicle. |
| `AttacherJoints.getAttacherJointCompatibility(vehicle: any, attacherJoint: any, inputAttacherVehicle: any, inputAttacherJoint: any)` | 4761 | ✍ Checks whether an implement joint can couple to a vehicle joint: forced direction, blocked state, sub type match, brand and vehicle path restrictions, then the overridable `getIsAttacherJointCompatible`. Returns true, or false with an optional warning text. |
| `AttacherJoints.findVehicleInAttachRange()` | 4858 | ✍ Deprecated stub: only logs a message pointing to `updateVehiclesInAttachRange`. Returns nothing. |
| `AttacherJoints.updateVehiclesInAttachRange(vehicle: any, maxDistanceSq: any, maxAngle: any, fullUpdate: any)` | 4864 | ✍ Finds the nearest compatible free input joint within distance and angle for the vehicle and its implements, spreading the scan over frames unless `fullUpdate`. Returns attacher vehicle, joint index, attachable, its joint index and warning. Note: it calls the global `getAttacherJointCompatibility`, not the `AttacherJoints.` one. |
| `AttacherJoints.actionEventAttach(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 4976 | ✍ Input callback for the attach action: if an attachable is in range it checks ownership and attaches on the server or sends `VehicleAttachRequestEvent` from a client; otherwise it starts detaching the selected implement, or shows a warning when not allowed. |
| `AttacherJoints.actionEventDetach(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 5009 | ✍ Input callback for the detach action: starts the detach process of the selected implement if allowed, otherwise shows the warning (or a default text). |
| `AttacherJoints.actionEventLowerImplement(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 5024 | ✍ Input callback for lowering: called with the implement as `self`, it forwards to the attacher vehicle's `handleLowerImplementEvent`. |
| `AttacherJoints.actionEventLowerAllImplements(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 5033 | ✍ Input callback for lowering all implements: starts the combo (forced) and raises the LOWER_ALL_IMPLEMENTS state change on the root vehicle. |
| `AttacherJoints.updateActionEvents(self: any)` | 5041 | ✍ Client: updates the attach action text, visibility and priority (attach vs detach, ownership check, warnings) and the lower action state and text from the selected implement. |
| `AttacherJoints.updateAttacherJointLimits(implement: any, attacherJointDesc: any, inputAttacherJointDesc: any, axis: any)` | 5112 | ✍ Computes the rotation and translation limits for one axis from the joint's and the input joint's limits and scales (zero if fixed rotation), stores them on the implement, and returns the current limits interpolated by move alpha. Local names `upperTransLimit`/`lowerTransLimit` are swapped but used consistently. |
| `AttacherJoints.updateAttacherJointRotationLimit(implement: any, attacherJointDesc: any, axis: any, force: any, alpha: any)` | 5150 | ✍ Interpolates the rotation limit of one axis by alpha and, if it changed noticeably (or forced), applies it to the physics joint, honouring lock up/down and dynamic lower limit options on axis 3. |
| `AttacherJoints.updateAttacherJointTranslationLimit(implement: any, attacherJointDesc: any, axis: any, force: any, alpha: any)` | 5179 | ✍ Interpolates the translation limit of one axis by alpha and, if it changed noticeably (or forced), applies it to the physics joint, honouring lock up/down options on axis 2. |
| `AttacherJoints.updateRequiredTopLightsState(self: any)` | 5202 | ✍ Checks whether any attached implement uses a joint and input joint both flagged for top lights and raises `onRequiresTopLightsChanged` with the result. |
| `AttacherJoints.consoleCommandBottomArmWidth(_: any, category: any, width: any)` | 5219 | ✍ Console command that sets the bottom arm width of all joints of the current vehicle chain to a category width or explicit width and logs the resulting category. Does nothing if there is no current vehicle. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onPreAttachImplement` | 304 |
| registerEvent | `onPostAttachImplement` | 305 |
| registerEvent | `onPreDetachImplement` | 306 |
| registerEvent | `onPostDetachImplement` | 307 |
| registerEvent | `onRequiresTopLightsChanged` | 308 |
| registerFunction | `loadAttachmentsFinished` | 314 |
| registerFunction | `handleLowerImplementEvent` | 315 |
| registerFunction | `handleLowerImplementByAttacherJointIndex` | 316 |
| registerFunction | `getAttachedImplements` | 317 |
| registerFunction | `getAttacherJoints` | 318 |
| registerFunction | `getAttacherJointByJointDescIndex` | 319 |
| registerFunction | `getAttacherJointIndexByNode` | 320 |
| registerFunction | `getAttacherJointByNode` | 321 |
| registerFunction | `getImplementFromAttacherJointIndex` | 322 |
| registerFunction | `getAttacherJointIndexFromObject` | 323 |
| registerFunction | `getAttacherJointDescFromObject` | 324 |
| registerFunction | `getAttacherJointIndexFromImplementIndex` | 325 |
| registerFunction | `getObjectFromImplementIndex` | 326 |
| registerFunction | `updateAttacherJointGraphics` | 327 |
| registerFunction | `calculateAttacherJointMoveUpperLowerAlpha` | 328 |
| registerFunction | `doGroundHeightNodeCheck` | 329 |
| registerFunction | `finishGroundHeightNodeCheck` | 330 |
| registerFunction | `groundHeightNodeCheckCallback` | 331 |
| registerFunction | `updateAttacherJointRotation` | 332 |
| registerFunction | `updateAttacherJointRotationNodes` | 333 |
| registerFunction | `updateAttacherJointSettingsByObject` | 334 |
| registerFunction | `setAttacherJointBottomArmWidth` | 335 |
| registerFunction | `attachImplementFromInfo` | 336 |
| registerFunction | `attachImplement` | 337 |
| registerFunction | `postAttachImplement` | 338 |
| registerFunction | `createAttachmentJoint` | 339 |
| registerFunction | `hardAttachImplement` | 340 |
| registerFunction | `hardDetachImplement` | 341 |
| registerFunction | `detachImplement` | 342 |
| registerFunction | `detachImplementByObject` | 343 |
| registerFunction | `playAttachSound` | 344 |
| registerFunction | `playDetachSound` | 345 |
| registerFunction | `detachingIsPossible` | 346 |
| registerFunction | `attachAdditionalAttachment` | 347 |
| registerFunction | `detachAdditionalAttachment` | 348 |
| registerFunction | `getImplementIndexByJointDescIndex` | 349 |
| registerFunction | `getImplementByJointDescIndex` | 350 |
| registerFunction | `getImplementIndexByObject` | 351 |
| registerFunction | `getImplementByObject` | 352 |
| registerFunction | `callFunctionOnAllImplements` | 353 |
| registerFunction | `activateAttachments` | 354 |
| registerFunction | `deactivateAttachments` | 355 |
| registerFunction | `deactivateAttachmentsLights` | 356 |
| registerFunction | `setJointMoveDown` | 357 |
| registerFunction | `getJointMoveDown` | 358 |
| registerFunction | `getIsHardAttachAllowed` | 359 |
| registerFunction | `getIsSmoothAttachUpdateAllowed` | 360 |
| registerFunction | `loadAttacherJointFromXML` | 361 |
| registerFunction | `onBottomArmToolbarI3DLoaded` | 362 |
| registerFunction | `setSelectedImplementByObject` | 363 |
| registerFunction | `getSelectedImplement` | 364 |
| registerFunction | `getCanToggleAttach` | 365 |
| registerFunction | `getShowAttachControlBarAction` | 366 |
| registerFunction | `getAttachControlBarActionAccessible` | 367 |
| registerFunction | `detachAttachedImplement` | 368 |
| registerFunction | `startAttacherJointCombo` | 369 |
| registerFunction | `registerSelfLoweringActionEvent` | 370 |
| registerFunction | `getIsAttachingAllowed` | 371 |
| registerFunction | `getIsAttacherJointCompatible` | 372 |
| registerFunction | `getCanSteerAttachable` | 373 |
| registerFunction | `onAttacherJointsVehicleLoaded` | 374 |
| registerFunction | `getAttachableInfo` | 375 |
| registerFunction | `setAttacherJointBlocked` | 376 |
| registerOverwrittenFunction | `raiseActive` | 382 |
| registerOverwrittenFunction | `registerActionEvents` | 383 |
| registerOverwrittenFunction | `removeActionEvents` | 384 |
| registerOverwrittenFunction | `addToPhysics` | 385 |
| registerOverwrittenFunction | `removeFromPhysics` | 386 |
| registerOverwrittenFunction | `getTotalMass` | 387 |
| registerOverwrittenFunction | `getAdditionalComponentMass` | 388 |
| registerOverwrittenFunction | `addChildVehicles` | 389 |
| registerOverwrittenFunction | `getAirConsumerUsage` | 390 |
| registerOverwrittenFunction | `getRequiresPower` | 391 |
| registerOverwrittenFunction | `addVehicleToAIImplementList` | 392 |
| registerOverwrittenFunction | `collectAIAgentAttachments` | 393 |
| registerOverwrittenFunction | `setAIVehicleObstacleStateDirty` | 394 |
| registerOverwrittenFunction | `getDirectionSnapAngle` | 395 |
| registerOverwrittenFunction | `getFillLevelInformation` | 396 |
| registerOverwrittenFunction | `getHasObjectMounted` | 397 |
| registerOverwrittenFunction | `attachableAddToolCameras` | 398 |
| registerOverwrittenFunction | `attachableRemoveToolCameras` | 399 |
| registerOverwrittenFunction | `registerSelectableObjects` | 400 |
| registerOverwrittenFunction | `getIsReadyForAutomatedTrainTravel` | 401 |
| registerOverwrittenFunction | `getIsAutomaticShiftingAllowed` | 402 |
| registerOverwrittenFunction | `loadDashboardGroupFromXML` | 403 |
| registerOverwrittenFunction | `getIsDashboardGroupActive` | 404 |
| registerOverwrittenFunction | `loadAttacherJointHeightNode` | 405 |
| registerOverwrittenFunction | `getIsAttacherJointHeightNodeActive` | 406 |
| registerOverwrittenFunction | `loadTipSide` | 407 |
| registerOverwrittenFunction | `getIsTipSideAvailable` | 408 |
| registerOverwrittenFunction | `loadFillUnitFromXML` | 409 |
| registerOverwrittenFunction | `getFillUnitSupportsToolType` | 410 |
| registerOverwrittenFunction | `isDetachAllowed` | 411 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 412 |
| registerOverwrittenFunction | `getIsWheelFoliageDestructionAllowed` | 413 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 414 |
| registerOverwrittenFunction | `getConnectionHoseConfigIndex` | 415 |
| registerOverwrittenFunction | `getPowerTakeOffConfigIndex` | 416 |
| registerOverwrittenFunction | `loadHoseTargetNode` | 417 |
| registerOverwrittenFunction | `getIsConnectionTargetUsed` | 418 |
| registerEventListener | `onPreLoad` | 424 |
| registerEventListener | `onLoad` | 425 |
| registerEventListener | `onPostLoad` | 426 |
| registerEventListener | `onLoadFinished` | 427 |
| registerEventListener | `onRegisterDashboardValueTypes` | 428 |
| registerEventListener | `onPreDelete` | 429 |
| registerEventListener | `onDelete` | 430 |
| registerEventListener | `onReadStream` | 431 |
| registerEventListener | `onWriteStream` | 432 |
| registerEventListener | `onUpdateInterpolation` | 433 |
| registerEventListener | `onUpdate` | 434 |
| registerEventListener | `onUpdateEnd` | 435 |
| registerEventListener | `onUpdateTick` | 436 |
| registerEventListener | `onRegisterActionEvents` | 437 |
| registerEventListener | `onStateChange` | 438 |
| registerEventListener | `onLightsTypesMaskChanged` | 439 |
| registerEventListener | `onTurnLightStateChanged` | 440 |
| registerEventListener | `onBrakeLightsVisibilityChanged` | 441 |
| registerEventListener | `onReverseLightsVisibilityChanged` | 442 |
| registerEventListener | `onBeaconLightsVisibilityChanged` | 443 |
| registerEventListener | `onBrake` | 444 |
| registerEventListener | `onTurnedOn` | 445 |
| registerEventListener | `onTurnedOff` | 446 |
| registerEventListener | `onLeaveVehicle` | 447 |
| registerEventListener | `onActivate` | 448 |
| registerEventListener | `onDeactivate` | 449 |
| registerEventListener | `onReverseDirectionChanged` | 450 |

## Messages

- subscribes `MessageType.VEHICLE_LOADED` (l.723)
