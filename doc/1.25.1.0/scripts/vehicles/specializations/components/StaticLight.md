# vehicles/specializations/components/StaticLight.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/components/StaticLight.md)*

Source: `dataS/scripts/vehicles/specializations/components/StaticLight.lua` — FS25 1.25.1.0

✍ A mesh-based light (emissive glow done by shader parameters, no engine light source) for vehicles. It drives the `lightControl` or `lightIds0..3` shader parameters of a shape node, or toggles its visibility, according to the active light types mask and an optional charge function. Several entries on the same node can be merged. Used by `Lights` (`spec_lights`) and by `SharedLight`; client-side visual.

- **StaticLight** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `StaticLight.new(vehicle: any, customMt: any)` | 16 | ✍ Creates a static light for a vehicle (may be nil) with no charge function. |
| `StaticLight:loadFromXML(xmlFile: any, baseKey: any, components: any, i3dMappings: any, loadLightTypes: any, sharedLight: any)` | 28 | ✍ Loads one static light: requires a shape node (not a light source; inside the shared light root if one is given), detects `lightControl` or a UV slot via `lightIds`, reads intensity (default 5), visibility toggle and light types (inherited from the shared light if any). Returns false with a warning on invalid nodes or missing shader parameters, else switches the light off and returns true. |
| `StaticLight:merge(otherLight: any)` | 144 | ✍ Merges this light's types and excluded types into another light on the same node and returns it; returns itself unchanged when the UV slots differ. |
| `StaticLight:setLightTypesMask(lightsTypesMask: any)` | 168 | ✍ Evaluates the active-type bit mask against this light's types and excluded types (and the vehicle's light-active check) and calls `setState`; does nothing without types or vehicle. |
| `StaticLight:setIsBlinking(isBlinking: any)` | 215 | ✍ Marks the light as blinking in the shader `lightTypeBitMask` (whole mask, or only this UV slot if its index is 12 or below); no effect with `lightControl`. |
| `StaticLight:setState(isActive: any, chargeScale: any)` | 242 | ✍ Applies the state: toggles node visibility, or writes intensity times charge into `lightControl` or the relevant `lightIds` channel (all channels when no UV slot). |
| `StaticLight:setChargeFunction(func: any, funcTarget: any)` | 273 | ✍ Registers a function (and target) returning the charge scale used by `setLightTypesMask`. |
| `StaticLight.loadLightsFromXML(lights: any, xmlFile: any, baseKey: any, vehicle: any, components: any, i3dMappings: any, loadLightTypes: any, sharedLight: any)` | 279 | ✍ Loads all static lights under an XML base key into `lights` (created if nil), merging with an existing light on the same node through `vehicle:getStaticLightFromNode`. Returns the list. |
| `StaticLight.registerXMLPaths(schema: any, basePath: any)` | 303 | ✍ Registers the XML paths of a static light (node or shaderNode, UV slot, intensity, visibility toggle, light types). |
