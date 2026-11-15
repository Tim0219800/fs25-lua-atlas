---@meta
-- FS25 1.25.1.0 : vehicles/Vehicle.lua (generated stub, FS25 Lua Atlas)

---@class Vehicle : Object
Vehicle = {}

---@param name string
function Vehicle.registerInteractionFlag(name) end

---@param vehicleType any
function Vehicle.registerEvents(vehicleType) end

---@param vehicleType any
function Vehicle.registerFunctions(vehicleType) end

function Vehicle.init() end

function Vehicle.postInit() end

function Vehicle.registers() end

---@param schema any
---@param basePath any
function Vehicle.registerComponentXMLPaths(schema, basePath) end

---@param isServer any
---@param isClient any
---@param customMt any
function Vehicle.new(isServer, isClient, customMt) end

---@param filename any
function Vehicle:setFilename(filename) end

---@param configurations any
---@param boughtConfigurations any
---@param configurationData any
function Vehicle:setConfigurations(configurations, boughtConfigurations, configurationData) end

---@param typeDef any
function Vehicle:setType(typeDef) end

---@param loadCallbackFunction any
---@param loadCallbackFunctionTarget any
---@param loadCallbackFunctionArguments any
function Vehicle:setLoadCallback(loadCallbackFunction, loadCallbackFunctionTarget, loadCallbackFunctionArguments) end

function Vehicle:loadCallback() end

---@param vehicleLoadingData any
function Vehicle:load(vehicleLoadingData) end

---@param i3dNode any
---@param failedReason any
---@param arguments any
---@param i3dLoadingId any
function Vehicle:i3dFileLoaded(i3dNode, failedReason, arguments, i3dLoadingId) end

function Vehicle:loadFinished() end

---@param filename any
---@param callOnCreate any
---@param addToPhysics any
---@param asyncCallbackFunction any
---@param asyncCallbackObject any
---@param asyncCallbackArguments any
function Vehicle:loadSubSharedI3DFile(filename, callOnCreate, addToPhysics, asyncCallbackFunction, asyncCallbackObject, asyncCallbackArguments) end

function Vehicle:onFinishedLoading() end

---@param target any
---@return table
function Vehicle:createLoadingTask(target) end

---@param task table
function Vehicle:finishLoadingTask(task) end

---@param immediate any
function Vehicle:delete(immediate) end

---@param forceDelete any
---@param callback any
---@param resetPlayer any
function Vehicle:reset(forceDelete, callback, resetPlayer) end

function Vehicle:getNeedsSaving() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function Vehicle:saveToXMLFile(xmlFile, key, usedModNames) end

---@param xmlFile any
---@param key any
---@return string
function Vehicle:saveStatsToXMLFile(xmlFile, key) end

---@param streamId integer
---@param connection table
---@param objectId any
function Vehicle:readStream(streamId, connection, objectId) end

---@param streamId integer
---@param connection table
function Vehicle:postReadStream(streamId, connection) end

---@param streamId integer
---@param connection table
function Vehicle:writeStream(streamId, connection) end

---@param streamId integer
---@param connection table
function Vehicle:postWriteStream(streamId, connection) end

---@param streamId integer
---@param timestamp integer
---@param connection table
function Vehicle:readUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Vehicle:writeUpdateStream(streamId, connection, dirtyMask) end

---@param dt any
function Vehicle:updateVehicleSpeed(dt) end

---@param dt any
function Vehicle:update(dt) end

---@param dt number
function Vehicle:updateTick(dt) end

---@param dt any
function Vehicle:updateEnd(dt) end

---@param subDraw any
function Vehicle:draw(subDraw) end

function Vehicle:drawUIInfo() end

---@param loadingState any
function Vehicle:setLoadingState(loadingState) end

---@param loadingStep SpecializationLoadStep
function Vehicle:setLoadingStep(loadingStep) end

---@return boolean
function Vehicle:addToPhysics() end

function Vehicle:removeFromPhysics() end

---@param state boolean
function Vehicle:setVisibility(state) end

---@param positionX number
---@param offsetY number
---@param positionZ number
---@param yRot number
function Vehicle:setRelativePosition(positionX, offsetY, positionZ, yRot) end

