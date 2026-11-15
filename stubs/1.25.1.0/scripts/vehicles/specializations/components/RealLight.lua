---@meta
-- FS25 1.25.1.0 : vehicles/specializations/components/RealLight.lua (generated stub, FS25 Lua Atlas)

---@class RealLight
RealLight = {}

---@param vehicle any
---@param customMt any
function RealLight.new(vehicle, customMt) end

---@param xmlFile any
---@param baseKey any
---@param components any
---@param i3dMappings any
---@param loadLightTypes any
function RealLight:loadFromXML(xmlFile, baseKey, components, i3dMappings, loadLightTypes) end

---@param otherLight any
function RealLight:merge(otherLight) end

---@param iesEnabled any
function RealLight:updateIESProfile(iesEnabled) end

function RealLight:updateLightScattering() end

function RealLight:updateMergedShadows() end

function RealLight:finalize() end

---@param lightsProfile any
function RealLight:onLightsProfileChanged(lightsProfile) end

---@param lightsTypesMask any
function RealLight:setLightTypesMask(lightsTypesMask) end

---@param isBlinking any
function RealLight:setIsBlinking(isBlinking) end

---@param isActive any
---@param chargeScale any
function RealLight:setState(isActive, chargeScale) end

---@param alpha any
function RealLight:setCharge(alpha) end

---@param func any
---@param funcTarget any
function RealLight:setChargeFunction(func, funcTarget) end

---@param lightSources any
function RealLight.getAreShadowsMergable(lightSources) end

---@param lightSource1 integer
---@param lightSource2 integer
---@param coneAngle number
---@param yRotation number
---@return number
function RealLight.getConeAngleContribution(lightSource1, lightSource2, coneAngle, yRotation) end

---@param lightSources any
function RealLight.getMergedConeAngleSize(lightSources) end

---@param lights any
---@param xmlFile any
---@param baseKey any
---@param vehicle any
---@param components any
---@param i3dMappings any
---@param loadLightTypes any
function RealLight.loadLightsFromXML(lights, xmlFile, baseKey, vehicle, components, i3dMappings, loadLightTypes) end

---@param schema any
---@param basePath any
function RealLight.registerXMLPaths(schema, basePath) end

---@param _ any
---@param enabled any
function RealLight.consoleCommandDebugIES(_, enabled) end
