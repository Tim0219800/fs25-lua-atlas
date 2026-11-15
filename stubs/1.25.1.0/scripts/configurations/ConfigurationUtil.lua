---@meta
-- FS25 1.25.1.0 : configurations/ConfigurationUtil.lua (generated stub, FS25 Lua Atlas)

---@class ConfigurationUtil
ConfigurationUtil = {}

---@param manager string
---@param object integer
---@param name string
---@param id integer
function ConfigurationUtil.addBoughtConfiguration(manager, object, name, id) end

---@param object string
---@param name string
---@param id integer
---@return boolean
function ConfigurationUtil.hasBoughtConfiguration(object, name, id) end

---@param object string
---@param name string
---@param id integer
function ConfigurationUtil.setConfiguration(object, name, id) end

---@param object string
---@param configName string
---@param configId integer
---@return table
function ConfigurationUtil.getColorByConfigId(object, configName, configId) end

---@param configFileName string
---@param configName string
---@param configId integer
function ConfigurationUtil.getConfigItemByConfigId(configFileName, configName, configId) end

---@param object table
---@param eventName string
function ConfigurationUtil.raiseConfigurationItemEvent(object, eventName) end

---@param configFileName table
---@param configName string
---@param configId integer
---@return string
function ConfigurationUtil.getSaveIdByConfigId(configFileName, configName, configId) end

---@param itemConfigurations table
---@param configName string
---@param configId integer
---@param xmlFile table
---@param key string
---@param isActive boolean
---@param configurationData table
---@param xmlIndex integer
---@return integer
function ConfigurationUtil.saveConfigurationToXMLFile(itemConfigurations, configName, configId, xmlFile, key, isActive, configurationData, xmlIndex) end

---@param configFileName string
---@param xmlFile table
---@param key string
---@param configurations table
---@param boughtConfigurations table
---@param configurationData table
function ConfigurationUtil.saveConfigurationsToXMLFile(configFileName, xmlFile, key, configurations, boughtConfigurations, configurationData) end

---@param configFileName string
---@param xmlFile table
---@param key string
---@return table
---@return table
---@return table
function ConfigurationUtil.loadConfigurationsFromXMLFile(configFileName, xmlFile, key) end

---@param manager table
---@param streamId integer
---@param connection table
---@param configFileName string
---@return table
---@return table
---@return table
function ConfigurationUtil.readConfigurationsFromStream(manager, streamId, connection, configFileName) end

---@param manager table
---@param streamId integer
---@param connection table
---@param configFileName string
---@param configurations table
---@param boughtConfigurations table
---@param configurationData table
function ConfigurationUtil.writeConfigurationsToStream(manager, streamId, connection, configFileName, configurations, boughtConfigurations, configurationData) end

---@param configFileName string
---@param configurationData1 table
---@param configurationData2 table
---@return boolean
function ConfigurationUtil.getConfigurationDataHasChanged(configFileName, configurationData1, configurationData2) end

---@param configFileName table
---@param configName string
---@param configId string
---@return integer
function ConfigurationUtil.getConfigIdBySaveId(configFileName, configName, configId) end

---@param xmlFile XMLFile
---@param key string
---@param subKey string
---@param param string
---@param defaultValue any
---@param fallbackConfigKey string?
---@param fallbackOldKey string?
---@return any
function ConfigurationUtil.getConfigurationValue(xmlFile, key, subKey, param, defaultValue, fallbackConfigKey, fallbackOldKey) end

---@param xmlFile XMLFile
---@param index integer
---@param key string
---@param defaultKey string?
---@param configurationKey string
---@return string?
---@return integer
function ConfigurationUtil.getXMLConfigurationKey(xmlFile, index, key, defaultKey, configurationKey) end

---@param manager XMLFile
---@param xmlFile XMLFile
---@param key string
---@param baseDir string
---@param customEnvironment string
---@param isMod boolean
---@param storeItem any
---@return table
function ConfigurationUtil.getConfigurationsFromXML(manager, xmlFile, key, baseDir, customEnvironment, isMod, storeItem) end

---@param storeItem table
---@param xmlFile XMLFile
---@param key string
---@param baseDir string
---@param customEnvironment string
---@param isMod boolean
---@return table
function ConfigurationUtil.getConfigurationSetsFromXML(storeItem, xmlFile, key, baseDir, customEnvironment, isMod) end

---@param manager any
---@param configurations any
function ConfigurationUtil.getSubConfigurationsFromConfigurations(manager, configurations) end

---@param configItems table
---@return integer
function ConfigurationUtil.getDefaultConfigIdFromItems(configItems) end

---@param configurations any
---@param configSets any
function ConfigurationUtil.getConfigurationsMatchConfigSets(configurations, configSets) end

---@param configurations any
---@param configSets any
function ConfigurationUtil.getClosestConfigurationSet(configurations, configSets) end

---@param materialId any
function ConfigurationUtil.isColorMetallic(materialId) end
