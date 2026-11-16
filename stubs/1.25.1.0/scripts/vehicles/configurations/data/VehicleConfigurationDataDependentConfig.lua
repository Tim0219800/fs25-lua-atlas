---@meta
-- FS25 1.25.1.0 : vehicles/configurations/data/VehicleConfigurationDataDependentConfig.lua (generated stub, FS25 Lua Atlas)

--- Configuration data module that lets a configuration item list other configurations (by name and index) that should be set along with it.
---@class VehicleConfigurationDataDependentConfig
VehicleConfigurationDataDependentConfig = {}

--- Static. Registers the .dependentConfiguration entries with #name and #index.
---@param schema any
---@param rootPath any
---@param configPath any
function VehicleConfigurationDataDependentConfig.registerXMLPaths(schema, rootPath, configPath) end

--- Reads the dependent configurations of an item into configItem.dependentConfigurations, keeping only entries with both name and index. How they are applied is not in this file (UNVERIFIED).
---@param configItem any
---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param baseDirectory any
---@param customEnvironment any
function VehicleConfigurationDataDependentConfig.loadConfigItem(configItem, xmlFile, baseKey, configKey, baseDirectory, customEnvironment) end
