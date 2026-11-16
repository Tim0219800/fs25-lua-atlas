---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Plow.lua (generated stub, FS25 Lua Atlas)

--- Specialization for plows (reversible or not, foldable). NO effect, particle or effect animationNode: the only animation handled is the plow's rotation (turnAnimation) and the rotating parts (speedRotatingParts); the work and turning sound is handled on the client. The soil thrown up by a plow comes from WorkParticles (WorkParticles.lua:238: active if getDoGroundManipulation() and on a field; Plow does not override getDoGroundManipulation, so the default is true, WorkParticles.lua:311, independent of the work state of this script). WORK: processPlowArea (PLOW area) erases tire tracks (also on a distant client), then, except for a client farther than Plow.CLIENT_DM_UPDATE_RADIUS (constant not defined here: UNVERIFIED), calls FSDensityMapUtil.updatePlowArea (with angle, limitToField, limitFruitDestructionToField) and updateVineCultivatorArea, but only if self.tailwaterDepth < 0.1 (no plowing under more than 0.1 of water depth, unit not given in this file); isWorking = speed > 0.5, even if nothing is plowed. The FSDensityMapUtil bodies are absent from the dump: exact effect on the terrain UNVERIFIED. AREA CONDITIONS: inactive for 2000 ms after attaching, and, by default, if the implement is not lowered (onlyActiveWhenLowered). There is no switching on for a plow. FIELD LIMIT: the limitToField option (toggled by the IMPLEMENT_EXTRA3 action, synchronized by PlowLimitToFieldEvent) is forced to true without the createFields permission or on platforms that forbid field creation; reset to true on detaching. ROTATION: setRotationMax/setRotationCenter drive the animation and send PlowRotationEvent / PlowRotationCenterEvent; the state (rotationMax, animation time) is saved (saveToXMLFile) and sent in the initial stream. Rotation is refused if folding, height, power (getIsPowered) or the lifting state do not allow it; AI turns happen at the end of the row (onAIImplement*). WEATHER/MOISTURE: no reading. NETWORK: only the initial stream (rotation) and the rotation/limit events; no synchronized effect. dt: unused except in the signature (time statistics: dt/60000 min, plowedTime). Server statistics: plowedHectares, plowedTime. EXTENSION POINTS: functions setRotationMax, setRotationCenter, setPlowLimitToField, getIsPlowRotationAllowed, getCanTogglePlowRotation, getPlowLimitToField, getPlowForceLimitToField, setPlowAIRequirements, processPlowArea; many overrides (folding, detaching, lowering, AI, rotating parts, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML PLOW type, getIsWorkAreaActive). Default speed limit: 15. Initialization and XML registration (initSpecialization, registerXMLPaths) not reread key by key.
---@class Plow
Plow = {}

--- Declares the plow area type, the plow configuration and the XML schema. Not reread key by key.
function Plow.initSpecialization() end

--- Registers the XML keys of vehicle.plow: rotationPart (animation, folding/detaching limits), directionNode, onlyActiveWhenLowered, AI parameters, sounds. Not reread key by key.
---@param schema any
---@param basePath any
function Plow.registerXMLPaths(schema, basePath) end

--- Requires the WorkArea specialization.
---@param specializations any
function Plow.prerequisitesPresent(specializations) end

--- Registers the rotation functions, the field limit, the AI requirements and processPlowArea.
---@param vehicleType any
function Plow.registerFunctions(vehicleType) end

--- Overrides folding, detaching, lowering, AI, rotating parts, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML, getIsWorkAreaActive, doCheckSpeedLimit and getCanBeSelected (list not reread line by line).
---@param vehicleType any
function Plow.registerOverwrittenFunctions(vehicleType) end

--- Subscribes notably to onLoad, onPostLoad, onDelete, the initial stream, onUpdate, onRegisterActionEvents, the area processing events, onPostAttach, onPreDetach, onDeactivate, the AI, animation and folding events, and onRootVehicleChanged.
---@param vehicleType any
function Plow.registerEventListeners(vehicleType) end

--- Reads the plow configuration: rotating parts, animation limits, direction node, AI parameters, texts, sounds; initializes rotationMax, limitToField, activation delay and pass parameters (detailed reading not reread).
---@param savegame any
function Plow:onLoad(savegame) end

