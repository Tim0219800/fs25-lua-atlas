---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Foldable.lua (generated stub, FS25 Lua Atlas)

--- Specialization for vehicles and tools with a folding movement defined by one or more animated folding parts (animation clip or AnimatedVehicle animation), optionally with a middle position used for lowering. It tracks foldAnimTime (0 to 1), syncs the direction over the network with FoldableSetFoldDirectionEvent, and overrides many functions of other specializations so work areas, moving tools, spray types, attacher joints and more are enabled only within XML-defined fold limits. It also handles input actions, AI behaviour, the action controller and savegame persistence. No prerequisites on other specializations.
---@class Foldable
Foldable = {}

--- Always returns true: the specialization has no prerequisites on other specializations.
---@param specializations any
function Foldable.prerequisitesPresent(specializations) end

--- Registers the "folding" vehicle configuration type and declares many XML paths: the foldingConfigurations schema plus the fold limit attributes added to work areas, moving tools, wheels, fill units, sprayers, attacher joints and others. Also registers the two savegame keys foldAnimTime and isAllowed.
function Foldable.initSpecialization() end

--- Registers the XML attributes of one folding configuration under the given base path: texts, start state, fold limits for each action, behaviour flags and the foldingPart children (animation, joint, delayed lowering). Shared so other schemas can reuse it.
---@param schema any
---@param basePath any
function Foldable.registerFoldingXMLPaths(schema, basePath) end

--- Registers the vehicle events onFoldStateChanged (direction, moveToMiddle) and onFoldTimeChanged (animation time), raised by this specialization.
---@param vehicleType any
function Foldable.registerEvents(vehicleType) end

--- Registers the public folding API on the vehicle type: setFoldState, setFoldDirection, setFoldMiddleState, getIsUnfolded, getFoldAnimTime, the fold-allowed checks and the toggled-direction helpers.
---@param vehicleType any
function Foldable.registerFunctions(vehicleType) end

--- Registers overrides of functions from many other specializations (work areas, moving tools, spray types, attacher joints, fill units, lowering, AI checks, crab steering and more) so they respect the current fold state.
---@param vehicleType any
function Foldable.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the specialization to load, stream, update, input registration, attach/detach, lowering and root vehicle change events of the vehicle.
---@param vehicleType any
function Foldable.registerEventListeners(vehicleType) end

--- Reads the active folding configuration: texts, start animation time, input actions, all fold limits and behaviour flags, then loads each foldingPart. Restores foldAnimTime and isAllowed from the savegame, or applies the foldableInvertFoldState / foldableFoldingTime loading parameters.
---@param savegame any
function Foldable:onLoad(savegame) end

--- Applies the loaded animation time to the model. If there are no folding parts or the parent's fold state is used, it removes the stream, update and input listeners to save work.
---@param savegame any
function Foldable:onPostLoad(savegame) end

--- If control during folding is forbidden, registers getIsVehicleControlAllowed as a player-control check on the vehicle when that registration function exists.
function Foldable:onRegistered() end

--- Writes foldAnimTime and isAllowed into the savegame entry, only when the vehicle has folding parts.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Foldable:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client join: reads direction (2 bits), moveToMiddle and animation time from the stream, applies the animation time without moving components and then calls setFoldState without sending an event.
---@param streamId any
---@param connection any
function Foldable:onReadStream(streamId, connection) end

--- Writes the current fold direction (2 bits), the moveToMiddle flag and the fold animation time for a joining client; counterpart of onReadStream.
---@param streamId any
---@param connection any
function Foldable:onWriteStream(streamId, connection) end

--- While a fold direction is active, reads the progress of all folding part animations, updates foldAnimTime (raising onFoldTimeChanged), stops at the end or middle target, realigns component joints on the server and syncs sub-vehicles. Also drives distance-delayed lowering of parts and brakes when control is blocked while folding.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Foldable:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client: refreshes the fold and fold-middle action event texts. Server: when ignoreFoldMiddleWhileFolded is set and the tool reaches the middle position, folds it back if the attacher joint is lowered so both states stay consistent.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Foldable:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Loads one foldingPart: speed scale, optional component joint, and an animation either from an animation clip on a root node or by AnimatedVehicle animationName, plus optional distance-delay settings. Returns false (with an XML warning) if invalid.
---@param xmlFile table
---@param baseKey string
---@param foldingPart table
---@return boolean
function Foldable:loadFoldingPartFromXML(xmlFile, baseKey, foldingPart) end

