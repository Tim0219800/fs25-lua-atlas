# vehicles/wheels/WheelVisual.lua

*[Version française](../../../fr/scripts/vehicles/wheels/WheelVisual.md)*

Source: `dataS/scripts/vehicles/wheels/WheelVisual.lua` — FS25 1.25.1.0

✍ One visual wheel (tire plus rims and extras) of a vehicle wheel, made of visual parts loaded from XML under a transform group linked to the wheel. It supports a connected twin wheel, reports width, offset, tire node and added mass, forwards per-frame updates to its parts, and can register a shallow-water obstacle with the mission simulation.

- **WheelVisual** (l.24)

## Functions

| Function | Line | Description |
|---|---|---|
| `WheelVisual.new(vehicle: any, wheel: any, linkNode: any, isLeft: any, rimOffset: any, baseDirectory: any, customMt: any)` | 28 | ✍ Creates the visual wheel, linking a new transform group named visualWheel to the given node. Defaults to width 0.5 and radius 0.5. |
| `WheelVisual:delete()` | 52 | ✍ Deletes all visual parts, removes the shallow-water obstacle and deletes the root node. |
| `WheelVisual:loadFromXML(xmlObject: any)` | 64 | ✍ Loads physics width/radius, rim diameter, an optional rim material template and every visual part type from WheelVisual.PARTS, adding the rim offset to parts other than innerRim and additional. Returns true if at least one part loaded. |
| `WheelVisual:postLoad()` | 113 | ✍ Applies the rim material to inner and outer rim parts, then calls `postLoad` on every part. |
| `WheelVisual:setConnectedWheel(connectedVisualWheel: any, offset: any)` | 127 | ✍ Links this wheel to a twin wheel with a signed offset and positions its node along X beside it, taking both widths and the left/right side into account. |
| `WheelVisual:getWidthAndOffset()` | 152 | ✍ Returns the wheel width and its X offset; when a tire part exists the offset includes the tire part offset (sign depends on left/right). |
| `WheelVisual:getIsTireInverted()` | 165 | ✍ Returns the inverted flag if the wheel has a tire part, otherwise false. |
| `WheelVisual:getTireNode()` | 177 | ✍ Returns the node of the first tire part, or nil if none. |
| `WheelVisual:getAdditionalMass()` | 189 | ✍ Returns the summed mass of all visual parts. |
| `WheelVisual:update(x: any, y: any, z: any, xDrive: any, suspensionLength: any, steeringAngle: any, changed: any)` | 200 | ✍ Calls `update` on each part that has one, threading the changed flag and suspension length through them; returns both values. |
| `WheelVisual:addShallowWaterObstacle()` | 212 | ✍ Registers this wheel as an obstacle in `g_currentMission.shallowWaterSimulation` if it exists, sized from width and radius. Skipped in the shop configuration; the simulation class is not in the dump (UNVERIFIED). |
| `WheelVisual:removeShallowWaterObstacle()` | 235 | ✍ Removes the shallow-water obstacle if one was registered. |
| `WheelVisual:getShallowWaterParameters()` | 244 | ✍ Callback returning the X/Z push vector and Y rotation for the water simulation, from vehicle speed plus random jitter when the wheel slips or moves. Note: `math.random() * 2 - 1 * slip` has an operator precedence quirk, so slip only scales the constant 1. |
| `WheelVisual.registerXMLPaths(schema: any, key: any)` | 269 | ✍ Registers the XML schema paths of every visual part type defined in WheelVisual.PARTS under the given key. |
