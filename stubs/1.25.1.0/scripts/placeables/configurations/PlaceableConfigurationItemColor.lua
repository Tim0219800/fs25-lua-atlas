---@meta
-- FS25 1.25.1.0 : placeables/configurations/PlaceableConfigurationItemColor.lua (stub généré, atlas Lua FS25)

---@class PlaceableConfigurationItemColor : PlaceableConfigurationItem
PlaceableConfigurationItemColor = {}

---@param configName any
---@param customMt any
function PlaceableConfigurationItemColor.new(configName, customMt) end

---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param baseDirectory any
---@param customEnvironment any
function PlaceableConfigurationItemColor:loadFromXML(xmlFile, baseKey, configKey, baseDirectory, customEnvironment) end

---@param xmlFile any
---@param key any
---@param isActive any
---@param configurationData any
function PlaceableConfigurationItemColor:saveToXMLFile(xmlFile, key, isActive, configurationData) end

---@param xmlFile any
---@param key any
---@param configurationData any
function PlaceableConfigurationItemColor:loadFromSavegameXMLFile(xmlFile, key, configurationData) end

---@param streamId any
---@param connection any
---@param configurationData any
function PlaceableConfigurationItemColor:readFromStream(streamId, connection, configurationData) end

---@param streamId any
---@param connection any
---@param configurationData any
function PlaceableConfigurationItemColor:writeToStream(streamId, connection, configurationData) end

---@param configurationData1 any
---@param configurationData2 any
function PlaceableConfigurationItemColor:hasDataChanged(configurationData1, configurationData2) end

---@param placeable any
function PlaceableConfigurationItemColor:getColor(placeable) end

---@param placeable any
function PlaceableConfigurationItemColor:getColorAndMaterialFromPlaceable(placeable) end

---@param xmlFile any
---@param sizeData any
function PlaceableConfigurationItemColor:onSizeLoad(xmlFile, sizeData) end

---@param placeable any
---@param configId any
function PlaceableConfigurationItemColor:onPostLoad(placeable, configId) end

---@param xmlFile any
---@param baseKey any
---@param baseDir any
---@param customEnvironment any
---@param isMod any
---@param configurationItems any
---@param storeItem any
---@param configName any
function PlaceableConfigurationItemColor.postLoad(xmlFile, baseKey, baseDir, customEnvironment, isMod, configurationItems, storeItem, configName) end

---@param configs any
---@param configId any
---@param configName any
---@param configFileName any
function PlaceableConfigurationItemColor.getFallbackConfigId(configs, configId, configName, configFileName) end

---@param schema any
---@param rootPath any
---@param configPath any
function PlaceableConfigurationItemColor.registerXMLPaths(schema, rootPath, configPath) end

---@param schema any
---@param basePath any
function PlaceableConfigurationItemColor.registerSavegameXMLPaths(schema, basePath) end
