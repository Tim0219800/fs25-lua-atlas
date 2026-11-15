---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AttacherJoints.lua (stub généré, atlas Lua FS25)

---@class AttacherJoints
AttacherJoints = {}

---@param width any
---@return integer
function AttacherJoints.getClosestLowerLinkCategoryIndex(width) end

function AttacherJoints.initSpecialization() end

---@param schema any
---@param baseName any
function AttacherJoints.registerAttacherJointXMLPaths(schema, baseName) end

---@param name string
function AttacherJoints.registerJointType(name) end

---@param specializations any
function AttacherJoints.prerequisitesPresent(specializations) end

---@param vehicleType any
function AttacherJoints.registerEvents(vehicleType) end

---@param vehicleType any
function AttacherJoints.registerFunctions(vehicleType) end

---@param vehicleType any
function AttacherJoints.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function AttacherJoints.registerEventListeners(vehicleType) end

---@param savegame table
function AttacherJoints:onPreLoad(savegame) end

---@param savegame table
function AttacherJoints:onLoad(savegame) end

---@param savegame table
function AttacherJoints:onPostLoad(savegame) end

---@param savegame table
function AttacherJoints:onLoadFinished(savegame) end

function AttacherJoints:onRegisterDashboardValueTypes() end

function AttacherJoints:onPreDelete() end

