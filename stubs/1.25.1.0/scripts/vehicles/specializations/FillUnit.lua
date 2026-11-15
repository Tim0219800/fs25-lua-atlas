---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FillUnit.lua (generated stub, FS25 Lua Atlas)

---@class FillUnit
FillUnit = {}

---@class FillActivatable
FillActivatable = {}

function FillUnit.initSpecialization() end

---@param schema any
---@param key any
function FillUnit.registerUnitDisplaySchema(schema, key) end

---@param specializations any
function FillUnit.prerequisitesPresent(specializations) end

---@param vehicleType any
function FillUnit.registerEvents(vehicleType) end

---@param vehicleType any
function FillUnit.registerFunctions(vehicleType) end

---@param vehicleType any
function FillUnit.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function FillUnit.registerEventListeners(vehicleType) end

---@param savegame any
function FillUnit:onLoad(savegame) end

---@param savegame any
function FillUnit:onPostLoad(savegame) end

function FillUnit:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function FillUnit:saveToXMLFile(xmlFile, key, usedModNames) end

---@param xmlFile any
---@param key any
function FillUnit:saveStatsToXMLFile(xmlFile, key) end

---@param streamId any
---@param connection any
function FillUnit:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function FillUnit:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function FillUnit:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function FillUnit:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function FillUnit:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function FillUnit:onPostUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function FillUnit:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function FillUnit:onDeactivate() end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function FillUnit:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param dischargeObject any
function FillUnit:onDischargeTargetObjectChanged(dischargeObject) end

function FillUnit:getDrawFirstFillText() end

function FillUnit:getFillUnits() end

---@param fillUnitIndex any
function FillUnit:getFillUnitByIndex(fillUnitIndex) end

---@param fillUnitIndex any
function FillUnit:getFillUnitExists(fillUnitIndex) end

---@param fillUnitIndex any
function FillUnit:getFillUnitCapacity(fillUnitIndex) end

---@param fillUnitIndex integer
---@param fillTypeIndex integer
---@param farmId integer
function FillUnit:getFillUnitFreeCapacity(fillUnitIndex, fillTypeIndex, farmId) end

---@param farmId any
function FillUnit:getIsFillAllowedFromFarm(farmId) end

---@param fillUnitIndex any
function FillUnit:getFillUnitFillLevel(fillUnitIndex) end

---@param fillUnitIndex any
function FillUnit:getFillUnitFillLevelPercentage(fillUnitIndex) end

---@param fillUnitIndex any
function FillUnit:getFillUnitFillType(fillUnitIndex) end

---@param fillUnitIndex any
function FillUnit:getFillUnitLastValidFillType(fillUnitIndex) end

---@param fillUnitIndex any
function FillUnit:getFillUnitFirstSupportedFillType(fillUnitIndex) end

---@param fillUnitIndex any
function FillUnit:getFillUnitExactFillRootNode(fillUnitIndex) end

---@param fillUnitIndex any
function FillUnit:getFillUnitRootNode(fillUnitIndex) end

---@param fillUnitIndex any
function FillUnit:getFillUnitAutoAimTargetNode(fillUnitIndex) end

---@param fillUnitIndex any
---@param fillType any
function FillUnit:getFillUnitSupportsFillType(fillUnitIndex, fillType) end

---@param fillUnitIndex any
---@param toolType any
function FillUnit:getFillUnitSupportsToolType(fillUnitIndex, toolType) end

---@param fillUnitIndex any
---@param toolType any
---@param fillType any
function FillUnit:getFillUnitSupportsToolTypeAndFillType(fillUnitIndex, toolType, fillType) end

---@param fillUnitIndex any
function FillUnit:getFillUnitSupportedFillTypes(fillUnitIndex) end

---@param fillUnitIndex any
function FillUnit:getFillUnitSupportedToolTypes(fillUnitIndex) end

---@param fillUnitIndex any
---@param fillType any
function FillUnit:getFillUnitAllowsFillType(fillUnitIndex, fillType) end

---@param fillUnitIndex any
function FillUnit:getFillTypeChangeThreshold(fillUnitIndex) end

---@param fillType any
---@param ignoreCapacity any
function FillUnit:getFirstValidFillUnitToFill(fillType, ignoreCapacity) end

---@param fillUnitIndex any
---@param fillType any
---@param ignoreCapacity any
function FillUnit:getFillUnitCanBeFilled(fillUnitIndex, fillType, ignoreCapacity) end

