# vehicles/specializations/components/RealLight.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/components/RealLight.md)*

Source: `dataS/scripts/vehicles/specializations/components/RealLight.lua` — FS25 1.25.1.0

✍ Wrapper around one or more engine light sources used by the vehicle Lights specialization (`spec_lights`). It reads a light node from XML, handles light types and excluded types, IES profile, light scattering and shadow (including a merged-shadow helper spot light) according to the `LIGHTS_PROFILE` setting, and turns the light on or off with a charge-based colour scale. Client-side visual; it calls vehicle methods such as `getIsLightActive` and `getRealLightFromNode` that are defined elsewhere (UNVERIFIED).

- **RealLight** (l.23)

## Functions

| Function | Line | Description |
|---|---|---|
| `RealLight.new(vehicle: any, customMt: any)` | 27 | ✍ Creates a real light object for a vehicle with no charge function. |
| `RealLight:loadFromXML(xmlFile: any, baseKey: any, components: any, i3dMappings: any, loadLightTypes: any)` | 39 | ✍ Loads a real light from XML: validates the node is a light source, collects child light sources, reads intensity scale, light types, IES profile, scattering and shadow settings (builds a merged shadow spot when several sources and shadows are used). Returns false with a warning if the node is missing or not a light. |
| `RealLight:merge(otherLight: any)` | 162 | ✍ Appends this light's light types and excluded types to another light on the same node and returns that other light. |
| `RealLight:updateIESProfile(iesEnabled: any)` | 179 | ✍ Enables or disables IES profiles on the sources whose names match `RealLight.DEFAULT_LIGHT_PROFILE`, and sets the current intensity scale from the profile. Note: the scale line runs after the disable branch too, so it overrides the reset done there. |
| `RealLight:updateLightScattering()` | 212 | ✍ Turns engine light scattering on or off per source depending on `useLightScattering`, light types, lights profile (high or very high) and range above 7.5; caps the scattering cone angle to `SCATTERING_MAX_ANGLE`. |
| `RealLight:updateMergedShadows()` | 260 | ✍ Applies shadow maps (512) according to the lights profile: only at ultra, merges the shadows of several sources or sets a single shadow with priority, ignoring the vehicle components; otherwise disables shadow maps. |
| `RealLight:finalize()` | 308 | ✍ Finishes loading by calling `updateMergedShadows`. |
| `RealLight:onLightsProfileChanged(lightsProfile: any)` | 314 | ✍ Re-applies IES profile, light scattering and shadows after the lights quality profile changed. |
| `RealLight:setLightTypesMask(lightsTypesMask: any)` | 323 | ✍ Computes from a bit mask of active light types whether this light is on (honouring excluded types and the vehicle's light-active check) and a charge scale, optionally from the charge function, then calls `setState`. |
| `RealLight:setIsBlinking(isBlinking: any)` | 365 | ✍ Empty hook; real lights ignore blinking state. |
| `RealLight:setState(isActive: any, chargeScale: any)` | 370 | ✍ Sets the light colour scale from the charge (or 1/0 by state) and shows or hides the light node. |
| `RealLight:setCharge(alpha: any)` | 377 | ✍ Multiplies the default colour by the charge and current intensity scale and applies it to every light source. |
| `RealLight:setChargeFunction(func: any, funcTarget: any)` | 387 | ✍ Registers a function (and target) that returns the charge scale used by `setLightTypesMask`. |
| `RealLight.getAreShadowsMergable(lightSources: any)` | 393 | ✍ Checks pairwise whether the cone edges of the given light sources stay within a half space, i.e. whether their shadows can be merged. Returns a boolean. |
| `RealLight.getConeAngleContribution(lightSource1: integer, lightSource2: integer, coneAngle: number, yRotation: number) → number` | 438 | ✍ Helper that returns the angle reached by one cone edge of `lightSource2` as seen from `lightSource1` (edge angle plus half cone). |
| `RealLight.getMergedConeAngleSize(lightSources: any)` | 459 | ✍ Returns the largest cone angle needed to cover all given light sources, taking both edges of each cone pairwise. |
| `RealLight.loadLightsFromXML(lights: any, xmlFile: any, baseKey: any, vehicle: any, components: any, i3dMappings: any, loadLightTypes: any)` | 480 | ✍ Loads every real light under an XML base key into `lights` (created if nil), merging with an existing light of the same node via `vehicle:getRealLightFromNode`. Returns the list. |
| `RealLight.registerXMLPaths(schema: any, basePath: any)` | 502 | ✍ Registers the XML paths of a real light (node, intensity, types, IES profile, scattering, shadows). |
| `RealLight.consoleCommandDebugIES(_: any, enabled: any)` | 518 | ✍ Console command: toggles or sets IES profile usage and re-applies it to the real lights of the current vehicle and its children. Note: `IES_DEBUG_ENABLED` is stored here; whether other code reads it is UNVERIFIED. |
