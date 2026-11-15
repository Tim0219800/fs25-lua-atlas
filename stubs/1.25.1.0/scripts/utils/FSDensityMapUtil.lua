---@meta
-- FS25 1.25.1.0 : utils/FSDensityMapUtil.lua (stub généré, atlas Lua FS25)

---@class FSDensityMapUtil
FSDensityMapUtil = {}

function FSDensityMapUtil.clearCache() end

---@param x number
---@param y number
---@param z number
---@return boolean
---@return number
---@return number
function FSDensityMapUtil.getFieldDataAtWorldPosition(x, y, z) end

---@param fruitIndex integer
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param destroySpray boolean
---@param useMinForageState boolean?
---@param excludedSprayType boolean?
---@param setsWeeds boolean?
---@param limitToField boolean?
---@return number
---@return number
---@return number
---@return number
---@return number
---@return number
---@return number
---@return number
---@return number
---@return integer
---@return number
---@return number
function FSDensityMapUtil.cutFruitArea(fruitIndex, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, destroySpray, useMinForageState, excludedSprayType, setsWeeds, limitToField) end

---@param fruitIndex integer
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param allowPreparing boolean?
---@param useMinForageState boolean?
---@return integer
---@return number
---@return number
---@return integer
function FSDensityMapUtil.getFruitArea(fruitIndex, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, allowPreparing, useMinForageState) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param angle number?
---@return integer
function FSDensityMapUtil.updateRollerArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, angle) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param removeStones boolean?
---@return integer
---@return integer
function FSDensityMapUtil.updateGrassRollerArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, removeStones) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param delta number
---@param fieldFilter table?
---@param customFilter table?
function FSDensityMapUtil.addStoneArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, delta, fieldFilter, customFilter) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return integer
---@return integer
function FSDensityMapUtil.removeStoneArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return integer
function FSDensityMapUtil.getStoneArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param angle number?
---@return number
---@return number
---@return number
function FSDensityMapUtil.updateStonePickerArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, angle) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param deleteAll boolean
function FSDensityMapUtil.removeFieldArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, deleteAll) end

---@param polygonVertices array
---@param deleteAll boolean
function FSDensityMapUtil.removeFieldPolygon(polygonVertices, deleteAll) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param createField boolean
---@param limitFruitDestructionToField boolean
---@param angle number
---@param blockedSprayTypeIndex integer
---@param setsWeeds boolean?
---@param disableStones boolean?
---@return integer
---@return integer
function FSDensityMapUtil.updateCultivatorArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, createField, limitFruitDestructionToField, angle, blockedSprayTypeIndex, setsWeeds, disableStones) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param createField boolean?
---@param limitFruitDestructionToField boolean?
---@param angle number?
---@param blockedSprayTypeIndex integer
---@return number
---@return number
function FSDensityMapUtil.updateDiscHarrowArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, createField, limitFruitDestructionToField, angle, blockedSprayTypeIndex) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param angle number?
---@return integer
---@return integer
function FSDensityMapUtil.updatePlowPackerArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, angle) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param forced boolean?
---@return number
---@return number
function FSDensityMapUtil.updateSubsoilerArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, forced) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param createField boolean
---@param limitFruitDestructionToField boolean
---@param angle number
---@param resetPlowLevel boolean?
---@param disableStones boolean?
---@return integer
---@return integer
function FSDensityMapUtil.updatePlowArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, createField, limitFruitDestructionToField, angle, resetPlowLevel, disableStones) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param createField boolean
---@param limitFruitDestructionToField boolean
---@param clearFoliageOffset number
function FSDensityMapUtil.updatePlowShareArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, createField, limitFruitDestructionToField, clearFoliageOffset) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param filter1 DensityMapModifier?
---@param filter2 DensityMapModifier?
function FSDensityMapUtil.resetDisplacementArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, filter1, filter2) end

---@param multiModifier DensityMapModifier
---@param filter1 DensityMapModifier?
---@param filter2 DensityMapModifier?
function FSDensityMapUtil.multiModifierAddResetDisplacement(multiModifier, filter1, filter2) end

