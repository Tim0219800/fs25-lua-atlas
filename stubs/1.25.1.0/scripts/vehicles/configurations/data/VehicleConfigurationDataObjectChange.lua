---@meta
-- FS25 1.25.1.0 : vehicles/configurations/data/VehicleConfigurationDataObjectChange.lua (stub généré, atlas Lua FS25)

---@class VehicleConfigurationDataObjectChange
VehicleConfigurationDataObjectChange = {}

---@param schema any
---@param rootPath any
---@param configPath any
function VehicleConfigurationDataObjectChange.registerXMLPaths(schema, rootPath, configPath) end

---@param configItem any
---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param baseDirectory any
---@param customEnvironment any
function VehicleConfigurationDataObjectChange.loadConfigItem(configItem, xmlFile, baseKey, configKey, baseDirectory, customEnvironment) end

---@param vehicle any
---@param configItem any
---@param configId any
function VehicleConfigurationDataObjectChange.onLoad(vehicle, configItem, configId) end

---@param vehicle any
---@param configItem any
---@param configId any
function VehicleConfigurationDataObjectChange.onPostLoad(vehicle, configItem, configId) end