---@param fillUnitIndex any
---@param fillTypeIndex any
function FillUnit:setFillUnitFillType(fillUnitIndex, fillTypeIndex) end

---@param fillUnitIndex any
---@param fillTypeIndex any
---@param isPersistent any
function FillUnit:setFillUnitFillTypeToDisplay(fillUnitIndex, fillTypeIndex, isPersistent) end

---@param fillUnitIndex any
---@param fillLevel any
---@param isPersistent any
function FillUnit:setFillUnitFillLevelToDisplay(fillUnitIndex, fillLevel, isPersistent) end

---@param fillUnitIndex any
---@param capacity any
function FillUnit:setFillUnitCapacityToDisplay(fillUnitIndex, capacity) end

---@param fillUnitIndex any
---@param capacity any
---@param noEventSend any
function FillUnit:setFillUnitCapacity(fillUnitIndex, capacity, noEventSend) end

---@param fillUnitIndex any
---@param forcedMaterialFillType any
function FillUnit:setFillUnitForcedMaterialFillType(fillUnitIndex, forcedMaterialFillType) end

---@param fillUnitIndex any
function FillUnit:getFillUnitForcedMaterialFillType(fillUnitIndex) end

---@param fillUnitIndex any
---@param isInRange any
function FillUnit:setFillUnitInTriggerRange(fillUnitIndex, isInRange) end

---@param alarmTriggers any
---@param fillLevelDelta any
function FillUnit:updateAlarmTriggers(alarmTriggers, fillLevelDelta) end

---@param alarmTrigger any
function FillUnit:getAlarmTriggerIsActive(alarmTrigger) end

---@param alarmTrigger any
---@param state any
function FillUnit:setAlarmTriggerState(alarmTrigger, state) end

---@param node any
function FillUnit:getFillUnitIndexFromNode(node) end

---@param node any
function FillUnit:getFillUnitExtraDistanceFromNode(node) end

---@param node any
function FillUnit:getFillUnitFromNode(node) end

---@param ignoreDeleteOnEmptyFlag any
function FillUnit:emptyAllFillUnits(ignoreDeleteOnEmptyFlag) end

---@param xmlFile any
---@param key any
---@param entry any
---@param index any
function FillUnit:loadFillUnitUnloadingFromXML(xmlFile, key, entry, index) end

---@param fillUnitIndex any
function FillUnit:getFillUnitUnloadPalletFilename(fillUnitIndex) end

function FillUnit:getFillUnitHasMountedPalletsToUnload() end

function FillUnit:getFillUnitMountedPalletsToUnload() end

function FillUnit:getFillUnitUnloadingTasks() end

function FillUnit:getFillUnitEmptyOnReset() end

---@param rootVehicle any
function FillUnit:getAllowLoadTriggerActivation(rootVehicle) end

---@param vehicle any
---@param func any
function FillUnit:addExactFillRootAimToUpdate(vehicle, func) end

---@param ignoreWarning any
function FillUnit:unloadFillUnits(ignoreWarning) end

---@param farmId any
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
function FillUnit:addFillUnitFillLevel(farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData) end

---@param fillUnitIndex any
---@param fillType any
---@param force any
function FillUnit:setFillUnitLastValidFillType(fillUnitIndex, fillType, force) end

---@param xmlFile any
---@param key any
---@param entry any
---@param index any
function FillUnit:loadFillUnitFromXML(xmlFile, key, entry, index) end

---@param xmlFile any
---@param key any
---@param alarmTrigger any
---@param fillUnit any
function FillUnit:loadAlarmTrigger(xmlFile, key, alarmTrigger, fillUnit) end

---@param xmlFile any
---@param key any
---@param entry any
function FillUnit:loadMeasurementNode(xmlFile, key, entry) end

---@param fillUnit any
---@param dt any
---@param setActive any
---@param forcedIntensity any
function FillUnit:updateMeasurementNodes(fillUnit, dt, setActive, forcedIntensity) end

---@param xmlFile any
---@param key any
---@param fillPlane any
---@param fillUnit any
function FillUnit:loadFillPlane(xmlFile, key, fillPlane, fillUnit) end

---@param fillUnitIndex any
---@param forcedFillType any
function FillUnit:setFillPlaneForcedFillType(fillUnitIndex, forcedFillType) end

---@param fillUnit any
function FillUnit:updateFillUnitFillPlane(fillUnit) end

---@param xmlFile any
---@param key any
function FillUnit:loadFillTypeMaterials(xmlFile, key) end

