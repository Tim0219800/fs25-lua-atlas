---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Foldable.lua (generated stub, FS25 Lua Atlas)

---@class Foldable
Foldable = {}

---@param specializations any
function Foldable.prerequisitesPresent(specializations) end

function Foldable.initSpecialization() end

---@param schema any
---@param basePath any
function Foldable.registerFoldingXMLPaths(schema, basePath) end

---@param vehicleType any
function Foldable.registerEvents(vehicleType) end

---@param vehicleType any
function Foldable.registerFunctions(vehicleType) end

---@param vehicleType any
function Foldable.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function Foldable.registerEventListeners(vehicleType) end

---@param savegame any
function Foldable:onLoad(savegame) end

---@param savegame any
function Foldable:onPostLoad(savegame) end

function Foldable:onRegistered() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function Foldable:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId any
---@param connection any
function Foldable:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function Foldable:onWriteStream(streamId, connection) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Foldable:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Foldable:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param xmlFile table
---@param baseKey string
---@param foldingPart table
---@return boolean
function Foldable:loadFoldingPartFromXML(xmlFile, baseKey, foldingPart) end

---@param direction any
---@param noEventSend any
function Foldable:setFoldDirection(direction, noEventSend) end

---@param direction any
---@param moveToMiddle any
---@param noEventSend any
function Foldable:setFoldState(direction, moveToMiddle, noEventSend) end

---@param doLowering any
function Foldable:setFoldMiddleState(doLowering) end

function Foldable:getIsUnfolded() end

function Foldable:getFoldAnimTime() end

---@param isAllowed boolean
function Foldable:setIsFoldActionAllowed(isAllowed) end

---@return boolean
function Foldable:getIsFoldActionAllowed() end

---@param direction integer
---@param onAiTurnOn boolean
---@return boolean
---@return string
function Foldable:getIsFoldAllowed(direction, onAiTurnOn) end

function Foldable:getIsFoldMiddleAllowed() end

function Foldable:getToggledFoldDirection() end

function Foldable:getToggledFoldMiddleDirection() end

---@param self any
function Foldable.getIsVehicleControlAllowed(self) end

---@param superFunc any
function Foldable:allowLoadMovingToolStates(superFunc) end

---@param superFunc any
---@param speedRotatingPart any
---@param xmlFile any
---@param key any
function Foldable:loadSpeedRotatingPartFromXML(superFunc, speedRotatingPart, xmlFile, key) end

---@param superFunc any
---@param speedRotatingPart any
function Foldable:getIsSpeedRotatingPartActive(superFunc, speedRotatingPart) end

---@param superFunc any
---@param compensationNode any
---@param xmlFile any
---@param key any
function Foldable:loadSlopeCompensationNodeFromXML(superFunc, compensationNode, xmlFile, key) end

---@param superFunc any
---@param compensationNode any
function Foldable:getSlopeCompensationAngleScale(superFunc, compensationNode) end

---@param superFunc any
---@param wheel any
function Foldable:loadWheelFromXML(superFunc, wheel) end

---@param superFunc any
---@param wheel any
function Foldable:getIsVersatileYRotActive(superFunc, wheel) end

---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function Foldable:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

---@param superFunc any
---@param workArea any
function Foldable:getIsWorkAreaActive(superFunc, workArea) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param groundReferenceNode any
function Foldable:loadGroundReferenceNode(superFunc, xmlFile, key, groundReferenceNode) end

---@param superFunc any
---@param groundReferenceNode any
function Foldable:updateGroundReferenceNode(superFunc, groundReferenceNode) end

---@param superFunc any
---@param levelerNode any
---@param xmlFile any
---@param key any
function Foldable:loadLevelerNodeFromXML(superFunc, levelerNode, xmlFile, key) end

---@param superFunc any
---@param levelerNode any
function Foldable:getIsLevelerPickupNodeActive(superFunc, levelerNode) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function Foldable:loadMovingToolFromXML(superFunc, xmlFile, key, entry) end

---@param superFunc any
---@param movingTool any
function Foldable:getIsMovingToolActive(superFunc, movingTool) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function Foldable:loadMovingPartFromXML(superFunc, xmlFile, key, entry) end

---@param superFunc any
---@param movingPart any
function Foldable:getIsMovingPartActive(superFunc, movingPart) end

---@param superFunc any
function Foldable:getCanBeTurnedOn(superFunc) end

---@param superFunc any
---@param nextState any
function Foldable:getIsNextCoverStateAllowed(superFunc, nextState) end

