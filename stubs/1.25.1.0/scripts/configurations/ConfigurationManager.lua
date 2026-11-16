---@meta
-- FS25 1.25.1.0 : configurations/ConfigurationManager.lua (generated stub, FS25 Lua Atlas)

--- Manager subclassing AbstractManager that holds the registered configuration types (for example vehicle or placeable options) with name/index lookups and a priority-sorted name list. In this file it only stores and exposes that data; registration of configurations happens elsewhere (UNVERIFIED). Each description is expected to carry an item class with a SELECTOR value and XML keys.
---@class ConfigurationManager : AbstractManager
ConfigurationManager = {}

--- Creates the manager via AbstractManager.new, stores the type name and XML root element name, and initializes the data tables.
---@param typeName any
---@param rootElementName any
---@param customMt any
---@return table
function ConfigurationManager.new(typeName, rootElementName, customMt) end

--- Resets the configurations table, the index-to-name and name-to-index maps and the sorted name list to empty tables.
function ConfigurationManager:initDataStructures() end

--- Returns how many configuration types are registered (length of the index-to-name list).
---@return integer
function ConfigurationManager:getNumOfConfigurationTypes() end

--- Returns the list of configuration names in registration (index) order. This is the internal table, not a copy.
---@return table
function ConfigurationManager:getConfigurationTypes() end

--- Returns the list of configuration names sorted by priority. This is the internal table, not a copy.
---@return table
function ConfigurationManager:getSortedConfigurationTypes() end

--- Returns the configuration name registered at the given index, or nil.
---@param index integer
---@return string
function ConfigurationManager:getConfigurationNameByIndex(index) end

--- Returns the index of the configuration with the given name, or nil.
---@param name string
---@return integer
function ConfigurationManager:getConfigurationIndexByName(name) end

--- Returns the table of all configuration descriptions keyed by name.
---@return table
function ConfigurationManager:getConfigurations() end

--- Returns the description table of a configuration by name, or nil if unknown.
---@param name string
---@return table
function ConfigurationManager:getConfigurationDescByName(name) end

--- Returns one attribute from a configuration description. Not nil-safe: it errors if the configuration name is unknown.
---@param configurationName string
---@param attribute string
---@return any
function ConfigurationManager:getConfigurationAttribute(configurationName, attribute) end

--- Returns the SELECTOR value of the configuration's item class, or ConfigurationUtil.SELECTOR_MULTIOPTION when the configuration is unknown.
---@param configurationName string
---@return integer
function ConfigurationManager:getConfigurationSelectorType(configurationName) end

--- Returns the XML key of the configurations container and of the individual configuration element for a name, or nil, nil if unknown.
---@param configurationName string
function ConfigurationManager:getConfigurationKeys(configurationName) end

--- Returns an iterator over all configuration types yielding the container key and the element key with a `(?)` index wildcard appended. Note: it would error if a name has no registered keys, since it concatenates a nil.
function ConfigurationManager:configurationKeyIterator() end
