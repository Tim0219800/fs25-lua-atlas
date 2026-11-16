---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Attachable.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization for any implement or trailer that can be hooked to another vehicle. It loads the input attacher joints (the implement side of a hitch), support legs, steering axle behaviour, tool cameras, brakes and lowering animation from the vehicle XML, and keeps the link to the attacher vehicle once attached. It raises events such as onPreAttach, onPostAttach, onPreDetach, onPostDetach and onSetLowered, and overrides many base Vehicle functions so that an attached tool inherits state (active, powered, farm, root vehicle) from its tractor. It works with the AttacherJoints specialization on the tractor side and registers joints with the vehicle system. Note: setIsDetachingBlocked and getCanImplementBeUsedForAI are registered here but no function body with those names exists in this dump, and constants such as the XML keys are not visible (UNVERIFIED).
---@class Attachable
Attachable = {}

--- Prerequisite check for the specialization. Always returns true, so Attachable can be added to any vehicle type without requiring other specializations.
---@param specializations table
---@return boolean
function Attachable.prerequisitesPresent(specializations) end

--- Declares the events this specialization can raise: onPreAttach, onPostAttach, onPreDetach, onPostDetach, onSetLowered, onSetLoweredAll and onLeaveRootVehicle.
---@param vehicleType any
function Attachable.registerEvents(vehicleType) end

--- Registers the new vehicle functions added by this specialization (joint getters, detach process, lowering, steering axle, tool cameras and so on). It also lists setIsDetachingBlocked, which has no definition in this dump.
---@param vehicleType any
function Attachable.registerFunctions(vehicleType) end

--- Registers the base Vehicle functions this specialization wraps with superFunc, such as findRootVehicle, getIsActive, getBrakeForce, getIsLowered, addToPhysics and removeFromPhysics. The entry for getCanImplementBeUsedForAI points to a function not defined in this dump.
---@param vehicleType any
function Attachable.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the specialization to vehicle lifecycle and state events: load, delete, streams, updates, select/unselect, state change, root vehicle change, fold state change and animation value type registration.
---@param vehicleType any
function Attachable.registerEventListeners(vehicleType) end

--- Registers the inputAttacherJoint configuration type and declares the XML schema paths under vehicle.attachable (joints, brake force, air usage, steering axle, support, lower animation, tool cameras, sounds) plus two savegame attributes (lowerAnimTime, isDetachingBlocked).
function Attachable.initSpecialization() end

--- Declares every XML attribute and child element of an input attacher joint under the given base key: node, joint type, distances to ground, bottom arm data, limit scales, springs, lowering flags, additional attachment and more.
---@param schema any
---@param baseName any
function Attachable.registerInputAttacherJointXMLPaths(schema, baseName) end

--- Declares the XML attributes of a support (stand) animation entry: animation name, delayed load, delayed attach, detach after animation and the animation time at which detaching happens.
---@param schema any
---@param key any
function Attachable.registerSupportXMLPaths(schema, key) end

--- Reads the vehicle.attachable XML: support animations, input attacher joints (including the selected configuration), brake force, air usage, folding rules, power requirement, steering axle and steering angle nodes, lower animation, tool cameras, client sounds and texts. Also warns about deprecated XML keys.
---@param savegame table
function Attachable:onLoad(savegame) end

--- Plays non-delayed support animations to their end state, applies the brake force if the vehicle has a brake, decides whether steering axle updates are needed, and removes the update listeners when the vehicle has no input attacher joints.
---@param savegame table
function Attachable:onPostLoad(savegame) end

--- Registers each input attacher joint with the mission's vehicle system and stores the returned joint info on the joint.
---@param savegame table
function Attachable:onLoadFinished(savegame) end

--- Plays delayed support animations, initialises drawbar reference nodes, and restores the lower animation time and detach-blocked flag from the savegame (or applies the default lowered state when there is no savegame).
---@param savegame table
function Attachable:onPreInitComponentPlacement(savegame) end

