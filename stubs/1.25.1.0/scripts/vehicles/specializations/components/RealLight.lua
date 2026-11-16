---@meta
-- FS25 1.25.1.0 : vehicles/specializations/components/RealLight.lua (generated stub, FS25 Lua Atlas)

--- Wrapper around one or more engine light sources used by the vehicle Lights specialization (`spec_lights`). It reads a light node from XML, handles light types and excluded types, IES profile, light scattering and shadow (including a merged-shadow helper spot light) according to the `LIGHTS_PROFILE` setting, and turns the light on or off with a charge-based colour scale. Client-side visual; it calls vehicle methods such as `getIsLightActive` and `getRealLightFromNode` that are defined elsewhere (UNVERIFIED).
---@class RealLight
RealLight = {}

--- Creates a real light object for a vehicle with no charge function.
---@param vehicle any
---@param customMt any
function RealLight.new(vehicle, customMt) end

--- Loads a real light from XML: validates the node is a light source, collects child light sources, reads intensity scale, light types, IES profile, scattering and shadow settings (builds a merged shadow spot when several sources and shadows are used). Returns false with a warning if the node is missing or not a light.
---@param xmlFile any
---@param baseKey any
---@param components any
---@param i3dMappings any
---@param loadLightTypes any
function RealLight:loadFromXML(xmlFile, baseKey, components, i3dMappings, loadLightTypes) end

--- Appends this light's light types and excluded types to another light on the same node and returns that other light.
---@param otherLight any
function RealLight:merge(otherLight) end

--- Enables or disables IES profiles on the sources whose names match `RealLight.DEFAULT_LIGHT_PROFILE`, and sets the current intensity scale from the profile. Note: the scale line runs after the disable branch too, so it overrides the reset done there.
---@param iesEnabled any
function RealLight:updateIESProfile(iesEnabled) end

--- Turns engine light scattering on or off per source depending on `useLightScattering`, light types, lights profile (high or very high) and range above 7.5; caps the scattering cone angle to `SCATTERING_MAX_ANGLE`.
function RealLight:updateLightScattering() end

--- Applies shadow maps (512) according to the lights profile: only at ultra, merges the shadows of several sources or sets a single shadow with priority, ignoring the vehicle components; otherwise disables shadow maps.
function RealLight:updateMergedShadows() end

--- Finishes loading by calling `updateMergedShadows`.
function RealLight:finalize() end

--- Re-applies IES profile, light scattering and shadows after the lights quality profile changed.
---@param lightsProfile any
function RealLight:onLightsProfileChanged(lightsProfile) end

--- Computes from a bit mask of active light types whether this light is on (honouring excluded types and the vehicle's light-active check) and a charge scale, optionally from the charge function, then calls `setState`.
---@param lightsTypesMask any
function RealLight:setLightTypesMask(lightsTypesMask) end

--- Empty hook; real lights ignore blinking state.
---@param isBlinking any
function RealLight:setIsBlinking(isBlinking) end

--- Sets the light colour scale from the charge (or 1/0 by state) and shows or hides the light node.
---@param isActive any
---@param chargeScale any
function RealLight:setState(isActive, chargeScale) end

--- Multiplies the default colour by the charge and current intensity scale and applies it to every light source.
---@param alpha any
function RealLight:setCharge(alpha) end

--- Registers a function (and target) that returns the charge scale used by `setLightTypesMask`.
---@param func any
---@param funcTarget any
function RealLight:setChargeFunction(func, funcTarget) end

--- Checks pairwise whether the cone edges of the given light sources stay within a half space, i.e. whether their shadows can be merged. Returns a boolean.
---@param lightSources any
function RealLight.getAreShadowsMergable(lightSources) end

--- Helper that returns the angle reached by one cone edge of `lightSource2` as seen from `lightSource1` (edge angle plus half cone).
---@param lightSource1 integer
---@param lightSource2 integer
---@param coneAngle number
---@param yRotation number
---@return number
function RealLight.getConeAngleContribution(lightSource1, lightSource2, coneAngle, yRotation) end

--- Returns the largest cone angle needed to cover all given light sources, taking both edges of each cone pairwise.
---@param lightSources any
function RealLight.getMergedConeAngleSize(lightSources) end

--- Loads every real light under an XML base key into `lights` (created if nil), merging with an existing light of the same node via `vehicle:getRealLightFromNode`. Returns the list.
---@param lights any
---@param xmlFile any
---@param baseKey any
---@param vehicle any
---@param components any
---@param i3dMappings any
---@param loadLightTypes any
function RealLight.loadLightsFromXML(lights, xmlFile, baseKey, vehicle, components, i3dMappings, loadLightTypes) end

--- Registers the XML paths of a real light (node, intensity, types, IES profile, scattering, shadows).
---@param schema any
---@param basePath any
function RealLight.registerXMLPaths(schema, basePath) end

--- Console command: toggles or sets IES profile usage and re-applies it to the real lights of the current vehicle and its children. Note: `IES_DEBUG_ENABLED` is stored here; whether other code reads it is UNVERIFIED.
---@param _ any
---@param enabled any
function RealLight.consoleCommandDebugIES(_, enabled) end
