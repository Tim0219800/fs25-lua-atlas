# forestry/TargetTreeMarker.lua

*[Version française](../../fr/scripts/forestry/TargetTreeMarker.md)*

Source: `dataS/scripts/forestry/TargetTreeMarker.lua` — FS25 1.25.1.0

✍ Plain class for the coloured ring or band drawn around a tree to show the target of a forestry tool. It loads a marker i3d, shows or hides it, sets its emissive color through a shader parameter, optionally pulses it with a sine-based flash in the per-frame update, and positions it on the tree with a width and radius.

- **TargetTreeMarker** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `TargetTreeMarker.new(vehicle: any, linkNode: any, customMt: any)` | 16 | ✍ Constructor. Stores the vehicle (may be nil) and link node; the marker starts inactive, not flashing, with a minimum flash intensity of 0.1. |
| `TargetTreeMarker.registerXMLPaths(schema: any, baseKey: any)` | 32 | ✍ Registers the marker XML attributes: i3d filename, width, offset from the tree and emissive color. |
| `TargetTreeMarker:loadFromXML(xmlFile: any, key: any, baseDirectory: any)` | 41 | ✍ Reads filename, width, offset and color, then starts an asynchronous shared i3d load through the vehicle if present, otherwise through g_i3DManager. onI3DLoaded completes the setup. |
| `TargetTreeMarker:delete()` | 59 | ✍ Deletes the marker node and releases the shared i3d if loaded, and removes the marker from mission updateables. |
| `TargetTreeMarker:setIsActive(isActive: any)` | 70 | ✍ Stores the active state and shows or hides the marker node accordingly if it is loaded. |
| `TargetTreeMarker:setColor(r: any, g: any, b: any, isFlashing: any, flashingMinIntensity: any)` | 79 | ✍ Sets the RGB emissive color. When isFlashing is given and changes, it turns flashing on (registering for updates and restarting the timer) or off, and can set the minimum flash intensity. |
| `TargetTreeMarker:update(dt: any)` | 101 | ✍ Flash animation: advances the timer by dt and scales the emissive color and alpha by a sine-based factor between the minimum intensity and 1. Only runs while flashing is enabled. |
| `TargetTreeMarker:setPosition(x: any, y: any, z: any, dx: any, dy: any, dz: any, radius: any, offset: any)` | 111 | ✍ Places the marker at a world position shifted along a direction by an offset (default minus half the width), orients it along that direction and writes the width and diameter (2 x radius) into the shader. |
| `TargetTreeMarker:onI3DLoaded(i3dNode: any, failedReason: any)` | 122 | ✍ Callback of the shared i3d load. Takes the nested first child as marker node, links it under the link node, applies visibility and color, and deletes the temporary i3d root. |
