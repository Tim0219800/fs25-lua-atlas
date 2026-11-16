---@meta
-- FS25 1.25.1.0 : utils/FSDensityMapUtil.lua (generated stub, FS25 Lua Atlas)

--- Utility table of static helpers for the terrain density maps (fruit, field type, ground type, spray, weeds, stones, plowing, vines). The SDK dump keeps only signatures, so every behaviour below is inferred from names and parameters. Most functions take a world-space parallelogram (start, width and height corners) and return pixel counts or factors; callers are presumably work-area specializations. UNVERIFIED.
---@class FSDensityMapUtil
FSDensityMapUtil = {}

--- Signature only (no body in the SDK dump): Presumably clears cached density-map modifiers or filters held by the utility; takes no argument. UNVERIFIED.
function FSDensityMapUtil.clearCache() end

--- Signature only (no body in the SDK dump): Given a world position (x, y, z), returns whether it is on a field, a density-bits value and a ground type. UNVERIFIED how these are computed.
---@param x number
---@param y number
---@param z number
---@return boolean
---@return number
---@return number
function FSDensityMapUtil.getFieldDataAtWorldPosition(x, y, z) end

--- Signature only (no body in the SDK dump): Harvests a fruit type over a world parallelogram; returns scaled and total pixel counts, factors (spray, plow, lime, weed, stubble, roller, bee), growth state, max area and a pixel sum. Optional flags: destroy spray, forage minimum, field limit. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Queries the fruit of a given index over a world parallelogram without cutting it; returns a result value, pixel count, total pixels and growth state. Options for preparing and minimum forage state. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Applies a roller pass over a world parallelogram with a given angle and returns a changed value. Exact density layers touched UNVERIFIED.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param angle number?
---@return integer
function FSDensityMapUtil.updateRollerArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, angle) end

--- Signature only (no body in the SDK dump): Applies a grass-roller pass over a world parallelogram, optionally removing stones; returns changed and total pixel counts. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Presumably adds a delta to stone density over a world parallelogram, with optional field and custom filters. No documented return. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Presumably removes stones over a world parallelogram; returns a pixel count and a total pixel count. UNVERIFIED.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return integer
---@return integer
function FSDensityMapUtil.removeStoneArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

--- Signature only (no body in the SDK dump): Presumably reads stone data over a world parallelogram; the only documented return is a filter index. UNVERIFIED.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return integer
function FSDensityMapUtil.getStoneArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

--- Signature only (no body in the SDK dump): Applies a stone-picker pass over a world parallelogram with an angle; returns a stone factor, the area handled and the total area. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Presumably removes field data over a world parallelogram; a flag deleteAll widens what is removed. No documented return. UNVERIFIED.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param deleteAll boolean
function FSDensityMapUtil.removeFieldArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, deleteAll) end

--- Signature only (no body in the SDK dump): Presumably removes field data inside a polygon of vertices; deleteAll flag. UNVERIFIED.
---@param polygonVertices array
---@param deleteAll boolean
function FSDensityMapUtil.removeFieldPolygon(polygonVertices, deleteAll) end

--- Signature only (no body in the SDK dump): Applies a cultivator pass over a world parallelogram, with options to create a field, limit fruit destruction to fields, angle, blocked spray type, weeds and stones; returns changed and total area pixels. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Applies a disc-harrow pass over a world parallelogram, with createField, field-limited destruction, angle and blocked spray type; returns changed and total area. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Applies a plow-packer pass over a world parallelogram with an angle; returns changed and total area pixels. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Applies a subsoiler pass over a world parallelogram, with a forced flag; returns changed and total area. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Applies a plow pass over a world parallelogram, with options for field creation, field-limited destruction, angle, plow level reset and stones; returns changed and total area pixels. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Digs the plow-share furrow in the terrain displacement and clears foliage over a world parallelogram; options for field creation and foliage offset. UNVERIFIED beyond that.
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

--- Signature only (no body in the SDK dump): Presumably resets terrain displacement over a world parallelogram, using two optional filters. UNVERIFIED.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param filter1 DensityMapModifier?
---@param filter2 DensityMapModifier?
function FSDensityMapUtil.resetDisplacementArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, filter1, filter2) end

--- Signature only (no body in the SDK dump): Presumably adds a displacement-reset operation, with two filters, to a given multi-modifier. UNVERIFIED.
---@param multiModifier DensityMapModifier
---@param filter1 DensityMapModifier?
---@param filter2 DensityMapModifier?
function FSDensityMapUtil.multiModifierAddResetDisplacement(multiModifier, filter1, filter2) end

--- Signature only (no body in the SDK dump): Presumably resets terrain displacement for a prebuilt density-map area object, using two optional filters. UNVERIFIED.
---@param densityMapArea DensityMapPolygon
---@param filter1 DensityMapModifier?
---@param filter2 DensityMapModifier?
function FSDensityMapUtil.resetDisplacement(densityMapArea, filter1, filter2) end

