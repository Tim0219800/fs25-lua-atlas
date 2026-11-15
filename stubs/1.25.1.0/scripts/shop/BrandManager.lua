---@meta
-- FS25 1.25.1.0 : shop/BrandManager.lua (stub généré, atlas Lua FS25)

---@class BrandManager : AbstractManager
BrandManager = {}

---@param customMt any
---@return table
function BrandManager.new(customMt) end

function BrandManager:initDataStructures() end

---@param missionInfo any
---@return boolean
function BrandManager:loadMapData(missionInfo) end

---@param name string
---@param title string
---@param imageFilename string
---@param baseDir string
---@param isMod boolean
---@param imageShopOverview string?
---@param imageOffset number?
---@return table?
function BrandManager:addBrand(name, title, imageFilename, baseDir, isMod, imageShopOverview, imageOffset) end

---@param brandIndex integer
---@return table
function BrandManager:getBrandByIndex(brandIndex) end

---@param brandIndex integer
---@return string
function BrandManager:getBrandIconByIndex(brandIndex) end

---@param brandName string
---@return table
function BrandManager:getBrandByName(brandName) end

---@param brandName string
---@return integer
function BrandManager:getBrandIndexByName(brandName) end
