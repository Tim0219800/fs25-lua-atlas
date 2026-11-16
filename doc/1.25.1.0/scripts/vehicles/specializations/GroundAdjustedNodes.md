# vehicles/specializations/GroundAdjustedNodes.lua

*[Version française](../../../fr/scripts/vehicles/specializations/GroundAdjustedNodes.md)*

Source: `dataS/scripts/vehicles/specializations/GroundAdjustedNodes.lua` — FS25 1.25.1.0

✍ Vehicle specialization that moves nodes vertically so they follow the ground, for example the hoses of a slurry spreader. Raycasts from configured nodes measure the distance to the terrain (or water), and the adjust nodes are translated toward the result at a limited speed. It runs on the client and the server alike, only updates when the vehicle is near the player, and adds a small wobble while over a field. Configurable through the vehicle XML and a shop configuration.

- **GroundAdjustedNodes** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `GroundAdjustedNodes.prerequisitesPresent(specializations: any)` | 20 | ✍ Always returns true: the specialization has no prerequisite on other specializations. |
| `GroundAdjustedNodes.initSpecialization()` | 26 | ✍ Registers the shop configuration type "groundAdjustedNode" and the XML schema paths under vehicle.groundAdjustedNodes (update distances, water adjustment, collision mask, attach-only flag). Also adds start/end ground adjust scale attributes to animation parts. |
| `GroundAdjustedNodes.registerNodeXMLPaths(schema: any, basePath: any)` | 51 | ✍ Registers the XML attributes of one groundAdjustedNode entry: activation time, Y offset and up to several raycast nodes. Also registers the adjust-node attributes, both directly on the entry (old style) and on its adjustNode children. |
| `GroundAdjustedNodes.registerAdjustNodeXMLPaths(schema: any, basePath: any)` | 68 | ✍ Registers the XML attributes of an adjust node: node, minY and maxY limits, move speeds, reset-when-inactive, update threshold, inactive position and the averaged inactive height option. |
| `GroundAdjustedNodes.registerFunctions(vehicleType: any)` | 83 | ✍ Registers the specialization's vehicle functions (XML loaders, init, activity check and the raycast and node update functions) on the vehicle type. |
| `GroundAdjustedNodes.registerEventListeners(vehicleType: any)` | 95 | ✍ Subscribes the specialization to onLoad, onLoadFinished, onUpdate and onRegisterAnimationValueTypes. |
| `GroundAdjustedNodes:onLoad(savegame: any)` | 104 | ✍ Reads the global settings and loads every groundAdjustedNode, both the base ones and those of the selected configuration. If none is valid, it removes the update, load-finished and animation listeners to save work. |
| `GroundAdjustedNodes:onLoadFinished(savegame: any)` | 143 | ✍ Computes the initial active state of each node and, if active, applies the current adjusted height to nodes that differ noticeably from their i3d position. Flags moving tools as dirty when available. |
| `GroundAdjustedNodes:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 165 | ✍ Each frame, if the vehicle is closer than maxUpdateDistance, runs the raycasts and then updates every ground adjusted node. Nothing happens when the vehicle is farther away. |
| `GroundAdjustedNodes:loadGroundAdjustedNodeFromXML(xmlFile: any, key: any, groundAdjustedNode: any)` | 178 | ✍ Loads one groundAdjustedNode: activation time, adjust nodes (including the legacy single-node form) and raycast nodes, with a limit of two raycast nodes. Returns true only if at least one raycast node and one adjust node exist, otherwise logs a warning. |
| `GroundAdjustedNodes:loadGroundAdjustedRaycastNodeFromXML(xmlFile: any, key: any, groundAdjustedNode: any, raycastNode: any)` | 232 | ✍ Loads a raycast node (node, distance, Y offset) and builds its raycast callback, which ignores triggers and stores the hit distance. Reuses an existing entry when the same node has identical settings, and rejects conflicting duplicates. Returns nil on error. |
| `GroundAdjustedNodes:loadGroundAdjustedAdjustNodeFromXML(xmlFile: any, key: any, groundAdjustedNode: any, adjustNode: any, required: any)` | 280 | ✍ Loads one adjust node: stores its current translation, Y limits, move speeds (converted to per millisecond) and inactive height. Returns false if the node is missing, with a warning only when it is required. |
| `GroundAdjustedNodes:initGroundAdjustedAdjustNode(groundAdjustedNode: any, adjustNode: any)` | 317 | ✍ When two raycast nodes are used, computes the adjust node's relative position between them (alpha) so the two measured heights can be interpolated. Does nothing with a single raycast node. |
| `GroundAdjustedNodes:updateGroundAdjustedRaycasts(dt: any)` | 332 | ✍ For each active raycast node, checks whether the spot is on a field via the terrain detail density map. Off a field (or with water adjustment) it raycasts downward, otherwise it uses the terrain height. Stores the resulting distance to the ground. |
| `GroundAdjustedNodes:updateGroundAdjustedNode(groundAdjustedNode: any, dt: any)` | 390 | ✍ Updates the active state and each adjust node's target height: from the measured ground distance, plus a noise wobble on fields, clamped to minY and maxY and blended with the inactive position by the active scale. Then moves the node toward it at the configured speed. |
| `GroundAdjustedNodes:getIsGroundAdjustedNodeActive(groundAdjustedNode: any, ignoreAttachState: any)` | 490 | ✍ Returns whether ground adjustment is allowed: always when the onlyActiveWhileAttached option is off, or when the vehicle is attached to another vehicle, or when the attach check is ignored. |
| `GroundAdjustedNodes:onRegisterAnimationValueTypes()` | 497 | ✍ Registers the animation value type "groundAdjustScale", which lets an animation drive the active scale of the ground adjusted node owning a given node. Warns and returns 0 if no matching groundAdjustedNode is found. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadGroundAdjustedNodeFromXML` | 84 |
| registerFunction | `loadGroundAdjustedAdjustNodeFromXML` | 85 |
| registerFunction | `initGroundAdjustedAdjustNode` | 86 |
| registerFunction | `loadGroundAdjustedRaycastNodeFromXML` | 87 |
| registerFunction | `getIsGroundAdjustedNodeActive` | 88 |
| registerFunction | `updateGroundAdjustedRaycasts` | 89 |
| registerFunction | `updateGroundAdjustedNode` | 90 |
| registerEventListener | `onLoad` | 96 |
| registerEventListener | `onLoadFinished` | 97 |
| registerEventListener | `onUpdate` | 98 |
| registerEventListener | `onRegisterAnimationValueTypes` | 99 |
