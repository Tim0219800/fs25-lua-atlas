# placeables/specializations/PlaceableVehicle.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableVehicle.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableVehicle.lua` — FS25 1.25.1.0

✍ Placeable specialization for a building-menu entry that only spawns vehicles. On the server (or the constructing client in preview) it loads the vehicles listed under `placeable.placeableVehicle.vehicle` and parks them on link nodes; when placement is final the server detaches them, adds them to physics and registers them. The placeable itself is then deleted instead of being registered.

- **PlaceableVehicle** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableVehicle.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: no prerequisite specialization. |
| `PlaceableVehicle.registerFunctions(vehicleType: any)` | 24 | ✍ Registers `onFinishLoadingVehicle` on the placeable type. |
| `PlaceableVehicle.registerOverwrittenFunctions(placeableType: any)` | 30 | ✍ Overrides `collectPickObjects` and `register` on the placeable type. |
| `PlaceableVehicle.registerEventListeners(placeableType: any)` | 37 | ✍ Subscribes to onLoad, onFinalizePlacement and onDelete. |
| `PlaceableVehicle.registerXMLPaths(schema: any, basePath: any)` | 45 | ✍ Declares the per-vehicle XML keys (`#xmlFilename` and `#linkNode`) under `placeable.placeableVehicle.vehicle`. The exact key list comes from the registration lines, partly UNVERIFIED. |
| `PlaceableVehicle:onLoad(savegame: table)` | 57 | ✍ Server or construction-preview client only: for each vehicle entry with a filename and link node, starts an asynchronous vehicle load at the node pose, as a shop-config preview or an owned unregistered vehicle, tied to a loading task. |
| `PlaceableVehicle:onFinishLoadingVehicle(vehicles: any, vehicleLoadState: any, vehicleData: any)` | 96 | ✍ Load callback: if the placeable is being deleted it deletes the loaded vehicles; otherwise it removes them from physics, sets the farm owner and links their components to the link node. Logs an error on failure, and always finishes the loading task. |
| `PlaceableVehicle:onFinalizePlacement()` | 132 | ✍ Server only, and not with an icon generator: moves vehicle components back to the root node keeping their world pose, adds the vehicles to physics and registers them, then clears the pending list. |
| `PlaceableVehicle:onDelete()` | 156 | ✍ Deletes any vehicle still held in the pending list (those never released at placement). |
| `PlaceableVehicle:register(alreadySent: any)` | 168 | ✍ Overrides registration: outside construction preview, the placeable deletes itself, so it is never synchronized to clients; only the spawned vehicles remain. |
| `PlaceableVehicle:collectPickObjects(superFunc: any, node: any)` | 179 | ✍ Skips a node that is one of the vehicle link nodes (returns without calling the parent), so those nodes are not collected as pick objects; other nodes go to the parent function. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onFinishLoadingVehicle` | 25 |
| registerOverwrittenFunction | `collectPickObjects` | 31 |
| registerOverwrittenFunction | `register` | 32 |
| registerEventListener | `onLoad` | 38 |
| registerEventListener | `onFinalizePlacement` | 39 |
| registerEventListener | `onDelete` | 40 |