--- Before deletion, detaches this implement from its attacher vehicle if attached and unregisters its input attacher joints from the vehicle system.
function Attachable:onPreDelete() end

--- Cleans up resources: deletes tool cameras, releases the shared i3d file of the lower link balls and deletes the active sound samples.
function Attachable:onDelete() end

--- Writes the lower animation time (when a lower animation exists) and the detach-blocked flag to the savegame XML.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Attachable:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client side on join: if the server says the implement is attached, reads the attacher vehicle, joint indices and lowered state, then re-attaches the implement locally and sets the joint's move-down state.
---@param streamId integer
---@param connection Connection
function Attachable:onReadStream(streamId, connection) end

--- Server side on join: writes whether the implement is attached and, if so, the attacher vehicle, input and attacher joint indices, move-down state and implement index. Mirrors onReadStream.
---@param streamId integer
---@param connection Connection
function Attachable:onWriteStream(streamId, connection) end

--- While attached and within the attacher vehicle's update distance and same update loop, refreshes the attacher joint graphics on both vehicles each frame.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Attachable:onUpdateInterpolation(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Per-frame update. Computes the steering axle angle from the yaw relative to the base vehicle (speed scaled, optional distance delay), rotates the target node, updates steering angle nodes, and finishes a pending detach once support animations are done.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Attachable:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Updates the vehicle-system info of each input attacher joint and, on the client, starts or stops the looping active sound depending on whether the vehicle's last speed exceeds a small threshold.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Attachable:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Loads one input attacher joint from XML into the given table and returns true if a node was found. Handles joint type (with fallbacks), distances to ground, bottom arm balls, limit scales, springs, lowering defaults, dependent joints, object changes and additional attachment. Logs XML warnings for invalid values.
---@param xmlFile table
---@param key any
---@param inputAttacherJoint any
---@param index any
function Attachable:loadInputAttacherJoint(xmlFile, key, inputAttacherJoint, index) end

--- Loads a height node of an input attacher joint from XML (node and owning joint node). Always returns true.
---@param xmlFile table
---@param key string
---@param heightNode table
---@param attacherJointNode any
function Attachable:loadAttacherJointHeightNode(xmlFile, key, heightNode, attacherJointNode) end

--- Returns whether a given height node is active. Always true here; other specializations may override it.
---@param heightNode table
---@return boolean
function Attachable:getIsAttacherJointHeightNodeActive(heightNode) end

--- Returns the input attacher joint table at the given 1-based index, or nil if it does not exist.
---@param index any
function Attachable:getInputAttacherJointByJointDescIndex(index) end

--- Returns the index of the input attacher joint whose node matches the given node, or nil when none matches.
---@param node any
function Attachable:getInputAttacherJointIndexByNode(node) end

--- Returns the vehicle this implement is currently attached to, or nil if it is not attached.
function Attachable:getAttacherVehicle() end

--- Returns true when the implement is not attached to anything, meaning its map hotspot may be shown.
function Attachable:getShowAttachableMapHotspot() end

--- Returns the list of input attacher joints loaded for this vehicle.
function Attachable:getInputAttacherJoints() end

--- Returns true if the given vehicle is this vehicle itself or any vehicle further up the attachment chain.
---@param vehicle any
function Attachable:getIsAttachedTo(vehicle) end

--- Returns the index of the input attacher joint currently used for the attachment, or nil when detached.
function Attachable:getActiveInputAttacherJointDescIndex() end

--- Returns the input attacher joint table currently in use, or nil when the implement is not attached.
function Attachable:getActiveInputAttacherJoint() end

--- Returns true if the tool may be lowered: false for an additional attachment that does not need lowering, or when the active joint does not allow lowering. Second return value is always nil.
---@return boolean
---@return string
function Attachable:getAllowsLowering() end

--- Fills a support animation entry from XML (animation name, delayed load, delayed attach, detach after animation, detach time). Returns true only if an animation name is present.
---@param supportAnimation table
---@param xmlFile XMLFile
---@param key string
function Attachable:loadSupportAnimationFromXML(supportAnimation, xmlFile, key) end

