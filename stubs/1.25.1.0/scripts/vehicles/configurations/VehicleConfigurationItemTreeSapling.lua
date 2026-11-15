---@meta
-- FS25 1.25.1.0 : vehicles/configurations/VehicleConfigurationItemTreeSapling.lua (generated stub, FS25 Lua Atlas)

---@class VehicleConfigurationItemTreeSapling : VehicleConfigurationItem
VehicleConfigurationItemTreeSapling = {}

---@param configName any
---@param customMt any
function VehicleConfigurationItemTreeSapling.new(configName, customMt) end

---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param baseDirectory any
---@param customEnvironment any
function VehicleConfigurationItemTreeSapling:loadFromXML(xmlFile, baseKey, configKey, baseDirectory, customEnvironment) end

---@param xmlFile any
---@param baseKey any
---@param baseDir any
---@param customEnvironment any
---@param isMod any
---@param configurationItems any
---@param storeItem any
---@param configName any
function VehicleConfigurationItemTreeSapling.postLoad(xmlFile, baseKey, baseDir, customEnvironment, isMod, configurationItems, storeItem, configName) end

---@param configurationItems any
---@param xmlFile any
---@param configName any
---@param baseConfigItem any
function VehicleConfigurationItemTreeSapling.generateConfigurations(configurationItems, xmlFile, configName, baseConfigItem) end

---@param schema any
---@param rootPath any
---@param configPath any
function VehicleConfigurationItemTreeSapling.registerXMLPaths(schema, rootPath, configPath) end
