# vehicles/specializations/Plow.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Plow.md)*

Source: `dataS/scripts/vehicles/specializations/Plow.lua` — FS25 1.25.1.0

✍ Specialization for plows (reversible or not, foldable). NO effect, particle or effect animationNode: the only animation handled is the plow's rotation (turnAnimation) and the rotating parts (speedRotatingParts); the work and turning sound is handled on the client. The soil thrown up by a plow comes from WorkParticles (WorkParticles.lua:238: active if getDoGroundManipulation() and on a field; Plow does not override getDoGroundManipulation, so the default is true, WorkParticles.lua:311, independent of the work state of this script). WORK: processPlowArea (PLOW area) erases tire tracks (also on a distant client), then, except for a client farther than Plow.CLIENT_DM_UPDATE_RADIUS (constant not defined here: UNVERIFIED), calls FSDensityMapUtil.updatePlowArea (with angle, limitToField, limitFruitDestructionToField) and updateVineCultivatorArea, but only if self.tailwaterDepth < 0.1 (no plowing under more than 0.1 of water depth, unit not given in this file); isWorking = speed > 0.5, even if nothing is plowed. The FSDensityMapUtil bodies are absent from the dump: exact effect on the terrain UNVERIFIED. AREA CONDITIONS: inactive for 2000 ms after attaching, and, by default, if the implement is not lowered (onlyActiveWhenLowered). There is no switching on for a plow. FIELD LIMIT: the limitToField option (toggled by the IMPLEMENT_EXTRA3 action, synchronized by PlowLimitToFieldEvent) is forced to true without the createFields permission or on platforms that forbid field creation; reset to true on detaching. ROTATION: setRotationMax/setRotationCenter drive the animation and send PlowRotationEvent / PlowRotationCenterEvent; the state (rotationMax, animation time) is saved (saveToXMLFile) and sent in the initial stream. Rotation is refused if folding, height, power (getIsPowered) or the lifting state do not allow it; AI turns happen at the end of the row (onAIImplement*). WEATHER/MOISTURE: no reading. NETWORK: only the initial stream (rotation) and the rotation/limit events; no synchronized effect. dt: unused except in the signature (time statistics: dt/60000 min, plowedTime). Server statistics: plowedHectares, plowedTime. EXTENSION POINTS: functions setRotationMax, setRotationCenter, setPlowLimitToField, getIsPlowRotationAllowed, getCanTogglePlowRotation, getPlowLimitToField, getPlowForceLimitToField, setPlowAIRequirements, processPlowArea; many overrides (folding, detaching, lowering, AI, rotating parts, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML PLOW type, getIsWorkAreaActive). Default speed limit: 15. Initialization and XML registration (initSpecialization, registerXMLPaths) not reread key by key.

