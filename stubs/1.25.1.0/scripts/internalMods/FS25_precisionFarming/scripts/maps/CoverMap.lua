---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/maps/CoverMap.lua (stub généré, atlas Lua FS25)

---@class CoverMap : ValueMap
CoverMap = {}

---@param fruitTypes table
---@param preUpdate boolean
---@param useMinForageState boolean
---@param strawChopperActive boolean
---@return DensityMapMultiModifier
---@return table
---@return table
function CoverMap:getCoverUpdateDensityMapModifiers(fruitTypes, preUpdate, useMinForageState, strawChopperActive) end

---@param fruitTypes table
---@param densityMapShape DensityMapPolygon
---@param useMinForageState boolean?
---@param strawChopperActive boolean
---@return integer?
function CoverMap:preUpdateCoverArea(fruitTypes, densityMapShape, useMinForageState, strawChopperActive) end

---@param fruitTypes table
---@param densityMapShape DensityMapPolygon
---@param useMinForageState boolean?
---@param strawChopperActive boolean
---@param usedFruitIndex integer?
---@return boolean
---@return boolean
function CoverMap:postUpdateCoverArea(fruitTypes, densityMapShape, useMinForageState, strawChopperActive, usedFruitIndex) end
