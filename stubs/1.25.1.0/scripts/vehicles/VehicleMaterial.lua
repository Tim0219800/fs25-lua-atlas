---@meta
-- FS25 1.25.1.0 : vehicles/VehicleMaterial.lua (generated stub, FS25 Lua Atlas)

---@class VehicleMaterial
VehicleMaterial = {}

---@param baseDirectory any
---@param customMt any
function VehicleMaterial.new(baseDirectory, customMt) end

function VehicleMaterial:clone() end

---@param r any
---@param g any
---@param b any
function VehicleMaterial:setColor(r, g, b) end

function VehicleMaterial:getBrightness() end

---@param templateName any
---@param colorOnly any
---@param customEnvironment any
function VehicleMaterial:setTemplateName(templateName, colorOnly, customEnvironment) end

---@param xmlFile any
---@param key any
---@param customEnvironment any
function VehicleMaterial:loadFromXML(xmlFile, key, customEnvironment) end

---@param xmlFile any
---@param key any
---@param customEnvironment any
function VehicleMaterial:loadShortFromXML(xmlFile, key, customEnvironment) end

---@param vehicle any
---@param targetMaterialSlotName any
function VehicleMaterial:applyToVehicle(vehicle, targetMaterialSlotName) end

---@param node any
---@param targetMaterialSlotName any
---@param colorOnly any
function VehicleMaterial:apply(node, targetMaterialSlotName, colorOnly) end

---@param node any
---@param materialIndex any
---@param colorOnly any
function VehicleMaterial:applyToMaterial(node, materialIndex, colorOnly) end

---@param node any
---@param materialId any
---@param checkColor any
function VehicleMaterial:getIsApplied(node, materialId, checkColor) end

---@param schema XMLSchema
---@param basePath string
function VehicleMaterial.registerXMLPaths(schema, basePath) end

---@param schema XMLSchema
---@param basePath string
function VehicleMaterial.registerShortXMLPaths(schema, basePath) end
