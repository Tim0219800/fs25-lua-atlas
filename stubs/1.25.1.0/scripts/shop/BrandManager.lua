---@meta
-- FS25 1.25.1.0 : shop/BrandManager.lua (generated stub, FS25 Lua Atlas)

--- Manager (subclass of AbstractManager) that registers machine and product brands from dataS/brands.xml and from mods, and looks them up by index or name. It also publishes a global `Brand` table mapping upper-case names to indices (for example Brand.LIZARD, used as the fallback). It registers the console command gsBrandUsageList, whose handler consoleCommandBrandUsageList is not defined in this file (UNVERIFIED).
---@class BrandManager : AbstractManager
BrandManager = {}

--- Creates the manager and registers the console command gsBrandUsageList, which prints the used brands (handler not in this file, UNVERIFIED).
---@param customMt any
---@return table
function BrandManager.new(customMt) end

--- Resets the brand counter and the name-to-index, name-to-brand and index-to-brand tables, and assigns the global `Brand` to the name-to-index table.
function BrandManager:initDataStructures() end

--- Calls the parent loadMapData, then reads every brand of dataS/brands.xml (name, title with optional $l10n_ translation, images, offset) and registers it with addBrand as a non-mod brand. Returns true.
---@param missionInfo any
---@return boolean
function BrandManager:loadMapData(missionInfo) end

--- Registers a brand. The name is upper-cased and must be a valid index name; title, image and baseDir are required, and the shop-overview image defaults to the main one. Returns the brand table, false on missing data, or nil if invalid or already present.
---@param name string
---@param title string
---@param imageFilename string
---@param baseDir string
---@param isMod boolean
---@param imageShopOverview string?
---@param imageOffset number?
---@return table?
function BrandManager:addBrand(name, title, imageFilename, baseDir, isMod, imageShopOverview, imageOffset) end

--- Returns the brand table for an index, or nil for a nil or unknown index.
---@param brandIndex integer
---@return table
function BrandManager:getBrandByIndex(brandIndex) end

--- Returns the icon file path of the brand with the given index, or nil if the index is nil or unknown.
---@param brandIndex integer
---@return string
function BrandManager:getBrandIconByIndex(brandIndex) end

--- Returns the brand table for a name, matched case-insensitively, or nil.
---@param brandName string
---@return table
function BrandManager:getBrandByName(brandName) end

--- Returns a brand index from a name. Unknown or invalid names log a warning (with a close-match suggestion) and return Brand.LIZARD. A nil name returns nil.
---@param brandName string
---@return integer
function BrandManager:getBrandIndexByName(brandName) end
