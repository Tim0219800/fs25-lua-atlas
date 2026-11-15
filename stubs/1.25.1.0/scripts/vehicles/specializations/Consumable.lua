---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Consumable.lua (generated stub, FS25 Lua Atlas)

---@param specializations table
---@return boolean
function Consumable.prerequisitesPresent(specializations) end

function Consumable.initSpecialization() end

---@param vehicleType table
function Consumable.registerEvents(vehicleType) end

---@param vehicleType table
function Consumable.registerFunctions(vehicleType) end

---@param vehicleType table
function Consumable.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType table
function Consumable.registerEventListeners(vehicleType) end

---@param savegame table
function Consumable:onLoad(savegame) end

---@param savegame table
function Consumable:onPostLoad(savegame) end

function Consumable:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function Consumable:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId any
---@param connection any
function Consumable:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function Consumable:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function Consumable:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function Consumable:onWriteUpdateStream(streamId, connection, dirtyMask) end

function Consumable:onDirtyMaskCleared() end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Consumable:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Consumable:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function Consumable:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

---@param isFilling any
function Consumable:onFillUnitIsFillingStateChanged(isFilling) end

---@param fillTypeIndex any
---@param fillUnitIndex any
---@param numTriggers any
function Consumable:onAddedFillUnitTrigger(fillTypeIndex, fillUnitIndex, numTriggers) end

---@param numTriggers any
function Consumable:onRemovedFillUnitTrigger(numTriggers) end

---@param fillUnitIndex any
function Consumable:getConsumableVariationIndexByFillUnitIndex(fillUnitIndex) end

---@param typeIndex any
---@param slotIndex any
---@param variationIndex any
function Consumable:setConsumableSlotVariationIndex(typeIndex, slotIndex, variationIndex) end

---@param typeName any
---@param delta any
---@param consumingInProgress any
---@param fillConsumingSlots any
function Consumable:updateConsumable(typeName, delta, consumingInProgress, fillConsumingSlots) end

---@param typeName any
function Consumable:getConsumableIsAvailable(typeName) end

---@param typeName any
function Consumable:getShowConsumableEmptyWarning(typeName) end

---@param fillTrigger any
---@param fillUnitIndex any
---@param fillType any
function Consumable:getCustomFillTriggerSpeedFactor(fillTrigger, fillUnitIndex, fillType) end

---@param superFunc any
---@param farmId any
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
function Consumable:addFillUnitFillLevel(superFunc, farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, ...) end

---@param superFunc any
---@param fillUnitIndex any
function Consumable:getFillUnitFreeCapacity(superFunc, fillUnitIndex, ...) end

---@param superFunc any
---@param nodes any
function Consumable:collectPalletTensionBeltNodes(superFunc, nodes) end

---@param self any
function Consumable.updateActivatable(self) end