--- Returns true when the vehicle has an animation system (playAnimation exists), so support animations can be played.
---@param supportAnimation any
function Attachable:getIsSupportAnimationAllowed(supportAnimation) end

--- Returns true when every support animation flagged detach-after-animation has finished or reached its configured detach time, so the final detach can happen.
function Attachable:getIsReadyToFinishDetachProcess() end

--- Starts detaching: sends AttachableStartDetachEvent, plays the support animations and, on the server, detaches at once if ready or flags detaching as in progress. Returns whether the detach could be completed now.
---@param noEventSend any
function Attachable:startDetachProcess(noEventSend) end

--- Returns true if this implement and every attacher vehicle above it that supports lowering are lowered. The parameter is the fallback value when lowering is not allowed.
---@param defaultIsLowered boolean
---@return boolean
function Attachable:getIsImplementChainLowered(defaultIsLowered) end

--- Returns whether the implement is in work position. Always true here; other specializations are expected to override it.
---@return boolean
function Attachable:getIsInWorkPosition() end

--- Returns the air consumption value read from the XML (usage while fully braking). The function name keeps the original misspelling Attachble.
---@return number
function Attachable:getAttachbleAirConsumerUsage() end

--- Returns whether the implement may be detached, with optional warning text. Refuses when detaching is blocked, the joint forbids it, the parent is lifted and must be lowered first, it is an additional attachment, or attaching is still in progress.
---@return boolean
---@return string
function Attachable:isDetachAllowed() end

--- Returns whether attaching is allowed: the farm must have access to the vehicle and no detach may be in progress. Second return value is always nil.
---@param farmId integer
---@param attacherVehicle table
---@return boolean
---@return string
function Attachable:isAttachAllowed(farmId, attacherVehicle) end

--- Returns whether a given input attacher joint can be used for attaching. Always true here; hook for overrides.
---@param inputAttacherJoint table
---@return boolean
function Attachable:getIsInputAttacherActive(inputAttacherJoint) end

--- Returns the vehicle used as steering reference: the attacher's own attacher when the super attachable option is set, otherwise the attacher vehicle if forced or if it can steer this attachable. May return nil.
function Attachable:getSteeringAxleBaseVehicle() end

--- Reads steering axle settings from XML into the given table: speed range, rotation limits, target node, direction, forced usage, distance delay and optional reference component. Turn speed is converted from degrees per second to per millisecond.
---@param spec any
---@param xmlFile any
---@param key any
function Attachable:loadSteeringAxleFromXML(spec, xmlFile, key) end

--- Returns whether steering axle adjustment is allowed. Always true here; hook for overrides.
function Attachable:getIsSteeringAxleAllowed() end

--- Fills a steering angle node entry from XML (node, speed per millisecond, scale, offset, minimum speed) and resets its current angle. Always returns true.
---@param entry any
---@param xmlFile any
---@param key any
function Attachable:loadSteeringAngleNodeFromXML(entry, xmlFile, key) end

--- Moves a steering angle node toward the target angle at its configured speed when the vehicle is faster than the node's minimum speed, applies the Y rotation and marks the moving tool dirty.
---@param steeringAngleNode any
---@param angle any
---@param dt any
function Attachable:updateSteeringAngleNode(steeringAngleNode, angle, dt) end

--- Adds this implement's tool cameras to the root vehicle (if it supports addToolCameras). Does nothing without tool cameras.
function Attachable:attachableAddToolCameras() end

--- Removes this implement's tool cameras from the root vehicle (if it supports removeToolCameras). Does nothing without tool cameras.
function Attachable:attachableRemoveToolCameras() end