---@param fillTypeMaterials any
---@param fillTypeIndex any
function FillUnit:updateFillTypeMaterials(fillTypeMaterials, fillTypeIndex) end

---@param fillUnit any
function FillUnit:updateFillUnitAutoAimTarget(fillUnit) end

---@param trigger table
---@param fillTypeIndex integer
---@param fillUnitIndex any
function FillUnit:addFillUnitTrigger(trigger, fillTypeIndex, fillUnitIndex) end

---@param trigger table
function FillUnit:removeFillUnitTrigger(trigger) end

function FillUnit:updateFillUnitTriggers() end

---@param isFilling any
---@param noEventSend any
function FillUnit:setFillUnitIsFilling(isFilling, noEventSend) end

---@param isPlaying any
function FillUnit:setFillSoundIsPlaying(isPlaying) end

---@param fillUnitIndex any
function FillUnit:getIsFillUnitActive(fillUnitIndex) end

---@param superFunc any
---@param component any
function FillUnit:getAdditionalComponentMass(superFunc, component) end

---@param superFunc function
---@param display table
function FillUnit:getFillLevelInformation(superFunc, display) end

---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function FillUnit:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

---@param superFunc any
function FillUnit:getIsReadyForAutomatedTrainTravel(superFunc) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function FillUnit:loadMovingToolFromXML(superFunc, xmlFile, key, entry) end

---@param superFunc any
---@param movingTool any
function FillUnit:getIsMovingToolActive(superFunc, movingTool) end

---@param superFunc any
function FillUnit:getDoConsumePtoPower(superFunc) end

---@param superFunc any
function FillUnit:getIsPowerTakeOffActive(superFunc) end

---@param superFunc any
function FillUnit:getCanBeTurnedOn(superFunc) end

---@param superFunc any
---@param box any
function FillUnit:showInfo(superFunc, box) end

---@param superFunc any
---@param levelerNode any
---@param xmlFile any
---@param key any
function FillUnit:loadLevelerNodeFromXML(superFunc, levelerNode, xmlFile, key) end

---@param superFunc any
---@param levelerNode any
function FillUnit:getIsLevelerPickupNodeActive(superFunc, levelerNode) end

---@param superFunc table
---@param attacherJoint table
---@param xmlFile string
---@param baseName string
---@param index integer
function FillUnit:loadAttacherJointFromXML(superFunc, attacherJoint, xmlFile, baseName, index) end

---@param superFunc any
---@param vehicle any
---@param attacherJoint any
---@param inputAttacherVehicle any
---@param inputAttacherJoint any
function FillUnit:getIsAttacherJointCompatible(superFunc, vehicle, attacherJoint, inputAttacherVehicle, inputAttacherJoint) end

function FillUnit:debugGetSupportedFillTypesPerFillUnit() end

---@param sources any
---@param currentVehicle any
---@param excludeVehicle any
---@param fillTypes any
function FillUnit.addFillTypeSources(sources, currentVehicle, excludeVehicle, fillTypes) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function FillUnit.loadSpecValueCapacity(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function FillUnit.getSpecValueCapacity(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

---@param xmlFile any
function FillUnit.getCapacityFromXml(xmlFile) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function FillUnit.loadSpecValueFillTypes(xmlFile, customEnvironment, baseDir) end

---@param xmlFile any
function FillUnit.getFillTypeNamesFromXML(xmlFile) end

---@param storeItem any
---@param realItem any
---@param configurations any
function FillUnit.getSpecValueFillTypes(storeItem, realItem, configurations) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function FillUnit.loadSpecValueFillUnitMassData(xmlFile, customEnvironment, baseDir) end

---@param fillUnitMassData any
function FillUnit.getSpecValueStartFillUnitMassByMassData(fillUnitMassData) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function FillUnit.actionEventConsoleFillUnitNext(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function FillUnit.actionEventConsoleFillUnitInc(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function FillUnit.actionEventConsoleFillUnitDec(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function FillUnit.actionEventUnload(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
function FillUnit.updateUnloadActionDisplay(self) end

---@param vehicle any
function FillActivatable.new(vehicle) end

function FillActivatable:getIsActivatable() end

function FillActivatable:run() end

function FillActivatable:activate() end

function FillActivatable:deactivate() end

function FillActivatable:draw() end

---@param isFilling any
function FillActivatable:updateActivateText(isFilling) end

---@param fillTypeIndex any
function FillActivatable:setFillType(fillTypeIndex) end