--- Starts folding in the given direction (-1, 0 or 1) without targeting the middle position; shortcut to setFoldState with moveToMiddle false.
---@param direction any
---@param noEventSend any
function Foldable:setFoldDirection(direction, noEventSend) end

--- Sets the fold direction and whether to stop at the middle time, sends FoldableSetFoldDirectionEvent unless noEventSend is true, starts or stops each part's animation (or delays it by distance), and raises onFoldStateChanged. Nudges foldAnimTime by 0.0001 so fold limits can trigger.
---@param direction any
---@param moveToMiddle any
---@param noEventSend any
function Foldable:setFoldState(direction, moveToMiddle, noEventSend) end

--- Raises or lowers the tool through the fold middle position when one is defined and allowed: lowering unfolds back toward the AI raise direction opposite, raising moves to the middle. Does nothing without foldMiddleAnimTime.
---@param doLowering any
function Foldable:setFoldMiddleState(doLowering) end

--- Returns true if the tool is in its working (unfolded) state, judged by turnOnFoldDirection and the end or middle animation time; always true when there are no folding parts.
function Foldable:getIsUnfolded() end

--- Returns the fold animation time (0 to 1), preferring the value loaded from the savegame while it is still pending.
function Foldable:getFoldAnimTime() end

--- Enables or disables the folding action, for example from a script that needs to block player folding.
---@param isAllowed boolean
function Foldable:setIsFoldActionAllowed(isAllowed) end

--- Returns whether the fold action is currently allowed (the isAllowed flag).
---@return boolean
function Foldable:getIsFoldActionAllowed() end

--- Returns allowed plus an optional warning (always nil here). Not allowed if the flag is off, if the active input attacher joint's fold limits are violated, or if a fold in progress is outside the toggle limits. The parameters direction and onAiTurnOn are not used in this body.
---@param direction integer
---@param onAiTurnOn boolean
---@return boolean
---@return string
function Foldable:getIsFoldAllowed(direction, onAiTurnOn) end

--- Returns true if folding is allowed and a middle fold animation time is defined.
function Foldable:getIsFoldMiddleAllowed() end

--- Computes the direction a fold button press would take: the reverse of the current movement, or toward the nearer end when idle, with special handling of the middle position and the lowered range.
function Foldable:getToggledFoldDirection() end

--- Computes the direction a lowering button press would take for the fold middle state; returns 0 if no middle time is defined.
function Foldable:getToggledFoldMiddleDirection() end

--- Control check registered when allowControlWhileFolding is false: returns false while a fold movement is in progress, true otherwise.
---@param self any
function Foldable.getIsVehicleControlAllowed(self) end

--- Override that forbids loading saved moving tool states while the fold time is outside the configured limits; otherwise defers to the parent.
---@param superFunc any
function Foldable:allowLoadMovingToolStates(superFunc) end

--- Override that, after the parent succeeds, reads foldLimitedOuterRange and foldMinLimit/foldMaxLimit of a speed rotating part (defaults 0 and 1, or 0.5 and 0.5 when outer range is used).
---@param superFunc any
---@param speedRotatingPart any
---@param xmlFile any
---@param key any
function Foldable:loadSpeedRotatingPartFromXML(superFunc, speedRotatingPart, xmlFile, key) end

--- Override returning false when the fold animation time is outside the stored limits of a speed rotating part; otherwise defers to the parent. Supports the inverted outer-range mode.
---@param superFunc any
---@param speedRotatingPart any
function Foldable:getIsSpeedRotatingPartActive(superFunc, speedRotatingPart) end

--- Override that reads foldAngleScale and invertFoldAngleScale from a slope compensation node before calling the parent.
---@param superFunc any
---@param compensationNode any
---@param xmlFile any
---@param key any
function Foldable:loadSlopeCompensationNodeFromXML(superFunc, compensationNode, xmlFile, key) end

--- Override that scales the parent's slope compensation angle by an interpolation between foldAngleScale and 1 depending on the fold time, taking the middle time into account.
---@param superFunc any
---@param compensationNode any
function Foldable:getSlopeCompensationAngleScale(superFunc, compensationNode) end

--- Override that reads versatileFoldMinLimit and versatileFoldMaxLimit of a wheel (defaults 0 and 1) before the parent call.
---@param superFunc any
---@param wheel any
function Foldable:loadWheelFromXML(superFunc, wheel) end

