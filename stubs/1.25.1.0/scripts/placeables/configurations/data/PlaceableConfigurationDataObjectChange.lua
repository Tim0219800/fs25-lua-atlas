---@meta
-- FS25 1.25.1.0 : placeables/configurations/data/PlaceableConfigurationDataObjectChange.lua (stub généré, atlas Lua FS25)

---@class PlaceableConfigurationDataObjectChange
PlaceableConfigurationDataObjectChange = {}

---@param schema any
---@param rootPath any
---@param configPath any
function PlaceableConfigurationDataObjectChange.registerXMLPaths(schema, rootPath, configPath) end

---@param configItem any
---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param baseDirectory any
---@param customEnvironment any
function PlaceableConfigurationDataObjectChange.loadConfigItem(configItem, xmlFile, baseKey, configKey, baseDirectory, customEnvironment) end

---@param placeable any
---@param configItem any
---@param configId any
function PlaceableConfigurationDataObjectChange.onLoad(placeable, configItem, configId) end

---@param placeable any
---@param configItem any
---@param configId any
function PlaceableConfigurationDataObjectChange.onPostLoad(placeable, configItem, configId) end