---@param positionX any
---@param positionY any
---@param positionZ any
---@param xRot any
---@param yRot any
---@param zRot any
---@param componentPositions any
function Vehicle:setAbsolutePosition(positionX, positionY, positionZ, xRot, yRot, zRot, componentPositions) end

---@param position any
function Vehicle:getLimitedVehicleYPosition(position) end

---@param x number
---@param y number
---@param z number
---@param xRot number
---@param yRot number
---@param zRot number
---@param componentIndex integer
---@param changeInterp boolean
function Vehicle:setWorldPosition(x, y, z, xRot, yRot, zRot, componentIndex, changeInterp) end

---@param x number
---@param y number
---@param z number
---@param qx number
---@param qy number
---@param qz number
---@param qw number
---@param componentIndex integer
---@param changeInterp boolean
function Vehicle:setWorldPositionQuaternion(x, y, z, qx, qy, qz, qw, componentIndex, changeInterp) end

---@param componentIndex integer
function Vehicle:setDefaultComponentPosition(componentIndex) end

function Vehicle:resetPositionToTerrainHeight() end

---@param node integer
function Vehicle:getIsNodeActive(node) end

function Vehicle:getPrice() end

---@return number
function Vehicle:getSellPrice() end

---@param storeItem any
---@param age any
---@param operatingTime any
---@param price any
---@param repairPrice any
---@param repaintPrice any
function Vehicle.calculateSellPrice(storeItem, age, operatingTime, price, repairPrice, repaintPrice) end

---@return boolean
function Vehicle:getIsOnField() end

---@param node integer
---@return integer
function Vehicle:getParentComponent(node) end

---@param useAttacherVehicleSpeed boolean
---@return number
function Vehicle:getLastSpeed(useAttacherVehicleSpeed) end

function Vehicle:getDeactivateOnLeave() end

function Vehicle:getIsSynchronized() end

---@param nodeId integer
---@return boolean
function Vehicle:getIsVehicleNode(nodeId) end

---@return boolean
function Vehicle:getIsOperating() end

function Vehicle:getIsActive() end

---@param ignoreSelection any
---@param activeForAI any
function Vehicle:getIsActiveForInput(ignoreSelection, activeForAI) end

function Vehicle:getIsActiveForSound() end

---@param defaultIsLowered any
function Vehicle:getIsLowered(defaultIsLowered) end

function Vehicle:updateWaterInfo() end

