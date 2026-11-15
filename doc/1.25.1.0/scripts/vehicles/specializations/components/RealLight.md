# vehicles/specializations/components/RealLight.lua

Source : `dataS/scripts/vehicles/specializations/components/RealLight.lua` — FS25 1.25.1.0

- **RealLight** (l.23)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RealLight.new(vehicle: any, customMt: any)` | 27 |  |
| `RealLight:loadFromXML(xmlFile: any, baseKey: any, components: any, i3dMappings: any, loadLightTypes: any)` | 39 |  |
| `RealLight:merge(otherLight: any)` | 162 |  |
| `RealLight:updateIESProfile(iesEnabled: any)` | 179 |  |
| `RealLight:updateLightScattering()` | 212 |  |
| `RealLight:updateMergedShadows()` | 260 |  |
| `RealLight:finalize()` | 308 |  |
| `RealLight:onLightsProfileChanged(lightsProfile: any)` | 314 |  |
| `RealLight:setLightTypesMask(lightsTypesMask: any)` | 323 |  |
| `RealLight:setIsBlinking(isBlinking: any)` | 365 |  |
| `RealLight:setState(isActive: any, chargeScale: any)` | 370 |  |
| `RealLight:setCharge(alpha: any)` | 377 |  |
| `RealLight:setChargeFunction(func: any, funcTarget: any)` | 387 |  |
| `RealLight.getAreShadowsMergable(lightSources: any)` | 393 |  |
| `RealLight.getConeAngleContribution(lightSource1: integer, lightSource2: integer, coneAngle: number, yRotation: number) → number` | 438 |  |
| `RealLight.getMergedConeAngleSize(lightSources: any)` | 459 |  |
| `RealLight.loadLightsFromXML(lights: any, xmlFile: any, baseKey: any, vehicle: any, components: any, i3dMappings: any, loadLightTypes: any)` | 480 |  |
| `RealLight.registerXMLPaths(schema: any, basePath: any)` | 502 |  |
| `RealLight.consoleCommandDebugIES(_: any, enabled: any)` | 518 |  |
