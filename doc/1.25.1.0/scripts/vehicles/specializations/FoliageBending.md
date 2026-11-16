# vehicles/specializations/FoliageBending.lua

*[Version française](../../../fr/scripts/vehicles/specializations/FoliageBending.md)*

Source: `dataS/scripts/vehicles/specializations/FoliageBending.lua` — FS25 1.25.1.0

✍ Specialization that makes a vehicle push aside foliage on the map through g_currentMission.foliageBendingSystem. Bending nodes are rectangles (X and Z extents plus a height offset) attached to a vehicle node, created when the vehicle is activated and destroyed on deactivation or deletion. Configuration-dependent foliageBendingModifier entries can resize or disable nodes. The FoliageBendingSystem class itself is not in the dump (UNVERIFIED).

- **FoliageBending** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `FoliageBending.prerequisitesPresent(specializations: any)` | 17 | ✍ Always returns true: no prerequisite specialization. |
| `FoliageBending.initSpecialization()` | 23 | ✍ Declares the XML attributes of a bending node (node, min/max X and Z extents, yOffset). |
| `FoliageBending.postInitSpecialization()` | 40 | ✍ After all specializations are known, registers the foliageBendingModifier XML element under every vehicle configuration type: index or indices, extents, yOffset, isActive and overwrite. |
| `FoliageBending.registerFunctions(vehicleType: any)` | 65 | ✍ Registers the bending node load, modifier load, activate, deactivate and lookup functions on the vehicle type. |
| `FoliageBending.registerEventListeners(vehicleType: any)` | 75 | ✍ Subscribes to post load, delete, activate and deactivate events. |
| `FoliageBending:onPostLoad(savegame: any)` | 84 | ✍ Loads all vehicle.foliageBending.bendingNode entries, then applies foliageBendingModifier entries of the active configurations: either overwriting the node extents or widening them, and optionally disabling a node. Warns on undefined indices. |
| `FoliageBending:onDelete()` | 146 | ✍ Removes all active bending objects of the vehicle from the foliage bending system. |
| `FoliageBending:loadBendingNodeFromXML(xmlFile: any, key: any, bendingNode: any)` | 152 | ✍ Reads one bending node: node (defaults to the vehicle root node), extents minX/maxX/minZ/maxZ (default -1 to 1) and yOffset (default 0). Always returns true. |
| `FoliageBending:loadBendingNodeModifierFromXML(xmlFile: any, key: any)` | 172 | ✍ Reads one modifier (index or indices, optional extents, isActive, overwrite) and queues it in spec.bendingModifiers. Returns nothing and logs a warning when no index is given. |
| `FoliageBending:activateBendingNodes()` | 205 | ✍ Creates a rectangle in g_currentMission.foliageBendingSystem for each active node that has none yet, storing its id. The system class is not in the dump (UNVERIFIED behaviour). |
| `FoliageBending:deactivateBendingNodes()` | 218 | ✍ Destroys the foliage bending objects created for this vehicle and clears their ids; safe to call when no node exists. |
| `FoliageBending:getFoliageBendingNodeByIndex(index: any)` | 232 | ✍ Returns the bending node table at the given index (nil if out of range). |
| `FoliageBending:onActivate()` | 238 | ✍ Calls activateBendingNodes when the vehicle is activated. |
| `FoliageBending:onDeactivate()` | 244 | ✍ Calls deactivateBendingNodes when the vehicle is deactivated. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadBendingNodeFromXML` | 66 |
| registerFunction | `loadBendingNodeModifierFromXML` | 67 |
| registerFunction | `activateBendingNodes` | 68 |
| registerFunction | `deactivateBendingNodes` | 69 |
| registerFunction | `getFoliageBendingNodeByIndex` | 70 |
| registerEventListener | `onPostLoad` | 76 |
| registerEventListener | `onDelete` | 77 |
| registerEventListener | `onActivate` | 78 |
| registerEventListener | `onDeactivate` | 79 |
