---@meta
-- FS25 1.25.1.0 : vehicles/configurations/VehicleConfigurationItemColor.lua (stub généré, atlas Lua FS25)

---@class VehicleConfigurationItemColor : VehicleConfigurationItem
VehicleConfigurationItemColor = {}

---@param configName any
---@param customMt any
function VehicleConfigurationItemColor.new(configName, customMt) end

---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param baseDirectory any
---@param customEnvironment any
function VehicleConfigurationItemColor:loadFromXML(xmlFile, baseKey, configKey, baseDirectory, customEnvironment) end

---@param xmlFile any
---@param key any
---@param isActive any
---@param configurationData any
function VehicleConfigurationItemColor:saveToXMLFile(xmlFile, key, isActive, configurationData) end

---@param xmlFile any
---@param key any
---@param configurationData any
function VehicleConfigurationItemColor:loadFromSavegameXMLFile(xmlFile, key, configurationData) end

---@param streamId any
---@param connection any
---@param configurationData any
function VehicleConfigurationItemColor:readFromStream(streamId, connection, configurationData) end

---@param streamId any
---@param connection any
---@param configurationData any
function VehicleConfigurationItemColor:writeToStream(streamId, connection, configurationData) end

---@param configurationData1 any
---@param configurationData2 any
function VehicleConfigurationItemColor:hasDataChanged(configurationData1, configurationData2) end

---@param vehicle any
function VehicleConfigurationItemColor:updateMaterial(vehicle) end

function VehicleConfigurationItemColor:getColor() end

---@param vehicle any
function VehicleConfigurationItemColor:getMaterial(vehicle) end

---@param xmlFile any
---@param sizeData any
function VehicleConfigurationItemColor:onSizeLoad(xmlFile, sizeData) end

---@param vehicle any
function VehicleConfigurationItemColor:getColorAndMaterialFromVehicle(vehicle) end

---@param object any
---@param configId any
function VehicleConfigurationItemColor:onPostLoad(object, configId) end

---@param xmlFile any
---@param baseKey any
---@param baseDir any
---@param customEnvironment any
---@param isMod any
---@param configurationItems any
---@param storeItem any
---@param configName any
function VehicleConfigurationItemColor.postLoad(xmlFile, baseKey, baseDir, customEnvironment, isMod, configurationItems, storeItem, configName) end

---@param configs any
---@param configId any
---@param configName any
---@param configFileName any
function VehicleConfigurationItemColor.getFallbackConfigId(configs, configId, configName, configFileName) end

---@param vehicle any
---@param configName any
function VehicleConfigurationItemColor.getMaterialByColorConfiguration(vehicle, configName) end

---@param schema any
---@param rootPath any
---@param configPath any
function VehicleConfigurationItemColor.registerXMLPaths(schema, rootPath, configPath) end

---@param schema any
---@param basePath any
function VehicleConfigurationItemColor.registerSavegameXMLPaths(schema, basePath) end