---@param superFunc any
---@param nextState any
function Foldable:getIsNextCoverStateAllowedWarning(superFunc, nextState) end

---@param superFunc any
function Foldable:getIsInWorkPosition(superFunc) end

---@param superFunc any
function Foldable:getTurnedOnNotAllowedWarning(superFunc) end

---@param superFunc any
---@return boolean
---@return string
function Foldable:isDetachAllowed(superFunc) end

---@param superFunc integer
---@param farmId integer
---@param attacherVehicle table
---@return boolean
---@return string
function Foldable:isAttachAllowed(superFunc, farmId, attacherVehicle) end

---@param superFunc any
---@return boolean
---@return string
function Foldable:getAllowsLowering(superFunc) end

---@param superFunc any
---@param default any
function Foldable:getIsLowered(superFunc, default) end

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

---@param superFunc any
---@param xmlFile any
---@param key any
---@param adjustedNode any
function Foldable:loadGroundAdjustedNodeFromXML(superFunc, xmlFile, key, adjustedNode) end

---@param superFunc any
---@param adjustedNode any
---@param ignoreAttachState any
function Foldable:getIsGroundAdjustedNodeActive(superFunc, adjustedNode, ignoreAttachState) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param sprayType any
function Foldable:loadSprayTypeFromXML(superFunc, xmlFile, key, sprayType) end

---@param superFunc any
---@param sprayType any
function Foldable:getIsSprayTypeActive(superFunc, sprayType) end

---@param superFunc any
function Foldable:getCanBeSelected(superFunc) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param inputAttacherJoint any
---@param index any
function Foldable:loadInputAttacherJoint(superFunc, xmlFile, key, inputAttacherJoint, index) end

---@param superFunc table
---@param inputAttacherJoint table
---@return boolean
function Foldable:getIsInputAttacherActive(superFunc, inputAttacherJoint) end

---@param superFunc any
---@param xmlFile any
function Foldable:loadAdditionalCharacterFromXML(superFunc, xmlFile) end

---@param superFunc any
function Foldable:getIsAdditionalCharacterActive(superFunc) end

---@param superFunc any
function Foldable:getAllowDynamicMountObjects(superFunc) end

---@param superFunc table
---@param supportAnimation integer
---@param xmlFile integer
---@param key string
function Foldable:loadSupportAnimationFromXML(superFunc, supportAnimation, xmlFile, key) end

---@param superFunc any
---@param supportAnimation any
function Foldable:getIsSupportAnimationAllowed(superFunc, supportAnimation) end

---@param superFunc any
---@param spec any
---@param xmlFile any
---@param key any
function Foldable:loadSteeringAxleFromXML(superFunc, spec, xmlFile, key) end

---@param superFunc any
function Foldable:getIsSteeringAxleAllowed(superFunc) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
---@param index any
function Foldable:loadFillUnitFromXML(superFunc, xmlFile, key, entry, index) end

---@param superFunc any
---@param fillUnitIndex any
---@param toolType any
function Foldable:getFillUnitSupportsToolType(superFunc, fillUnitIndex, toolType) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param turnedOnAnimation any
function Foldable:loadTurnedOnAnimationFromXML(superFunc, xmlFile, key, turnedOnAnimation) end

---@param superFunc any
---@param turnedOnAnimation any
function Foldable:getIsTurnedOnAnimationActive(superFunc, turnedOnAnimation) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param heightNode any
---@param attacherJointNode any
function Foldable:loadAttacherJointHeightNode(superFunc, xmlFile, key, heightNode, attacherJointNode) end

---@param superFunc any
---@param heightNode any
function Foldable:getIsAttacherJointHeightNodeActive(superFunc, heightNode) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param spec any
function Foldable:loadPickupFromXML(superFunc, xmlFile, key, spec) end

---@param superFunc any
---@param spec any
---@param newState any
function Foldable:getCanChangePickupState(superFunc, spec, newState) end

---@param superFunc table
---@param xmlFile table
---@param key string
---@param target any
---@return boolean
function Foldable:loadCutterTiltFromXML(superFunc, xmlFile, key, target) end

---@param superFunc any
---@param automaticTilt any
---@return boolean
---@return boolean
function Foldable:getCutterTiltIsActive(superFunc, automaticTilt) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param prunerNode any
function Foldable:loadPreprunerNodeFromXML(superFunc, xmlFile, key, prunerNode) end

---@param superFunc any
---@param prunerNode any
function Foldable:getIsPreprunerNodeActive(superFunc, prunerNode) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param shovelNode any
function Foldable:loadShovelNode(superFunc, xmlFile, key, shovelNode) end

