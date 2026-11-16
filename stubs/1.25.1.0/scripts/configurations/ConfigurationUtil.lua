---@meta
-- FS25 1.25.1.0 : configurations/ConfigurationUtil.lua (generated stub, FS25 Lua Atlas)

--- Static helpers for configurations (selectable options) of store items such as vehicles and placeables. They track bought and active configurations on an object, save and load them in savegame XML, send them over the network, parse configuration and configuration-set definitions from store XML, and pick fallbacks when a saved id no longer exists. They rely on g_storeManager, a configuration manager and configuration item classes defined elsewhere. The constant ConfigurationUtil.SEND_NUM_BITS is used here but defined outside this file (UNVERIFIED).
---@class ConfigurationUtil
ConfigurationUtil = {}

--- Marks configuration id `id` of type `name` as bought on the object, creating the sub-table if needed. Does nothing if the manager does not know that configuration name.
---@param manager string
---@param object integer
---@param name string
---@param id integer
function ConfigurationUtil.addBoughtConfiguration(manager, object, name, id) end

--- Returns true if the object has the given configuration id marked as bought for that configuration name, false otherwise.
---@param object string
---@param name string
---@param id integer
---@return boolean
function ConfigurationUtil.hasBoughtConfiguration(object, name, id) end

--- Stores the active configuration id for a configuration name on the object. No validation is done.
---@param object string
---@param name string
---@param id integer
function ConfigurationUtil.setConfiguration(object, name, id) end

--- Looks up the store item of the object and, if the chosen configuration is a VehicleConfigurationItemColor, returns its color; otherwise returns nil. Also returns nil when the id is nil.
---@param object string
---@param configName string
---@param configId integer
---@return table
function ConfigurationUtil.getColorByConfigId(object, configName, configId) end

--- Returns the configuration item object for a store XML file, configuration name and id, or nil when any of them is missing. Errors if the store item is not found, since it is indexed without a nil check.
---@param configFileName string
---@param configName string
---@param configId integer
function ConfigurationUtil.getConfigItemByConfigId(configFileName, configName, configId) end

--- For each of the object's sorted configuration names, calls the method named `eventName` on the currently selected configuration item, passing the object and the config id, when that method exists.
---@param object table
---@param eventName string
function ConfigurationUtil.raiseConfigurationItemEvent(object, eventName) end

--- Returns the saveId string of a configuration item identified by store XML file, name and numeric id, or nil if it cannot be found.
---@param configFileName table
---@param configName string
---@param configId integer
---@return string
function ConfigurationUtil.getSaveIdByConfigId(configFileName, configName, configId) end

--- Writes one configuration item to `key(xmlIndex)` through its saveToXMLFile, with its optional extra data, and returns the incremented index. Returns the index unchanged if the item does not exist.
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

--- Saves every bought configuration of an object to the savegame XML, flagging as active the one matching the current selection. Does nothing if the store item has no configurations.
---@param configFileName string
---@param xmlFile table
---@param key string
---@param configurations table
---@param boughtConfigurations table
---@param configurationData table
function ConfigurationUtil.saveConfigurationsToXMLFile(configFileName, xmlFile, key, configurations, boughtConfigurations, configurationData) end

--- Reads saved configurations by name and saveId. If a saveId is gone it tries the item class getFallbackConfigId, then the first selectable item. Returns the active configurations, bought configurations and per-item data tables.
---@param configFileName string
---@param xmlFile table
---@param key string
---@return table
---@return table
---@return table
function ConfigurationUtil.loadConfigurationsFromXMLFile(configFileName, xmlFile, key) end

--- Network read counterpart of writeConfigurationsToStream: rebuilds the configuration, bought and data tables from the stream, converting zero-based wire ids to one-based. Logs an error if an item is missing on the client.
---@param manager table
---@param streamId integer
---@param connection table
---@param configFileName string
---@return table
---@return table
---@return table
function ConfigurationUtil.readConfigurationsFromStream(manager, streamId, connection, configFileName) end

