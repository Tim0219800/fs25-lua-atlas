# vehicles/specializations/Attachable.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Attachable.md)*

Source: `dataS/scripts/vehicles/specializations/Attachable.lua` — FS25 1.25.1.0

✍ Vehicle specialization for any implement or trailer that can be hooked to another vehicle. It loads the input attacher joints (the implement side of a hitch), support legs, steering axle behaviour, tool cameras, brakes and lowering animation from the vehicle XML, and keeps the link to the attacher vehicle once attached. It raises events such as onPreAttach, onPostAttach, onPreDetach, onPostDetach and onSetLowered, and overrides many base Vehicle functions so that an attached tool inherits state (active, powered, farm, root vehicle) from its tractor. It works with the AttacherJoints specialization on the tractor side and registers joints with the vehicle system. Note: setIsDetachingBlocked and getCanImplementBeUsedForAI are registered here but no function body with those names exists in this dump, and constants such as the XML keys are not visible (UNVERIFIED).

- **Attachable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Attachable.prerequisitesPresent(specializations: table) → boolean` | 26 | ✍ Prerequisite check for the specialization. Always returns true, so Attachable can be added to any vehicle type without requiring other specializations. |
| `Attachable.registerEvents(vehicleType: any)` | 32 | ✍ Declares the events this specialization can raise: onPreAttach, onPostAttach, onPreDetach, onPostDetach, onSetLowered, onSetLoweredAll and onLeaveRootVehicle. |
| `Attachable.registerFunctions(vehicleType: any)` | 44 | ✍ Registers the new vehicle functions added by this specialization (joint getters, detach process, lowering, steering axle, tool cameras and so on). It also lists setIsDetachingBlocked, which has no definition in this dump. |
| `Attachable.registerOverwrittenFunctions(vehicleType: any)` | 96 | ✍ Registers the base Vehicle functions this specialization wraps with superFunc, such as findRootVehicle, getIsActive, getBrakeForce, getIsLowered, addToPhysics and removeFromPhysics. The entry for getCanImplementBeUsedForAI points to a function not defined in this dump. |
| `Attachable.registerEventListeners(vehicleType: any)` | 130 | ✍ Subscribes the specialization to vehicle lifecycle and state events: load, delete, streams, updates, select/unselect, state change, root vehicle change, fold state change and animation value type registration. |
| `Attachable.initSpecialization()` | 153 | ✍ Registers the inputAttacherJoint configuration type and declares the XML schema paths under vehicle.attachable (joints, brake force, air usage, steering axle, support, lower animation, tool cameras, sounds) plus two savegame attributes (lowerAnimTime, isDetachingBlocked). |
| `Attachable.registerInputAttacherJointXMLPaths(schema: any, baseName: any)` | 258 | ✍ Declares every XML attribute and child element of an input attacher joint under the given base key: node, joint type, distances to ground, bottom arm data, limit scales, springs, lowering flags, additional attachment and more. |
| `Attachable.registerSupportXMLPaths(schema: any, key: any)` | 350 | ✍ Declares the XML attributes of a support (stand) animation entry: animation name, delayed load, delayed attach, detach after animation and the animation time at which detaching happens. |
| `Attachable:onLoad(savegame: table)` | 363 | ✍ Reads the vehicle.attachable XML: support animations, input attacher joints (including the selected configuration), brake force, air usage, folding rules, power requirement, steering axle and steering angle nodes, lower animation, tool cameras, client sounds and texts. Also warns about deprecated XML keys. |
| `Attachable:onPostLoad(savegame: table)` | 511 | ✍ Plays non-delayed support animations to their end state, applies the brake force if the vehicle has a brake, decides whether steering axle updates are needed, and removes the update listeners when the vehicle has no input attacher joints. |
| `Attachable:onLoadFinished(savegame: table)` | 541 | ✍ Registers each input attacher joint with the mission's vehicle system and stores the returned joint info on the joint. |
| `Attachable:onPreInitComponentPlacement(savegame: table)` | 551 | ✍ Plays delayed support animations, initialises drawbar reference nodes, and restores the lower animation time and detach-blocked flag from the savegame (or applies the default lowered state when there is no savegame). |
| `Attachable:onPreDelete()` | 599 | ✍ Before deletion, detaches this implement from its attacher vehicle if attached and unregisters its input attacher joints from the vehicle system. |
| `Attachable:onDelete()` | 619 | ✍ Cleans up resources: deletes tool cameras, releases the shared i3d file of the lower link balls and deletes the active sound samples. |
| `Attachable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 644 | ✍ Writes the lower animation time (when a lower animation exists) and the detach-blocked flag to the savegame XML. |
| `Attachable:onReadStream(streamId: integer, connection: Connection)` | 658 | ✍ Client side on join: if the server says the implement is attached, reads the attacher vehicle, joint indices and lowered state, then re-attaches the implement locally and sets the joint's move-down state. |
| `Attachable:onWriteStream(streamId: integer, connection: Connection)` | 676 | ✍ Server side on join: writes whether the implement is attached and, if so, the attacher vehicle, input and attacher joint indices, move-down state and implement index. Mirrors onReadStream. |
| `Attachable:onUpdateInterpolation(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 701 | ✍ While attached and within the attacher vehicle's update distance and same update loop, refreshes the attacher joint graphics on both vehicles each frame. |
| `Attachable:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 721 | ✍ Per-frame update. Computes the steering axle angle from the yaw relative to the base vehicle (speed scaled, optional distance delay), rotates the target node, updates steering angle nodes, and finishes a pending detach once support animations are done. |
| `Attachable:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 829 | ✍ Updates the vehicle-system info of each input attacher joint and, on the client, starts or stops the looping active sound depending on whether the vehicle's last speed exceeds a small threshold. |
| `Attachable:loadInputAttacherJoint(xmlFile: table, key: any, inputAttacherJoint: any, index: any)` | 856 | ✍ Loads one input attacher joint from XML into the given table and returns true if a node was found. Handles joint type (with fallbacks), distances to ground, bottom arm balls, limit scales, springs, lowering defaults, dependent joints, object changes and additional attachment. Logs XML warnings for invalid values. |
| `Attachable:loadAttacherJointHeightNode(xmlFile: table, key: string, heightNode: table, attacherJointNode: any)` | 1173 | ✍ Loads a height node of an input attacher joint from XML (node and owning joint node). Always returns true. |
| `Attachable:getIsAttacherJointHeightNodeActive(heightNode: table) → boolean` | 1184 | ✍ Returns whether a given height node is active. Always true here; other specializations may override it. |
| `Attachable:getInputAttacherJointByJointDescIndex(index: any)` | 1190 | ✍ Returns the input attacher joint table at the given 1-based index, or nil if it does not exist. |
| `Attachable:getInputAttacherJointIndexByNode(node: any)` | 1196 | ✍ Returns the index of the input attacher joint whose node matches the given node, or nil when none matches. |
| `Attachable:getAttacherVehicle()` | 1211 | ✍ Returns the vehicle this implement is currently attached to, or nil if it is not attached. |
| `Attachable:getShowAttachableMapHotspot()` | 1216 | ✍ Returns true when the implement is not attached to anything, meaning its map hotspot may be shown. |
| `Attachable:getInputAttacherJoints()` | 1222 | ✍ Returns the list of input attacher joints loaded for this vehicle. |
| `Attachable:getIsAttachedTo(vehicle: any)` | 1228 | ✍ Returns true if the given vehicle is this vehicle itself or any vehicle further up the attachment chain. |
| `Attachable:getActiveInputAttacherJointDescIndex()` | 1247 | ✍ Returns the index of the input attacher joint currently used for the attachment, or nil when detached. |
| `Attachable:getActiveInputAttacherJoint()` | 1253 | ✍ Returns the input attacher joint table currently in use, or nil when the implement is not attached. |
| `Attachable:getAllowsLowering() → boolean, string` | 1261 | ✍ Returns true if the tool may be lowered: false for an additional attachment that does not need lowering, or when the active joint does not allow lowering. Second return value is always nil. |
| `Attachable:loadSupportAnimationFromXML(supportAnimation: table, xmlFile: XMLFile, key: string)` | 1284 | ✍ Fills a support animation entry from XML (animation name, delayed load, delayed attach, detach after animation, detach time). Returns true only if an animation name is present. |
| `Attachable:getIsSupportAnimationAllowed(supportAnimation: any)` | 1296 | ✍ Returns true when the vehicle has an animation system (playAnimation exists), so support animations can be played. |
| `Attachable:getIsReadyToFinishDetachProcess()` | 1302 | ✍ Returns true when every support animation flagged detach-after-animation has finished or reached its configured detach time, so the final detach can happen. |
| `Attachable:startDetachProcess(noEventSend: any)` | 1325 | ✍ Starts detaching: sends AttachableStartDetachEvent, plays the support animations and, on the server, detaches at once if ready or flags detaching as in progress. Returns whether the detach could be completed now. |
| `Attachable:getIsImplementChainLowered(defaultIsLowered: boolean) → boolean` | 1361 | ✍ Returns true if this implement and every attacher vehicle above it that supports lowering are lowered. The parameter is the fallback value when lowering is not allowed. |
| `Attachable:getIsInWorkPosition() → boolean` | 1383 | ✍ Returns whether the implement is in work position. Always true here; other specializations are expected to override it. |
| `Attachable:getAttachbleAirConsumerUsage() → number` | 1390 | ✍ Returns the air consumption value read from the XML (usage while fully braking). The function name keeps the original misspelling Attachble. |
| `Attachable:isDetachAllowed() → boolean, string` | 1398 | ✍ Returns whether the implement may be detached, with optional warning text. Refuses when detaching is blocked, the joint forbids it, the parent is lifted and must be lowered first, it is an additional attachment, or attaching is still in progress. |
| `Attachable:isAttachAllowed(farmId: integer, attacherVehicle: table) → boolean, string` | 1442 | ✍ Returns whether attaching is allowed: the farm must have access to the vehicle and no detach may be in progress. Second return value is always nil. |
| `Attachable:getIsInputAttacherActive(inputAttacherJoint: table) → boolean` | 1458 | ✍ Returns whether a given input attacher joint can be used for attaching. Always true here; hook for overrides. |
| `Attachable:getSteeringAxleBaseVehicle()` | 1464 | ✍ Returns the vehicle used as steering reference: the attacher's own attacher when the super attachable option is set, otherwise the attacher vehicle if forced or if it can steer this attachable. May return nil. |
| `Attachable:loadSteeringAxleFromXML(spec: any, xmlFile: any, key: any)` | 1486 | ✍ Reads steering axle settings from XML into the given table: speed range, rotation limits, target node, direction, forced usage, distance delay and optional reference component. Turn speed is converted from degrees per second to per millisecond. |
| `Attachable:getIsSteeringAxleAllowed()` | 1512 | ✍ Returns whether steering axle adjustment is allowed. Always true here; hook for overrides. |
| `Attachable:loadSteeringAngleNodeFromXML(entry: any, xmlFile: any, key: any)` | 1518 | ✍ Fills a steering angle node entry from XML (node, speed per millisecond, scale, offset, minimum speed) and resets its current angle. Always returns true. |
| `Attachable:updateSteeringAngleNode(steeringAngleNode: any, angle: any, dt: any)` | 1532 | ✍ Moves a steering angle node toward the target angle at its configured speed when the vehicle is faster than the node's minimum speed, applies the Y rotation and marks the moving tool dirty. |
| `Attachable:attachableAddToolCameras()` | 1551 | ✍ Adds this implement's tool cameras to the root vehicle (if it supports addToolCameras). Does nothing without tool cameras. |
| `Attachable:attachableRemoveToolCameras()` | 1566 | ✍ Removes this implement's tool cameras from the root vehicle (if it supports removeToolCameras). Does nothing without tool cameras. |
| `Attachable:preAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: boolean, loadFromSavegame: boolean)` | 1584 | ✍ Called before the attachment completes. Stores the attacher vehicle and active joint, picks distances to ground per attacher vehicle file, toggles additional objects and bottom arm balls, plays non-delayed support animations and raises onPreAttach. |
| `Attachable:postAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer, loadFromSavegame: boolean)` | 1646 | ✍ Called after attaching. Activates the tool if the root vehicle is controlled, copies lights state from the attacher vehicle, plays delayed support animations, adds tool cameras, applies object changes and moving part references, registers the lowering controlled action and raises onPostAttach. |
| `Attachable:preDetach(attacherVehicle: any, implement: any)` | 1736 | ✍ Called before detaching. Removes the lowering controlled action from the action controller and raises onPreDetach. |
| `Attachable:postDetach(implementIndex: any)` | 1748 | ✍ Called after detaching. Deactivates the vehicle, reverts object changes and moving part references, plays the reverse support animations and lower animation, removes tool cameras, hides additional objects, clears the attacher references and raises onPostDetach. |
| `Attachable:setLowered(lowered: boolean)` | 1806 | ✍ Sets the lowered state: plays the lower animation forward or backward, propagates the state to dependent attacher joints (with warnings if missing) and raises onSetLowered. |
| `Attachable:setLoweredAll(doLowering: boolean, jointDescIndex: any)` | 1840 | ✍ Asks the attacher vehicle to lower or lift the whole implement at the given joint index, then raises onSetLoweredAll. Assumes the implement is attached. |
| `Attachable:setToolBottomArmWidthByIndex(inputAttacherJointIndex: integer, widthIndex: integer)` | 1850 | ✍ Moves the left and right bottom arm ball nodes of an input attacher joint to the width chosen by index (0.5 if the index is unknown). The ball size computation is not applied to the mesh. |
| `Attachable:updateInputAttacherJointGraphics(implement: any, dt: any)` | 1867 | ✍ While the attachment is not in progress, updates the moving parts for the steering bar nodes and drawbar node of the active input joint. |
| `Attachable:setIsAdditionalAttachment(needsLowering: any, vehicleLoaded: any)` | 1887 | ✍ Marks the vehicle as an additional attachment (cannot be detached or lowered by itself) and stores whether it needs lowering. If already loaded, refreshes action events and removes the lowering action when lowering is not needed. |
| `Attachable:getIsAdditionalAttachment()` | 1905 | ✍ Returns true if the vehicle was marked as an additional attachment. |
| `Attachable:setIsSupportVehicle(state: any)` | 1911 | ✍ Flags the vehicle as a support vehicle; the state defaults to true when nil is passed. Support vehicles are excluded from reset and map hotspots. |
| `Attachable:getIsSupportVehicle()` | 1922 | ✍ Returns the support vehicle flag (nil if it was never set). |
| `Attachable:registerLoweringActionEvent(actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any)` | 1928 | ✍ Registers an input action event for lowering by forwarding all parameters to addPoweredActionEvent (the event is tied to the vehicle being powered). Returns what that function returns. |
| `Attachable:getLoweringActionEventState()` | 1935 | ✍ Returns whether the lower/lift action should be shown (both attacher and input joints allow lowering) and the matching display text with the vehicle type, depending on the current lowered state. |
| `Attachable:getAllowMultipleAttachments()` | 1958 | ✍ Returns false here: the attachment dialog is not offered for an already attached implement. Overridable. |
| `Attachable:resolveMultipleAttachments()` | 1964 | ✍ Empty hook called before attaching to a second vehicle; does nothing in this specialization. |
| `Attachable:getBlockFoliageDestruction()` | 1969 | ✍ Returns the blockFoliageDestruction XML flag: when true the implement blocks foliage destruction for its whole vehicle chain. |
| `Attachable:onDeactivate()` | 1980 | ✍ On deactivation, re-applies the brake force if the vehicle has a brake and, on the client, stops the active sound if it is playing. |
| `Attachable:onSelect(subSelectionIndex: any)` | 1999 | ✍ When the implement is selected, tells the attacher vehicle to mark it as the selected implement. |
| `Attachable:onUnselect()` | 2008 | ✍ When the implement is unselected, tells the attacher vehicle to clear its selected implement (passes nil). |
| `Attachable:findRootVehicle(superFunc: any)` | 2017 | ✍ Override: returns the root vehicle of the attacher vehicle when attached, otherwise defers to the base implementation. |
| `Attachable:getIsActive(superFunc: any)` | 2028 | ✍ Override: active if the base says so or if the attacher vehicle is active. |
| `Attachable:getIsOperating(superFunc: any) → boolean` | 2042 | ✍ Override: operating if the base says so or if the attacher vehicle is operating. |
| `Attachable:getBrakeForce(superFunc: any)` | 2056 | ✍ Override: returns the larger of the base brake force and this tool's own force. The force can be interpolated by mass between the default and maximum values, and a separate force applies while lowered. |
| `Attachable:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 2078 | ✍ Override: refuses folding (with a warning text) when attached and folding while attached is disabled, when lowered and folding while lowered is disabled, or when the active joint forbids folding. Otherwise defers to the base. |
| `Attachable:getCanToggleTurnedOn(superFunc: any)` | 2102 | ✍ Override: returns false if the attacher joint of the tractor or the active input joint forbids turning the implement on; otherwise defers to the base. |
| `Attachable:getDeactivateOnLeave(superFunc: any)` | 2138 | ✍ Override: returns false if the attacher vehicle does not deactivate on leave; otherwise defers to the base. |
| `Attachable:getCanAIImplementContinueWork(superFunc: any, isTurning: any) → boolean` | 2152 | ✍ Override: after the base check, requires the lower animation to be at an end (or lifting) and, if the AI needs lowering, the joint to have finished moving. Returns the base's stop values when the base refuses. |
| `Attachable:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 2183 | ✍ Override: returns false while any support animation is playing; otherwise defers to the base. |
| `Attachable:getActiveFarm(superFunc: any)` | 2196 | ✍ Override: for an attached tool returns the attacher vehicle's farm, unless the vehicle is itself entered by a controller (enterable with a controller farm), in which case the base value is used. |
| `Attachable:getCanBeSelected(superFunc: any)` | 2213 | ✍ Override: attachable vehicles can always be selected; returns true. |
| `Attachable:getIsLowered(superFunc: any, defaultIsLowered: any)` | 2219 | ✍ Override: when attached, returns the joint's move-down state if lowering is allowed or default-lowered, otherwise the provided default; when detached defers to the base. |
| `Attachable:mountDynamic(superFunc: any, object: any, objectActorId: any, jointNode: any, mountType: any, forceAcceleration: any)` | 2237 | ✍ Override: refuses dynamic mounting of objects (returns false) while this vehicle is attached; otherwise defers to the base. |
| `Attachable:getOwnerConnection(superFunc: any)` | 2249 | ✍ Override: when attached, returns the attacher vehicle's owner connection (multiplayer); otherwise defers to the base. |
| `Attachable:getIsInUse(superFunc: any, connection: any)` | 2261 | ✍ Override: when attached, in-use status for a connection comes from the attacher vehicle; otherwise from the base. |
| `Attachable:getUpdatePriority(superFunc: any, skipCount: any, x: any, y: any, z: any, coeff: any, connection: any, isGuiVisible: any)` | 2272 | ✍ Override: when attached, the network update priority is taken from the attacher vehicle; otherwise the base value is used (the base call omits the GUI visibility argument). |
| `Attachable:getCanBeReset(superFunc: any)` | 2283 | ✍ Override: returns false for additional attachments and support vehicles; otherwise defers to the base. |
| `Attachable:loadAdditionalLightAttributesFromXML(superFunc: any, xmlFile: any, key: any, light: any)` | 2297 | ✍ Override: after the base loads a light, also reads the optional inputAttacherJointIndex attribute that restricts the light to one input joint. Returns false if the base fails. |
| `Attachable:getIsLightActive(superFunc: any, light: any)` | 2309 | ✍ Override: a light tied to an input attacher joint index is inactive unless that joint is the active one; otherwise defers to the base. |
| `Attachable:getIsPowered(superFunc: any)` | 2321 | ✍ Override: attached, powered state comes from the attacher vehicle (its warning is passed on). Detached, the vehicle is unpowered with a warning if it needs external power and has no Motorized specialization. |
| `Attachable:getConnectionHoseConfigIndex(superFunc: any)` | 2342 | ✍ Override: returns the connection hose configuration index from the XML, with the inputAttacherJoint configuration value taking priority, falling back to the base value. |
| `Attachable:getIsMapHotspotVisible(superFunc: any)` | 2356 | ✍ Override: the map hotspot is visible only if the base allows it, the vehicle is neither an additional attachment nor a support vehicle, and it is not attached. |
| `Attachable:getPowerTakeOffConfigIndex(superFunc: any)` | 2374 | ✍ Override: returns the power take off configuration index from the XML, with the inputAttacherJoint configuration value taking priority, falling back to the base value. |
| `Attachable:loadDashboardGroupFromXML(superFunc: any, xmlFile: any, key: any, group: any)` | 2388 | ✍ Override: after the base loads a dashboard group, also reads the optional isAttached condition. Returns false if the base fails. |
| `Attachable:getIsDashboardGroupActive(superFunc: any, group: any)` | 2400 | ✍ Override: a dashboard group with an isAttached condition is inactive when it does not match the current attached state; otherwise defers to the base. |
| `Attachable:setWorldPositionQuaternion(superFunc: number, x: number, y: number, z: number, qx: number, qy: number, qz: number, qw: number, i: integer, changeInterp: boolean)` | 2421 | ✍ Override: on a client, ignores positions received from the network while the implement is hard attached (its position follows the attacher vehicle); on the server and otherwise defers to the base. |
| `Attachable:addToPhysics(superFunc: any) → boolean` | 2438 | ✍ Override: after the base adds the vehicle to physics, creates the attachment joint if the attacher vehicle is in physics (unless hard attached). If a hard-attached parent is not yet in physics, resets the flag so the call can be repeated. |
| `Attachable:removeFromPhysics(superFunc: any) → boolean` | 2472 | ✍ Override: before the base removes the vehicle from physics, clears the stored joint index of the attachment (unless hard attached) when the attacher vehicle is in physics. |
| `Attachable:actionControllerLowerImplementEvent(direction: any)` | 2493 | ✍ Callback of the lowering controlled action: if lowering is allowed, sets the joint move-down state from the direction sign (negative lifts) when it differs. Returns true if handled. |
| `Attachable:onStateChange(state: any, data: any)` | 2515 | ✍ On AI start-line and end-line state changes, lowers or lifts the implement through the controlled action when it is set to lower if any implement is lowered. |
| `Attachable:onRootVehicleChanged(rootVehicle: table)` | 2530 | ✍ When the root vehicle changes, re-parents the lowering controlled action to the new root's action controller if both exist. |
| `Attachable:onFoldStateChanged(direction: any, moveToMiddle: any)` | 2542 | ✍ While folding changes, raises onSetLowered with true or false depending on the fold direction relative to the turn-on direction, only if a fold middle time exists. Note: reads spec_foldable without checking that the Foldable specialization is present. |
| `Attachable:onRegisterAnimationValueTypes()` | 2555 | ✍ Registers animation value types that let AnimatedVehicle parts drive input joint settings: lower/upper rotation and translation limit scales, rotation offsets and distances to ground. On the server each change updates the attacher vehicle's joint settings. |
| `Attachable:onBottomArmBallsI3DLoaded(i3dNode: integer, failedReason: table, inputAttacherJoint: any)` | 2778 | ✍ Callback for the lower link balls i3d: if it has exactly three ball nodes, links them to the input joint, sets the widest width and visibility, and links the top ball to the top reference node. Otherwise logs a warning. Deletes the loaded node. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onPreAttach` | 33 |
| registerEvent | `onPostAttach` | 34 |
| registerEvent | `onPreDetach` | 35 |
| registerEvent | `onPostDetach` | 36 |
| registerEvent | `onSetLowered` | 37 |
| registerEvent | `onSetLoweredAll` | 38 |
| registerEvent | `onLeaveRootVehicle` | 39 |
| registerFunction | `loadInputAttacherJoint` | 45 |
| registerFunction | `loadAttacherJointHeightNode` | 46 |
| registerFunction | `getIsAttacherJointHeightNodeActive` | 47 |
| registerFunction | `getInputAttacherJointByJointDescIndex` | 48 |
| registerFunction | `getInputAttacherJointIndexByNode` | 49 |
| registerFunction | `getAttacherVehicle` | 50 |
| registerFunction | `getShowAttachableMapHotspot` | 51 |
| registerFunction | `getInputAttacherJoints` | 52 |
| registerFunction | `getIsAttachedTo` | 53 |
| registerFunction | `getActiveInputAttacherJointDescIndex` | 54 |
| registerFunction | `getActiveInputAttacherJoint` | 55 |
| registerFunction | `getAllowsLowering` | 56 |
| registerFunction | `loadSupportAnimationFromXML` | 57 |
| registerFunction | `getIsSupportAnimationAllowed` | 58 |
| registerFunction | `getIsReadyToFinishDetachProcess` | 59 |
| registerFunction | `startDetachProcess` | 60 |
| registerFunction | `getIsImplementChainLowered` | 61 |
| registerFunction | `getIsInWorkPosition` | 62 |
| registerFunction | `getAttachbleAirConsumerUsage` | 63 |
| registerFunction | `isDetachAllowed` | 64 |
| registerFunction | `isAttachAllowed` | 65 |
| registerFunction | `getIsInputAttacherActive` | 66 |
| registerFunction | `getSteeringAxleBaseVehicle` | 67 |
| registerFunction | `loadSteeringAxleFromXML` | 68 |
| registerFunction | `getIsSteeringAxleAllowed` | 69 |
| registerFunction | `loadSteeringAngleNodeFromXML` | 70 |
| registerFunction | `updateSteeringAngleNode` | 71 |
| registerFunction | `attachableAddToolCameras` | 72 |
| registerFunction | `attachableRemoveToolCameras` | 73 |
| registerFunction | `preAttach` | 74 |
| registerFunction | `postAttach` | 75 |
| registerFunction | `preDetach` | 76 |
| registerFunction | `postDetach` | 77 |
| registerFunction | `setLowered` | 78 |
| registerFunction | `setLoweredAll` | 79 |
| registerFunction | `setToolBottomArmWidthByIndex` | 80 |
| registerFunction | `updateInputAttacherJointGraphics` | 81 |
| registerFunction | `setIsAdditionalAttachment` | 82 |
| registerFunction | `getIsAdditionalAttachment` | 83 |
| registerFunction | `setIsSupportVehicle` | 84 |
| registerFunction | `getIsSupportVehicle` | 85 |
| registerFunction | `registerLoweringActionEvent` | 86 |
| registerFunction | `getLoweringActionEventState` | 87 |
| registerFunction | `getAllowMultipleAttachments` | 88 |
| registerFunction | `resolveMultipleAttachments` | 89 |
| registerFunction | `getBlockFoliageDestruction` | 90 |
| registerFunction | `setIsDetachingBlocked` | 91 |
| registerOverwrittenFunction | `findRootVehicle` | 97 |
| registerOverwrittenFunction | `getIsActive` | 98 |
| registerOverwrittenFunction | `getIsOperating` | 99 |
| registerOverwrittenFunction | `getBrakeForce` | 100 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 101 |
| registerOverwrittenFunction | `getCanToggleTurnedOn` | 102 |
| registerOverwrittenFunction | `getCanImplementBeUsedForAI` | 103 |
| registerOverwrittenFunction | `getCanAIImplementContinueWork` | 104 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 105 |
| registerOverwrittenFunction | `getDeactivateOnLeave` | 106 |
| registerOverwrittenFunction | `getActiveFarm` | 107 |
| registerOverwrittenFunction | `getCanBeSelected` | 108 |
| registerOverwrittenFunction | `getIsLowered` | 109 |
| registerOverwrittenFunction | `mountDynamic` | 110 |
| registerOverwrittenFunction | `getOwnerConnection` | 111 |
| registerOverwrittenFunction | `getIsInUse` | 112 |
| registerOverwrittenFunction | `getUpdatePriority` | 113 |
| registerOverwrittenFunction | `getCanBeReset` | 114 |
| registerOverwrittenFunction | `loadAdditionalLightAttributesFromXML` | 115 |
| registerOverwrittenFunction | `getIsLightActive` | 116 |
| registerOverwrittenFunction | `getIsPowered` | 117 |
| registerOverwrittenFunction | `getConnectionHoseConfigIndex` | 118 |
| registerOverwrittenFunction | `getIsMapHotspotVisible` | 119 |
| registerOverwrittenFunction | `getPowerTakeOffConfigIndex` | 120 |
| registerOverwrittenFunction | `loadDashboardGroupFromXML` | 121 |
| registerOverwrittenFunction | `getIsDashboardGroupActive` | 122 |
| registerOverwrittenFunction | `setWorldPositionQuaternion` | 123 |
| registerOverwrittenFunction | `addToPhysics` | 124 |
| registerOverwrittenFunction | `removeFromPhysics` | 125 |
| registerEventListener | `onLoad` | 131 |
| registerEventListener | `onPostLoad` | 132 |
| registerEventListener | `onLoadFinished` | 133 |
| registerEventListener | `onPreInitComponentPlacement` | 134 |
| registerEventListener | `onPreDelete` | 135 |
| registerEventListener | `onDelete` | 136 |
| registerEventListener | `onReadStream` | 137 |
| registerEventListener | `onWriteStream` | 138 |
| registerEventListener | `onUpdateInterpolation` | 139 |
| registerEventListener | `onUpdate` | 140 |
| registerEventListener | `onUpdateTick` | 141 |
| registerEventListener | `onDeactivate` | 142 |
| registerEventListener | `onSelect` | 143 |
| registerEventListener | `onUnselect` | 144 |
| registerEventListener | `onStateChange` | 145 |
| registerEventListener | `onRootVehicleChanged` | 146 |
| registerEventListener | `onFoldStateChanged` | 147 |
| registerEventListener | `onRegisterAnimationValueTypes` | 148 |