---@param densityMapArea DensityMapPolygon
---@param filter1 DensityMapModifier?
---@param filter2 DensityMapModifier?
function FSDensityMapUtil.resetDisplacement(densityMapArea, filter1, filter2) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param onlyOnFields boolean
---@param deleteAll boolean
function FSDensityMapUtil.updateDestroyCommonArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, onlyOnFields, deleteAll) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
function FSDensityMapUtil.updateWheelDestructionArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param value DensityValueCompareType
---@return integer
---@return integer
function FSDensityMapUtil.setGroundTypeLayerArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, value) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param value integer
---@return integer
---@return integer
function FSDensityMapUtil.setStubbleShredLevelArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, value) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param sprayTypeIndex integer
---@param sprayAmount number
---@return integer
---@return integer
function FSDensityMapUtil.updateSprayArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, sprayTypeIndex, sprayAmount) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param blockedSprayTypeIndex integer?
---@param customFilter table?
function FSDensityMapUtil.removeSprayArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, blockedSprayTypeIndex, customFilter) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param sprayType table
---@param sprayAmount number
---@return integer
---@return integer
function FSDensityMapUtil.updateFertilizerArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, sprayType, sprayAmount) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param groundType integer
---@return number
---@return integer
function FSDensityMapUtil.updateLimeArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, groundType) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param groundType integer
---@return number
---@return integer
function FSDensityMapUtil.updateHerbicideArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, groundType) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param isHoeWeeder boolean
---@return integer
function FSDensityMapUtil.updateWeederArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, isHoeWeeder) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return integer
---@return integer
function FSDensityMapUtil.removeWeedArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
function FSDensityMapUtil.setSparseWeedArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
function FSDensityMapUtil.setSowingWeedArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param customFilter1 DensityMapModifier?
---@param customFilter2 DensityMapModifier?
function FSDensityMapUtil.setWeedBlockingState(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, customFilter1, customFilter2) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
function FSDensityMapUtil.removeWeedBlockingState(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return number
---@return number
function FSDensityMapUtil.updateMulcherArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param fruitType integer
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param limitToField boolean?
---@return number
---@return number
---@return number
---@return number
---@return number
---@return number
---@return number
---@return number
---@return number
---@return integer
---@return number
---@return number
function FSDensityMapUtil.updateMowerArea(fruitType, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, limitToField) end

---@param fruitId Integer
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return Integer
function FSDensityMapUtil.updateFruitHaulmArea(fruitId, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return number
function FSDensityMapUtil.getStubbleFactor(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param force boolean
---@param excludeType boolean?
function FSDensityMapUtil.resetSprayArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, force, excludeType) end

---@param fruitIndex integer
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param fieldGroundType integer
---@param ridgeSeeding boolean?
---@param angle number?
---@param growthState integer?
---@param blockedSprayTypeIndex integer?
---@return integer
---@return integer
function FSDensityMapUtil.updateSowingArea(fruitIndex, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, fieldGroundType, ridgeSeeding, angle, growthState, blockedSprayTypeIndex) end

---@param fruitIndex integer
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param fieldGroundType integer
---@param ridgeSeeding boolean
---@param angle number?
---@param growthState integer?
---@param blockedSprayTypeIndex integer?
---@return integer
---@return integer
function FSDensityMapUtil.updateDirectSowingArea(fruitIndex, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, fieldGroundType, ridgeSeeding, angle, growthState, blockedSprayTypeIndex) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param angle number?
---@return Integer
---@return Integer
function FSDensityMapUtil.updateRidgeFormerArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, angle) end

---@param fruitId integer
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param startDropWorldX number
---@param startDropWorldZ number
---@param widthDropWorldX number
---@param widthDropWorldZ number
---@param heightDropWorldX number
---@param heightDropWorldZ number
---@param limitToFruit boolean?
---@return integer
function FSDensityMapUtil.updateFruitPreparerArea(fruitId, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, startDropWorldX, startDropWorldZ, widthDropWorldX, widthDropWorldZ, heightDropWorldX, heightDropWorldZ, limitToFruit) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return number
---@return number
---@return boolean
function FSDensityMapUtil.clearDecoArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param fruitId integer
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param customState integer?
---@param ignoreExistingFruits boolean
---@return number
function FSDensityMapUtil.createVineArea(fruitId, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, customState, ignoreExistingFruits) end

---@param fruitId integer
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
function FSDensityMapUtil.destroyVineArea(fruitId, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param fruitId integer
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param values array
---@return number
function FSDensityMapUtil.updateVineAreaValues(fruitId, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, values) end

---@param fruitId integer
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param value integer
function FSDensityMapUtil:setVineAreaValue(fruitId, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, value) end

---@param fruitId interger
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return number
---@return number
---@return number
---@return number
---@return number
---@return number
function FSDensityMapUtil.updateVineCutArea(fruitId, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param fruitId integer
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return number
---@return number
function FSDensityMapUtil.updateVinePrepareArea(fruitId, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param fruitId integer
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param resetState integer
---@return number
---@return number
function FSDensityMapUtil.resetVineArea(fruitId, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, resetState) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param changeGroundType integer
---@return number
function FSDensityMapUtil.updateVineCultivatorArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, changeGroundType) end

---@param densityMapArea DensityMapNodePolygon
---@param perlinPercentage integer
function FSDensityMapUtil.updateDisasterArea(densityMapArea, perlinPercentage) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
function FSDensityMapUtil.eraseTireTrack(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param id integer
---@param firstChannel integer
---@param numChannels integer
---@param value number
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return integer
---@return integer
---@return integer
function FSDensityMapUtil.getAreaDensity(id, firstChannel, numChannels, value, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param x number
---@param z number
---@return nil|integer
---@return integer
function FSDensityMapUtil.getFruitTypeIndexAtWorldPos(x, z) end

---@param x number
---@param z number
---@return boolean
function FSDensityMapUtil.getIsFieldAtWorldPos(x, z) end

---@param x number
---@param z number
---@return integer
function FSDensityMapUtil.getFieldTypeAtWorldPos(x, z) end

---@param fieldType integer
---@return DensityMapModifier
---@return DensityMapFilter
function FSDensityMapUtil.getFieldTypeModifierAndFilter(fieldType) end

---@param fieldType integer
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return integer
---@return integer
function FSDensityMapUtil.getFieldTypeArea(fieldType, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param fieldType integer
---@param area DensityMapPolygon
---@return integer
---@return integer
function FSDensityMapUtil.getFieldTypeAreaInPolygon(fieldType, area) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return integer
---@return integer
---@return integer
function FSDensityMapUtil.getFieldDensity(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return integer
---@return integer
---@return integer
function FSDensityMapUtil.getBushDensity(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

---@param angle number
---@param maxDensityValue integer
---@return number
function FSDensityMapUtil.convertToDensityMapAngle(angle, maxDensityValue) end

---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param fruitIndex integer
---@return number
function FSDensityMapUtil.getWeedFactor(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, fruitIndex) end

---@param bool boolean
---@param warning string?
function FSDensityMapUtil.assert(bool, warning) end
