---@meta
-- FS25 1.25.1.0 : misc/SplitShapeManager.lua (generated stub, FS25 Lua Atlas)

--- Manager (subclass of AbstractManager) holding the registry of wood split types: one descriptor per tree species with title, price per liter, wood chips yield and harvester rules. The 45 vanilla species are hard-coded in loadMapData rather than read from XML. Also keeps an activeYarders table, which is only initialised here.
---@class SplitShapeManager : AbstractManager
SplitShapeManager = {}

--- Constructor: creates the manager on top of AbstractManager, using the given metatable or the default one.
---@param customMt table?
---@return SplitShapeManager
function SplitShapeManager.new(customMt) end

--- Resets the lookup tables typesByIndex and typesByName and the activeYarders list.
function SplitShapeManager:initDataStructures() end

--- Calls the parent loader, then registers all built-in split types (index 1 to 45) through addSplitType with hard-coded prices, chip yields and harvester flags. In development builds it also adds the console command gsSplitTypesExport, which calls exportToXML (not defined in this file, UNVERIFIED). Returns true.
---@return boolean
function SplitShapeManager:loadMapData() end

--- Registers a split type descriptor (name uppercased, translated title, price, chips per liter, harvester permission, harvester area threshold defaulting to 4.5, volumeToLiter defaulting to 1000). Logs an error and returns without adding if the index or the name is already taken.
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

--- Returns the split type descriptor for the index reported by the engine split-type query, or nil if none is registered.
---@param index integer
---@return table?
function SplitShapeManager:getSplitTypeByIndex(index) end

--- Returns the uppercase name of the split type for the given index, or the placeholder string "<NO_SPLIT_TYPE>" when the index is unknown.
---@param index integer
---@return string
function SplitShapeManager:getSplitTypeNameByIndex(index) end
