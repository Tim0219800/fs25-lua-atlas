---@meta
-- FS25 1.25.1.0 : placeables/configurations/PlaceableConfigurationItem.lua (generated stub, FS25 Lua Atlas)

--- Base class holding one selectable configuration entry of a placeable (name, description, price, daily upkeep, default and selectable flags, save id). It loads from the placeable XML and the savegame, and forwards lifecycle callbacks to the mixins listed in `PlaceableConfigurationItem.GLOBAL_DATA`, which is not filled in this file (UNVERIFIED where it is set). Subclasses such as the color item extend it.
---@class PlaceableConfigurationItem
PlaceableConfigurationItem = {}

--- Creates a config item for a configuration name with defaults: empty name, index -1, price 0, no upkeep, not default, selectable, no save id.
---@param configName any
---@param customMt any
function PlaceableConfigurationItem.new(configName, customMt) end

--- Reads name (with optional text params), description, price, daily upkeep, default and selectable flags, save id and the shop title override from the XML. Falls back to the config key as name when empty. Returns true.
---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param baseDirectory any
---@param customEnvironment any
function PlaceableConfigurationItem:loadFromXML(xmlFile, baseKey, configKey, baseDirectory, customEnvironment) end

--- Writes the config name, save id and an active flag into the savegame XML at the given key.
---@param xmlFile any
---@param key any
---@param isActive any
---@param configurationData any
function PlaceableConfigurationItem:saveToXMLFile(xmlFile, key, isActive, configurationData) end

--- Empty hook for loading per-item data from a savegame; subclasses override it.
---@param xmlFile any
---@param key any
---@param configurationData any
function PlaceableConfigurationItem:loadFromSavegameXMLFile(xmlFile, key, configurationData) end

--- Stores the item's index and, if no save id was given in XML, uses the index as a string for the save id.
---@param index any
function PlaceableConfigurationItem:setIndex(index) end

--- Returns true when this item has the same display name as another item, so that `postLoad` can add a numeric suffix.
---@param otherItem any
function PlaceableConfigurationItem:getNeedsRenaming(otherItem) end

--- Calls `onPreLoad` of every mixin in `GLOBAL_DATA` that defines it, passing the placeable, this item and the config id.
---@param placeable any
---@param configId any
function PlaceableConfigurationItem:onPreLoad(placeable, configId) end

--- Calls `onLoad` of every mixin in `GLOBAL_DATA` that defines it, passing the placeable, this item and the config id.
---@param placeable any
---@param configId any
function PlaceableConfigurationItem:onLoad(placeable, configId) end

--- Calls `onPostLoad` of every mixin in `GLOBAL_DATA` that defines it, passing the placeable, this item and the config id.
---@param placeable any
---@param configId any
function PlaceableConfigurationItem:onPostLoad(placeable, configId) end

--- Calls `onLoadFinished` of every mixin in `GLOBAL_DATA` that defines it, passing the placeable, this item and the config id.
---@param placeable any
---@param configId any
function PlaceableConfigurationItem:onLoadFinished(placeable, configId) end

--- Calls `onSizeLoad` of every mixin in `GLOBAL_DATA` that defines it, passing this item, the XML file and the size data table.
---@param xmlFile any
---@param sizeData any
function PlaceableConfigurationItem:onSizeLoad(xmlFile, sizeData) end

--- After all items are loaded, appends a numeric suffix to duplicate names and logs an XML warning for duplicated save ids within the same configuration.
---@param xmlFile any
---@param baseKey any
---@param baseDir any
---@param customEnvironment any
---@param isMod any
---@param configurationItems any
---@param storeItem any
function PlaceableConfigurationItem.postLoad(xmlFile, baseKey, baseDir, customEnvironment, isMod, configurationItems, storeItem) end

--- Registers the XML paths for title, name, params, desc, price, dailyUpkeep, isDefault, isSelectable and saveId, then lets each `GLOBAL_DATA` mixin register its own paths.
---@param schema any
---@param rootPath any
---@param configPath any
function PlaceableConfigurationItem.registerXMLPaths(schema, rootPath, configPath) end

--- Registers the savegame XML paths for configuration name, save id and the active flag.
---@param schema any
---@param basePath any
function PlaceableConfigurationItem.registerSavegameXMLPaths(schema, basePath) end
