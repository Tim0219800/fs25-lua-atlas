---@meta
-- FS25 1.25.1.0 : vehicles/specializations/TreePlanter.lua (stub généré, atlas Lua FS25)

---@class TreePlanter
TreePlanter = {}

---@class TreePlanterActivatable
TreePlanterActivatable = {}

---@param specializations table
---@return boolean
function TreePlanter.prerequisitesPresent(specializations) end

function TreePlanter.initSpecialization() end

---@param vehicleType any
function TreePlanter.registerFunctions(vehicleType) end

---@param vehicleType any
function TreePlanter.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function TreePlanter.registerEventListeners(vehicleType) end

---@param savegame table
function TreePlanter:onLoad(savegame) end

function TreePlanter:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function TreePlanter:saveToXMLFile(xmlFile, key, usedModNames) end

---@param object integer
---@param isDeleting boolean
function TreePlanter:removeMountedObject(object, isDeleting) end

---@param streamId integer
---@param connection Connection
function TreePlanter:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function TreePlanter:onWriteStream(streamId, connection) end

---@param streamId integer
---@param timestamp integer
---@param connection table
function TreePlanter:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function TreePlanter:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TreePlanter:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TreePlanter:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TreePlanter:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function TreePlanter:onTurnedOn() end

function TreePlanter:onTurnedOff() end

---@param isFilling any
function TreePlanter:onFillUnitIsFillingStateChanged(isFilling) end

---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function TreePlanter:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, appliedDelta) end

---@param pallet any
function TreePlanter:onFillUnitUnloadPallet(pallet) end

---@param superFunc any
---@param farmId any
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
function TreePlanter:addFillUnitFillLevel(superFunc, farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData) end

---@param superFunc any
---@param fillUnitIndex any
function TreePlanter:getFillUnitFillLevel(superFunc, fillUnitIndex) end

---@param superFunc any
---@param fillUnitIndex any
function TreePlanter:getFillUnitFillLevelPercentage(superFunc, fillUnitIndex) end

---@param superFunc any
---@param fillUnitIndex any
function TreePlanter:getFillUnitFillType(superFunc, fillUnitIndex) end

---@param superFunc any
---@param fillUnitIndex any
function TreePlanter:getFillUnitCapacity(superFunc, fillUnitIndex) end

---@param superFunc any
---@param fillUnitIndex any
---@param fillType any
function TreePlanter:getFillUnitAllowsFillType(superFunc, fillUnitIndex, fillType) end

---@param superFunc any
---@param fillUnitIndex any
---@param fillTypeIndex any
---@param farmId any
function TreePlanter:getFillUnitFreeCapacity(superFunc, fillUnitIndex, fillTypeIndex, farmId) end

---@param superFunc any
---@param display any
function TreePlanter:getFillLevelInformation(superFunc, display) end

---@param superFunc table
---@param object table
---@return boolean
function TreePlanter:getHasObjectMounted(superFunc, object) end

---@param superFunc any
---@param fillUnitIndex any
function TreePlanter:getFillUnitUnloadPalletFilename(superFunc, fillUnitIndex) end

---@param superFunc any
function TreePlanter:getFillUnitHasMountedPalletsToUnload(superFunc) end

---@param superFunc any
function TreePlanter:getFillUnitMountedPalletsToUnload(superFunc) end

---@param superFunc any
function TreePlanter:getImplementAllowAutomaticSteering(superFunc) end

function TreePlanter:getCanPlantOutsideSeason() end

---@param treeTypeIndex any
---@param treeVariationIndex any
---@param noEventSend any
function TreePlanter:setTreePlanterTreeTypeIndex(treeTypeIndex, treeVariationIndex, noEventSend) end

---@param i3dNode any
---@param failedReason any
---@param args any
---@return integer
---@return table
function TreePlanter:onTreePlanterSaplingLoaded(i3dNode, failedReason, args) end

---@param onLoad any
function TreePlanter:updateTreePlanterFillLevel(onLoad) end

---@param plantLimitToField boolean
---@param noEventSend boolean
function TreePlanter:setPlantLimitToField(plantLimitToField, noEventSend) end

---@param noEventSend any
function TreePlanter:createTree(noEventSend) end

---@param palletObjectId table
---@param noEventSend any
function TreePlanter:loadPallet(palletObjectId, noEventSend) end

---@param superFunc any
---@return number
function TreePlanter:getDirtMultiplier(superFunc) end

---@param superFunc any
---@return number
function TreePlanter:getWearMultiplier(superFunc) end

---@param superFunc table
---@param speedRotatingPart table
---@return boolean
function TreePlanter:getIsSpeedRotatingPartActive(superFunc, speedRotatingPart) end

---@param superFunc any
---@param workArea any
function TreePlanter:getIsWorkAreaActive(superFunc, workArea) end

---@param superFunc any
---@return boolean
function TreePlanter:doCheckSpeedLimit(superFunc) end

---@param superFunc any
function TreePlanter:getCanBeSelected(superFunc) end

---@param object any
function TreePlanter:onDeleteTreePlanterObject(object) end

---@param superFunc any
function TreePlanter:getIsOnField(superFunc) end

---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function TreePlanter:palletTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function TreePlanter:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function TreePlanter.actionEventToggleTreePlanterFieldLimitation(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function TreePlanter.actionEventPlant(self, actionName, inputValue, callbackState, isAnalog) end

---@return number
function TreePlanter.getDefaultSpeedLimit() end

---@param self integer
---@param refNode integer
---@param palletsInTrigger any
---@return table
function TreePlanter.getSaplingPalletInRange(self, refNode, palletsInTrigger) end

---@param treePlanterVehicle table
---@return table
function TreePlanterActivatable.new(treePlanterVehicle) end

---@return boolean
function TreePlanterActivatable:getIsActivatable() end

function TreePlanterActivatable:run() end