--- Signature only (no body in the SDK dump): Destroys common foliage and fruit over a world parallelogram, optionally only on fields, with a deleteAll flag. No documented return. UNVERIFIED.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param onlyOnFields boolean
---@param deleteAll boolean
function FSDensityMapUtil.updateDestroyCommonArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, onlyOnFields, deleteAll) end

--- Signature only (no body in the SDK dump): Presumably applies wheel destruction (crushing of crops) over a world parallelogram. No documented return. UNVERIFIED.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
function FSDensityMapUtil.updateWheelDestructionArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

--- Signature only (no body in the SDK dump): Sets the ground-type layer to a value over a world parallelogram; returns the changed and total pixel counts. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Sets the stubble shred level to a value over a world parallelogram; returns changed and total pixel counts. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Applies a spray type and amount over a world parallelogram; returns pixel count and total pixel count. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Presumably removes spray over a world parallelogram, with a blocked spray type and an optional custom filter. No documented return. UNVERIFIED.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param blockedSprayTypeIndex integer?
---@param customFilter table?
function FSDensityMapUtil.removeSprayArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, blockedSprayTypeIndex, customFilter) end

--- Signature only (no body in the SDK dump): Applies fertilizer of a spray type and amount over a world parallelogram; returns pixel count and total pixel count. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Applies lime over a world parallelogram depending on a ground type; returns an area and the total pixel count. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Applies herbicide over a world parallelogram depending on a ground type; returns an area and total pixels. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Applies a weeder pass over a world parallelogram, with a flag for hoe-type weeders; returns the number of pixels affected. UNVERIFIED.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param isHoeWeeder boolean
---@return integer
function FSDensityMapUtil.updateWeederArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, isHoeWeeder) end

--- Signature only (no body in the SDK dump): Removes weeds over a world parallelogram; returns pixel count and total pixel count. UNVERIFIED.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return integer
---@return integer
function FSDensityMapUtil.removeWeedArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

--- Signature only (no body in the SDK dump): Presumably sets a sparse weed state over a world parallelogram. No documented return. UNVERIFIED.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
function FSDensityMapUtil.setSparseWeedArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

--- Signature only (no body in the SDK dump): Presumably sets the weed state associated with sowing over a world parallelogram. No documented return. UNVERIFIED.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
function FSDensityMapUtil.setSowingWeedArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

--- Signature only (no body in the SDK dump): Presumably sets a weed-blocking state over a world parallelogram, with two optional custom filters. UNVERIFIED.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param customFilter1 DensityMapModifier?
---@param customFilter2 DensityMapModifier?
function FSDensityMapUtil.setWeedBlockingState(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, customFilter1, customFilter2) end

