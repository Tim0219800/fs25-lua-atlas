# vehicles/wheels/WheelVisualPartTire.lua

*[Version française](../../../fr/scripts/vehicles/wheels/WheelVisualPartTire.md)*

Source: `dataS/scripts/vehicles/wheels/WheelVisualPartTire.lua` — FS25 1.25.1.0

✍ Visual wheel part for the tire (subclass of WheelVisualPart). It can show tire pressure deformation by driving the `morphPos`/`prevMorphPos` shader parameters on tire shapes from the suspension length, when the platform setting `wheelVisualPressure` is on; it also adds the deformation to the returned suspension length.

- **WheelVisualPartTire** inherits from `WheelVisualPart` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `WheelVisualPartTire.new(name: any, visualWheel: any, linkNode: any, customMt: any)` | 16 | ✍ Creates a tire part through the parent constructor with deformation 0. Note: the customMt argument is ignored. |
| `WheelVisualPartTire:loadFromXML(xmlObject: any, key: any)` | 27 | ✍ Calls the parent loader, then reads maxDeformation and initialDeformation (default min(0.04, 60 percent of the max)). Returns false if the parent load fails. |
| `WheelVisualPartTire:update(x: any, y: any, z: any, xDrive: any, suspensionLength: any, steeringAngle: any, changed: any)` | 40 | ✍ When pressure visuals are enabled, computes a clamped deformation from the suspension length, updates the morph shader parameters when it changed past a platform threshold, and returns the changed flag and suspension length increased by the deformation. |
| `WheelVisualPartTire:setNode(node: any)` | 80 | ✍ Calls the parent `setNode`, collects the shapes having a `morphPos` (or legacy `morphPosition`) shader parameter and initializes their morph parameters, converting the old FS22 format. |
| `WheelVisualPartTire.registerXMLPaths(schema: any, key: any, name: any)` | 109 | ✍ Registers the XML paths of the tire part; currently just forwards to the parent registration. |
