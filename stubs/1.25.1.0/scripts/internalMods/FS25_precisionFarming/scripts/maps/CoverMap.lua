---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/maps/CoverMap.lua (generated stub, FS25 Lua Atlas)

--- Precision Farming map class (child of ValueMap) that tracks ground cover per pixel and uses a temporary harvest lock bitmap to detect which pixels were actually harvested. When a harvest finishes, it triggers the harvest updates of the nitrogen, pH and seed rate maps. The class's constructor and loading code are not present in this dump; only the cover update functions are.
---@class CoverMap : ValueMap
CoverMap = {}

--- Builds, then caches per fruit type set and forage flag, the DensityMapMultiModifier used before (preUpdate) or after a harvest. Returns the multi-modifier plus the two shared stats tables for changed and total pixels.
---@param fruitTypes table
---@param preUpdate boolean
---@param useMinForageState boolean
---@param strawChopperActive boolean
---@return DensityMapMultiModifier
---@return table
---@return table
function CoverMap:getCoverUpdateDensityMapModifiers(fruitTypes, preUpdate, useMinForageState, strawChopperActive) end

--- Runs before the harvest: marks pixels in harvestable (or preparable) growth state on the temporary lock map inside the given shape. Returns the index of the fruit type found with changed pixels, or nil, and remembers it as fallback.
---@param fruitTypes table
---@param densityMapShape DensityMapPolygon
---@param useMinForageState boolean?
---@param strawChopperActive boolean
---@return integer?
function CoverMap:preUpdateCoverArea(fruitTypes, densityMapShape, useMinForageState, strawChopperActive) end

--- Runs after the harvest: lowers the cover state on pixels that held fruit and no longer do, and calls harvestUpdate on the nitrogen, pH and seed rate maps when pixels were locked. Clears the lock and returns two booleans (pH map updated, nitrogen map updated).
---@param fruitTypes table
---@param densityMapShape DensityMapPolygon
---@param useMinForageState boolean?
---@param strawChopperActive boolean
---@param usedFruitIndex integer?
---@return boolean
---@return boolean
function CoverMap:postUpdateCoverArea(fruitTypes, densityMapShape, useMinForageState, strawChopperActive, usedFruitIndex) end