--- Override returning false when the fold time is outside the wheel's versatile fold limits; otherwise defers to the parent.
---@param superFunc any
---@param wheel any
function Foldable:getIsVersatileYRotActive(superFunc, wheel) end

--- Override that reads foldLimitedOuterRange and the folding#minLimit / folding#maxLimit of a work area (with a deprecation check of the old attribute names) before calling the parent.
---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function Foldable:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Override returning false when the fold animation time is outside the stored limits of a work area; otherwise defers to the parent. This is how a folded implement stops working with its outer sections.
---@param superFunc any
---@param workArea any
function Foldable:getIsWorkAreaActive(superFunc, workArea) end

--- Override that, when the parent loads the ground reference node, also reads its folding#minLimit and folding#maxLimit.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param groundReferenceNode any
function Foldable:loadGroundReferenceNode(superFunc, xmlFile, key, groundReferenceNode) end

--- Override that runs the parent update then forces isActive to false on the ground reference node when the fold time is outside its limits.
---@param superFunc any
---@param groundReferenceNode any
function Foldable:updateGroundReferenceNode(superFunc, groundReferenceNode) end

--- Override that calls the parent loader for a leveler node (also reads foldLimitedOuterRange), then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active).
---@param superFunc any
---@param levelerNode any
---@param xmlFile any
---@param key any
function Foldable:loadLevelerNodeFromXML(superFunc, levelerNode, xmlFile, key) end

--- Override returning false when the fold animation time is outside the stored limits of a leveler node; otherwise defers to the parent.
---@param superFunc any
---@param levelerNode any
function Foldable:getIsLevelerPickupNodeActive(superFunc, levelerNode) end

--- Override that, after the parent succeeds, reads the fold limits of a moving tool and checks foldingConfigurationIndex / foldingConfigurationIndices against the vehicle's folding configuration, storing hasRequiredFoldingConfiguration.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function Foldable:loadMovingToolFromXML(superFunc, xmlFile, key, entry) end

--- Override returning false if the moving tool needs another folding configuration or the fold time is outside its limits; otherwise defers to the parent.
---@param superFunc any
---@param movingTool any
function Foldable:getIsMovingToolActive(superFunc, movingTool) end

--- Override that calls the parent loader for a moving part, then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active).
---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function Foldable:loadMovingPartFromXML(superFunc, xmlFile, key, entry) end

--- Override returning false if the moving part has non-default fold limits and the fold time is outside them; otherwise defers to the parent.
---@param superFunc any
---@param movingPart any
function Foldable:getIsMovingPartActive(superFunc, movingPart) end

--- Override that blocks turning the implement on when the fold time is outside the turn-on limits.
---@param superFunc any
function Foldable:getCanBeTurnedOn(superFunc) end

--- Override that, after the parent allows it, also requires the fold time to be inside the cover toggle limits.
---@param superFunc any
---@param nextState any
function Foldable:getIsNextCoverStateAllowed(superFunc, nextState) end

--- Override returning the unfold warning text when the cover toggle is blocked by the fold time; otherwise defers to the parent warning.
---@param superFunc any
---@param nextState any
function Foldable:getIsNextCoverStateAllowedWarning(superFunc, nextState) end

--- Override returning false unless the tool is fully in its working fold end (or has no folding parts); otherwise defers to the parent.
---@param superFunc any
function Foldable:getIsInWorkPosition(superFunc) end

--- Override returning the unfold warning when the fold time prevents turning on; otherwise defers to the parent.
---@param superFunc any
function Foldable:getTurnedOnNotAllowedWarning(superFunc) end

--- Override returning false plus a warning if the fold time is outside the detach limits, or if the tool is mid-fold and detaching while folding is not allowed. Otherwise defers to the parent.
---@param superFunc any
---@return boolean
---@return string
function Foldable:isDetachAllowed(superFunc) end

--- Override returning false plus the unfold warning when the fold time is outside the attaching limits; otherwise defers to the parent.
---@param superFunc integer
---@param farmId integer
---@param attacherVehicle table
---@return boolean
---@return string
function Foldable:isAttachAllowed(superFunc, farmId, attacherVehicle) end

--- Override returning false plus the unfold warning when the fold time is outside the lowering limits; otherwise defers to the parent.
---@param superFunc any
---@return boolean
---@return string
function Foldable:getAllowsLowering(superFunc) end

