# vehicles/wheels/WheelSteering.lua

*[Version française](../../../fr/scripts/vehicles/wheels/WheelSteering.md)*

Source: `dataS/scripts/vehicles/wheels/WheelSteering.lua` — FS25 1.25.1.0

✍ Visual steering helper of a wheel: moves or rotates a steering node and rotates fenders according to the wheel steering angle, using limits from XML. Also supports a steering axle scale that reuses the limits. Purely visual; created per wheel.

- **WheelSteering** (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `WheelSteering.new(wheel: any)` | 14 | ✍ Creates the steering helper for a wheel with default min/max rotation limits of -1 and 1. |
| `WheelSteering:loadFromXML(xmlObject: any)` | 28 | ✍ Reads the steering node, rotation node, min/max translation and rotation values, the list of fenders with their limits and the steering axle values from the wheel XML. Always returns true. |
| `WheelSteering:setSteeringValues(rotMin: any, rotMax: any, rotSpeed: any, rotSpeedNeg: any, inverted: any)` | 67 | ✍ Receives the wheel's physical steering range and fills in missing fender limits and the overall steering node limits. If a steering axle scale is set, it is negated when inverted and takes the range as its limits. The speed arguments are unused. |
| `WheelSteering:update(x: any, y: any, z: any, xDrive: any, suspensionLength: any, steeringAngle: any, changed: any)` | 90 | ✍ Applies the steering angle visually: translates and/or rotates the steering node proportionally to the min/max limits, and rotates each fender around Y by the amount the angle exceeds its limits. Other arguments are unused. |
| `WheelSteering.registerXMLPaths(schema: any, key: any)` | 135 | ✍ Registers the XML schema paths for steering node, rotation node, translation/rotation limits, fenders and steering axle. |