--- Restores the plow orientation from the savegame (rotationMax, animation time) if rotation is allowed.
---@param savegame any
function Plow:onPostLoad(savegame) end

--- Releases the work and turning sounds.
function Plow:onDelete() end

--- Saves rotationMax and the rotation animation time.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Plow:saveToXMLFile(xmlFile, key, usedModNames) end

--- Reads the orientation and animation time sent on connection and applies them.
---@param streamId any
---@param connection any
function Plow:onReadStream(streamId, connection) end

--- Writes the orientation and the animation time.
---@param streamId any
---@param connection any
function Plow:onWriteStream(streamId, connection) end

--- Client: updates the text/activation of the field limit action (depending on permission) and of the rotation action (depending on getCanTogglePlowRotation). No visual effect.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Plow:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Erases tire tracks, plows the area in the density map (outside a distant client and if the water is low enough), accumulates the surfaces and sets isWorking (speed > 0.5). Returns the modified and total area.
---@param workArea any
---@param dt any
function Plow:processPlowArea(workArea, dt) end

--- Sets the plow side, sends PlowRotationEvent and starts the rotation animation (or places it directly at a given time).
---@param rotationMax any
---@param noEventSend any
---@param turnAnimationTime any
function Plow:setRotationMax(rotationMax, noEventSend, turnAnimationTime) end

--- Brings the animation to the AI center position and sends PlowRotationCenterEvent.
---@param noEventSend any
function Plow:setRotationCenter(noEventSend) end

--- Changes the limitToField option, broadcasts it (server: to all; client: to the server) and updates the action text.
---@param plowLimitToField any
---@param noEventSend any
function Plow:setPlowLimitToField(plowLimitToField, noEventSend) end

--- True if the folding state allows rotation (rotationFoldMin/Max limits).
function Plow:getIsPlowRotationAllowed() end

--- True if rotation is allowed by the folding, if the implement is not lowered when rotationAllowedIfLowered is false, and if the vehicle is powered (getIsPowered).
function Plow:getCanTogglePlowRotation() end

--- Returns the limitToField option.
---@return boolean
function Plow:getPlowLimitToField() end

--- True if the limit is imposed (forceLimitToField or a platform without field creation).
---@return boolean
function Plow:getPlowForceLimitToField() end

--- Defines the ground types required by the AI (with possible exclusions) and enables the variable lateral offset.
---@param excludedGroundTypes table
function Plow:setPlowAIRequirements(excludedGroundTypes) end

--- Forbids folding if the plow is turned to a position that is not allowed or lowered depending on the configuration.
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function Plow:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- Same for the intermediate folding position.
---@param superFunc any
function Plow:getIsFoldMiddleAllowed(superFunc) end

--- Adds the work dirt weighted by speed/limit when isWorking.
---@param superFunc any
function Plow:getDirtMultiplier(superFunc) end

--- Adds the work wear weighted by speed/limit when isWorking.
---@param superFunc any
---@return number
function Plow:getWearMultiplier(superFunc) end

--- Reads the rotating part options tied to the turning (disableOnTurn, turnAnimLimit, turnAnimLimitSide, invertDirectionOnRotation).
---@param superFunc any
---@param speedRotatingPart any
---@param xmlFile any
---@param key any
function Plow:loadSpeedRotatingPartFromXML(superFunc, speedRotatingPart, xmlFile, key) end

--- Disables a rotating part during turning according to the animation time and its limits.
---@param superFunc any
---@param speedRotatingPart any
function Plow:getIsSpeedRotatingPartActive(superFunc, speedRotatingPart) end

--- Inverts the rotation direction of a part when the plow is turned (animation time > 0.5).
---@param superFunc any
---@param speedRotatingPart any
function Plow:getSpeedRotatingPartDirection(superFunc, speedRotatingPart) end

--- Applies the speed limit if onlyActiveWhenLowered and the implement chain is lowered.
---@param superFunc any
function Plow:doCheckSpeedLimit(superFunc) end

--- Forces the PLOW area type if it is DEFAULT.
---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function Plow:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Default speed limit: 15.
function Plow.getDefaultSpeedLimit() end

--- For PLOW: inactive during the post-attach delay and, if required, while the implement is not lowered.
---@param superFunc any
---@param workArea any
function Plow:getIsWorkAreaActive(superFunc, workArea) end

