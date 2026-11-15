---@meta
-- FS25 1.25.1.0 : shop/StoreManager.lua (generated stub, FS25 Lua Atlas)

---@class StoreManager : AbstractManager
StoreManager = {}

---@param customMt any
---@return table
function StoreManager.new(customMt) end

function StoreManager:initDataStructures() end

---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function StoreManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

function StoreManager:unloadMapData() end

---@param filename any
---@param baseDirectory any
---@param customEnvironment any
function StoreManager:loadItemsFromXML(filename, baseDirectory, customEnvironment) end

---@param xmlFile table
---@param key string
---@param baseDir string
---@param customEnv any
---@param isMod any
function StoreManager:loadCategoryFromXML(xmlFile, key, baseDir, customEnv, isMod) end

---@param name string
---@param title string
---@param imageFilename string
---@param categoryTypeName string
---@param baseDir string
---@param insertAfter string
---@return boolean
function StoreManager:addCategory(name, title, imageFilename, categoryTypeName, baseDir, insertAfter) end

---@param name string
---@return table
function StoreManager:getCategoryByName(name) end

---@param name any
---@param title any
---@param iconFilename any
---@param iconUVs any
---@param baseDir any
---@param iconSliceId any
function StoreManager:addConstructionCategory(name, title, iconFilename, iconUVs, baseDir, iconSliceId) end

---@param name any
function StoreManager:getConstructionCategoryByName(name) end

---@param categoryName any
---@param name any
---@param title any
---@param iconFilename any
---@param iconUVs any
---@param baseDir any
---@param iconSliceId any
function StoreManager:addConstructionTab(categoryName, name, title, iconFilename, iconUVs, baseDir, iconSliceId) end

---@param name any
---@param categoryName any
function StoreManager:getConstructionTabByName(name, categoryName) end

function StoreManager:getConstructionCategories() end

---@param name string
---@param profile string?
---@param loadFunc function?
---@param getValueFunc function
---@param species integer
---@param relatedConfigurations table?
---@param configDataFunc function?
function StoreManager:addSpecType(name, profile, loadFunc, getValueFunc, species, relatedConfigurations, configDataFunc) end

---@return table
function StoreManager:getSpecTypes() end

---@param name string
---@return table
function StoreManager:getSpecTypeByName(name) end

---@param profile string
---@return table
function StoreManager:getSpecTypeByProfile(profile) end

---@param storeItem table
---@return boolean
function StoreManager:addItem(storeItem) end

---@param index integer
function StoreManager:removeItemByIndex(index) end

---@return table
function StoreManager:getItems() end

---@param index integer
---@return table
function StoreManager:getItemByIndex(index) end

---@param xmlFilename string
---@return table
function StoreManager:getItemByXMLFilename(xmlFilename) end

---@param storeItem table
---@return boolean
function StoreManager:getIsItemUnlocked(storeItem) end

---@param combinationData table
---@return table
function StoreManager:getItemsByCombinationData(combinationData) end

---@param customEnvironment string
---@return table
function StoreManager:getItemByCustomEnvironment(customEnvironment) end

---@param xmlFilename any
---@param baseDir any
---@param customEnvironment any
---@param isMod any
---@param isBundleItem any
---@param dlcTitle any
function StoreManager:addModStoreItem(xmlFilename, baseDir, customEnvironment, isMod, isBundleItem, dlcTitle) end

---@param rawXMLFilename string
---@param baseDir string
---@param customEnvironment string
---@param isMod boolean
---@param isBundleItem boolean
---@param dlcTitle string?
---@param extraContentId any
---@param ignoreAdd any
---@return table
function StoreManager:loadItem(rawXMLFilename, baseDir, customEnvironment, isMod, isBundleItem, dlcTitle, extraContentId, ignoreAdd) end

---@param name string
---@param title string
---@param imageFilename string
---@param baseDir string
---@return boolean
function StoreManager:addPack(name, title, imageFilename, baseDir) end

---@param name any
---@param title any
---@param imageFilename any
---@param baseDir any
---@param storeItems any
function StoreManager:addModStorePack(name, title, imageFilename, baseDir, storeItems) end

---@param name string
---@param itemFilename string
function StoreManager:addPackItem(name, itemFilename) end

function StoreManager:getPacks() end

---@param name string
function StoreManager:getPackItems(name) end

function StoreManager:consoleCommandReloadStoreItems() end

---@param schema XMLSchema
---@param basePath string
function StoreManager.registerStoreDataXMLPaths(schema, basePath) end