---@param nodeId any
---@param x any
---@param y any
---@param z any
---@param distance any
---@param nx any
---@param ny any
---@param nz any
---@param subShapeIndex any
---@param shapeId any
---@param isLast any
function Vehicle:onWaterRaycastCallback(nodeId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end

function Vehicle:setBroken() end

function Vehicle:getVehicleDamage() end

function Vehicle:getRepairPrice() end

function Vehicle:getRepaintPrice() end

function Vehicle:requestActionEventUpdate() end

function Vehicle:removeActionEvents() end

function Vehicle:updateActionEvents() end

---@param excludedVehicle any
function Vehicle:registerActionEvents(excludedVehicle) end

---@param actionEventsTable any
---@param inputAction any
function Vehicle:removeActionEvent(actionEventsTable, inputAction) end

function Vehicle:updateSelectableObjects() end

---@param selectableObjects any
function Vehicle:registerSelectableObjects(selectableObjects) end

---@param subSelection any
function Vehicle:addSubselection(subSelection) end

function Vehicle:clearSubselections() end

function Vehicle:getCanBeSelected() end

function Vehicle:getBlockSelection() end

function Vehicle:getCanToggleSelectable() end

function Vehicle:getRootVehicle() end

function Vehicle:findRootVehicle() end

function Vehicle:getChildVehicles() end

function Vehicle:getChildVehicleHash() end

---@param vehicles any
---@param rootVehicle any
function Vehicle:addChildVehicles(vehicles, rootVehicle) end

---@param secondCall any
function Vehicle:updateVehicleChain(secondCall) end

function Vehicle:unselectVehicle() end

---@param subSelectionIndex any
---@param ignoreActionEventUpdate any
function Vehicle:selectVehicle(subSelectionIndex, ignoreActionEventUpdate) end

---@param vehicle any
---@param subSelectionIndex any
---@param ignoreActionEventUpdate any
function Vehicle:setSelectedVehicle(vehicle, subSelectionIndex, ignoreActionEventUpdate) end

---@param object any
---@param subSelectionIndex any
---@param ignoreActionEventUpdate any
function Vehicle:setSelectedObject(object, subSelectionIndex, ignoreActionEventUpdate) end

function Vehicle:getIsSelected() end

function Vehicle:getSelectedObject() end

function Vehicle:getSelectedVehicle() end

---@param inputs any
function Vehicle:hasInputConflictWithSelection(inputs) end

function Vehicle:setMassDirty() end

function Vehicle:updateMass() end

function Vehicle:getMaxComponentMassReached() end

function Vehicle:getAvailableComponentMass() end

---@param component any
function Vehicle:getAdditionalComponentMass(component) end

---@param onlyGivenVehicle boolean
---@return number
function Vehicle:getTotalMass(onlyGivenVehicle) end

---@param component table
---@return number
function Vehicle:getComponentMass(component) end

function Vehicle:getDefaultMass() end

---@return number
---@return number
---@return number
function Vehicle:getOverallCenterOfMass() end

---@return number
function Vehicle:getVehicleWorldXRot() end

---@return number
---@return number
---@return number
function Vehicle:getVehicleWorldDirection() end

---@param display table
function Vehicle:getFillLevelInformation(display) end

---@param object table
---@return boolean
function Vehicle:getHasObjectMounted(object) end

function Vehicle:activate() end

function Vehicle:deactivate() end

---@param jointDesc table
---@param anchorActor integer
function Vehicle:setComponentJointFrame(jointDesc, anchorActor) end

---@param componentJoint table
---@param axis integer
---@param minLimit number
---@param maxLimit number
function Vehicle:setComponentJointRotLimit(componentJoint, axis, minLimit, maxLimit) end

---@param componentJoint table
---@param axis integer
---@param minLimit number
---@param maxLimit number
function Vehicle:setComponentJointTransLimit(componentJoint, axis, minLimit, maxLimit) end

---@param component table
---@param xmlFile XMLFile
---@param key string
---@param rootPosition table
---@param i integer
---@return boolean
function Vehicle:loadComponentFromXML(component, xmlFile, key, rootPosition, i) end

---@param jointDesc table
---@param xmlFile XMLFile
---@param key string
---@param componentJointI integer
---@param jointNode integer
---@param index1 integer
---@param index2 integer
---@return boolean
function Vehicle:loadComponentJointFromXML(jointDesc, xmlFile, key, componentJointI, jointNode, index1, index2) end

---@param component1 table
---@param component2 table
---@param jointDesc table
---@return boolean
function Vehicle:createComponentJoint(component1, component2, jointDesc) end

---@param xmlFile XMLFile
function Vehicle:loadSchemaOverlay(xmlFile) end

function Vehicle:getAdditionalSchemaText() end

function Vehicle:getUseTurnedOnSchema() end

function Vehicle:dayChanged() end

function Vehicle:periodChanged() end

---@param state any
function Vehicle:raiseStateChange(state, ...) end

function Vehicle:doCheckSpeedLimit() end

function Vehicle:getWorkLoad() end

---@param player any
function Vehicle:interact(player) end

function Vehicle:getInteractionHelp() end

---@param node any
function Vehicle:getDistanceToNode(node) end

function Vehicle:getIsAIActive() end

function Vehicle:getIsPowered() end

function Vehicle:getRequiresPower() end

function Vehicle:getIsInShowroom() end

---@param list any
function Vehicle:addVehicleToAIImplementList(list) end

---@param operatingTime any
---@param isLoading any
function Vehicle:setOperatingTime(operatingTime, isLoading) end

function Vehicle:getOperatingTime() end

---@param targetCollisionMask any
---@param path any
---@param node any
---@param str any
function Vehicle:doCollisionMaskCheck(targetCollisionMask, path, node, str) end

function Vehicle:getIsReadyForAutomatedTrainTravel() end

function Vehicle:getIsAutomaticShiftingAllowed() end

---@param onlyIfWorking boolean
---@return number
---@return boolean
function Vehicle:getSpeedLimit(onlyIfWorking) end

---@return number
function Vehicle:getRawSpeedLimit() end

---@param id any
function Vehicle:onVehicleWakeUpCallback(id) end

function Vehicle:getCanBeMounted() end

---@return number
function Vehicle:getDailyUpkeep() end

---@param storeItem any
---@param age any
---@param operatingTime any
---@param configurations any
function Vehicle.calculateDailyUpkeep(storeItem, age, operatingTime, configurations) end

---@return string
function Vehicle:getUppercaseName() end

function Vehicle:getName() end

function Vehicle:getFullName() end

function Vehicle:getBrand() end

function Vehicle:getImageFilename() end

---@param byPlayer Player
---@return boolean
function Vehicle:getCanBePickedUp(byPlayer) end

function Vehicle:getCanBeReset() end

function Vehicle:getResetPlaces() end

---@return string
---@return string
---@return string
function Vehicle:getResetDialogTexts() end

function Vehicle:getCanBeSold() end

function Vehicle:getCanBeAddedToSales() end

---@return string
function Vehicle:getReloadXML() end

---@param connection any
function Vehicle:getIsInUse(connection) end

function Vehicle:getPropertyState() end

function Vehicle:getAreControlledActionsAvailable() end

function Vehicle:getAreControlledActionsAccessible() end

function Vehicle:getControlledActionIcons() end

---@return boolean
---@return string
function Vehicle:getAreControlledActionsAllowed() end

function Vehicle:playControlledActions() end

function Vehicle:getActionControllerDirection() end

function Vehicle:createMapHotspot() end

function Vehicle:deleteMapHotspot() end

function Vehicle:getMapHotspot() end

function Vehicle:updateMapHotspot() end

function Vehicle:getIsMapHotspotVisible() end

function Vehicle:getShowInVehiclesOverview() end

---@param box any
function Vehicle:showInfo(box) end

---@param xmlFile integer
---@param key string
---@param node integer
---@param object table
function Vehicle:loadObjectChangeValuesFromXML(xmlFile, key, node, object) end

---@param object table
---@param isActive boolean
function Vehicle:setObjectChangeValues(object, isActive) end

function Vehicle:wakeUp() end

---@param alreadySent any
function Vehicle:register(alreadySent) end

function Vehicle:clearDirtyMask() end

---@param farmId any
---@param noEventSend any
function Vehicle:setOwnerFarmId(farmId, noEventSend) end

---@return string
function Vehicle:getUniqueId() end

---@param uniqueId string
function Vehicle:setUniqueId(uniqueId) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Vehicle.actionEventToggleSelection(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Vehicle.actionEventToggleSelectionReverse(self, actionName, inputValue, callbackState, isAnalog) end

---@param storeItem any
---@param realItem any
---@param _ any
---@param saleItem any
function Vehicle.getSpecValueDailyUpkeep(storeItem, realItem, _, saleItem) end

---@param storeItem any
---@param realItem any
---@param _ any
---@param saleItem any
function Vehicle.getSpecValueOperatingTime(storeItem, realItem, _, saleItem) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Vehicle.loadSpecValueWorkingWidth(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
function Vehicle.getSpecValueWorkingWidth(storeItem, realItem) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Vehicle.loadSpecValueWorkingWidthConfig(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Vehicle.getSpecValueWorkingWidthConfig(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Vehicle.loadSpecValueSpeedLimit(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
function Vehicle.getSpecValueSpeedLimit(storeItem, realItem) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Vehicle.loadSpecValueWeight(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Vehicle.getSpecConfigValuesWeight(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Vehicle.getSpecValueWeight(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Vehicle.loadSpecValueAdditionalWeight(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Vehicle.getSpecValueAdditionalWeight(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDirectory any
function Vehicle.loadSpecValueCombinations(xmlFile, customEnvironment, baseDirectory) end

---@param storeItem any
---@param realItem any
function Vehicle.getSpecValueCombinations(storeItem, realItem) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Vehicle.getSpecValueSlots(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