--- Override that, when a fold middle position exists, derives the lowered state from the fold animation and direction (taking ignoreFoldMiddleWhileFolded into account); otherwise defers to the parent.
---@param superFunc any
---@param default any
function Foldable:getIsLowered(superFunc, default) end

--- Override that, for tools with a fold middle position, registers the fold-middle input as the lowering action (powered or not). Returns early if that input equals the requested one. Note: the final parent call does not forward ignoreCollisions.
---@param superFunc any
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
function Foldable:registerLoweringActionEvent(superFunc, actionEventsTable, inputAction, target, callback, triggerUp, triggerDown, triggerAlways, startActive, callbackState, customIconName, ignoreCollisions) end

--- Override that forwards to the registerLoweringActionEvent override with the same arguments.
---@param superFunc any
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
function Foldable:registerSelfLoweringActionEvent(superFunc, actionEventsTable, inputAction, target, callback, triggerUp, triggerDown, triggerAlways, startActive, callbackState, customIconName, ignoreCollisions) end

--- Override that, once the parent succeeds, reads foldable#minLimit and foldable#maxLimit of a ground adjusted node (with a deprecation check of the old attributes).
---@param superFunc any
---@param xmlFile any
---@param key any
---@param adjustedNode any
function Foldable:loadGroundAdjustedNodeFromXML(superFunc, xmlFile, key, adjustedNode) end

--- Override returning false when the fold animation time is outside the stored limits of a ground adjusted node; otherwise defers to the parent.
---@param superFunc any
---@param adjustedNode any
---@param ignoreAttachState any
function Foldable:getIsGroundAdjustedNodeActive(superFunc, adjustedNode, ignoreAttachState) end

--- Override that reads optional fold limits and the required folding configuration indices of a spray type, storing hasRequiredFoldingConfiguration, then defers to the parent.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param sprayType any
function Foldable:loadSprayTypeFromXML(superFunc, xmlFile, key, sprayType) end

--- Override returning false if the spray type has fold limits that the current time violates, or if it needs another folding configuration; otherwise defers to the parent.
---@param superFunc any
---@param sprayType any
function Foldable:getIsSprayTypeActive(superFunc, sprayType) end

--- Override that always returns true, without calling the parent: a foldable vehicle can always be selected.
---@param superFunc any
function Foldable:getCanBeSelected(superFunc) end

--- Override that reads optional foldMinLimit and foldMaxLimit of an input attacher joint (nil if absent) before the parent call.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param inputAttacherJoint any
---@param index any
function Foldable:loadInputAttacherJoint(superFunc, xmlFile, key, inputAttacherJoint, index) end

--- Override returning false when the joint has fold limits and the fold time is outside them, so the joint cannot be used to attach; otherwise defers to the parent.
---@param superFunc table
---@param inputAttacherJoint table
---@return boolean
function Foldable:getIsInputAttacherActive(superFunc, inputAttacherJoint) end

--- Override that reads foldMinLimit and foldMaxLimit from vehicle.enterable.additionalCharacter and stores them in the Enterable spec before the parent call.
---@param superFunc any
---@param xmlFile any
function Foldable:loadAdditionalCharacterFromXML(superFunc, xmlFile) end

--- Override returning true when the fold time lies inside the additional character's limits; otherwise defers to the parent.
---@param superFunc any
function Foldable:getIsAdditionalCharacterActive(superFunc) end

--- Override returning false when the fold time is outside the dynamic mount limits; otherwise defers to the parent.
---@param superFunc any
function Foldable:getAllowDynamicMountObjects(superFunc) end

--- Override that reads folding#minLimit and folding#maxLimit of a support animation (with a deprecation check) before the parent call.
---@param superFunc table
---@param supportAnimation integer
---@param xmlFile integer
---@param key string
function Foldable:loadSupportAnimationFromXML(superFunc, supportAnimation, xmlFile, key) end

--- Override returning false when the fold animation time is outside the stored limits of a support animation; otherwise defers to the parent.
---@param superFunc any
---@param supportAnimation any
function Foldable:getIsSupportAnimationAllowed(superFunc, supportAnimation) end

--- Override that reads folding#minLimit and folding#maxLimit of the steering axle into the passed spec (deprecation check included) before the parent call.
---@param superFunc any
---@param spec any
---@param xmlFile any
---@param key any
function Foldable:loadSteeringAxleFromXML(superFunc, spec, xmlFile, key) end

