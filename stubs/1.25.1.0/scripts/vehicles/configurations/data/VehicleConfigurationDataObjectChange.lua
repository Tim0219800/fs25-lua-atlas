---@meta
-- FS25 1.25.1.0 : vehicles/configurations/data/VehicleConfigurationDataObjectChange.lua (generated stub, FS25 Lua Atlas)

--- Configuration data module that adds ObjectChangeUtil object changes to every configuration, applied either at load or after post-load depending on the postLoadObjectChange flag.
---@class VehicleConfigurationDataObjectChange
VehicleConfigurationDataObjectChange = {}

--- Static. Registers the #postLoadObjectChange attribute and the object change XML paths for the configuration.
---@param schema any
---@param rootPath any
---@param configPath any
function VehicleConfigurationDataObjectChange.registerXMLPaths(schema, rootPath, configPath) end

--- Reads postLoadObjectChange (default false) from the base key into the config item.
---@param configItem any
---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param baseDirectory any
---@param customEnvironment any
function VehicleConfigurationDataObjectChange.loadConfigItem(configItem, xmlFile, baseKey, configKey, baseDirectory, customEnvironment) end

--- When the item is not flagged post-load, applies the object changes of the chosen configuration to the vehicle components during load.
---@param vehicle any
---@param configItem any
---@param configId any
function VehicleConfigurationDataObjectChange.onLoad(vehicle, configItem, configId) end

--- When the item is flagged post-load, applies the object changes at the post-load stage instead.
---@param vehicle any
---@param configItem any
---@param configId any
function VehicleConfigurationDataObjectChange.onPostLoad(vehicle, configItem, configId) end
