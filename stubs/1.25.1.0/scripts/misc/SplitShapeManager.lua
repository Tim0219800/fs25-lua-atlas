---@meta
-- FS25 1.25.1.0 : misc/SplitShapeManager.lua (generated stub, FS25 Lua Atlas)

---@class SplitShapeManager : AbstractManager
SplitShapeManager = {}

---@param customMt table?
---@return SplitShapeManager
function SplitShapeManager.new(customMt) end

function SplitShapeManager:initDataStructures() end

---@return boolean
function SplitShapeManager:loadMapData() end

---@param name string
---@param l10nKey string
---@param splitTypeIndex integer
---@param pricePerLiter number
---@param woodChipsPerLiter number
---@param allowsWoodHarvester boolean
---@param customEnvironment string?
---@param volumeToLiter number?
---@param woodHarvesterAreaThreshold any
function SplitShapeManager:addSplitType(name, l10nKey, splitTypeIndex, pricePerLiter, woodChipsPerLiter, allowsWoodHarvester, customEnvironment, volumeToLiter, woodHarvesterAreaThreshold) end

---@param index integer
---@return table?
function SplitShapeManager:getSplitTypeByIndex(index) end

---@param index integer
---@return string
function SplitShapeManager:getSplitTypeNameByIndex(index) end
