---@meta
-- FS25 1.25.1.0 : vehicles/specializations/components/StaticLightCompound.lua (generated stub, FS25 Lua Atlas)

--- A group of shape nodes whose shader exposes 16 light slots (`lightIds0..3`), used to drive a whole multi-function lamp (headlight, indicator, daytime light...) with one object. It maps light functions to UV slots (overridable from the XML or a `SharedLight`), computes the per-slot state, type and UV offset from the active light types mask, and writes them to every node's shader parameters. Helper methods such as `getStateValueByFunction` are called but not defined here (UNVERIFIED). Client-side visual.
---@class StaticLightCompound
StaticLightCompound = {}

--- Creates an empty static light compound for a vehicle.
---@param vehicle any
---@param customMt any
function StaticLightCompound.new(vehicle, customMt) end

--- Reads `.function` entries under a XML key (function name, UV slot 1-16, UV offset, intensity scale, light type) into a list, warning on unknown names or out-of-range slots.
---@param xmlFile any
---@param baseKey any
function StaticLightCompound.loadFunctionMappingData(xmlFile, baseKey) end

--- Loads the compound: reads options, builds the function-to-UV-slot mapping (XML mapping then shared light overrides, unused slots get a default entry), validates each node (shape, `lightIds` parameter, inside the shared light root), and inits the 16 state arrays. Returns false if no valid node remains.
---@param xmlFile any
---@param baseKey any
---@param components any
---@param i3dMappings any
---@param vehicle any
---@param sharedLight any
function StaticLightCompound:loadFromXML(xmlFile, baseKey, components, i3dMappings, vehicle, sharedLight) end

--- Stores the main light types and excluded types when the given tables are non-empty.
---@param lightTypes any
---@param excludedLightTypes any
function StaticLightCompound:setLightTypes(lightTypes, excludedLightTypes) end

--- Stores the turn left/right and reverse role flags and appends the matching additional light types from `spec_lights` to the compound's light types.
---@param turnLightLeft any
---@param turnLightRight any
---@param reverseLight any
function StaticLightCompound:setOverwriteSettings(turnLightLeft, turnLightRight, reverseLight) end

--- Recomputes slot states from the active light types mask (slot 1 from the compound's own types, the others via function mapping and intensity scales) and writes `lightIds`, `lightTypeBitMask` and `lightUvOffsetBitMask` to each node, or zeros for nodes whose light is inactive for the vehicle. The `vehicle` argument is required.
---@param lightsTypesMask any
---@param vehicle any
function StaticLightCompound:setLightTypesMask(lightsTypesMask, vehicle) end

--- Registers the XML paths of a static light compound (options, function mappings, nodes).
---@param schema any
---@param basePath any
function StaticLightCompound.registerXMLPaths(schema, basePath) end