- **Plow** (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `Plow.initSpecialization()` | 38 | ✍ Declares the plow area type, the plow configuration and the XML schema. Not reread key by key. |
| `Plow.registerXMLPaths(schema: any, basePath: any)` | 63 | ✍ Registers the XML keys of vehicle.plow: rotationPart (animation, folding/detaching limits), directionNode, onlyActiveWhenLowered, AI parameters, sounds. Not reread key by key. |
| `Plow.prerequisitesPresent(specializations: any)` | 95 | ✍ Requires the WorkArea specialization. |
| `Plow.registerFunctions(vehicleType: any)` | 101 | ✍ Registers the rotation functions, the field limit, the AI requirements and processPlowArea. |
| `Plow.registerOverwrittenFunctions(vehicleType: any)` | 116 | ✍ Overrides folding, detaching, lowering, AI, rotating parts, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML, getIsWorkAreaActive, doCheckSpeedLimit and getCanBeSelected (list not reread line by line). |
| `Plow.registerEventListeners(vehicleType: any)` | 138 | ✍ Subscribes notably to onLoad, onPostLoad, onDelete, the initial stream, onUpdate, onRegisterActionEvents, the area processing events, onPostAttach, onPreDetach, onDeactivate, the AI, animation and folding events, and onRootVehicleChanged. |
| `Plow:onLoad(savegame: any)` | 165 | ✍ Reads the plow configuration: rotating parts, animation limits, direction node, AI parameters, texts, sounds; initializes rotationMax, limitToField, activation delay and pass parameters (detailed reading not reread). |
| `Plow:onPostLoad(savegame: any)` | 254 | ✍ Restores the plow orientation from the savegame (rotationMax, animation time) if rotation is allowed. |
| `Plow:onDelete()` | 272 | ✍ Releases the work and turning sounds. |
| `Plow:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 282 | ✍ Saves rotationMax and the rotation animation time. |
| `Plow:onReadStream(streamId: any, connection: any)` | 293 | ✍ Reads the orientation and animation time sent on connection and applies them. |
| `Plow:onWriteStream(streamId: any, connection: any)` | 311 | ✍ Writes the orientation and the animation time. |
| `Plow:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 323 | ✍ Client: updates the text/activation of the field limit action (depending on permission) and of the rotation action (depending on getCanTogglePlowRotation). No visual effect. |
| `Plow:processPlowArea(workArea: any, dt: any)` | 353 | ✍ Erases tire tracks, plows the area in the density map (outside a distant client and if the water is low enough), accumulates the surfaces and sets isWorking (speed > 0.5). Returns the modified and total area. |
| `Plow:setRotationMax(rotationMax: any, noEventSend: any, turnAnimationTime: any)` | 402 | ✍ Sets the plow side, sends PlowRotationEvent and starts the rotation animation (or places it directly at a given time). |
| `Plow:setRotationCenter(noEventSend: any)` | 425 | ✍ Brings the animation to the AI center position and sends PlowRotationCenterEvent. |
| `Plow:setPlowLimitToField(plowLimitToField: any, noEventSend: any)` | 446 | ✍ Changes the limitToField option, broadcasts it (server: to all; client: to the server) and updates the action text. |
| `Plow:getIsPlowRotationAllowed()` | 474 | ✍ True if the folding state allows rotation (rotationFoldMin/Max limits). |
| `Plow:getCanTogglePlowRotation()` | 489 | ✍ True if rotation is allowed by the folding, if the implement is not lowered when rotationAllowedIfLowered is false, and if the vehicle is powered (getIsPowered). |
| `Plow:getPlowLimitToField() → boolean` | 510 | ✍ Returns the limitToField option. |
| `Plow:getPlowForceLimitToField() → boolean` | 517 | ✍ True if the limit is imposed (forceLimitToField or a platform without field creation). |
| `Plow:setPlowAIRequirements(excludedGroundTypes: table)` | 524 | ✍ Defines the ground types required by the AI (with possible exclusions) and enables the variable lateral offset. |
| `Plow:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 540 | ✍ Forbids folding if the plow is turned to a position that is not allowed or lowered depending on the configuration. |
| `Plow:getIsFoldMiddleAllowed(superFunc: any)` | 563 | ✍ Same for the intermediate folding position. |
| `Plow:getDirtMultiplier(superFunc: any)` | 580 | ✍ Adds the work dirt weighted by speed/limit when isWorking. |
| `Plow:getWearMultiplier(superFunc: any) → number` | 594 | ✍ Adds the work wear weighted by speed/limit when isWorking. |
| `Plow:loadSpeedRotatingPartFromXML(superFunc: any, speedRotatingPart: any, xmlFile: any, key: any)` | 607 | ✍ Reads the rotating part options tied to the turning (disableOnTurn, turnAnimLimit, turnAnimLimitSide, invertDirectionOnRotation). |
| `Plow:getIsSpeedRotatingPartActive(superFunc: any, speedRotatingPart: any)` | 622 | ✍ Disables a rotating part during turning according to the animation time and its limits. |
| `Plow:getSpeedRotatingPartDirection(superFunc: any, speedRotatingPart: any)` | 647 | ✍ Inverts the rotation direction of a part when the plow is turned (animation time > 0.5). |
| `Plow:doCheckSpeedLimit(superFunc: any)` | 662 | ✍ Applies the speed limit if onlyActiveWhenLowered and the implement chain is lowered. |
| `Plow:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 668 | ✍ Forces the PLOW area type if it is DEFAULT. |
| `Plow.getDefaultSpeedLimit()` | 680 | ✍ Default speed limit: 15. |
| `Plow:getIsWorkAreaActive(superFunc: any, workArea: any)` | 686 | ✍ For PLOW: inactive during the post-attach delay and, if required, while the implement is not lowered. |
| `Plow:getCanAIImplementContinueWork(superFunc: any, isTurning: any)` | 705 | ✍ The AI does not continue while the rotation animation is playing (except with the stopDuringTurn parameter). |
| `Plow:getAIInvertMarkersOnTurn(superFunc: any, turnLeft: any)` | 721 | ✍ Indicates whether the AI markers are inverted in a turn depending on the plow side. |
| `Plow:getCanBeSelected(superFunc: any)` | 736 | ✍ Returns true: the implement is selectable. |
| `Plow:isDetachAllowed(superFunc: any) → boolean` | 743 | ✍ Refuses detaching during rotation or outside the detach animation limits (with a warning). |
| `Plow:getAllowsLowering(superFunc: any) → boolean` | 762 | ✍ Refuses lowering during rotation. |
| `Plow:getIsAIReadyToDrive(superFunc: any)` | 773 | ✍ Not ready for the AI if rotationMax is true or if rotation is in progress. |
| `Plow:getIsAIPreparingToDrive(superFunc: any)` | 784 | ✍ True during rotation. |
| `Plow:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 795 | ✍ Registers the rotation actions (if there is an animation) and the field limit action (IMPLEMENT_EXTRA3). |
| `Plow:onStartWorkAreaProcessing(dt: any)` | 815 | ✍ Before the pass: isWorking = false; computes limitToField (forced without the createFields permission) and the density map angle; resets the surfaces to zero. |
| `Plow:onEndWorkAreaProcessing(dt: any)` | 840 | ✍ Server: plowedHectares/plowedTime statistics and worked area. Client: starts/stops the work sound according to isWorking. |
| `Plow:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 878 | ✍ Arms the activation delay (2000 ms) and resumes a rotation animation interrupted at detaching. |
| `Plow:onPreDetach(attacherVehicle: table, implement: table)` | 896 | ✍ Resets limitToField to true and stops a rotation in progress (remembered for resuming). |
| `Plow:onDeactivate()` | 908 | ✍ Cuts the work and turning sounds. |
| `Plow:onAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 919 | ✍ AI course settings: total overlap and a cutting angle of 25 degrees. |
| `Plow:onAIImplementStartTurn(isLeft: any)` | 927 | ✍ Resets the AI headland position. |
| `Plow:onAIImplementTurnProgress(progress: any, isLeft: any, movingDirection: any)` | 933 | ✍ During an AI turn: moves the plow to the center then turns it fully at the configured progress positions. |
| `Plow:onAIImplementEndTurn(isLeft: any)` | 949 | ✍ Turns the plow to the turn side at the end of the AI turn. |
| `Plow:onAIImplementSideOffsetChanged(isLeft: any, isInitial: any)` | 956 | ✍ Applies the initial plow side (immediately or as soon as rotation is allowed). |
| `Plow:onAIImplementEnd()` | 969 | ✍ Clears the AI deferred rotation. |
| `Plow:onStartAnimation(animName: any)` | 975 | ✍ Plays the turning sound at the start of the rotation animation. |
| `Plow:onFinishAnimation(animName: any)` | 984 | ✍ Cuts the turning sound at the end of the rotation animation. |
| `Plow:onFoldTimeChanged(foldAnimTime: any)` | 993 | ✍ Server: applies a deferred AI rotation as soon as it becomes allowed. |
| `Plow:onRootVehicleChanged(rootVehicle: table)` | 1008 | ✍ Registers/updates with the actionController the "rotatePlow" and "rotateBackPlow" actions (turning, AI-related). |
| `Plow.actionEventTurn(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1053 | ✍ Input callback: toggles the plow side if allowed. |
| `Plow.actionEventLimitToField(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1064 | ✍ Input callback: toggles limitToField if not imposed. |
| `Plow.actionControllerRotateBackEvent(self: any, direction: any, isAIEvent: any)` | 1073 | ✍ actionController callback: returns the plow to the non-turned state on an AI event. |
| `Plow.actionControllerRotateEvent(self: any, direction: any, isAIEvent: any)` | 1092 | ✍ actionController callback: turns the plow or finishes the interrupted animation. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `processPlowArea` | 102 |
| registerFunction | `processPlowShareArea` | 103 |
| registerFunction | `setRotationMax` | 104 |
| registerFunction | `setRotationCenter` | 105 |
| registerFunction | `setPlowLimitToField` | 106 |
| registerFunction | `getIsPlowRotationAllowed` | 107 |
| registerFunction | `getCanTogglePlowRotation` | 108 |
| registerFunction | `getPlowLimitToField` | 109 |
| registerFunction | `getPlowForceLimitToField` | 110 |
| registerFunction | `setPlowAIRequirements` | 111 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 117 |
| registerOverwrittenFunction | `getIsFoldMiddleAllowed` | 118 |
| registerOverwrittenFunction | `getDirtMultiplier` | 119 |
| registerOverwrittenFunction | `getWearMultiplier` | 120 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 121 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 122 |
| registerOverwrittenFunction | `getSpeedRotatingPartDirection` | 123 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 124 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 125 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 126 |
| registerOverwrittenFunction | `getCanAIImplementContinueWork` | 127 |
| registerOverwrittenFunction | `getAIInvertMarkersOnTurn` | 128 |
| registerOverwrittenFunction | `getCanBeSelected` | 129 |
| registerOverwrittenFunction | `isDetachAllowed` | 130 |
| registerOverwrittenFunction | `getAllowsLowering` | 131 |
| registerOverwrittenFunction | `getIsAIReadyToDrive` | 132 |
| registerOverwrittenFunction | `getIsAIPreparingToDrive` | 133 |
| registerEventListener | `onLoad` | 139 |
| registerEventListener | `onPostLoad` | 140 |
| registerEventListener | `onDelete` | 141 |
| registerEventListener | `onReadStream` | 142 |
| registerEventListener | `onWriteStream` | 143 |
| registerEventListener | `onUpdate` | 144 |
| registerEventListener | `onRegisterActionEvents` | 145 |
| registerEventListener | `onStartWorkAreaProcessing` | 146 |
| registerEventListener | `onEndWorkAreaProcessing` | 147 |
| registerEventListener | `onPostAttach` | 148 |
| registerEventListener | `onPreDetach` | 149 |
| registerEventListener | `onDeactivate` | 150 |
| registerEventListener | `onAIFieldCourseSettingsInitialized` | 151 |
| registerEventListener | `onAIImplementStartTurn` | 152 |
| registerEventListener | `onAIImplementTurnProgress` | 153 |
| registerEventListener | `onAIImplementEndTurn` | 154 |
| registerEventListener | `onAIImplementSideOffsetChanged` | 155 |
| registerEventListener | `onAIImplementEnd` | 156 |
| registerEventListener | `onStartAnimation` | 157 |
| registerEventListener | `onFinishAnimation` | 158 |
| registerEventListener | `onFoldTimeChanged` | 159 |
| registerEventListener | `onRootVehicleChanged` | 160 |
