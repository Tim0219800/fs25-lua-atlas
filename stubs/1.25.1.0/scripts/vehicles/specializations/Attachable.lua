---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Attachable.lua (stub généré, atlas Lua FS25)

---@class Attachable
Attachable = {}

---@param specializations table
---@return boolean
function Attachable.prerequisitesPresent(specializations) end

---@param vehicleType any
function Attachable.registerEvents(vehicleType) end

---@param vehicleType any
function Attachable.registerFunctions(vehicleType) end

---@param vehicleType any
function Attachable.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function Attachable.registerEventListeners(vehicleType) end

function Attachable.initSpecialization() end

---@param schema any
---@param baseName any
function Attachable.registerInputAttacherJointXMLPaths(schema, baseName) end

---@param schema any
---@param key any
function Attachable.registerSupportXMLPaths(schema, key) end

---@param savegame table
function Attachable:onLoad(savegame) end

---@param savegame table
function Attachable:onPostLoad(savegame) end

---@param savegame table
function Attachable:onLoadFinished(savegame) end

---@param savegame table
function Attachable:onPreInitComponentPlacement(savegame) end

function Attachable:onPreDelete() end

function Attachable:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function Attachable:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function Attachable:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function Attachable:onWriteStream(streamId, connection) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Attachable:onUpdateInterpolation(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Attachable:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Attachable:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param xmlFile table
---@param key any
---@param inputAttacherJoint any
---@param index any
function Attachable:loadInputAttacherJoint(xmlFile, key, inputAttacherJoint, index) end

---@param xmlFile table
---@param key string
---@param heightNode table
---@param attacherJointNode any
function Attachable:loadAttacherJointHeightNode(xmlFile, key, heightNode, attacherJointNode) end

---@param heightNode table
---@return boolean
function Attachable:getIsAttacherJointHeightNodeActive(heightNode) end

---@param index any
function Attachable:getInputAttacherJointByJointDescIndex(index) end

---@param node any
function Attachable:getInputAttacherJointIndexByNode(node) end

function Attachable:getAttacherVehicle() end

function Attachable:getShowAttachableMapHotspot() end

function Attachable:getInputAttacherJoints() end

---@param vehicle any
function Attachable:getIsAttachedTo(vehicle) end

function Attachable:getActiveInputAttacherJointDescIndex() end

function Attachable:getActiveInputAttacherJoint() end

---@return boolean
---@return string
function Attachable:getAllowsLowering() end

---@param supportAnimation table
---@param xmlFile XMLFile
---@param key string
function Attachable:loadSupportAnimationFromXML(supportAnimation, xmlFile, key) end

---@param supportAnimation any
function Attachable:getIsSupportAnimationAllowed(supportAnimation) end

function Attachable:getIsReadyToFinishDetachProcess() end

---@param noEventSend any
function Attachable:startDetachProcess(noEventSend) end

---@param defaultIsLowered boolean
---@return boolean
function Attachable:getIsImplementChainLowered(defaultIsLowered) end

---@return boolean
function Attachable:getIsInWorkPosition() end

---@return number
function Attachable:getAttachbleAirConsumerUsage() end

---@return boolean
---@return string
function Attachable:isDetachAllowed() end

---@param farmId integer
---@param attacherVehicle table
---@return boolean
---@return string
function Attachable:isAttachAllowed(farmId, attacherVehicle) end

---@param inputAttacherJoint table
---@return boolean
function Attachable:getIsInputAttacherActive(inputAttacherJoint) end

function Attachable:getSteeringAxleBaseVehicle() end

---@param spec any
---@param xmlFile any
---@param key any
function Attachable:loadSteeringAxleFromXML(spec, xmlFile, key) end

function Attachable:getIsSteeringAxleAllowed() end

---@param entry any
---@param xmlFile any
---@param key any
function Attachable:loadSteeringAngleNodeFromXML(entry, xmlFile, key) end

---@param steeringAngleNode any
---@param angle any
---@param dt any
function Attachable:updateSteeringAngleNode(steeringAngleNode, angle, dt) end

function Attachable:attachableAddToolCameras() end

function Attachable:attachableRemoveToolCameras() end

---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex boolean
---@param loadFromSavegame boolean
function Attachable:preAttach(attacherVehicle, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
---@param loadFromSavegame boolean
function Attachable:postAttach(attacherVehicle, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

---@param attacherVehicle any
---@param implement any
function Attachable:preDetach(attacherVehicle, implement) end

---@param implementIndex any
function Attachable:postDetach(implementIndex) end

---@param lowered boolean
function Attachable:setLowered(lowered) end

---@param doLowering boolean
---@param jointDescIndex any
function Attachable:setLoweredAll(doLowering, jointDescIndex) end

---@param inputAttacherJointIndex integer
---@param widthIndex integer
function Attachable:setToolBottomArmWidthByIndex(inputAttacherJointIndex, widthIndex) end

---@param implement any
---@param dt any
function Attachable:updateInputAttacherJointGraphics(implement, dt) end

---@param needsLowering any
---@param vehicleLoaded any
function Attachable:setIsAdditionalAttachment(needsLowering, vehicleLoaded) end

function Attachable:getIsAdditionalAttachment() end

---@param state any
function Attachable:setIsSupportVehicle(state) end

function Attachable:getIsSupportVehicle() end

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

function Attachable:getLoweringActionEventState() end

function Attachable:getAllowMultipleAttachments() end

function Attachable:resolveMultipleAttachments() end

function Attachable:getBlockFoliageDestruction() end

function Attachable:onDeactivate() end

---@param subSelectionIndex any
function Attachable:onSelect(subSelectionIndex) end

function Attachable:onUnselect() end

---@param superFunc any
function Attachable:findRootVehicle(superFunc) end

---@param superFunc any
function Attachable:getIsActive(superFunc) end

---@param superFunc any
---@return boolean
function Attachable:getIsOperating(superFunc) end

---@param superFunc any
function Attachable:getBrakeForce(superFunc) end

---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function Attachable:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

---@param superFunc any
function Attachable:getCanToggleTurnedOn(superFunc) end

---@param superFunc any
function Attachable:getDeactivateOnLeave(superFunc) end

---@param superFunc any
---@param isTurning any
---@return boolean
function Attachable:getCanAIImplementContinueWork(superFunc, isTurning) end

---@param superFunc any
---@return boolean
---@return string
function Attachable:getAreControlledActionsAllowed(superFunc) end

---@param superFunc any
function Attachable:getActiveFarm(superFunc) end

---@param superFunc any
function Attachable:getCanBeSelected(superFunc) end

---@param superFunc any
---@param defaultIsLowered any
function Attachable:getIsLowered(superFunc, defaultIsLowered) end

---@param superFunc any
---@param object any
---@param objectActorId any
---@param jointNode any
---@param mountType any
---@param forceAcceleration any
function Attachable:mountDynamic(superFunc, object, objectActorId, jointNode, mountType, forceAcceleration) end

---@param superFunc any
function Attachable:getOwnerConnection(superFunc) end

---@param superFunc any
---@param connection any
function Attachable:getIsInUse(superFunc, connection) end

---@param superFunc any
---@param skipCount any
---@param x any
---@param y any
---@param z any
---@param coeff any
---@param connection any
---@param isGuiVisible any
function Attachable:getUpdatePriority(superFunc, skipCount, x, y, z, coeff, connection, isGuiVisible) end

---@param superFunc any
function Attachable:getCanBeReset(superFunc) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param light any
function Attachable:loadAdditionalLightAttributesFromXML(superFunc, xmlFile, key, light) end

---@param superFunc any
---@param light any
function Attachable:getIsLightActive(superFunc, light) end

---@param superFunc any
function Attachable:getIsPowered(superFunc) end

---@param superFunc any
function Attachable:getConnectionHoseConfigIndex(superFunc) end

---@param superFunc any
function Attachable:getIsMapHotspotVisible(superFunc) end

---@param superFunc any
function Attachable:getPowerTakeOffConfigIndex(superFunc) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param group any
function Attachable:loadDashboardGroupFromXML(superFunc, xmlFile, key, group) end

---@param superFunc any
---@param group any
function Attachable:getIsDashboardGroupActive(superFunc, group) end

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

---@param superFunc any
---@return boolean
function Attachable:addToPhysics(superFunc) end

---@param superFunc any
---@return boolean
function Attachable:removeFromPhysics(superFunc) end

---@param direction any
function Attachable:actionControllerLowerImplementEvent(direction) end

---@param state any
---@param data any
function Attachable:onStateChange(state, data) end

---@param rootVehicle table
function Attachable:onRootVehicleChanged(rootVehicle) end

---@param direction any
---@param moveToMiddle any
function Attachable:onFoldStateChanged(direction, moveToMiddle) end

function Attachable:onRegisterAnimationValueTypes() end

---@param i3dNode integer
---@param failedReason table
---@param inputAttacherJoint any
function Attachable:onBottomArmBallsI3DLoaded(i3dNode, failedReason, inputAttacherJoint) end