--- Signature only (no body in the SDK dump): Presumably clears the weed-blocking state over a world parallelogram. UNVERIFIED.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
function FSDensityMapUtil.removeWeedBlockingState(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

--- Signature only (no body in the SDK dump): Applies a mulcher pass over a world parallelogram; returns the changed area and the total area. UNVERIFIED.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return number
---@return number
function FSDensityMapUtil.updateMulcherArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

--- Signature only (no body in the SDK dump): Mows a fruit type over a world parallelogram, optionally limited to fields; returns the same set of values as cutFruitArea (pixels, factors, growth state, max area). UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Presumably processes the haulm (stalks) of a fruit over a world parallelogram; returns the number of changed pixels. UNVERIFIED.
---@param fruitId Integer
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return Integer
function FSDensityMapUtil.updateFruitHaulmArea(fruitId, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

--- Signature only (no body in the SDK dump): Returns a stubble value (named area) over a world parallelogram. UNVERIFIED how it is computed.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@return number
function FSDensityMapUtil.getStubbleFactor(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

--- Signature only (no body in the SDK dump): Presumably resets spray over a world parallelogram, with a force flag and an excluded type. No documented return. UNVERIFIED.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param force boolean
---@param excludeType boolean?
function FSDensityMapUtil.resetSprayArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, force, excludeType) end

--- Signature only (no body in the SDK dump): Sows a fruit over a world parallelogram, with field ground type, ridge seeding, angle, growth state and blocked spray type; returns changed and total area pixels. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Direct-sowing variant of sowing over a world parallelogram, same parameter list as updateSowingArea; returns changed and total area pixels. UNVERIFIED how it differs.
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

--- Signature only (no body in the SDK dump): Applies a ridge-former pass over a world parallelogram with an angle; returns changed and total area pixels. UNVERIFIED. Note: its doc comment is titled as sowing, apparently copy-pasted.
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

--- Signature only (no body in the SDK dump): Applies a fruit preparer (haulm topper) over a world parallelogram, with a second drop-area parallelogram and a limit-to-fruit flag; returns the changed pixel count. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Clears decorative foliage over a world parallelogram; returns an area, a total area and a boolean for non-mowable cut. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Creates vine fruit over a world parallelogram, with an optional custom state and a flag to ignore existing fruits; returns an area. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Presumably destroys vine fruit over a world parallelogram. No documented return. UNVERIFIED.
---@param fruitId integer
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
function FSDensityMapUtil.destroyVineArea(fruitId, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

--- Signature only (no body in the SDK dump): Presumably writes a values argument into vine data over a world parallelogram; returns a total area. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Presumably sets a single value on vine data over a world parallelogram. Note: declared with a colon (FSDensityMapUtil:), unlike the other functions, so the first parameter may be shifted if called with a dot. UNVERIFIED.
---@param fruitId integer
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param value integer
function FSDensityMapUtil:setVineAreaValue(fruitId, startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, value) end

--- Signature only (no body in the SDK dump): Harvest-cuts vine over a world parallelogram; returns area, total area and weed, spray, plow and lime factors. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Applies vine preparation over a world parallelogram; returns an area and a total area. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Resets vine over a world parallelogram to a given state; returns an area and a total area. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Applies a vine cultivator pass over a world parallelogram, optionally changing the ground type; returns an area. UNVERIFIED.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param changeGroundType integer
---@return number
function FSDensityMapUtil.updateVineCultivatorArea(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, changeGroundType) end

--- Signature only (no body in the SDK dump): Presumably applies a disaster effect to a prebuilt density-map area, with a perlin percentage argument. No documented return. UNVERIFIED.
---@param densityMapArea DensityMapNodePolygon
---@param perlinPercentage integer
function FSDensityMapUtil.updateDisasterArea(densityMapArea, perlinPercentage) end

--- Signature only (no body in the SDK dump): Erases tire tracks over a world parallelogram. No documented return. UNVERIFIED how.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
function FSDensityMapUtil.eraseTireTrack(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end

--- Signature only (no body in the SDK dump): Counts density over a world parallelogram for a given density-map id, first channel, channel count and value; returns accumulator, matching pixels and total pixels. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Returns the fruit type index (or nil) and growth state at a world x, z position. UNVERIFIED.
---@param x number
---@param z number
---@return nil|integer
---@return integer
function FSDensityMapUtil.getFruitTypeIndexAtWorldPos(x, z) end

--- Signature only (no body in the SDK dump): Returns whether a world x, z position lies on a field. UNVERIFIED.
---@param x number
---@param z number
---@return boolean
function FSDensityMapUtil.getIsFieldAtWorldPos(x, z) end

--- Signature only (no body in the SDK dump): Returns the field type index at a world x, z position. UNVERIFIED.
---@param x number
---@param z number
---@return integer
function FSDensityMapUtil.getFieldTypeAtWorldPos(x, z) end

--- Signature only (no body in the SDK dump): Returns a shared density-map modifier and a filter matching the given field type, for counting its pixels. UNVERIFIED.
---@param fieldType integer
---@return DensityMapModifier
---@return DensityMapFilter
function FSDensityMapUtil.getFieldTypeModifierAndFilter(fieldType) end

--- Signature only (no body in the SDK dump): Counts pixels of a field type over a world parallelogram; returns matching and total pixel counts. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Counts pixels of a field type inside a polygon area; returns matching and total pixel counts. UNVERIFIED.
---@param fieldType integer
---@param area DensityMapPolygon
---@return integer
---@return integer
function FSDensityMapUtil.getFieldTypeAreaInPolygon(fieldType, area) end

--- Signature only (no body in the SDK dump): Returns accumulator, matching and total pixel counts of field density over a world parallelogram. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Returns accumulator, matching and total pixel counts of bush density over a world parallelogram. UNVERIFIED.
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

--- Signature only (no body in the SDK dump): Converts an angle into a density-map angle value using a maximum density value. The return is documented as radians, which looks inconsistent. UNVERIFIED.
---@param angle number
---@param maxDensityValue integer
---@return number
function FSDensityMapUtil.convertToDensityMapAngle(angle, maxDensityValue) end

--- Signature only (no body in the SDK dump): Returns a weed factor over a world parallelogram, for a given fruit index. UNVERIFIED how it is computed.
---@param startWorldX number
---@param startWorldZ number
---@param widthWorldX number
---@param widthWorldZ number
---@param heightWorldX number
---@param heightWorldZ number
---@param fruitIndex integer
---@return number
function FSDensityMapUtil.getWeedFactor(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ, fruitIndex) end

--- Signature only (no body in the SDK dump): Presumably a helper asserting a boolean and emitting a warning message when false. UNVERIFIED.
---@param bool boolean
---@param warning string?
function FSDensityMapUtil.assert(bool, warning) end
