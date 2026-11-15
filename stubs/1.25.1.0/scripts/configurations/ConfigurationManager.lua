---@meta
-- FS25 1.25.1.0 : configurations/ConfigurationManager.lua (generated stub, FS25 Lua Atlas)

---@class ConfigurationManager : AbstractManager
ConfigurationManager = {}

---@param typeName any
---@param rootElementName any
---@param customMt any
---@return table
function ConfigurationManager.new(typeName, rootElementName, customMt) end

function ConfigurationManager:initDataStructures() end

---@return integer
function ConfigurationManager:getNumOfConfigurationTypes() end

---@return table
function ConfigurationManager:getConfigurationTypes() end

---@return table
function ConfigurationManager:getSortedConfigurationTypes() end

---@param index integer
---@return string
function ConfigurationManager:getConfigurationNameByIndex(index) end

---@param name string
---@return integer
function ConfigurationManager:getConfigurationIndexByName(name) end

---@return table
function ConfigurationManager:getConfigurations() end

---@param name string
---@return table
function ConfigurationManager:getConfigurationDescByName(name) end

---@param configurationName string
---@param attribute string
---@return any
function ConfigurationManager:getConfigurationAttribute(configurationName, attribute) end

---@param configurationName string
---@return integer
function ConfigurationManager:getConfigurationSelectorType(configurationName) end

---@param configurationName string
function ConfigurationManager:getConfigurationKeys(configurationName) end

function ConfigurationManager:configurationKeyIterator() end
