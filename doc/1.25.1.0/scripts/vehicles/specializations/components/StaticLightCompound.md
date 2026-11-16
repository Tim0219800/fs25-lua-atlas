# vehicles/specializations/components/StaticLightCompound.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/components/StaticLightCompound.md)*

Source: `dataS/scripts/vehicles/specializations/components/StaticLightCompound.lua` — FS25 1.25.1.0

✍ A group of shape nodes whose shader exposes 16 light slots (`lightIds0..3`), used to drive a whole multi-function lamp (headlight, indicator, daytime light...) with one object. It maps light functions to UV slots (overridable from the XML or a `SharedLight`), computes the per-slot state, type and UV offset from the active light types mask, and writes them to every node's shader parameters. Helper methods such as `getStateValueByFunction` are called but not defined here (UNVERIFIED). Client-side visual.

- **StaticLightCompound** (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `StaticLightCompound.new(vehicle: any, customMt: any)` | 19 | ✍ Creates an empty static light compound for a vehicle. |
| `StaticLightCompound.loadFunctionMappingData(xmlFile: any, baseKey: any)` | 29 | ✍ Reads `.function` entries under a XML key (function name, UV slot 1-16, UV offset, intensity scale, light type) into a list, warning on unknown names or out-of-range slots. |
| `StaticLightCompound:loadFromXML(xmlFile: any, baseKey: any, components: any, i3dMappings: any, vehicle: any, sharedLight: any)` | 61 | ✍ Loads the compound: reads options, builds the function-to-UV-slot mapping (XML mapping then shared light overrides, unused slots get a default entry), validates each node (shape, `lightIds` parameter, inside the shared light root), and inits the 16 state arrays. Returns false if no valid node remains. |
| `StaticLightCompound:setLightTypes(lightTypes: any, excludedLightTypes: any)` | 213 | ✍ Stores the main light types and excluded types when the given tables are non-empty. |
| `StaticLightCompound:setOverwriteSettings(turnLightLeft: any, turnLightRight: any, reverseLight: any)` | 225 | ✍ Stores the turn left/right and reverse role flags and appends the matching additional light types from `spec_lights` to the compound's light types. |
| `StaticLightCompound:setLightTypesMask(lightsTypesMask: any, vehicle: any)` | 259 | ✍ Recomputes slot states from the active light types mask (slot 1 from the compound's own types, the others via function mapping and intensity scales) and writes `lightIds`, `lightTypeBitMask` and `lightUvOffsetBitMask` to each node, or zeros for nodes whose light is inactive for the vehicle. The `vehicle` argument is required. |
| `StaticLightCompound.registerXMLPaths(schema: any, basePath: any)` | 449 | ✍ Registers the XML paths of a static light compound (options, function mappings, nodes). |
