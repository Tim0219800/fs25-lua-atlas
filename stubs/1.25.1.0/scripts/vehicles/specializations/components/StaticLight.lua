---@meta
-- FS25 1.25.1.0 : vehicles/specializations/components/StaticLight.lua (generated stub, FS25 Lua Atlas)

--- A mesh-based light (emissive glow done by shader parameters, no engine light source) for vehicles. It drives the `lightControl` or `lightIds0..3` shader parameters of a shape node, or toggles its visibility, according to the active light types mask and an optional charge function. Several entries on the same node can be merged. Used by `Lights` (`spec_lights`) and by `SharedLight`; client-side visual.
---@class StaticLight
StaticLight = {}

--- Creates a static light for a vehicle (may be nil) with no charge function.
---@param vehicle any
---@param customMt any
function StaticLight.new(vehicle, customMt) end

--- Loads one static light: requires a shape node (not a light source; inside the shared light root if one is given), detects `lightControl` or a UV slot via `lightIds`, reads intensity (default 5), visibility toggle and light types (inherited from the shared light if any). Returns false with a warning on invalid nodes or missing shader parameters, else switches the light off and returns true.
---@param xmlFile any
---@param baseKey any
---@param components any
---@param i3dMappings any
---@param loadLightTypes any
---@param sharedLight any
function StaticLight:loadFromXML(xmlFile, baseKey, components, i3dMappings, loadLightTypes, sharedLight) end

--- Merges this light's types and excluded types into another light on the same node and returns it; returns itself unchanged when the UV slots differ.
---@param otherLight any
function StaticLight:merge(otherLight) end

--- Evaluates the active-type bit mask against this light's types and excluded types (and the vehicle's light-active check) and calls `setState`; does nothing without types or vehicle.
---@param lightsTypesMask any
function StaticLight:setLightTypesMask(lightsTypesMask) end

--- Marks the light as blinking in the shader `lightTypeBitMask` (whole mask, or only this UV slot if its index is 12 or below); no effect with `lightControl`.
---@param isBlinking any
function StaticLight:setIsBlinking(isBlinking) end

--- Applies the state: toggles node visibility, or writes intensity times charge into `lightControl` or the relevant `lightIds` channel (all channels when no UV slot).
---@param isActive any
---@param chargeScale any
function StaticLight:setState(isActive, chargeScale) end

--- Registers a function (and target) returning the charge scale used by `setLightTypesMask`.
---@param func any
---@param funcTarget any
function StaticLight:setChargeFunction(func, funcTarget) end

--- Loads all static lights under an XML base key into `lights` (created if nil), merging with an existing light on the same node through `vehicle:getStaticLightFromNode`. Returns the list.
---@param lights any
---@param xmlFile any
---@param baseKey any
---@param vehicle any
---@param components any
---@param i3dMappings any
---@param loadLightTypes any
---@param sharedLight any
function StaticLight.loadLightsFromXML(lights, xmlFile, baseKey, vehicle, components, i3dMappings, loadLightTypes, sharedLight) end

--- Registers the XML paths of a static light (node or shaderNode, UV slot, intensity, visibility toggle, light types).
---@param schema any
---@param basePath any
function StaticLight.registerXMLPaths(schema, basePath) end
