---@meta
-- FS25 1.25.1.0 : shop/StoreItemUtil.lua (stub généré, atlas Lua FS25)

---@class StoreItemUtil
StoreItemUtil = {}

---@param storeItem table
---@return boolean
function StoreItemUtil.getIsVehicle(storeItem) end

---@param storeItem table
---@return boolean
function StoreItemUtil.getIsAnimal(storeItem) end

---@param storeItem table
---@return boolean
function StoreItemUtil.getIsPlaceable(storeItem) end

---@param storeItem table
---@return boolean
function StoreItemUtil.getIsObject(storeItem) end

---@param storeItem table
---@return boolean
function StoreItemUtil.getIsHandTool(storeItem) end

---@param storeItem table
---@return boolean
function StoreItemUtil.getIsConfigurable(storeItem) end

---@param storeItem table
---@return boolean
function StoreItemUtil.getCanBeShownInConfigScreen(storeItem) end

---@param storeItem table
---@return boolean
function StoreItemUtil.getIsLeasable(storeItem) end

---@param storeItem table
---@param configurationName string
---@return integer
function StoreItemUtil.getDefaultConfigId(storeItem, configurationName) end

---@param storeItem table
---@param configurations table?
---@return integer
function StoreItemUtil.getDefaultPrice(storeItem, configurations) end

---@param storeItem table
---@param configurations table?
---@return integer
function StoreItemUtil.getDailyUpkeep(storeItem, configurations) end

---@param storeItem table
---@param configurations table?
---@param costType string
---@return integer
function StoreItemUtil.getCosts(storeItem, configurations, costType) end

---@param xmlFile XMLFile
---@param storeDataXMLName string
---@param customEnvironment string
---@return table?
function StoreItemUtil.getFunctionsFromXML(xmlFile, storeDataXMLName, customEnvironment) end

---@param item any
function StoreItemUtil.loadSpecsFromXML(item) end

---@param specTypes table
---@param species XMLFile
---@param xmlFile XMLFile
---@param customEnvironment string
---@param baseDirectory any
---@return table
function StoreItemUtil.getSpecsFromXML(specTypes, species, xmlFile, customEnvironment, baseDirectory) end

---@param xmlFile XMLFile
---@param storeDataXMLKey string
---@return integer
function StoreItemUtil.getBrandIndexFromXML(xmlFile, storeDataXMLKey) end

---@param xmlFile XMLFile
---@param storeDataXMLName string
---@return integer
---@return integer
---@return boolean
function StoreItemUtil.getVRamUsageFromXML(xmlFile, storeDataXMLName) end

---@param storeItem any
---@param configName any
---@param configIndex any
function StoreItemUtil.getSubConfigurationIndex(storeItem, configName, configIndex) end

---@param storeItem any
---@param configName any
---@param state any
function StoreItemUtil.getSubConfigurationItems(storeItem, configName, state) end

---@param xmlFilename any
---@param baseName any
---@param rotationOffset any
---@param configurations any
function StoreItemUtil.getSizeValues(xmlFilename, baseName, rotationOffset, configurations) end

---@param xmlFilename any
---@param xmlFile any
---@param baseName any
---@param rotationOffset any
---@param configurations any
function StoreItemUtil.getSizeValuesFromXML(xmlFilename, xmlFile, baseName, rotationOffset, configurations) end

---@param xmlFilename any
---@param xmlFile any
---@param baseName any
---@param baseKey any
---@param elementKey any
---@param configKey any
---@param rotationOffset any
---@param configurations any
---@param defaults any
function StoreItemUtil.getSizeValuesFromXMLByKey(xmlFilename, xmlFile, baseName, baseKey, elementKey, configKey, rotationOffset, configurations, defaults) end

---@param schema any
---@param baseKey any
function StoreItemUtil.registerConfigurationSetXMLPaths(schema, baseKey) end
