# vehicles/specializations/ShallowWaterObstacles.lua

*[Version française](../../../fr/scripts/vehicles/specializations/ShallowWaterObstacles.md)*

Source: `dataS/scripts/vehicles/specializations/ShallowWaterObstacles.lua` — FS25 1.25.1.0

✍ Specialization that registers vehicle nodes as obstacles in the shallow water simulation (`g_currentMission.shallowWaterSimulation`), so moving vehicles push water. Event listeners are only registered when `Platform.hasShallowWaterSimulation` is true. The simulation class itself is not in the dump, so what it does with the obstacles is UNVERIFIED. XML entries come from `vehicle.shallowWaterObstacle.obstacleNode`.


## Functions

| Function | Line | Description |
|---|---|---|
| `ShallowWaterObstacles.prerequisitesPresent(specializations: any)` | 18 | ✍ Always returns true: no other specialization is required. |
| `ShallowWaterObstacles.initSpecialization()` | 24 | ✍ Declares the obstacle node XML schema: node, direction node (defaults to the node), size in meters (default 1 1 1) and local offset. |
| `ShallowWaterObstacles.registerFunctions(vehicleType: any)` | 39 | ✍ Registers `loadObstacleNodeFromXML` on the vehicle type. |
| `ShallowWaterObstacles.registerEventListeners(vehicleType: any)` | 45 | ✍ Subscribes to onPostLoad, onLoadFinished and onDelete, but only if the platform supports shallow water simulation; otherwise registers nothing. |
| `ShallowWaterObstacles:onPostLoad(savegame: any)` | 57 | ✍ Loads all `obstacleNode` entries from the XML. If none is valid, removes the other listeners and clears the list. |
| `ShallowWaterObstacles:onLoadFinished(savegame: table)` | 80 | ✍ Registers each obstacle node with the shallow water simulation (`addObstacle` with size, callback and offset). Skipped while the vehicle is in the shop configuration state. |
| `ShallowWaterObstacles:onDelete()` | 93 | ✍ Removes every registered obstacle from the shallow water simulation. |
| `ShallowWaterObstacles:loadObstacleNodeFromXML(xmlFile: any, key: any, obstacleNode: any)` | 107 | ✍ Reads one obstacle (node, direction node, size, offset) and initialises its last position. Returns false with an XML warning if the node is missing. |
| `ShallowWaterObstacles.getShallowWaterParameters(obstacleNode: any)` | 127 | ✍ Callback given to the simulation: returns the node's x and z velocity (unit direction of movement since the last call times the vehicle's signed speed times 1000) and the heading angle around Y of the direction node. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadObstacleNodeFromXML` | 40 |
| registerEventListener | `onPostLoad` | 50 |
| registerEventListener | `onLoadFinished` | 51 |
| registerEventListener | `onDelete` | 52 |
