---@meta
-- FS25 1.25.1.0 : vehicles/VehicleMaterialManager.lua (stub généré, atlas Lua FS25)

---@class VehicleMaterialManager : AbstractManager
VehicleMaterialManager = {}

function VehicleMaterialManager:initDataStructures() end

---@param mapXMLFile integer
---@param missionInfo table
---@param baseDirectory string
---@return boolean
function VehicleMaterialManager:loadMapData(mapXMLFile, missionInfo, baseDirectory) end

---@param xmlFilename any
---@param key any
---@param baseDirectory any
---@param customEnvironment any
function VehicleMaterialManager:addModMaterialTemplatesToLoad(xmlFilename, key, baseDirectory, customEnvironment) end

---@param xmlFilename any
---@param baseDirectory any
---@param customEnvironment any
function VehicleMaterialManager:loadMaterialTemplates(xmlFilename, baseDirectory, customEnvironment) end

---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param customEnvironment any
---@param parentTemplateDefault any
function VehicleMaterialManager:loadMaterialTemplatesFromXML(xmlFile, key, baseDirectory, customEnvironment, parentTemplateDefault) end

---@param name any
---@param customEnvironment any
function VehicleMaterialManager:getMaterialTemplateByName(name, customEnvironment) end

---@param name any
---@param customEnvironment any
function VehicleMaterialManager:getMaterialTemplateColorByName(name, customEnvironment) end

---@param name any
---@param customEnvironment any
function VehicleMaterialManager:getMaterialTemplateColorAndTitleByName(name, customEnvironment) end

---@param name any
function VehicleMaterialManager:getMaterialTemplateIndexByName(name) end

---@param index any
function VehicleMaterialManager:getMaterialTemplateNameByIndex(index) end

---@param materialTemplateName any
function VehicleMaterialManager:getMaterialTemplateFinish(materialTemplateName) end

---@param schema any
---@param basePath any
function VehicleMaterialManager.registerXMLPaths(schema, basePath) end
