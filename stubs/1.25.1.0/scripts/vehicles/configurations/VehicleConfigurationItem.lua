---@meta
-- FS25 1.25.1.0 : vehicles/configurations/VehicleConfigurationItem.lua (stub généré, atlas Lua FS25)

---@class VehicleConfigurationItem
VehicleConfigurationItem = {}

---@param configName any
---@param customMt any
function VehicleConfigurationItem.new(configName, customMt) end

---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param baseDirectory any
---@param customEnvironment any
function VehicleConfigurationItem:loadFromXML(xmlFile, baseKey, configKey, baseDirectory, customEnvironment) end

---@param xmlFile any
---@param key any
---@param isActive any
---@param configurationData any
function VehicleConfigurationItem:saveToXMLFile(xmlFile, key, isActive, configurationData) end

---@param xmlFile any
---@param key any
---@param configurationData any
function VehicleConfigurationItem:loadFromSavegameXMLFile(xmlFile, key, configurationData) end

---@param index any
function VehicleConfigurationItem:setIndex(index) end

---@param otherItem any
function VehicleConfigurationItem:getNeedsRenaming(otherItem) end

---@param object any
---@param configId any
function VehicleConfigurationItem:onPreLoad(object, configId) end

---@param object any
---@param configId any
function VehicleConfigurationItem:onLoad(object, configId) end

---@param object any
---@param configId any
function VehicleConfigurationItem:onPrePostLoad(object, configId) end

---@param object any
---@param configId any
function VehicleConfigurationItem:onPostLoad(object, configId) end

---@param object any
---@param configId any
function VehicleConfigurationItem:onLoadFinished(object, configId) end

---@param xmlFile any
---@param sizeData any
function VehicleConfigurationItem:onSizeLoad(xmlFile, sizeData) end

---@param xmlFile any
---@param baseKey any
---@param baseDir any
---@param customEnvironment any
---@param isMod any
---@param configurationItems any
---@param storeItem any
function VehicleConfigurationItem.postLoad(xmlFile, baseKey, baseDir, customEnvironment, isMod, configurationItems, storeItem) end

---@param schema any
---@param rootPath any
---@param configPath any
function VehicleConfigurationItem.registerXMLPaths(schema, rootPath, configPath) end

---@param schema any
---@param basePath any
function VehicleConfigurationItem.registerSavegameXMLPaths(schema, basePath) end
