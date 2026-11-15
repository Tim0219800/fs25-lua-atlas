---@meta
-- FS25 1.25.1.0 : vehicles/specializations/components/StaticLightCompound.lua (generated stub, FS25 Lua Atlas)

---@class StaticLightCompound
StaticLightCompound = {}

---@param vehicle any
---@param customMt any
function StaticLightCompound.new(vehicle, customMt) end

---@param xmlFile any
---@param baseKey any
function StaticLightCompound.loadFunctionMappingData(xmlFile, baseKey) end

---@param xmlFile any
---@param baseKey any
---@param components any
---@param i3dMappings any
---@param vehicle any
---@param sharedLight any
function StaticLightCompound:loadFromXML(xmlFile, baseKey, components, i3dMappings, vehicle, sharedLight) end

---@param lightTypes any
---@param excludedLightTypes any
function StaticLightCompound:setLightTypes(lightTypes, excludedLightTypes) end

---@param turnLightLeft any
---@param turnLightRight any
---@param reverseLight any
function StaticLightCompound:setOverwriteSettings(turnLightLeft, turnLightRight, reverseLight) end

---@param lightsTypesMask any
---@param vehicle any
function StaticLightCompound:setLightTypesMask(lightsTypesMask, vehicle) end

---@param schema any
---@param basePath any
function StaticLightCompound.registerXMLPaths(schema, basePath) end