--- Override returning false when the fold time is outside the Attachable steering axle fold limits; otherwise defers to the parent.
---@param superFunc any
function Foldable:getIsSteeringAxleAllowed(superFunc) end

--- Override that calls the parent loader for a fill unit, then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active).
---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
---@param index any
function Foldable:loadFillUnitFromXML(superFunc, xmlFile, key, entry, index) end

--- Override that rejects any defined tool type on a fill unit whose fold limits are violated by the current fold time; ToolType.UNDEFINED is always passed to the parent.
---@param superFunc any
---@param fillUnitIndex any
---@param toolType any
function Foldable:getFillUnitSupportsToolType(superFunc, fillUnitIndex, toolType) end

--- Override that calls the parent loader for a turned-on animation, then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active).
---@param superFunc any
---@param xmlFile any
---@param key any
---@param turnedOnAnimation any
function Foldable:loadTurnedOnAnimationFromXML(superFunc, xmlFile, key, turnedOnAnimation) end

--- Override returning false when the fold animation time is outside the stored limits of a turned-on animation; otherwise defers to the parent.
---@param superFunc any
---@param turnedOnAnimation any
function Foldable:getIsTurnedOnAnimationActive(superFunc, turnedOnAnimation) end

--- Override that calls the parent loader for an attacher joint height node, then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active).
---@param superFunc any
---@param xmlFile any
---@param key any
---@param heightNode any
---@param attacherJointNode any
function Foldable:loadAttacherJointHeightNode(superFunc, xmlFile, key, heightNode, attacherJointNode) end

--- Override returning false when the fold animation time is outside the stored limits of an attacher joint height node; otherwise defers to the parent.
---@param superFunc any
---@param heightNode any
function Foldable:getIsAttacherJointHeightNodeActive(superFunc, heightNode) end

--- Override that calls the parent loader for a pickup, then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active).
---@param superFunc any
---@param xmlFile any
---@param key any
---@param spec any
function Foldable:loadPickupFromXML(superFunc, xmlFile, key, spec) end

--- Override returning false when the fold time is outside the pickup's fold limits, so it cannot be raised or lowered; otherwise defers to the parent.
---@param superFunc any
---@param spec any
---@param newState any
function Foldable:getCanChangePickupState(superFunc, spec, newState) end

--- Override that calls the parent loader for a cutter automatic tilt (returns false if the parent fails), then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active).
---@param superFunc table
---@param xmlFile table
---@param key string
---@param target any
---@return boolean
function Foldable:loadCutterTiltFromXML(superFunc, xmlFile, key, target) end

--- Override that returns the parent's active flag, but when active and the fold time is outside the tilt's limits returns false with doReset true so the header tilt returns to its initial position.
---@param superFunc any
---@param automaticTilt any
---@return boolean
---@return boolean
function Foldable:getCutterTiltIsActive(superFunc, automaticTilt) end

--- Override that calls the parent loader for a vine pre-pruner node, then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active).
---@param superFunc any
---@param xmlFile any
---@param key any
---@param prunerNode any
function Foldable:loadPreprunerNodeFromXML(superFunc, xmlFile, key, prunerNode) end

--- Override returning false when the fold animation time is outside the stored limits of a pre-pruner node; otherwise defers to the parent.
---@param superFunc any
---@param prunerNode any
function Foldable:getIsPreprunerNodeActive(superFunc, prunerNode) end

--- Override that calls the parent loader for a shovel node (always returns true), then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active).
---@param superFunc any
---@param xmlFile any
---@param key any
---@param shovelNode any
function Foldable:loadShovelNode(superFunc, xmlFile, key, shovelNode) end

--- Override returning false when the fold animation time is outside the stored limits of a shovel node; otherwise defers to the parent.
---@param superFunc any
---@param shovelNode any
function Foldable:getShovelNodeIsActive(superFunc, shovelNode) end

--- Override that calls the parent loader for a steering angle node, then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active).
---@param superFunc any
---@param entry any
---@param xmlFile any
---@param key any
function Foldable:loadSteeringAngleNodeFromXML(superFunc, entry, xmlFile, key) end

