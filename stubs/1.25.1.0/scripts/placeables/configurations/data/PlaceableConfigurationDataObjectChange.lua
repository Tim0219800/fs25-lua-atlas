---@meta
-- FS25 1.25.1.0 : placeables/configurations/data/PlaceableConfigurationDataObjectChange.lua (generated stub, FS25 Lua Atlas)

--- Mixin that adds object-change support to placeable configurations. Each configuration item can choose whether its object changes are applied during load or after post load, via the `#postLoadObjectChange` XML attribute. The changes themselves are handled by `ObjectChangeUtil`.
---@class PlaceableConfigurationDataObjectChange
PlaceableConfigurationDataObjectChange = {}

--- Registers the boolean `#postLoadObjectChange` path (default false) and the standard object-change XML paths under the configuration key.
---@param schema any
---@param rootPath any
---@param configPath any
function PlaceableConfigurationDataObjectChange.registerXMLPaths(schema, rootPath, configPath) end

--- Reads `#postLoadObjectChange` from the XML and stores it on the config item.
---@param configItem any
---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param baseDirectory any
---@param customEnvironment any
function PlaceableConfigurationDataObjectChange.loadConfigItem(configItem, xmlFile, baseKey, configKey, baseDirectory, customEnvironment) end

--- If the item is not flagged post-load, applies the object changes for the chosen config id with `ObjectChangeUtil.updateObjectChanges` using the placeable's components.
---@param placeable any
---@param configItem any
---@param configId any
function PlaceableConfigurationDataObjectChange.onLoad(placeable, configItem, configId) end

--- Same as `onLoad` but only runs when the item is flagged `postLoadObjectChange`, so the changes are applied after post load.
---@param placeable any
---@param configItem any
---@param configId any
function PlaceableConfigurationDataObjectChange.onPostLoad(placeable, configItem, configId) end