--- Writes bought configurations to a network stream: type count, then per type its index, its ids, an active flag and, if the item has writeToStream, its extra data. Ids are sent zero-based.
---@param manager table
---@param streamId integer
---@param connection table
---@param configFileName string
---@param configurations table
---@param boughtConfigurations table
---@param configurationData table
function ConfigurationUtil.writeConfigurationsToStream(manager, streamId, connection, configFileName, configurations, boughtConfigurations, configurationData) end

--- Compares two configuration data tables and returns true if one is nil and the other not, an entry is missing from the second, or an item's hasDataChanged reports a difference. Only entries of the first table are checked.
---@param configFileName string
---@param configurationData1 table
---@param configurationData2 table
---@return boolean
function ConfigurationUtil.getConfigurationDataHasChanged(configFileName, configurationData1, configurationData2) end

--- Converts a saveId to the configuration index. Falls back to the item class getFallbackConfigId, then the first selectable item, and finally returns 1 if nothing matches.
---@param configFileName table
---@param configName string
---@param configId string
---@return integer
function ConfigurationUtil.getConfigIdBySaveId(configFileName, configName, configId) end

--- Reads `key..subKey..param` from the XML, then the fallback config key, then the old-style key, and returns the first found value or the default. Prints a callstack if subKey is a table.
---@param xmlFile XMLFile
---@param key string
---@param subKey string
---@param param string
---@param defaultValue any
---@param fallbackConfigKey string?
---@param fallbackOldKey string?
---@return any
function ConfigurationUtil.getConfigurationValue(xmlFile, key, subKey, param, defaultValue, fallbackConfigKey, fallbackOldKey) end

--- Returns the XML key of the configuration entry for a one-based index (default 1) plus that index. Falls back to the `(0)` entry, then to defaultKey, and warns if an explicit index is not present.
---@param xmlFile XMLFile
---@param index integer
---@param key string
---@param defaultKey string?
---@param configurationKey string
---@return string?
---@return integer
function ConfigurationUtil.getXMLConfigurationKey(xmlFile, index, key, defaultKey, configurationKey) end

--- For every registered configuration type, loads its items from the store XML using the item class (preLoad, new, setIndex, loadFromXML, postLoad). Returns the item lists and default ids per type, or nil, nil if none exist.
---@param manager XMLFile
---@param xmlFile XMLFile
---@param key string
---@param baseDir string
---@param customEnvironment string
---@param isMod boolean
---@param storeItem any
---@return table
function ConfigurationUtil.getConfigurationsFromXML(manager, xmlFile, key, baseDir, customEnvironment, isMod, storeItem) end

--- Parses the `configurationSets` block of a store XML into a list of sets with name, default flag, title override, yes/no option flag and a map of configuration name to index. Invalid names or indices produce XML warnings.
---@param storeItem table
---@param xmlFile XMLFile
---@param key string
---@param baseDir string
---@param customEnvironment string
---@param isMod boolean
---@return table
function ConfigurationUtil.getConfigurationSetsFromXML(storeItem, xmlFile, key, baseDir, customEnvironment, isMod) end

--- For configuration types with a sub-selection, builds the list of sub-values and a mapping from each value to its items, keeping only types with more than one sub-value. Returns nil if no configurations are given.
---@param manager any
---@param configurations any
function ConfigurationUtil.getSubConfigurationsFromConfigurations(manager, configurations) end

--- Returns the index of the first item flagged as default and selectable, else the first selectable item, else 1.
---@param configItems table
---@return integer
function ConfigurationUtil.getDefaultConfigIdFromItems(configItems) end

--- Returns true if the given configurations exactly match at least one of the configuration sets on every entry of that set.
---@param configurations any
---@param configSets any
function ConfigurationUtil.getConfigurationsMatchConfigSets(configurations, configSets) end

--- Returns the configuration set with the most matching entries and that match count. Returns nil and 0 if no set has any match.
---@param configurations any
---@param configSets any
function ConfigurationUtil.getClosestConfigurationSet(configurations, configSets) end

--- Returns true if the material id is one of 2, 3, 19, 30, 31 or 35, which the UI shows as metallic.
---@param materialId any
function ConfigurationUtil.isColorMetallic(materialId) end