--- Called before the attachment completes. Stores the attacher vehicle and active joint, picks distances to ground per attacher vehicle file, toggles additional objects and bottom arm balls, plays non-delayed support animations and raises onPreAttach.
---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex boolean
---@param loadFromSavegame boolean
function Attachable:preAttach(attacherVehicle, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

--- Called after attaching. Activates the tool if the root vehicle is controlled, copies lights state from the attacher vehicle, plays delayed support animations, adds tool cameras, applies object changes and moving part references, registers the lowering controlled action and raises onPostAttach.
---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
---@param loadFromSavegame boolean
function Attachable:postAttach(attacherVehicle, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

--- Called before detaching. Removes the lowering controlled action from the action controller and raises onPreDetach.
---@param attacherVehicle any
---@param implement any
function Attachable:preDetach(attacherVehicle, implement) end

--- Called after detaching. Deactivates the vehicle, reverts object changes and moving part references, plays the reverse support animations and lower animation, removes tool cameras, hides additional objects, clears the attacher references and raises onPostDetach.
---@param implementIndex any
function Attachable:postDetach(implementIndex) end

--- Sets the lowered state: plays the lower animation forward or backward, propagates the state to dependent attacher joints (with warnings if missing) and raises onSetLowered.
---@param lowered boolean
function Attachable:setLowered(lowered) end

--- Asks the attacher vehicle to lower or lift the whole implement at the given joint index, then raises onSetLoweredAll. Assumes the implement is attached.
---@param doLowering boolean
---@param jointDescIndex any
function Attachable:setLoweredAll(doLowering, jointDescIndex) end

--- Moves the left and right bottom arm ball nodes of an input attacher joint to the width chosen by index (0.5 if the index is unknown). The ball size computation is not applied to the mesh.
---@param inputAttacherJointIndex integer
---@param widthIndex integer
function Attachable:setToolBottomArmWidthByIndex(inputAttacherJointIndex, widthIndex) end

--- While the attachment is not in progress, updates the moving parts for the steering bar nodes and drawbar node of the active input joint.
---@param implement any
---@param dt any
function Attachable:updateInputAttacherJointGraphics(implement, dt) end

--- Marks the vehicle as an additional attachment (cannot be detached or lowered by itself) and stores whether it needs lowering. If already loaded, refreshes action events and removes the lowering action when lowering is not needed.
---@param needsLowering any
---@param vehicleLoaded any
function Attachable:setIsAdditionalAttachment(needsLowering, vehicleLoaded) end

--- Returns true if the vehicle was marked as an additional attachment.
function Attachable:getIsAdditionalAttachment() end

--- Flags the vehicle as a support vehicle; the state defaults to true when nil is passed. Support vehicles are excluded from reset and map hotspots.
---@param state any
function Attachable:setIsSupportVehicle(state) end

--- Returns the support vehicle flag (nil if it was never set).
function Attachable:getIsSupportVehicle() end

--- Registers an input action event for lowering by forwarding all parameters to addPoweredActionEvent (the event is tied to the vehicle being powered). Returns what that function returns.
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
function Attachable:registerLoweringActionEvent(actionEventsTable, inputAction, target, callback, triggerUp, triggerDown, triggerAlways, startActive, callbackState, customIconName) end

--- Returns whether the lower/lift action should be shown (both attacher and input joints allow lowering) and the matching display text with the vehicle type, depending on the current lowered state.
function Attachable:getLoweringActionEventState() end

--- Returns false here: the attachment dialog is not offered for an already attached implement. Overridable.
function Attachable:getAllowMultipleAttachments() end

--- Empty hook called before attaching to a second vehicle; does nothing in this specialization.
function Attachable:resolveMultipleAttachments() end

--- Returns the blockFoliageDestruction XML flag: when true the implement blocks foliage destruction for its whole vehicle chain.
function Attachable:getBlockFoliageDestruction() end

--- On deactivation, re-applies the brake force if the vehicle has a brake and, on the client, stops the active sound if it is playing.
function Attachable:onDeactivate() end

--- When the implement is selected, tells the attacher vehicle to mark it as the selected implement.
---@param subSelectionIndex any
function Attachable:onSelect(subSelectionIndex) end

--- When the implement is unselected, tells the attacher vehicle to clear its selected implement (passes nil).
function Attachable:onUnselect() end

--- Override: returns the root vehicle of the attacher vehicle when attached, otherwise defers to the base implementation.
---@param superFunc any
function Attachable:findRootVehicle(superFunc) end

--- Override: active if the base says so or if the attacher vehicle is active.
---@param superFunc any
function Attachable:getIsActive(superFunc) end

--- Override: operating if the base says so or if the attacher vehicle is operating.
---@param superFunc any
---@return boolean
function Attachable:getIsOperating(superFunc) end

--- Override: returns the larger of the base brake force and this tool's own force. The force can be interpolated by mass between the default and maximum values, and a separate force applies while lowered.
---@param superFunc any
function Attachable:getBrakeForce(superFunc) end

--- Override: refuses folding (with a warning text) when attached and folding while attached is disabled, when lowered and folding while lowered is disabled, or when the active joint forbids folding. Otherwise defers to the base.
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function Attachable:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- Override: returns false if the attacher joint of the tractor or the active input joint forbids turning the implement on; otherwise defers to the base.
---@param superFunc any
function Attachable:getCanToggleTurnedOn(superFunc) end

--- Override: returns false if the attacher vehicle does not deactivate on leave; otherwise defers to the base.
---@param superFunc any
function Attachable:getDeactivateOnLeave(superFunc) end

--- Override: after the base check, requires the lower animation to be at an end (or lifting) and, if the AI needs lowering, the joint to have finished moving. Returns the base's stop values when the base refuses.
---@param superFunc any
---@param isTurning any
---@return boolean
function Attachable:getCanAIImplementContinueWork(superFunc, isTurning) end

--- Override: returns false while any support animation is playing; otherwise defers to the base.
---@param superFunc any
---@return boolean
---@return string
function Attachable:getAreControlledActionsAllowed(superFunc) end

--- Override: for an attached tool returns the attacher vehicle's farm, unless the vehicle is itself entered by a controller (enterable with a controller farm), in which case the base value is used.
---@param superFunc any
function Attachable:getActiveFarm(superFunc) end

--- Override: attachable vehicles can always be selected; returns true.
---@param superFunc any
function Attachable:getCanBeSelected(superFunc) end

--- Override: when attached, returns the joint's move-down state if lowering is allowed or default-lowered, otherwise the provided default; when detached defers to the base.
---@param superFunc any
---@param defaultIsLowered any
function Attachable:getIsLowered(superFunc, defaultIsLowered) end

--- Override: refuses dynamic mounting of objects (returns false) while this vehicle is attached; otherwise defers to the base.
---@param superFunc any
---@param object any
---@param objectActorId any
---@param jointNode any
---@param mountType any
---@param forceAcceleration any
function Attachable:mountDynamic(superFunc, object, objectActorId, jointNode, mountType, forceAcceleration) end

--- Override: when attached, returns the attacher vehicle's owner connection (multiplayer); otherwise defers to the base.
---@param superFunc any
function Attachable:getOwnerConnection(superFunc) end

--- Override: when attached, in-use status for a connection comes from the attacher vehicle; otherwise from the base.
---@param superFunc any
---@param connection any
function Attachable:getIsInUse(superFunc, connection) end

--- Override: when attached, the network update priority is taken from the attacher vehicle; otherwise the base value is used (the base call omits the GUI visibility argument).
---@param superFunc any
---@param skipCount any
---@param x any
---@param y any
---@param z any
---@param coeff any
---@param connection any
---@param isGuiVisible any
function Attachable:getUpdatePriority(superFunc, skipCount, x, y, z, coeff, connection, isGuiVisible) end

--- Override: returns false for additional attachments and support vehicles; otherwise defers to the base.
---@param superFunc any
function Attachable:getCanBeReset(superFunc) end

--- Override: after the base loads a light, also reads the optional inputAttacherJointIndex attribute that restricts the light to one input joint. Returns false if the base fails.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param light any
function Attachable:loadAdditionalLightAttributesFromXML(superFunc, xmlFile, key, light) end

--- Override: a light tied to an input attacher joint index is inactive unless that joint is the active one; otherwise defers to the base.
---@param superFunc any
---@param light any
function Attachable:getIsLightActive(superFunc, light) end

--- Override: attached, powered state comes from the attacher vehicle (its warning is passed on). Detached, the vehicle is unpowered with a warning if it needs external power and has no Motorized specialization.
---@param superFunc any
function Attachable:getIsPowered(superFunc) end

--- Override: returns the connection hose configuration index from the XML, with the inputAttacherJoint configuration value taking priority, falling back to the base value.
---@param superFunc any
function Attachable:getConnectionHoseConfigIndex(superFunc) end

--- Override: the map hotspot is visible only if the base allows it, the vehicle is neither an additional attachment nor a support vehicle, and it is not attached.
---@param superFunc any
function Attachable:getIsMapHotspotVisible(superFunc) end

--- Override: returns the power take off configuration index from the XML, with the inputAttacherJoint configuration value taking priority, falling back to the base value.
---@param superFunc any
function Attachable:getPowerTakeOffConfigIndex(superFunc) end

--- Override: after the base loads a dashboard group, also reads the optional isAttached condition. Returns false if the base fails.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param group any
function Attachable:loadDashboardGroupFromXML(superFunc, xmlFile, key, group) end

--- Override: a dashboard group with an isAttached condition is inactive when it does not match the current attached state; otherwise defers to the base.
---@param superFunc any
---@param group any
function Attachable:getIsDashboardGroupActive(superFunc, group) end

--- Override: on a client, ignores positions received from the network while the implement is hard attached (its position follows the attacher vehicle); on the server and otherwise defers to the base.
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
function Attachable:setWorldPositionQuaternion(superFunc, x, y, z, qx, qy, qz, qw, i, changeInterp) end

--- Override: after the base adds the vehicle to physics, creates the attachment joint if the attacher vehicle is in physics (unless hard attached). If a hard-attached parent is not yet in physics, resets the flag so the call can be repeated.
---@param superFunc any
---@return boolean
function Attachable:addToPhysics(superFunc) end

--- Override: before the base removes the vehicle from physics, clears the stored joint index of the attachment (unless hard attached) when the attacher vehicle is in physics.
---@param superFunc any
---@return boolean
function Attachable:removeFromPhysics(superFunc) end

--- Callback of the lowering controlled action: if lowering is allowed, sets the joint move-down state from the direction sign (negative lifts) when it differs. Returns true if handled.
---@param direction any
function Attachable:actionControllerLowerImplementEvent(direction) end

--- On AI start-line and end-line state changes, lowers or lifts the implement through the controlled action when it is set to lower if any implement is lowered.
---@param state any
---@param data any
function Attachable:onStateChange(state, data) end

--- When the root vehicle changes, re-parents the lowering controlled action to the new root's action controller if both exist.
---@param rootVehicle table
function Attachable:onRootVehicleChanged(rootVehicle) end

--- While folding changes, raises onSetLowered with true or false depending on the fold direction relative to the turn-on direction, only if a fold middle time exists. Note: reads spec_foldable without checking that the Foldable specialization is present.
---@param direction any
---@param moveToMiddle any
function Attachable:onFoldStateChanged(direction, moveToMiddle) end

--- Registers animation value types that let AnimatedVehicle parts drive input joint settings: lower/upper rotation and translation limit scales, rotation offsets and distances to ground. On the server each change updates the attacher vehicle's joint settings.
function Attachable:onRegisterAnimationValueTypes() end

--- Callback for the lower link balls i3d: if it has exactly three ball nodes, links them to the input joint, sets the widest width and visibility, and links the top ball to the top reference node. Otherwise logs a warning. Deletes the loaded node.
---@param i3dNode integer
---@param failedReason table
---@param inputAttacherJoint any
function Attachable:onBottomArmBallsI3DLoaded(i3dNode, failedReason, inputAttacherJoint) end
