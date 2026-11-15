---@meta
-- FS25 1.25.1.0 : placeables/configurations/PlaceableConfigurationItem.lua (stub généré, atlas Lua FS25)

---@class PlaceableConfigurationItem
PlaceableConfigurationItem = {}

---@param configName any
---@param customMt any
function PlaceableConfigurationItem.new(configName, customMt) end

---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param baseDirectory any
---@param customEnvironment any
function PlaceableConfigurationItem:loadFromXML(xmlFile, baseKey, configKey, baseDirectory, customEnvironment) end

---@param xmlFile any
---@param key any
---@param isActive any
---@param configurationData any
function PlaceableConfigurationItem:saveToXMLFile(xmlFile, key, isActive, configurationData) end

---@param xmlFile any
---@param key any
---@param configurationData any
function PlaceableConfigurationItem:loadFromSavegameXMLFile(xmlFile, key, configurationData) end

---@param index any
function PlaceableConfigurationItem:setIndex(index) end

---@param otherItem any
function PlaceableConfigurationItem:getNeedsRenaming(otherItem) end

---@param placeable any
---@param configId any
function PlaceableConfigurationItem:onPreLoad(placeable, configId) end

---@param placeable any
---@param configId any
function PlaceableConfigurationItem:onLoad(placeable, configId) end

---@param placeable any
---@param configId any
function PlaceableConfigurationItem:onPostLoad(placeable, configId) end

---@param placeable any
---@param configId any
function PlaceableConfigurationItem:onLoadFinished(placeable, configId) end

---@param xmlFile any
---@param sizeData any
function PlaceableConfigurationItem:onSizeLoad(xmlFile, sizeData) end

---@param xmlFile any
---@param baseKey any
---@param baseDir any
---@param customEnvironment any
---@param isMod any
---@param configurationItems any
---@param storeItem any
function PlaceableConfigurationItem.postLoad(xmlFile, baseKey, baseDir, customEnvironment, isMod, configurationItems, storeItem) end

---@param schema any
---@param rootPath any
---@param configPath any
function PlaceableConfigurationItem.registerXMLPaths(schema, rootPath, configPath) end

---@param schema any
---@param basePath any
function PlaceableConfigurationItem.registerSavegameXMLPaths(schema, basePath) end
