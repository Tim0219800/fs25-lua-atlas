---@meta
-- FS25 1.25.1.0 : vehicles/configurations/VehicleConfigurationItemWheel.lua (stub généré, atlas Lua FS25)

---@class VehicleConfigurationItemWheel : VehicleConfigurationItem
VehicleConfigurationItemWheel = {}

---@param configName any
---@param customMt any
function VehicleConfigurationItemWheel.new(configName, customMt) end

---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param baseDirectory any
---@param customEnvironment any
function VehicleConfigurationItemWheel:loadFromXML(xmlFile, baseKey, configKey, baseDirectory, customEnvironment) end

---@param otherItem any
function VehicleConfigurationItemWheel:getNeedsRenaming(otherItem) end

---@param xmlFile any
---@param sizeData any
function VehicleConfigurationItemWheel:onSizeLoad(xmlFile, sizeData) end

---@param xmlFile any
---@param baseKey any
---@param baseDir any
---@param customEnvironment any
---@param isMod any
---@param configurationItems any
---@param storeItem any
---@param configName any
function VehicleConfigurationItemWheel.postLoad(xmlFile, baseKey, baseDir, customEnvironment, isMod, configurationItems, storeItem, configName) end

---@param configs any
---@param configId any
---@param configName any
---@param configFileName any
function VehicleConfigurationItemWheel.getFallbackConfigId(configs, configId, configName, configFileName) end

---@param configurationItems any
---@param xmlFile any
---@param configName any
---@param baseConfigItem any
function VehicleConfigurationItemWheel.generateConfigurations(configurationItems, xmlFile, configName, baseConfigItem) end

---@param xmlFile any
function VehicleConfigurationItemWheel:applyGeneratedConfiguration(xmlFile) end

---@param vehicle any
---@param configurationIndexToParentConfigIndex any
---@param index any
function VehicleConfigurationItemWheel:applyObjectChanges(vehicle, configurationIndexToParentConfigIndex, index) end

---@param schema any
---@param rootPath any
---@param configPath any
function VehicleConfigurationItemWheel.registerXMLPaths(schema, rootPath, configPath) end
