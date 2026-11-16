# forestry/ForestryRope.lua

*[Version française](../../fr/scripts/forestry/ForestryRope.md)*

Source: `dataS/scripts/forestry/ForestryRope.lua` — FS25 1.25.1.0

✍ Plain class for a purely visual forestry rope: a single shape stretched between a reference frame and a target point through shader parameters, with no physics. It loads a rope i3d (shared), keeps the rope pointed at a target node or position, and lets the owner change length, link node, visibility and emissive color (valid versus invalid). Sibling of ForestryPhysicsRope and ForestryHook.

- **ForestryRope** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `ForestryRope.new(vehicle: any, linkNode: any, customMt: any)` | 17 | ✍ Constructor. Stores the vehicle (may be nil) and link node and initialises local position and rotation, visibility, target data and bounding radius. |
| `ForestryRope.registerXMLPaths(schema: any, baseKey: any)` | 38 | ✍ Registers the rope XML attributes: i3d filename, rope node path, diameter, uv scale, and emissive colors for the valid and invalid states. Note: declared default colors differ from the ones used in loadFromXML. |
| `ForestryRope:loadFromXML(xmlFile: any, key: any, baseDirectory: any)` | 49 | ✍ Reads rope settings from XML and starts an asynchronous shared i3d load, through the vehicle if present, otherwise g_i3DManager. onI3DLoaded completes the setup. |
| `ForestryRope:loadFromConfigXML(xmlFile: any)` | 69 | ✍ Empty hook, nothing is loaded here. |
| `ForestryRope:clone(linkNode: any)` | 74 | ✍ Creates a copy with the same settings, optionally on another link node, reloading the cached i3d synchronously. Returns the clone, or nothing if there is no i3d filename. |
| `ForestryRope:delete()` | 93 | ✍ Removes the rope from mission updateables, deletes the reference frame if it still exists and releases the shared i3d. |
| `ForestryRope:update(dt: any)` | 108 | ✍ If a target is set, converts it to the reference frame's local space, points the rope at it and sets the rope length to the distance. Refreshes the target position first when a target node is used. |
| `ForestryRope:setLength(length: any)` | 124 | ✍ Writes the length into the rope shader parameter (with diameter and uv scale) and resizes the shape bounding sphere when the radius changes. Does nothing until the reference frame exists. |
| `ForestryRope:setTargetNode(nodeId: any, isActiveDirty: any)` | 139 | ✍ Sets a node as rope target and updates immediately. With isActiveDirty true the rope is registered for per-frame updates (to follow a moving node), otherwise it is removed from them. The node must not be nil. |
| `ForestryRope:setTargetPosition(x: any, y: any, z: any)` | 155 | ✍ Sets a fixed world position as target and updates immediately. |
| `ForestryRope:link(node: any, x: any, y: any, z: any, rx: any, ry: any, rz: any)` | 163 | ✍ Changes the link node and optionally the local position and rotation (nil keeps the old values), then re-links and repositions the reference frame if it exists. |
| `ForestryRope:setPositionAndDirection(x: any, y: any, z: any, dx: any, dz: any)` | 178 | ✍ Sets the rope start from a world position and, if both dx and dz are given, a horizontal direction, converted to the link node's local space; applies it to the reference frame if it exists. |
| `ForestryRope:setVisibility(visibility: any)` | 194 | ✍ Stores the visibility flag and applies it to the reference frame if it exists. |
| `ForestryRope:setEmissiveColor(valid: any)` | 203 | ✍ Sets the rope emissive shader color to the valid color when valid is true, otherwise the invalid color. Does nothing if the rope shape is not loaded. |
| `ForestryRope:onI3DLoaded(i3dNode: any, failedReason: any)` | 212 | ✍ Callback of the shared i3d load. Finds the rope shape by path, wraps it in a new reference frame linked under the link node, applies the emissive color, updates, then deletes the temporary i3d root. |
