# vehicles/wheels/WheelAxle.lua

*[Version française](../../../fr/scripts/vehicles/wheels/WheelAxle.md)*

Source: `dataS/scripts/vehicles/wheels/WheelAxle.lua` — FS25 1.25.1.0

✍ Describes a pair of wheels forming an axle, with optional load-dependent ('dynamic') suspension: spring and damping multipliers, and optionally a component joint, are blended according to the axle load. Loaded from the vehicle wheel XML; created by the vehicle wheel code with the owning vehicle.

- **WheelAxle** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `WheelAxle.new(vehicle: any, customMt: any)` | 16 | ✍ Creates an axle object bound to the given vehicle. |
| `WheelAxle:delete()` | 26 | ✍ Empty cleanup function; the axle owns no resources. |
| `WheelAxle:loadFromXML(xmlFile: any, key: any)` | 31 | ✍ Reads the two wheel nodes (`#wheel1`, `#wheel2`), resolves the wheels and loads the optional dynamicSuspension settings. Returns false (with an XML error if a node is missing) when the wheels cannot be found. |
| `WheelAxle:update(dt: any)` | 76 | ✍ Per-frame update: computes the combined tire load, smooths a 0..1 alpha toward it and, when it changed enough, applies lerped spring/damping multipliers to both wheels and the optional component joint. Note: it reads `self.maxLoad`, which is never set (the XML value is in `dynamicSuspension.maxLoad`), so the XML maxLoad appears ignored here. |
| `WheelAxle.getDebugValueHeader()` | 113 | ✍ Returns the column headers used by the vehicle wheel debug table for axles. |
| `WheelAxle:fillDebugValues(debugTable: any)` | 119 | ✍ Appends this axle's debug values (wheel indices, load, max load, alpha, spring/damping multipliers, joint data) to the given debug table columns; only writes when dynamic suspension exists. |
| `WheelAxle.registerXMLPaths(schema: any, key: any)` | 155 | ✍ Registers the XML schema paths for an axle: the two wheel nodes and the dynamicSuspension and componentJoint attributes. |