--- Override that skips the update entirely when the fold time is outside the node's limits; otherwise calls the parent.
---@param superFunc any
---@param steeringAngleNode any
---@param angle any
---@param dt any
function Foldable:updateSteeringAngleNode(superFunc, steeringAngleNode, angle, dt) end

--- Override that calls the parent loader for a wood harvester header tilt, then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active).
---@param superFunc any
---@param headerTilt any
---@param xmlFile any
---@param key any
function Foldable:loadWoodHarvesterHeaderTiltFromXML(superFunc, headerTilt, xmlFile, key) end

--- Override returning false when the fold time is outside the header tilt's limits; otherwise defers to the parent.
---@param superFunc any
---@param headerTilt any
function Foldable:getIsWoodHarvesterTiltStateAllowed(superFunc, headerTilt) end

--- Override that calls the parent loader for a suspension node, then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active).
---@param superFunc any
---@param xmlFile any
---@param key any
---@param suspensionNode any
function Foldable:loadSuspensionNodeFromXML(superFunc, xmlFile, key, suspensionNode) end

--- Override returning false when the fold animation time is outside the stored limits of a suspension node; otherwise defers to the parent.
---@param superFunc any
---@param suspensionNode any
function Foldable:getIsSuspensionNodeActive(superFunc, suspensionNode) end

--- Override that, after the parent succeeds, reads folding#minLimit and folding#maxLimit of a crab steering mode.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param mode any
function Foldable:loadCrabSteeringModeFromXML(superFunc, xmlFile, key, mode) end

--- Override returning false when the fold time is outside the crab steering mode's limits; otherwise defers to the parent.
---@param superFunc any
---@param mode any
function Foldable:getCrabSteeringModeAvailable(superFunc, mode) end

--- Override returning false plus the unfold warning when the fold time is outside the crab steering limits; otherwise defers to the parent.
---@param superFunc any
function Foldable:getCanToggleCrabSteering(superFunc) end

--- Override that calls the parent (without extra arguments) and reads foldMinLimit and foldMaxLimit of a wheel chock. Does not return the parent result.
---@param superFunc any
---@param wheelChock any
---@param xmlObject any
---@param key any
function Foldable:onLoadWheelChockFromXML(superFunc, wheelChock, xmlObject, key) end

--- Override returning false when the fold time is outside the wheel chock's limits; otherwise defers to the parent.
---@param superFunc any
---@param wheelChock any
function Foldable:getIsWheelChockAllowed(superFunc, wheelChock) end

--- Override that, after the parent succeeds, reads foldable#minLimit and foldable#maxLimit of a crane shovel.
---@param superFunc any
---@param spec any
---@param xmlFile any
---@param key any
function Foldable:loadCraneShovelFromXML(superFunc, spec, xmlFile, key) end

--- Override returning false plus the unfold warning when the fold time is outside the crane shovel's limits; otherwise defers to the parent.
---@param superFunc any
---@param spec any
function Foldable:getCraneShovelStateChangedAllowed(superFunc, spec) end

--- Override returning 0 while folding if releaseBrakesWhileFolding is set; otherwise defers to the parent.
---@param superFunc any
function Foldable:getBrakeForce(superFunc) end

--- Override returning true while a fold movement is in progress, otherwise the parent value.
---@param superFunc any
function Foldable:getRequiresPower(superFunc) end

--- Client: registers the fold input action (powered or not, depending on requiresPower) and the hidden fold-all action, unless the middle position is the only movement. Only when the vehicle is active for input.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Foldable:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Registers an external action event (trigger based) for the trigger named "folding", when the vehicle has folding parts.
---@param trigger any
---@param name any
---@param xmlFile any
---@param key any
function Foldable:onRegisterExternalActionEvents(trigger, name, xmlFile, key) end

--- Override that stops the AI from continuing when the tool is mid-fold (except while lifting toward the middle), if AI unfolding is allowed. Returns the parent's three values otherwise.
---@param superFunc any
---@param isTurning any
function Foldable:getCanAIImplementContinueWork(superFunc, isTurning) end

--- Override returning false if AI unfolding is allowed and the tool is not fully in its folded transport end; otherwise defers to the parent.
---@param superFunc any
function Foldable:getIsAIReadyToDrive(superFunc) end

--- Override returning true while the tool is at an intermediate fold position (neither end nor middle) with AI unfolding allowed; otherwise defers to the parent.
---@param superFunc any
function Foldable:getIsAIPreparingToDrive(superFunc) end