function AttacherJoints:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function AttacherJoints:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function AttacherJoints:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AttacherJoints:onWriteStream(streamId, connection) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AttacherJoints:onUpdateInterpolation(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AttacherJoints:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function AttacherJoints:onUpdateEnd(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AttacherJoints:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function AttacherJoints:loadAttachmentsFinished() end

---@param vehicle any
---@param direction any
function AttacherJoints:handleLowerImplementEvent(vehicle, direction) end

---@param attacherJointIndex any
---@param direction any
function AttacherJoints:handleLowerImplementByAttacherJointIndex(attacherJointIndex, direction) end

function AttacherJoints:getAttachedImplements() end

function AttacherJoints:getAttacherJoints() end

---@param jointDescIndex any
function AttacherJoints:getAttacherJointByJointDescIndex(jointDescIndex) end

---@param node any
function AttacherJoints:getAttacherJointIndexByNode(node) end

---@param node any
function AttacherJoints:getAttacherJointByNode(node) end

---@param attacherJointIndex any
function AttacherJoints:getImplementFromAttacherJointIndex(attacherJointIndex) end

---@param object any
function AttacherJoints:getAttacherJointIndexFromObject(object) end

---@param object any
function AttacherJoints:getAttacherJointDescFromObject(object) end

---@param implementIndex any
function AttacherJoints:getAttacherJointIndexFromImplementIndex(implementIndex) end

---@param implementIndex any
function AttacherJoints:getObjectFromImplementIndex(implementIndex) end

---@param implement table
---@param dt number
---@param forceUpdate any
function AttacherJoints:updateAttacherJointGraphics(implement, dt, forceUpdate) end

---@param jointDesc table
---@param object table
---@param initial boolean
function AttacherJoints:calculateAttacherJointMoveUpperLowerAlpha(jointDesc, object, initial) end

function AttacherJoints:doGroundHeightNodeCheck() end

function AttacherJoints:finishGroundHeightNodeCheck() end

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

---@param jointDesc table
---@param object table
function AttacherJoints:updateAttacherJointRotation(jointDesc, object) end

---@param jointDesc any
---@param alpha any
function AttacherJoints:updateAttacherJointRotationNodes(jointDesc, alpha) end

---@param vehicle any
---@param updateLimit any
---@param updateRotationOffset any
---@param updateDistanceToGround any
function AttacherJoints:updateAttacherJointSettingsByObject(vehicle, updateLimit, updateRotationOffset, updateDistanceToGround) end

---@param jointDescIndex any
---@param width any
function AttacherJoints:setAttacherJointBottomArmWidth(jointDescIndex, width) end

---@param info any
function AttacherJoints:attachImplementFromInfo(info) end

---@param implement any
function AttacherJoints:postAttachImplement(implement) end

---@param implement table
---@param noSmoothAttach boolean
function AttacherJoints:createAttachmentJoint(implement, noSmoothAttach) end

---@param implement table
function AttacherJoints:hardAttachImplement(implement) end

---@param implement table
function AttacherJoints:hardDetachImplement(implement) end

---@param implementIndex integer
---@param noEventSend boolean
---@return boolean
function AttacherJoints:detachImplement(implementIndex, noEventSend) end

---@param object table
---@param noEventSend boolean
---@return boolean
function AttacherJoints:detachImplementByObject(object, noEventSend) end

---@param object any
function AttacherJoints:setSelectedImplementByObject(object) end

function AttacherJoints:getSelectedImplement() end

function AttacherJoints:getCanToggleAttach() end

function AttacherJoints:getShowAttachControlBarAction() end

function AttacherJoints:detachAttachedImplement() end

---@param force any
function AttacherJoints:startAttacherJointCombo(force) end

---@param attacherJoint any
function AttacherJoints:getIsAttachingAllowed(attacherJoint) end

---@param vehicle any
---@param attacherJoint any
---@param inputAttacherVehicle any
---@param inputAttacherJoint any
function AttacherJoints:getIsAttacherJointCompatible(vehicle, attacherJoint, inputAttacherVehicle, inputAttacherJoint) end

---@param attachable table
---@return boolean
function AttacherJoints:getCanSteerAttachable(attachable) end

---@param vehicle table
function AttacherJoints:onAttacherJointsVehicleLoaded(vehicle) end

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

---@param jointDesc table
---@return boolean
function AttacherJoints:playAttachSound(jointDesc) end

---@param jointDesc table
---@return boolean
function AttacherJoints:playDetachSound(jointDesc) end

---@return boolean
function AttacherJoints:detachingIsPossible() end

---@param jointDesc any
---@param inputJointDesc any
---@param object any
function AttacherJoints:attachAdditionalAttachment(jointDesc, inputJointDesc, object) end

---@param jointDesc any
---@param inputJointDesc any
function AttacherJoints:detachAdditionalAttachment(jointDesc, inputJointDesc) end

---@param vehicles any
---@param vehicleLoadState any
---@param asyncCallbackArguments any
function AttacherJoints:additionalAttachmentLoaded(vehicles, vehicleLoadState, asyncCallbackArguments) end

---@param jointDescIndex integer
---@return integer
function AttacherJoints:getImplementIndexByJointDescIndex(jointDescIndex) end

---@param jointDescIndex integer
---@return table
function AttacherJoints:getImplementByJointDescIndex(jointDescIndex) end

---@param object table
---@return integer
function AttacherJoints:getImplementIndexByObject(object) end

---@param object table
---@return table
function AttacherJoints:getImplementByObject(object) end

---@param functionName any
function AttacherJoints:callFunctionOnAllImplements(functionName, ...) end

function AttacherJoints:activateAttachments() end

function AttacherJoints:deactivateAttachments() end

function AttacherJoints:deactivateAttachmentsLights() end

---@param jointDescIndex integer
---@param moveDown boolean
---@param noEventSend boolean
---@return boolean
function AttacherJoints:setJointMoveDown(jointDescIndex, moveDown, noEventSend) end

---@param jointDescIndex integer
---@return boolean
function AttacherJoints:getJointMoveDown(jointDescIndex) end

---@param jointDescIndex integer
---@return boolean
function AttacherJoints:getIsHardAttachAllowed(jointDescIndex) end

---@param implement any
function AttacherJoints:getIsSmoothAttachUpdateAllowed(implement) end

---@param attacherJoint table
---@param xmlFile integer
---@param baseName string
---@param index integer
function AttacherJoints:loadAttacherJointFromXML(attacherJoint, xmlFile, baseName, index) end

---@param i3dNode integer
---@param failedReason table
---@param args table
function AttacherJoints:onBottomArmToolbarI3DLoaded(i3dNode, failedReason, args) end

---@param superFunc any
function AttacherJoints:raiseActive(superFunc) end

---@param superFunc any
---@param excludedVehicle any
function AttacherJoints:registerActionEvents(superFunc, excludedVehicle) end

---@param superFunc any
function AttacherJoints:removeActionEvents(superFunc) end

---@param superFunc any
---@return boolean
function AttacherJoints:addToPhysics(superFunc) end

---@param superFunc any
---@return boolean
function AttacherJoints:removeFromPhysics(superFunc) end

---@param superFunc boolean
---@param onlyGivenVehicle boolean
---@return number
function AttacherJoints:getTotalMass(superFunc, onlyGivenVehicle) end

---@param superFunc any
---@param component any
function AttacherJoints:getAdditionalComponentMass(superFunc, component) end

---@param superFunc table
---@param vehicles table
---@param rootVehicle any
function AttacherJoints:addChildVehicles(superFunc, vehicles, rootVehicle) end

---@param superFunc any
---@return number
function AttacherJoints:getAirConsumerUsage(superFunc) end

---@param superFunc any
function AttacherJoints:getRequiresPower(superFunc) end

---@param superFunc any
---@param list any
function AttacherJoints:addVehicleToAIImplementList(superFunc, list) end

---@param superFunc any
---@param aiDrivableVehicle any
function AttacherJoints:collectAIAgentAttachments(superFunc, aiDrivableVehicle) end

---@param superFunc any
function AttacherJoints:setAIVehicleObstacleStateDirty(superFunc) end

---@param superFunc any
function AttacherJoints:getDirectionSnapAngle(superFunc) end

---@param superFunc any
---@param display any
function AttacherJoints:getFillLevelInformation(superFunc, display) end

---@param superFunc table
---@param object table
---@return boolean
function AttacherJoints:getHasObjectMounted(superFunc, object) end

---@param superFunc any
function AttacherJoints:attachableAddToolCameras(superFunc) end

---@param superFunc any
function AttacherJoints:attachableRemoveToolCameras(superFunc) end

---@param superFunc any
---@param selectableObjects any
function AttacherJoints:registerSelectableObjects(superFunc, selectableObjects) end

---@param superFunc any
function AttacherJoints:getIsReadyForAutomatedTrainTravel(superFunc) end

---@param superFunc any
function AttacherJoints:getIsAutomaticShiftingAllowed(superFunc) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param group any
function AttacherJoints:loadDashboardGroupFromXML(superFunc, xmlFile, key, group) end

---@param superFunc any
---@param group any
function AttacherJoints:getIsDashboardGroupActive(superFunc, group) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param heightNode any
---@param attacherJointNode any
function AttacherJoints:loadAttacherJointHeightNode(superFunc, xmlFile, key, heightNode, attacherJointNode) end

---@param superFunc any
---@param heightNode any
function AttacherJoints:getIsAttacherJointHeightNodeActive(superFunc, heightNode) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function AttacherJoints:loadTipSide(superFunc, xmlFile, key, entry) end

---@param superFunc any
---@param sideIndex any
function AttacherJoints:getIsTipSideAvailable(superFunc, sideIndex) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
---@param index any
function AttacherJoints:loadFillUnitFromXML(superFunc, xmlFile, key, entry, index) end

---@param superFunc any
---@param fillUnitIndex any
---@param toolType any
function AttacherJoints:getFillUnitSupportsToolType(superFunc, fillUnitIndex, toolType) end

---@param superFunc any
---@return boolean
function AttacherJoints:isDetachAllowed(superFunc) end

---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function AttacherJoints:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

---@param superFunc any
---@param wheel any
---@return boolean
function AttacherJoints:getIsWheelFoliageDestructionAllowed(superFunc, wheel) end

---@param superFunc any
---@return boolean
---@return string
function AttacherJoints:getAreControlledActionsAllowed(superFunc) end

---@param superFunc any
function AttacherJoints:getConnectionHoseConfigIndex(superFunc) end

---@param superFunc any
function AttacherJoints:getPowerTakeOffConfigIndex(superFunc) end

---@param superFunc any
---@param xmlFile any
---@param targetKey any
---@param entry any
function AttacherJoints:loadHoseTargetNode(superFunc, xmlFile, targetKey, entry) end

---@param superFunc any
---@param desc any
function AttacherJoints:getIsConnectionTargetUsed(superFunc, desc) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function AttacherJoints:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

function AttacherJoints:onActivate() end

function AttacherJoints:onDeactivate() end

---@param direction any
function AttacherJoints:onReverseDirectionChanged(direction) end

---@param state any
---@param data any
function AttacherJoints:onStateChange(state, data) end

---@param lightsTypesMask any
function AttacherJoints:onLightsTypesMaskChanged(lightsTypesMask) end

---@param state any
function AttacherJoints:onTurnLightStateChanged(state) end

---@param visibility any
function AttacherJoints:onBrakeLightsVisibilityChanged(visibility) end

---@param visibility any
function AttacherJoints:onReverseLightsVisibilityChanged(visibility) end

---@param visibility any
function AttacherJoints:onBeaconLightsVisibilityChanged(visibility) end

---@param brakePedal any
function AttacherJoints:onBrake(brakePedal) end

function AttacherJoints:onTurnedOn() end

function AttacherJoints:onTurnedOff() end

function AttacherJoints:onLeaveVehicle() end

---@param vehicle any
---@param attacherJoint any
---@param inputAttacherVehicle any
---@param inputAttacherJoint any
function AttacherJoints.getAttacherJointCompatibility(vehicle, attacherJoint, inputAttacherVehicle, inputAttacherJoint) end

function AttacherJoints.findVehicleInAttachRange() end

---@param vehicle any
---@param maxDistanceSq any
---@param maxAngle any
---@param fullUpdate any
function AttacherJoints.updateVehiclesInAttachRange(vehicle, maxDistanceSq, maxAngle, fullUpdate) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AttacherJoints.actionEventAttach(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AttacherJoints.actionEventDetach(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AttacherJoints.actionEventLowerImplement(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AttacherJoints.actionEventLowerAllImplements(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
function AttacherJoints.updateActionEvents(self) end

---@param implement any
---@param attacherJointDesc any
---@param inputAttacherJointDesc any
---@param axis any
function AttacherJoints.updateAttacherJointLimits(implement, attacherJointDesc, inputAttacherJointDesc, axis) end

---@param implement any
---@param attacherJointDesc any
---@param axis any
---@param force any
---@param alpha any
function AttacherJoints.updateAttacherJointRotationLimit(implement, attacherJointDesc, axis, force, alpha) end

---@param implement any
---@param attacherJointDesc any
---@param axis any
---@param force any
---@param alpha any
function AttacherJoints.updateAttacherJointTranslationLimit(implement, attacherJointDesc, axis, force, alpha) end

---@param self any
function AttacherJoints.updateRequiredTopLightsState(self) end

---@param _ any
---@param category any
---@param width any
function AttacherJoints.consoleCommandBottomArmWidth(_, category, width) end
