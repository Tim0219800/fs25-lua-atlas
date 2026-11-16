# vehicles/specializations/Foldable.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Foldable.md)*

Source: `dataS/scripts/vehicles/specializations/Foldable.lua` — FS25 1.25.1.0

✍ Specialization for vehicles and tools with a folding movement defined by one or more animated folding parts (animation clip or AnimatedVehicle animation), optionally with a middle position used for lowering. It tracks foldAnimTime (0 to 1), syncs the direction over the network with FoldableSetFoldDirectionEvent, and overrides many functions of other specializations so work areas, moving tools, spray types, attacher joints and more are enabled only within XML-defined fold limits. It also handles input actions, AI behaviour, the action controller and savegame persistence. No prerequisites on other specializations.

- **Foldable** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `Foldable.prerequisitesPresent(specializations: any)` | 17 | ✍ Always returns true: the specialization has no prerequisites on other specializations. |
| `Foldable.initSpecialization()` | 23 | ✍ Registers the "folding" vehicle configuration type and declares many XML paths: the foldingConfigurations schema plus the fold limit attributes added to work areas, moving tools, wheels, fill units, sprayers, attacher joints and others. Also registers the two savegame keys foldAnimTime and isAllowed. |
| `Foldable.registerFoldingXMLPaths(schema: any, basePath: any)` | 157 | ✍ Registers the XML attributes of one folding configuration under the given base path: texts, start state, fold limits for each action, behaviour flags and the foldingPart children (animation, joint, delayed lowering). Shared so other schemas can reuse it. |
| `Foldable.registerEvents(vehicleType: any)` | 227 | ✍ Registers the vehicle events onFoldStateChanged (direction, moveToMiddle) and onFoldTimeChanged (animation time), raised by this specialization. |
| `Foldable.registerFunctions(vehicleType: any)` | 234 | ✍ Registers the public folding API on the vehicle type: setFoldState, setFoldDirection, setFoldMiddleState, getIsUnfolded, getFoldAnimTime, the fold-allowed checks and the toggled-direction helpers. |
| `Foldable.registerOverwrittenFunctions(vehicleType: any)` | 251 | ✍ Registers overrides of functions from many other specializations (work areas, moving tools, spray types, attacher joints, fill units, lowering, AI checks, crab steering and more) so they respect the current fold state. |
| `Foldable.registerEventListeners(vehicleType: any)` | 330 | ✍ Subscribes the specialization to load, stream, update, input registration, attach/detach, lowering and root vehicle change events of the vehicle. |
| `Foldable:onLoad(savegame: any)` | 352 | ✍ Reads the active folding configuration: texts, start animation time, input actions, all fold limits and behaviour flags, then loads each foldingPart. Restores foldAnimTime and isAllowed from the savegame, or applies the foldableInvertFoldState / foldableFoldingTime loading parameters. |
| `Foldable:onPostLoad(savegame: any)` | 488 | ✍ Applies the loaded animation time to the model. If there are no folding parts or the parent's fold state is used, it removes the stream, update and input listeners to save work. |
| `Foldable:onRegistered()` | 509 | ✍ If control during folding is forbidden, registers getIsVehicleControlAllowed as a player-control check on the vehicle when that registration function exists. |
| `Foldable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 520 | ✍ Writes foldAnimTime and isAllowed into the savegame entry, only when the vehicle has folding parts. |
| `Foldable:onReadStream(streamId: any, connection: any)` | 530 | ✍ Client join: reads direction (2 bits), moveToMiddle and animation time from the stream, applies the animation time without moving components and then calls setFoldState without sending an event. |
| `Foldable:onWriteStream(streamId: any, connection: any)` | 540 | ✍ Writes the current fold direction (2 bits), the moveToMiddle flag and the fold animation time for a joining client; counterpart of onReadStream. |
| `Foldable:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 551 | ✍ While a fold direction is active, reads the progress of all folding part animations, updates foldAnimTime (raising onFoldTimeChanged), stops at the end or middle target, realigns component joints on the server and syncs sub-vehicles. Also drives distance-delayed lowering of parts and brakes when control is blocked while folding. |
| `Foldable:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 675 | ✍ Client: refreshes the fold and fold-middle action event texts. Server: when ignoreFoldMiddleWhileFolded is set and the tool reaches the middle position, folds it back if the attacher joint is lowered so both states stay consistent. |
| `Foldable:loadFoldingPartFromXML(xmlFile: table, baseKey: string, foldingPart: table) → boolean` | 710 | ✍ Loads one foldingPart: speed scale, optional component joint, and an animation either from an animation clip on a root node or by AnimatedVehicle animationName, plus optional distance-delay settings. Returns false (with an XML warning) if invalid. |
| `Foldable:setFoldDirection(direction: any, noEventSend: any)` | 810 | ✍ Starts folding in the given direction (-1, 0 or 1) without targeting the middle position; shortcut to setFoldState with moveToMiddle false. |
| `Foldable:setFoldState(direction: any, moveToMiddle: any, noEventSend: any)` | 816 | ✍ Sets the fold direction and whether to stop at the middle time, sends FoldableSetFoldDirectionEvent unless noEventSend is true, starts or stops each part's animation (or delays it by distance), and raises onFoldStateChanged. Nudges foldAnimTime by 0.0001 so fold limits can trigger. |
| `Foldable:setFoldMiddleState(doLowering: any)` | 921 | ✍ Raises or lowers the tool through the fold middle position when one is defined and allowed: lowering unfolds back toward the AI raise direction opposite, raising moves to the middle. Does nothing without foldMiddleAnimTime. |
| `Foldable:getIsUnfolded()` | 936 | ✍ Returns true if the tool is in its working (unfolded) state, judged by turnOnFoldDirection and the end or middle animation time; always true when there are no folding parts. |
| `Foldable:getFoldAnimTime()` | 962 | ✍ Returns the fold animation time (0 to 1), preferring the value loaded from the savegame while it is still pending. |
| `Foldable:setIsFoldActionAllowed(isAllowed: boolean)` | 970 | ✍ Enables or disables the folding action, for example from a script that needs to block player folding. |
| `Foldable:getIsFoldActionAllowed() → boolean` | 977 | ✍ Returns whether the fold action is currently allowed (the isAllowed flag). |
| `Foldable:getIsFoldAllowed(direction: integer, onAiTurnOn: boolean) → boolean, string` | 987 | ✍ Returns allowed plus an optional warning (always nil here). Not allowed if the flag is off, if the active input attacher joint's fold limits are violated, or if a fold in progress is outside the toggle limits. The parameters direction and onAiTurnOn are not used in this body. |
| `Foldable:getIsFoldMiddleAllowed()` | 1014 | ✍ Returns true if folding is allowed and a middle fold animation time is defined. |
| `Foldable:getToggledFoldDirection()` | 1026 | ✍ Computes the direction a fold button press would take: the reverse of the current movement, or toward the nearer end when idle, with special handling of the middle position and the lowered range. |
| `Foldable:getToggledFoldMiddleDirection()` | 1071 | ✍ Computes the direction a lowering button press would take for the fold middle state; returns 0 if no middle time is defined. |
| `Foldable.getIsVehicleControlAllowed(self: any)` | 1098 | ✍ Control check registered when allowControlWhileFolding is false: returns false while a fold movement is in progress, true otherwise. |
| `Foldable:allowLoadMovingToolStates(superFunc: any)` | 1109 | ✍ Override that forbids loading saved moving tool states while the fold time is outside the configured limits; otherwise defers to the parent. |
| `Foldable:loadSpeedRotatingPartFromXML(superFunc: any, speedRotatingPart: any, xmlFile: any, key: any)` | 1121 | ✍ Override that, after the parent succeeds, reads foldLimitedOuterRange and foldMinLimit/foldMaxLimit of a speed rotating part (defaults 0 and 1, or 0.5 and 0.5 when outer range is used). |
| `Foldable:getIsSpeedRotatingPartActive(superFunc: any, speedRotatingPart: any)` | 1141 | ✍ Override returning false when the fold animation time is outside the stored limits of a speed rotating part; otherwise defers to the parent. Supports the inverted outer-range mode. |
| `Foldable:loadSlopeCompensationNodeFromXML(superFunc: any, compensationNode: any, xmlFile: any, key: any)` | 1159 | ✍ Override that reads foldAngleScale and invertFoldAngleScale from a slope compensation node before calling the parent. |
| `Foldable:getSlopeCompensationAngleScale(superFunc: any, compensationNode: any)` | 1168 | ✍ Override that scales the parent's slope compensation angle by an interpolation between foldAngleScale and 1 depending on the fold time, taking the middle time into account. |
| `Foldable:loadWheelFromXML(superFunc: any, wheel: any)` | 1190 | ✍ Override that reads versatileFoldMinLimit and versatileFoldMaxLimit of a wheel (defaults 0 and 1) before the parent call. |
| `Foldable:getIsVersatileYRotActive(superFunc: any, wheel: any)` | 1199 | ✍ Override returning false when the fold time is outside the wheel's versatile fold limits; otherwise defers to the parent. |
| `Foldable:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 1211 | ✍ Override that reads foldLimitedOuterRange and the folding#minLimit / folding#maxLimit of a work area (with a deprecation check of the old attribute names) before calling the parent. |
| `Foldable:getIsWorkAreaActive(superFunc: any, workArea: any)` | 1231 | ✍ Override returning false when the fold animation time is outside the stored limits of a work area; otherwise defers to the parent. This is how a folded implement stops working with its outer sections. |
| `Foldable:loadGroundReferenceNode(superFunc: any, xmlFile: any, key: any, groundReferenceNode: any)` | 1249 | ✍ Override that, when the parent loads the ground reference node, also reads its folding#minLimit and folding#maxLimit. |
| `Foldable:updateGroundReferenceNode(superFunc: any, groundReferenceNode: any)` | 1262 | ✍ Override that runs the parent update then forces isActive to false on the ground reference node when the fold time is outside its limits. |
| `Foldable:loadLevelerNodeFromXML(superFunc: any, levelerNode: any, xmlFile: any, key: any)` | 1273 | ✍ Override that calls the parent loader for a leveler node (also reads foldLimitedOuterRange), then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active). |
| `Foldable:getIsLevelerPickupNodeActive(superFunc: any, levelerNode: any)` | 1289 | ✍ Override returning false when the fold animation time is outside the stored limits of a leveler node; otherwise defers to the parent. |
| `Foldable:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1307 | ✍ Override that, after the parent succeeds, reads the fold limits of a moving tool and checks foldingConfigurationIndex / foldingConfigurationIndices against the vehicle's folding configuration, storing hasRequiredFoldingConfiguration. |
| `Foldable:getIsMovingToolActive(superFunc: any, movingTool: any)` | 1340 | ✍ Override returning false if the moving tool needs another folding configuration or the fold time is outside its limits; otherwise defers to the parent. |
| `Foldable:loadMovingPartFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1355 | ✍ Override that calls the parent loader for a moving part, then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active). |
| `Foldable:getIsMovingPartActive(superFunc: any, movingPart: any)` | 1368 | ✍ Override returning false if the moving part has non-default fold limits and the fold time is outside them; otherwise defers to the parent. |
| `Foldable:getCanBeTurnedOn(superFunc: any)` | 1381 | ✍ Override that blocks turning the implement on when the fold time is outside the turn-on limits. |
| `Foldable:getIsNextCoverStateAllowed(superFunc: any, nextState: any)` | 1392 | ✍ Override that, after the parent allows it, also requires the fold time to be inside the cover toggle limits. |
| `Foldable:getIsNextCoverStateAllowedWarning(superFunc: any, nextState: any)` | 1407 | ✍ Override returning the unfold warning text when the cover toggle is blocked by the fold time; otherwise defers to the parent warning. |
| `Foldable:getIsInWorkPosition(superFunc: any)` | 1418 | ✍ Override returning false unless the tool is fully in its working fold end (or has no folding parts); otherwise defers to the parent. |
| `Foldable:getTurnedOnNotAllowedWarning(superFunc: any)` | 1430 | ✍ Override returning the unfold warning when the fold time prevents turning on; otherwise defers to the parent. |
| `Foldable:isDetachAllowed(superFunc: any) → boolean, string` | 1444 | ✍ Override returning false plus a warning if the fold time is outside the detach limits, or if the tool is mid-fold and detaching while folding is not allowed. Otherwise defers to the parent. |
| `Foldable:isAttachAllowed(superFunc: integer, farmId: integer, attacherVehicle: table) → boolean, string` | 1466 | ✍ Override returning false plus the unfold warning when the fold time is outside the attaching limits; otherwise defers to the parent. |
| `Foldable:getAllowsLowering(superFunc: any) → boolean, string` | 1480 | ✍ Override returning false plus the unfold warning when the fold time is outside the lowering limits; otherwise defers to the parent. |
| `Foldable:getIsLowered(superFunc: any, default: any)` | 1492 | ✍ Override that, when a fold middle position exists, derives the lowered state from the fold animation and direction (taking ignoreFoldMiddleWhileFolded into account); otherwise defers to the parent. |
| `Foldable:registerLoweringActionEvent(superFunc: any, actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any, ignoreCollisions: any)` | 1535 | ✍ Override that, for tools with a fold middle position, registers the fold-middle input as the lowering action (powered or not). Returns early if that input equals the requested one. Note: the final parent call does not forward ignoreCollisions. |
| `Foldable:registerSelfLoweringActionEvent(superFunc: any, actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any, ignoreCollisions: any)` | 1563 | ✍ Override that forwards to the registerLoweringActionEvent override with the same arguments. |
| `Foldable:loadGroundAdjustedNodeFromXML(superFunc: any, xmlFile: any, key: any, adjustedNode: any)` | 1569 | ✍ Override that, once the parent succeeds, reads foldable#minLimit and foldable#maxLimit of a ground adjusted node (with a deprecation check of the old attributes). |
| `Foldable:getIsGroundAdjustedNodeActive(superFunc: any, adjustedNode: any, ignoreAttachState: any)` | 1585 | ✍ Override returning false when the fold animation time is outside the stored limits of a ground adjusted node; otherwise defers to the parent. |
| `Foldable:loadSprayTypeFromXML(superFunc: any, xmlFile: any, key: any, sprayType: any)` | 1598 | ✍ Override that reads optional fold limits and the required folding configuration indices of a spray type, storing hasRequiredFoldingConfiguration, then defers to the parent. |
| `Foldable:getIsSprayTypeActive(superFunc: any, sprayType: any)` | 1627 | ✍ Override returning false if the spray type has fold limits that the current time violates, or if it needs another folding configuration; otherwise defers to the parent. |
| `Foldable:getCanBeSelected(superFunc: any)` | 1646 | ✍ Override that always returns true, without calling the parent: a foldable vehicle can always be selected. |
| `Foldable:loadInputAttacherJoint(superFunc: any, xmlFile: any, key: any, inputAttacherJoint: any, index: any)` | 1652 | ✍ Override that reads optional foldMinLimit and foldMaxLimit of an input attacher joint (nil if absent) before the parent call. |
| `Foldable:getIsInputAttacherActive(superFunc: table, inputAttacherJoint: table) → boolean` | 1663 | ✍ Override returning false when the joint has fold limits and the fold time is outside them, so the joint cannot be used to attach; otherwise defers to the parent. |
| `Foldable:loadAdditionalCharacterFromXML(superFunc: any, xmlFile: any)` | 1676 | ✍ Override that reads foldMinLimit and foldMaxLimit from vehicle.enterable.additionalCharacter and stores them in the Enterable spec before the parent call. |
| `Foldable:getIsAdditionalCharacterActive(superFunc: any)` | 1687 | ✍ Override returning true when the fold time lies inside the additional character's limits; otherwise defers to the parent. |
| `Foldable:getAllowDynamicMountObjects(superFunc: any)` | 1701 | ✍ Override returning false when the fold time is outside the dynamic mount limits; otherwise defers to the parent. |
| `Foldable:loadSupportAnimationFromXML(superFunc: table, supportAnimation: integer, xmlFile: integer, key: string)` | 1716 | ✍ Override that reads folding#minLimit and folding#maxLimit of a support animation (with a deprecation check) before the parent call. |
| `Foldable:getIsSupportAnimationAllowed(superFunc: any, supportAnimation: any)` | 1728 | ✍ Override returning false when the fold animation time is outside the stored limits of a support animation; otherwise defers to the parent. |
| `Foldable:loadSteeringAxleFromXML(superFunc: any, spec: any, xmlFile: any, key: any)` | 1739 | ✍ Override that reads folding#minLimit and folding#maxLimit of the steering axle into the passed spec (deprecation check included) before the parent call. |
| `Foldable:getIsSteeringAxleAllowed(superFunc: any)` | 1751 | ✍ Override returning false when the fold time is outside the Attachable steering axle fold limits; otherwise defers to the parent. |
| `Foldable:loadFillUnitFromXML(superFunc: any, xmlFile: any, key: any, entry: any, index: any)` | 1763 | ✍ Override that calls the parent loader for a fill unit, then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active). |
| `Foldable:getFillUnitSupportsToolType(superFunc: any, fillUnitIndex: any, toolType: any)` | 1772 | ✍ Override that rejects any defined tool type on a fill unit whose fold limits are violated by the current fold time; ToolType.UNDEFINED is always passed to the parent. |
| `Foldable:loadTurnedOnAnimationFromXML(superFunc: any, xmlFile: any, key: any, turnedOnAnimation: any)` | 1791 | ✍ Override that calls the parent loader for a turned-on animation, then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active). |
| `Foldable:getIsTurnedOnAnimationActive(superFunc: any, turnedOnAnimation: any)` | 1801 | ✍ Override returning false when the fold animation time is outside the stored limits of a turned-on animation; otherwise defers to the parent. |
| `Foldable:loadAttacherJointHeightNode(superFunc: any, xmlFile: any, key: any, heightNode: any, attacherJointNode: any)` | 1812 | ✍ Override that calls the parent loader for an attacher joint height node, then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active). |
| `Foldable:getIsAttacherJointHeightNodeActive(superFunc: any, heightNode: any)` | 1821 | ✍ Override returning false when the fold animation time is outside the stored limits of an attacher joint height node; otherwise defers to the parent. |
| `Foldable:loadPickupFromXML(superFunc: any, xmlFile: any, key: any, spec: any)` | 1832 | ✍ Override that calls the parent loader for a pickup, then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active). |
| `Foldable:getCanChangePickupState(superFunc: any, spec: any, newState: any)` | 1841 | ✍ Override returning false when the fold time is outside the pickup's fold limits, so it cannot be raised or lowered; otherwise defers to the parent. |
| `Foldable:loadCutterTiltFromXML(superFunc: table, xmlFile: table, key: string, target: any) → boolean` | 1855 | ✍ Override that calls the parent loader for a cutter automatic tilt (returns false if the parent fails), then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active). |
| `Foldable:getCutterTiltIsActive(superFunc: any, automaticTilt: any) → boolean, boolean` | 1870 | ✍ Override that returns the parent's active flag, but when active and the fold time is outside the tilt's limits returns false with doReset true so the header tilt returns to its initial position. |
| `Foldable:loadPreprunerNodeFromXML(superFunc: any, xmlFile: any, key: any, prunerNode: any)` | 1886 | ✍ Override that calls the parent loader for a vine pre-pruner node, then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active). |
| `Foldable:getIsPreprunerNodeActive(superFunc: any, prunerNode: any)` | 1899 | ✍ Override returning false when the fold animation time is outside the stored limits of a pre-pruner node; otherwise defers to the parent. |
| `Foldable:loadShovelNode(superFunc: any, xmlFile: any, key: any, shovelNode: any)` | 1910 | ✍ Override that calls the parent loader for a shovel node (always returns true), then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active). |
| `Foldable:getShovelNodeIsActive(superFunc: any, shovelNode: any)` | 1921 | ✍ Override returning false when the fold animation time is outside the stored limits of a shovel node; otherwise defers to the parent. |
| `Foldable:loadSteeringAngleNodeFromXML(superFunc: any, entry: any, xmlFile: any, key: any)` | 1933 | ✍ Override that calls the parent loader for a steering angle node, then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active). |
| `Foldable:updateSteeringAngleNode(superFunc: any, steeringAngleNode: any, angle: any, dt: any)` | 1946 | ✍ Override that skips the update entirely when the fold time is outside the node's limits; otherwise calls the parent. |
| `Foldable:loadWoodHarvesterHeaderTiltFromXML(superFunc: any, headerTilt: any, xmlFile: any, key: any)` | 1957 | ✍ Override that calls the parent loader for a wood harvester header tilt, then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active). |
| `Foldable:getIsWoodHarvesterTiltStateAllowed(superFunc: any, headerTilt: any)` | 1970 | ✍ Override returning false when the fold time is outside the header tilt's limits; otherwise defers to the parent. |
| `Foldable:loadSuspensionNodeFromXML(superFunc: any, xmlFile: any, key: any, suspensionNode: any)` | 1981 | ✍ Override that calls the parent loader for a suspension node, then reads foldMinLimit/foldMaxLimit from its XML node and stores them on the entry (defaults 0 and 1, i.e. always active). |
| `Foldable:getIsSuspensionNodeActive(superFunc: any, suspensionNode: any)` | 1994 | ✍ Override returning false when the fold animation time is outside the stored limits of a suspension node; otherwise defers to the parent. |
| `Foldable:loadCrabSteeringModeFromXML(superFunc: any, xmlFile: any, key: any, mode: any)` | 2005 | ✍ Override that, after the parent succeeds, reads folding#minLimit and folding#maxLimit of a crab steering mode. |
| `Foldable:getCrabSteeringModeAvailable(superFunc: any, mode: any)` | 2018 | ✍ Override returning false when the fold time is outside the crab steering mode's limits; otherwise defers to the parent. |
| `Foldable:getCanToggleCrabSteering(superFunc: any)` | 2029 | ✍ Override returning false plus the unfold warning when the fold time is outside the crab steering limits; otherwise defers to the parent. |
| `Foldable:onLoadWheelChockFromXML(superFunc: any, wheelChock: any, xmlObject: any, key: any)` | 2041 | ✍ Override that calls the parent (without extra arguments) and reads foldMinLimit and foldMaxLimit of a wheel chock. Does not return the parent result. |
| `Foldable:getIsWheelChockAllowed(superFunc: any, wheelChock: any)` | 2050 | ✍ Override returning false when the fold time is outside the wheel chock's limits; otherwise defers to the parent. |
| `Foldable:loadCraneShovelFromXML(superFunc: any, spec: any, xmlFile: any, key: any)` | 2061 | ✍ Override that, after the parent succeeds, reads foldable#minLimit and foldable#maxLimit of a crane shovel. |
| `Foldable:getCraneShovelStateChangedAllowed(superFunc: any, spec: any)` | 2074 | ✍ Override returning false plus the unfold warning when the fold time is outside the crane shovel's limits; otherwise defers to the parent. |
| `Foldable:getBrakeForce(superFunc: any)` | 2085 | ✍ Override returning 0 while folding if releaseBrakesWhileFolding is set; otherwise defers to the parent. |
| `Foldable:getRequiresPower(superFunc: any)` | 2098 | ✍ Override returning true while a fold movement is in progress, otherwise the parent value. |
| `Foldable:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 2104 | ✍ Client: registers the fold input action (powered or not, depending on requiresPower) and the hidden fold-all action, unless the middle position is the only movement. Only when the vehicle is active for input. |
| `Foldable:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 2131 | ✍ Registers an external action event (trigger based) for the trigger named "folding", when the vehicle has folding parts. |
| `Foldable:getCanAIImplementContinueWork(superFunc: any, isTurning: any)` | 2142 | ✍ Override that stops the AI from continuing when the tool is mid-fold (except while lifting toward the middle), if AI unfolding is allowed. Returns the parent's three values otherwise. |
| `Foldable:getIsAIReadyToDrive(superFunc: any)` | 2174 | ✍ Override returning false if AI unfolding is allowed and the tool is not fully in its folded transport end; otherwise defers to the parent. |
| `Foldable:getIsAIPreparingToDrive(superFunc: any)` | 2194 | ✍ Override returning true while the tool is at an intermediate fold position (neither end nor middle) with AI unfolding allowed; otherwise defers to the parent. |
| `Foldable:onDeactivate()` | 2208 | ✍ Stops the folding movement (direction 0, no event) when the vehicle is deactivated, unless keepFoldingWhileDetached, lowerWhileDetach or foldWhileDetach is set. |
| `Foldable:onSetLoweredAll(doLowering: any, jointDescIndex: any)` | 2218 | ✍ Handler for the all-lowered event: calls setFoldMiddleState with the lowering flag. |
| `Foldable:onPostAttach(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any)` | 2224 | ✍ With lowerWhileDetach, when attached to a raised joint and fully folded, moves the tool to the middle position (local only, no event). |
| `Foldable:onRootVehicleChanged(rootVehicle: table)` | 2241 | ✍ Registers or updates the fold, lowering and AI-start actions in the root vehicle's action controller, including AI event listeners and finished checks; removes them when there is no controller. Uses Platform.gameplay.foldAfterAIFinished. |
| `Foldable:actionControllerFoldEvent(direction: any)` | 2317 | ✍ Action controller callback for folding: converts the direction using turnOnFoldDirection and calls setFoldState if the fold is allowed. Returns true when handled, false when blocked. |
| `Foldable:actionControllerLowerEvent(direction: any)` | 2348 | ✍ Action controller callback to lower or raise via the fold middle state, moving to the middle position from either side. Returns true if a middle position is allowed. |
| `Foldable:actionControllerLowerEventAIStart(direction: any)` | 2381 | ✍ Action controller callback used when the AI starts working: moves the tool to the middle position unless it is already past it. Always returns true. |
| `Foldable:onPreDetach(attacherVehicle: table, implement: table)` | 2414 | ✍ Before detaching, with lowerWhileDetach and the tool at the middle position it unfolds away, or with foldWhileDetach it folds the tool; both local only (no event). |
| `Foldable:onPreAttachImplement(object: table, inputJointDescIndex: table, jointDescIndex: any, loadFromSavegame: any)` | 2430 | ✍ When an implement using the parent's folding state is attached, tracks it in subFoldingStateVehicles and copies the current fold time to it. |
| `Foldable:onPreDetachImplement(implement: table)` | 2444 | ✍ Removes a detaching implement that used the parent fold state from subFoldingStateVehicles. |
| `Foldable:onDynamicMountTypeChanged(dynamicMountType: any, mountObject: any)` | 2455 | ✍ Stops any folding movement (direction 0, no event) when the vehicle gets dynamically mounted on something. |
| `Foldable.setAnimTime(self: any, animTime: any, placeComponents: any, playSounds: any)` | 2463 | ✍ Sets foldAnimTime directly: positions every folding part animation, updates the Cylindered initial state, and on the server (if placeComponents) re-places the component joints. Propagates to sub-vehicles and raises onFoldTimeChanged. |
| `Foldable.updateActionEventFold(self: any)` | 2520 | ✍ Updates the fold action text (fold or unfold, from the toggled direction) and its active state from getIsFoldActionAllowed. |
| `Foldable.updateActionEventFoldMiddle(self: any)` | 2538 | ✍ Updates the lowering action text (lift or lower) and active state from getIsFoldMiddleAllowed, honouring ignoreFoldMiddleWhileFolded. |
| `Foldable.actionEventFold(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2565 | ✍ Input callback for folding: toggles the fold direction if allowed (targeting the middle when it matches turnOnFoldDirection) and syncs the attacher joint lowering state. Otherwise shows a blinking warning for 2000 ms. |
| `Foldable.actionEventFoldMiddle(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2601 | ✍ Input callback for the lowering key: toggles the fold middle state and aligns the attacher joint move-down state, or delegates to the attacher vehicle's lower implement handler when the middle state is ignored. |
| `Foldable.actionEventFoldAll(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2649 | ✍ Input callback that folds or unfolds this tool and every foldable vehicle in the same root vehicle that moves in a matching sense, with a blinking warning if none could move. Note: child vehicles are checked with the direction computed for this vehicle, not their own toggled one. |
| `Foldable.externalActionEventRegister(data: any, vehicle: any)` | 2700 | ✍ Registers the external (trigger) fold action; on press it tries to start the motor, then folds if the vehicle is powered or needs no power, otherwise shows the power warning. |
| `Foldable.externalActionEventUpdate(data: any, vehicle: any)` | 2727 | ✍ Updates the text of the external fold action to the fold or unfold label matching the toggled direction. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onFoldStateChanged` | 228 |
| registerEvent | `onFoldTimeChanged` | 229 |
| registerFunction | `loadFoldingPartFromXML` | 235 |
| registerFunction | `setFoldDirection` | 236 |
| registerFunction | `setFoldState` | 237 |
| registerFunction | `setFoldMiddleState` | 238 |
| registerFunction | `getIsUnfolded` | 239 |
| registerFunction | `getFoldAnimTime` | 240 |
| registerFunction | `setIsFoldActionAllowed` | 241 |
| registerFunction | `getIsFoldActionAllowed` | 242 |
| registerFunction | `getIsFoldAllowed` | 243 |
| registerFunction | `getIsFoldMiddleAllowed` | 244 |
| registerFunction | `getToggledFoldDirection` | 245 |
| registerFunction | `getToggledFoldMiddleDirection` | 246 |
| registerOverwrittenFunction | `allowLoadMovingToolStates` | 252 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 253 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 254 |
| registerOverwrittenFunction | `loadSlopeCompensationNodeFromXML` | 255 |
| registerOverwrittenFunction | `getSlopeCompensationAngleScale` | 256 |
| registerOverwrittenFunction | `loadWheelFromXML` | 257 |
| registerOverwrittenFunction | `getIsVersatileYRotActive` | 258 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 259 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 260 |
| registerOverwrittenFunction | `loadGroundReferenceNode` | 261 |
| registerOverwrittenFunction | `updateGroundReferenceNode` | 262 |
| registerOverwrittenFunction | `loadLevelerNodeFromXML` | 263 |
| registerOverwrittenFunction | `getIsLevelerPickupNodeActive` | 264 |
| registerOverwrittenFunction | `loadMovingToolFromXML` | 265 |
| registerOverwrittenFunction | `getIsMovingToolActive` | 266 |
| registerOverwrittenFunction | `loadMovingPartFromXML` | 267 |
| registerOverwrittenFunction | `getIsMovingPartActive` | 268 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 269 |
| registerOverwrittenFunction | `getIsNextCoverStateAllowed` | 270 |
| registerOverwrittenFunction | `getIsNextCoverStateAllowedWarning` | 271 |
| registerOverwrittenFunction | `getIsInWorkPosition` | 272 |
| registerOverwrittenFunction | `getTurnedOnNotAllowedWarning` | 273 |
| registerOverwrittenFunction | `isDetachAllowed` | 274 |
| registerOverwrittenFunction | `isAttachAllowed` | 275 |
| registerOverwrittenFunction | `getAllowsLowering` | 276 |
| registerOverwrittenFunction | `getIsLowered` | 277 |
| registerOverwrittenFunction | `getCanAIImplementContinueWork` | 278 |
| registerOverwrittenFunction | `getIsAIReadyToDrive` | 279 |
| registerOverwrittenFunction | `getIsAIPreparingToDrive` | 280 |
| registerOverwrittenFunction | `registerLoweringActionEvent` | 281 |
| registerOverwrittenFunction | `registerSelfLoweringActionEvent` | 282 |
| registerOverwrittenFunction | `loadGroundAdjustedNodeFromXML` | 283 |
| registerOverwrittenFunction | `getIsGroundAdjustedNodeActive` | 284 |
| registerOverwrittenFunction | `loadSprayTypeFromXML` | 285 |
| registerOverwrittenFunction | `getIsSprayTypeActive` | 286 |
| registerOverwrittenFunction | `getCanBeSelected` | 287 |
| registerOverwrittenFunction | `loadInputAttacherJoint` | 288 |
| registerOverwrittenFunction | `getIsInputAttacherActive` | 289 |
| registerOverwrittenFunction | `loadAdditionalCharacterFromXML` | 290 |
| registerOverwrittenFunction | `getIsAdditionalCharacterActive` | 291 |
| registerOverwrittenFunction | `getAllowDynamicMountObjects` | 292 |
| registerOverwrittenFunction | `loadSupportAnimationFromXML` | 293 |
| registerOverwrittenFunction | `getIsSupportAnimationAllowed` | 294 |
| registerOverwrittenFunction | `loadSteeringAxleFromXML` | 295 |
| registerOverwrittenFunction | `getIsSteeringAxleAllowed` | 296 |
| registerOverwrittenFunction | `loadFillUnitFromXML` | 297 |
| registerOverwrittenFunction | `getFillUnitSupportsToolType` | 298 |
| registerOverwrittenFunction | `loadTurnedOnAnimationFromXML` | 299 |
| registerOverwrittenFunction | `getIsTurnedOnAnimationActive` | 300 |
| registerOverwrittenFunction | `loadAttacherJointHeightNode` | 301 |
| registerOverwrittenFunction | `getIsAttacherJointHeightNodeActive` | 302 |
| registerOverwrittenFunction | `loadPickupFromXML` | 303 |
| registerOverwrittenFunction | `getCanChangePickupState` | 304 |
| registerOverwrittenFunction | `loadCutterTiltFromXML` | 305 |
| registerOverwrittenFunction | `getCutterTiltIsActive` | 306 |
| registerOverwrittenFunction | `loadPreprunerNodeFromXML` | 307 |
| registerOverwrittenFunction | `getIsPreprunerNodeActive` | 308 |
| registerOverwrittenFunction | `loadShovelNode` | 309 |
| registerOverwrittenFunction | `getShovelNodeIsActive` | 310 |
| registerOverwrittenFunction | `loadSteeringAngleNodeFromXML` | 311 |
| registerOverwrittenFunction | `updateSteeringAngleNode` | 312 |
| registerOverwrittenFunction | `loadWoodHarvesterHeaderTiltFromXML` | 313 |
| registerOverwrittenFunction | `getIsWoodHarvesterTiltStateAllowed` | 314 |
| registerOverwrittenFunction | `loadSuspensionNodeFromXML` | 315 |
| registerOverwrittenFunction | `getIsSuspensionNodeActive` | 316 |
| registerOverwrittenFunction | `loadCrabSteeringModeFromXML` | 317 |
| registerOverwrittenFunction | `getCrabSteeringModeAvailable` | 318 |
| registerOverwrittenFunction | `getCanToggleCrabSteering` | 319 |
| registerOverwrittenFunction | `onLoadWheelChockFromXML` | 320 |
| registerOverwrittenFunction | `getIsWheelChockAllowed` | 321 |
| registerOverwrittenFunction | `loadCraneShovelFromXML` | 322 |
| registerOverwrittenFunction | `getCraneShovelStateChangedAllowed` | 323 |
| registerOverwrittenFunction | `getBrakeForce` | 324 |
| registerOverwrittenFunction | `getRequiresPower` | 325 |
| registerEventListener | `onLoad` | 331 |
| registerEventListener | `onPostLoad` | 332 |
| registerEventListener | `onRegistered` | 333 |
| registerEventListener | `onReadStream` | 334 |
| registerEventListener | `onWriteStream` | 335 |
| registerEventListener | `onUpdate` | 336 |
| registerEventListener | `onUpdateTick` | 337 |
| registerEventListener | `onRegisterActionEvents` | 338 |
| registerEventListener | `onRegisterExternalActionEvents` | 339 |
| registerEventListener | `onDeactivate` | 340 |
| registerEventListener | `onSetLoweredAll` | 341 |
| registerEventListener | `onPostAttach` | 342 |
| registerEventListener | `onPreDetach` | 343 |
| registerEventListener | `onRootVehicleChanged` | 344 |
| registerEventListener | `onPreAttachImplement` | 345 |
| registerEventListener | `onPreDetachImplement` | 346 |
| registerEventListener | `onDynamicMountTypeChanged` | 347 |