---@param superFunc any
---@param shovelNode any
function Foldable:getShovelNodeIsActive(superFunc, shovelNode) end

---@param superFunc any
---@param entry any
---@param xmlFile any
---@param key any
function Foldable:loadSteeringAngleNodeFromXML(superFunc, entry, xmlFile, key) end

---@param superFunc any
---@param steeringAngleNode any
---@param angle any
---@param dt any
function Foldable:updateSteeringAngleNode(superFunc, steeringAngleNode, angle, dt) end

---@param superFunc any
---@param headerTilt any
---@param xmlFile any
---@param key any
function Foldable:loadWoodHarvesterHeaderTiltFromXML(superFunc, headerTilt, xmlFile, key) end

---@param superFunc any
---@param headerTilt any
function Foldable:getIsWoodHarvesterTiltStateAllowed(superFunc, headerTilt) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param suspensionNode any
function Foldable:loadSuspensionNodeFromXML(superFunc, xmlFile, key, suspensionNode) end

---@param superFunc any
---@param suspensionNode any
function Foldable:getIsSuspensionNodeActive(superFunc, suspensionNode) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param mode any
function Foldable:loadCrabSteeringModeFromXML(superFunc, xmlFile, key, mode) end

---@param superFunc any
---@param mode any
function Foldable:getCrabSteeringModeAvailable(superFunc, mode) end

---@param superFunc any
function Foldable:getCanToggleCrabSteering(superFunc) end

---@param superFunc any
---@param wheelChock any
---@param xmlObject any
---@param key any
function Foldable:onLoadWheelChockFromXML(superFunc, wheelChock, xmlObject, key) end

---@param superFunc any
---@param wheelChock any
function Foldable:getIsWheelChockAllowed(superFunc, wheelChock) end

---@param superFunc any
---@param spec any
---@param xmlFile any
---@param key any
function Foldable:loadCraneShovelFromXML(superFunc, spec, xmlFile, key) end

---@param superFunc any
---@param spec any
function Foldable:getCraneShovelStateChangedAllowed(superFunc, spec) end

---@param superFunc any
function Foldable:getBrakeForce(superFunc) end

---@param superFunc any
function Foldable:getRequiresPower(superFunc) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Foldable:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param trigger any
---@param name any
---@param xmlFile any
---@param key any
function Foldable:onRegisterExternalActionEvents(trigger, name, xmlFile, key) end

---@param superFunc any
---@param isTurning any
function Foldable:getCanAIImplementContinueWork(superFunc, isTurning) end

---@param superFunc any
function Foldable:getIsAIReadyToDrive(superFunc) end

---@param superFunc any
function Foldable:getIsAIPreparingToDrive(superFunc) end

function Foldable:onDeactivate() end

---@param doLowering any
---@param jointDescIndex any
function Foldable:onSetLoweredAll(doLowering, jointDescIndex) end

---@param attacherVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
function Foldable:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

---@param rootVehicle table
function Foldable:onRootVehicleChanged(rootVehicle) end

---@param direction any
function Foldable:actionControllerFoldEvent(direction) end

---@param direction any
function Foldable:actionControllerLowerEvent(direction) end

---@param direction any
function Foldable:actionControllerLowerEventAIStart(direction) end

---@param attacherVehicle table
---@param implement table
function Foldable:onPreDetach(attacherVehicle, implement) end

---@param object table
---@param inputJointDescIndex table
---@param jointDescIndex any
---@param loadFromSavegame any
function Foldable:onPreAttachImplement(object, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

---@param implement table
function Foldable:onPreDetachImplement(implement) end

---@param dynamicMountType any
---@param mountObject any
function Foldable:onDynamicMountTypeChanged(dynamicMountType, mountObject) end

---@param self any
---@param animTime any
---@param placeComponents any
---@param playSounds any
function Foldable.setAnimTime(self, animTime, placeComponents, playSounds) end

---@param self any
function Foldable.updateActionEventFold(self) end

---@param self any
function Foldable.updateActionEventFoldMiddle(self) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Foldable.actionEventFold(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Foldable.actionEventFoldMiddle(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Foldable.actionEventFoldAll(self, actionName, inputValue, callbackState, isAnalog) end

---@param data any
---@param vehicle any
function Foldable.externalActionEventRegister(data, vehicle) end

---@param data any
---@param vehicle any
function Foldable.externalActionEventUpdate(data, vehicle) end