--- The AI does not continue while the rotation animation is playing (except with the stopDuringTurn parameter).
---@param superFunc any
---@param isTurning any
function Plow:getCanAIImplementContinueWork(superFunc, isTurning) end

--- Indicates whether the AI markers are inverted in a turn depending on the plow side.
---@param superFunc any
---@param turnLeft any
function Plow:getAIInvertMarkersOnTurn(superFunc, turnLeft) end

--- Returns true: the implement is selectable.
---@param superFunc any
function Plow:getCanBeSelected(superFunc) end

--- Refuses detaching during rotation or outside the detach animation limits (with a warning).
---@param superFunc any
---@return boolean
function Plow:isDetachAllowed(superFunc) end

--- Refuses lowering during rotation.
---@param superFunc any
---@return boolean
function Plow:getAllowsLowering(superFunc) end

--- Not ready for the AI if rotationMax is true or if rotation is in progress.
---@param superFunc any
function Plow:getIsAIReadyToDrive(superFunc) end

--- True during rotation.
---@param superFunc any
function Plow:getIsAIPreparingToDrive(superFunc) end

--- Registers the rotation actions (if there is an animation) and the field limit action (IMPLEMENT_EXTRA3).
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Plow:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Before the pass: isWorking = false; computes limitToField (forced without the createFields permission) and the density map angle; resets the surfaces to zero.
---@param dt any
function Plow:onStartWorkAreaProcessing(dt) end

--- Server: plowedHectares/plowedTime statistics and worked area. Client: starts/stops the work sound according to isWorking.
---@param dt any
function Plow:onEndWorkAreaProcessing(dt) end

--- Arms the activation delay (2000 ms) and resumes a rotation animation interrupted at detaching.
---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
function Plow:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

--- Resets limitToField to true and stops a rotation in progress (remembered for resuming).
---@param attacherVehicle table
---@param implement table
function Plow:onPreDetach(attacherVehicle, implement) end

--- Cuts the work and turning sounds.
function Plow:onDeactivate() end

--- AI course settings: total overlap and a cutting angle of 25 degrees.
---@param fieldCourseSettings any
function Plow:onAIFieldCourseSettingsInitialized(fieldCourseSettings) end

--- Resets the AI headland position.
---@param isLeft any
function Plow:onAIImplementStartTurn(isLeft) end

--- During an AI turn: moves the plow to the center then turns it fully at the configured progress positions.
---@param progress any
---@param isLeft any
---@param movingDirection any
function Plow:onAIImplementTurnProgress(progress, isLeft, movingDirection) end

--- Turns the plow to the turn side at the end of the AI turn.
---@param isLeft any
function Plow:onAIImplementEndTurn(isLeft) end

--- Applies the initial plow side (immediately or as soon as rotation is allowed).
---@param isLeft any
---@param isInitial any
function Plow:onAIImplementSideOffsetChanged(isLeft, isInitial) end

--- Clears the AI deferred rotation.
function Plow:onAIImplementEnd() end

--- Plays the turning sound at the start of the rotation animation.
---@param animName any
function Plow:onStartAnimation(animName) end

--- Cuts the turning sound at the end of the rotation animation.
---@param animName any
function Plow:onFinishAnimation(animName) end

--- Server: applies a deferred AI rotation as soon as it becomes allowed.
---@param foldAnimTime any
function Plow:onFoldTimeChanged(foldAnimTime) end

--- Registers/updates with the actionController the "rotatePlow" and "rotateBackPlow" actions (turning, AI-related).
---@param rootVehicle table
function Plow:onRootVehicleChanged(rootVehicle) end

--- Input callback: toggles the plow side if allowed.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Plow.actionEventTurn(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: toggles limitToField if not imposed.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Plow.actionEventLimitToField(self, actionName, inputValue, callbackState, isAnalog) end

--- actionController callback: returns the plow to the non-turned state on an AI event.
---@param self any
---@param direction any
---@param isAIEvent any
function Plow.actionControllerRotateBackEvent(self, direction, isAIEvent) end

--- actionController callback: turns the plow or finishes the interrupted animation.
---@param self any
---@param direction any
---@param isAIEvent any
function Plow.actionControllerRotateEvent(self, direction, isAIEvent) end
