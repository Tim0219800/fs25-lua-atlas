---@meta
-- FS25 1.25.1.0 : vehicles/specializations/components/StaticLight.lua (generated stub, FS25 Lua Atlas)

---@class StaticLight
StaticLight = {}

---@param vehicle any
---@param customMt any
function StaticLight.new(vehicle, customMt) end

---@param xmlFile any
---@param baseKey any
---@param components any
---@param i3dMappings any
---@param loadLightTypes any
---@param sharedLight any
function StaticLight:loadFromXML(xmlFile, baseKey, components, i3dMappings, loadLightTypes, sharedLight) end

---@param otherLight any
function StaticLight:merge(otherLight) end

---@param lightsTypesMask any
function StaticLight:setLightTypesMask(lightsTypesMask) end

---@param isBlinking any
function StaticLight:setIsBlinking(isBlinking) end

---@param isActive any
---@param chargeScale any
function StaticLight:setState(isActive, chargeScale) end

---@param func any
---@param funcTarget any
function StaticLight:setChargeFunction(func, funcTarget) end

---@param lights any
---@param xmlFile any
---@param baseKey any
---@param vehicle any
---@param components any
---@param i3dMappings any
---@param loadLightTypes any
---@param sharedLight any
function StaticLight.loadLightsFromXML(lights, xmlFile, baseKey, vehicle, components, i3dMappings, loadLightTypes, sharedLight) end

---@param schema any
---@param basePath any
function StaticLight.registerXMLPaths(schema, basePath) end
