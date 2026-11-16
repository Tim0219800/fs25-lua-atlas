# vehicles/specializations/components/SharedLight.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/components/SharedLight.md)*

Source: `dataS/scripts/vehicles/specializations/components/SharedLight.lua` — FS25 1.25.1.0

✍ A reusable light model loaded from a shared XML/i3d asset (`data/shared/assets/lights`) and linked to a vehicle node. On load it distributes the lights found in the asset (default, top, bottom, brake, reverse, day-time, left and right turn) into the vehicle's `staticLights` tables as `StaticLight` objects, optionally builds a `StaticLightCompound`, and applies base and glass materials. Light role flags (reverse, turn left/right) and rotation presets come from the vehicle XML. Client-side visual; ships a debug console command that spawns every shared light.

- **SharedLight** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `SharedLight.new(vehicle: any, staticLights: any, customMt: any)` | 18 | ✍ Creates a shared light bound to a vehicle and to the vehicle's `staticLights` category tables; reverse and turn role flags start false. |
| `SharedLight:delete()` | 33 | ✍ Deletes the pending XML file, the light node and releases the shared i3d request. |
| `SharedLight:setCallback(callback: any, callbackTarget: any)` | 52 | ✍ Stores a callback (and optional target) called with the success flag after loading. |
| `SharedLight:onFinished(success: any)` | 59 | ✍ Invokes the registered callback, with or without target, passing the success flag. |
| `SharedLight:setRotationNodes(rotationNodes: any)` | 71 | ✍ Stores a table mapping rotation node names to rotation vectors, applied when the asset loads. |
| `SharedLight:setLightTypes(lightTypes: any, excludedLightTypes: any)` | 77 | ✍ Stores the light types and excluded light types handed to the compound light. |
| `SharedLight:loadFromVehicleXML(key: any, baseDirectory: any, callback: any)` | 84 | ✍ Reads one shared light entry in the vehicle XML (`#filename`, `#linkNode`, rotation nodes, light types, reverse/turn flags, function mapping, extra attributes) and starts loading. Refuses hidden or runtime-loaded reference link nodes. The result goes through `callback(success, self or nil)`. |
| `SharedLight:loadFromXML(linkNode: any, xmlFilename: any, baseDirectory: any)` | 146 | ✍ Loads the shared light XML and starts the async shared i3d load. When the XML is missing it checks `FS22_RENAMED_LIGHTS` to warn about renamed assets. Returns false (after `onFinished(false)`) on failure. |
| `SharedLight:onI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 201 | ✍ Async callback: loads the lights of every category into the vehicle tables (the default category is redirected to reverse or turn lists depending on the role flags), applies rotation presets, builds the optional compound, applies base and glass materials and links the node under the link node. |
| `SharedLight.consoleCommandDebug(_: any, defaultLight: any, brakeLight: any, highBeam: any, workLightBack: any, workLightFront: any, turnLightLeft: any, turnLeftRight: any, reverseLight: any)` | 272 | ✍ Debug console command: loads every shared light XML in the game's lights folder in rows in front of the player using a dummy vehicle, switches on the light types given as `true` strings and logs how many loaded. It also spawns the debug beacons. |
| `SharedLight.registerXMLPaths(schema: any, basePath: any)` | 445 | ✍ Empty; registers no XML paths. |
| `SharedLight.registerExternalXMLPaths(schema: any)` | 466 | ✍ Registers the XML paths of the shared light asset: each static light category, base and glass materials and the static light compound. |
