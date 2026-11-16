# vehicles/specializations/components/BeaconLight.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/components/BeaconLight.md)*

Source: `dataS/scripts/vehicles/specializations/components/BeaconLight.lua` — FS25 1.25.1.0

✍ Rotating or blinking beacon light for vehicles. It is loaded either from a shared beacon XML/i3d asset (with selectable variation and mount type) or from inline `staticLight` entries in the vehicle XML. It drives a rotator node, a real light source, and shader-based static lights whose intensity can depend on camera distance; the real light follows the `REAL_BEACON_LIGHTS` game setting. Client-side visual object; the vehicle calls `setIsActive`. Device data comes from `BeaconLightManager` (defined elsewhere, UNVERIFIED).

- **BeaconLight** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `BeaconLight.new(vehicle: any, customMt: any)` | 18 | ✍ Creates a beacon light for a vehicle (may be nil for debug use) with default speed 1, intensity 1, real light range scale 1, inactive. |
| `BeaconLight:delete()` | 43 | ✍ Deletes the beacon node, releases the shared i3d request and removes the object from the mission updateables. |
| `BeaconLight:setCallback(callback: any, callbackTarget: any)` | 59 | ✍ Stores a callback (and optional target) called with the success flag once loading is done. |
| `BeaconLight.loadFromVehicleXML(targetTable: any, xmlFile: any, key: any, vehicle: any)` | 66 | ✍ Creates a beacon light from a vehicle XML key and, on success, appends it to `targetTable`. With `#filename` it loads the shared asset at `#node` (refusing runtime-loaded reference nodes); without it, it reads inline `staticLight` entries. Returns the object or nil. |
| `BeaconLight:setXMLSettings(speed: any, intensity: any, mountType: any, variationName: any)` | 157 | ✍ Stores speed, intensity, mount type and variation name from the XML; nil speed or intensity keep the current values. |
| `BeaconLight:setRealLight(useRealLights: any, customRealLight: any, realLightRangeScale: any)` | 167 | ✍ Sets whether a real light is used, an optional external light node replacing the asset's one, and the range scale applied to it. |
| `BeaconLight:loadFromXML(linkNode: any, xmlFilename: any, baseDirectory: any)` | 175 | ✍ Loads the beacon asset XML and starts the asynchronous shared i3d load, linking later to `linkNode`. Returns false and calls `onFinished(false)` when the XML or the i3d filename is missing. |
| `BeaconLight:onI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 213 | ✍ Async callback: picks the requested variation and mount type, deletes the unused variation and mount nodes, loads variation settings, links the root under the link node with the mount y offset. Note: success is reported as node present AND has static lights, so assets without static lights count as failed. |
| `BeaconLight:onFinished(success: any)` | 289 | ✍ Initialises shader parameters of static lights, randomises the rotator start angle, sets up or removes the real light node (range scaling, shadow priority 0.25, hidden), then calls the callback. |
| `BeaconLight:loadVariationFromXML(xmlFile: any, key: any)` | 347 | ✍ Reads rotator, real light, static lights, device (via `BeaconLightManager`) and an optional material from one XML key (base or a variation) and applies the material to the node. |
| `BeaconLight:update(dt: any)` | 414 | ✍ Spins the rotator, animates the real light colour for multi-blink patterns, and refreshes distance-dependent intensity and minimum-distance visibility of static lights when the camera distance changed by more than 1. |
| `BeaconLight:setIsActive(isActive: any)` | 465 | ✍ Turns the beacon on or off: registers or unregisters per-frame updates if needed, toggles the real light (only when the beacon real-light setting is on) and sets each static light's shader intensity. |
| `BeaconLight:onLightsRealBeaconLightChanged()` | 534 | ✍ Reacts to a change of the real beacon light game setting by updating the visibility of the real light node. |
| `BeaconLight.spawnDebugBeacons(rootNode: any)` | 548 | ✍ Debug helper: scans the `data/shared/assets/beaconLights` folder, spawns every mount type and variation of each XML in a grid under `rootNode`, labels them and logs how many loaded or failed. |
| `BeaconLight.registerXMLPaths(schema: any)` | 632 | ✍ Registers the XML paths of the beacon asset: base and per-variation settings plus i3d mappings. |
| `BeaconLight.registerVariationPaths(schema: any, basePath: any)` | 651 | ✍ Registers the material and device XML paths for a beacon variation key. |
| `BeaconLight.registerVehicleXMLPaths(schema: any, basePath: any)` | 677 | ✍ Registers the vehicle-side XML paths for a beacon light (filename, node, speed, real light, intensity, mount type, variation, inline static lights). |