--- Stops the folding movement (direction 0, no event) when the vehicle is deactivated, unless keepFoldingWhileDetached, lowerWhileDetach or foldWhileDetach is set.
function Foldable:onDeactivate() end

--- Handler for the all-lowered event: calls setFoldMiddleState with the lowering flag.
---@param doLowering any
---@param jointDescIndex any
function Foldable:onSetLoweredAll(doLowering, jointDescIndex) end

--- With lowerWhileDetach, when attached to a raised joint and fully folded, moves the tool to the middle position (local only, no event).
---@param attacherVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
function Foldable:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

--- Registers or updates the fold, lowering and AI-start actions in the root vehicle's action controller, including AI event listeners and finished checks; removes them when there is no controller. Uses Platform.gameplay.foldAfterAIFinished.
---@param rootVehicle table
function Foldable:onRootVehicleChanged(rootVehicle) end

--- Action controller callback for folding: converts the direction using turnOnFoldDirection and calls setFoldState if the fold is allowed. Returns true when handled, false when blocked.
---@param direction any
function Foldable:actionControllerFoldEvent(direction) end

--- Action controller callback to lower or raise via the fold middle state, moving to the middle position from either side. Returns true if a middle position is allowed.
---@param direction any
function Foldable:actionControllerLowerEvent(direction) end

--- Action controller callback used when the AI starts working: moves the tool to the middle position unless it is already past it. Always returns true.
---@param direction any
function Foldable:actionControllerLowerEventAIStart(direction) end

--- Before detaching, with lowerWhileDetach and the tool at the middle position it unfolds away, or with foldWhileDetach it folds the tool; both local only (no event).
---@param attacherVehicle table
---@param implement table
function Foldable:onPreDetach(attacherVehicle, implement) end

--- When an implement using the parent's folding state is attached, tracks it in subFoldingStateVehicles and copies the current fold time to it.
---@param object table
---@param inputJointDescIndex table
---@param jointDescIndex any
---@param loadFromSavegame any
function Foldable:onPreAttachImplement(object, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

--- Removes a detaching implement that used the parent fold state from subFoldingStateVehicles.
---@param implement table
function Foldable:onPreDetachImplement(implement) end

--- Stops any folding movement (direction 0, no event) when the vehicle gets dynamically mounted on something.
---@param dynamicMountType any
---@param mountObject any
function Foldable:onDynamicMountTypeChanged(dynamicMountType, mountObject) end

--- Sets foldAnimTime directly: positions every folding part animation, updates the Cylindered initial state, and on the server (if placeComponents) re-places the component joints. Propagates to sub-vehicles and raises onFoldTimeChanged.
---@param self any
---@param animTime any
---@param placeComponents any
---@param playSounds any
function Foldable.setAnimTime(self, animTime, placeComponents, playSounds) end

--- Updates the fold action text (fold or unfold, from the toggled direction) and its active state from getIsFoldActionAllowed.
---@param self any
function Foldable.updateActionEventFold(self) end

--- Updates the lowering action text (lift or lower) and active state from getIsFoldMiddleAllowed, honouring ignoreFoldMiddleWhileFolded.
---@param self any
function Foldable.updateActionEventFoldMiddle(self) end

--- Input callback for folding: toggles the fold direction if allowed (targeting the middle when it matches turnOnFoldDirection) and syncs the attacher joint lowering state. Otherwise shows a blinking warning for 2000 ms.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Foldable.actionEventFold(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback for the lowering key: toggles the fold middle state and aligns the attacher joint move-down state, or delegates to the attacher vehicle's lower implement handler when the middle state is ignored.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Foldable.actionEventFoldMiddle(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback that folds or unfolds this tool and every foldable vehicle in the same root vehicle that moves in a matching sense, with a blinking warning if none could move. Note: child vehicles are checked with the direction computed for this vehicle, not their own toggled one.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Foldable.actionEventFoldAll(self, actionName, inputValue, callbackState, isAnalog) end

--- Registers the external (trigger) fold action; on press it tries to start the motor, then folds if the vehicle is powered or needs no power, otherwise shows the power warning.
---@param data any
---@param vehicle any
function Foldable.externalActionEventRegister(data, vehicle) end

--- Updates the text of the external fold action to the fold or unfold label matching the toggled direction.
---@param data any
---@param vehicle any
function Foldable.externalActionEventUpdate(data, vehicle) end
