# placeables/specializations/PlaceableBunkerSilo.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableBunkerSilo.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableBunkerSilo.lua` — FS25 1.25.1.0

✍ Placeable specialization that wraps a `BunkerSilo` object (loaded from `placeable.bunkerSilo`) and syncs it to joining clients. It also supports extendable silos that snap next to an existing silo of the same config and hide the shared walls, warns on sale when the silo is not empty, and clears the silo area when sold.

- **PlaceableBunkerSilo** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableBunkerSilo.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: no prerequisite specializations. |
| `PlaceableBunkerSilo.registerEventListeners(placeableType: any)` | 24 | ✍ Subscribes to `onLoad`, `onDelete`, `onFinalizePlacement`, `onReadStream`, `onWriteStream` and `onSell`. |
| `PlaceableBunkerSilo.registerFunctions(placeableType: any)` | 35 | ✍ Registers `updateBunkerSiloWalls`, `setWallVisibility` and `getIsBunkerSiloExtendable`. |
| `PlaceableBunkerSilo.registerOverwrittenFunctions(placeableType: any)` | 43 | ✍ Overrides the placement functions `getPlacementPosition`, `getPlacementRotation`, `getHasOverlap`, `startPlacementCheck`, plus `canBeSold` and `setOwnerFarmId`. |
| `PlaceableBunkerSilo.registerXMLPaths(schema: any, basePath: any)` | 54 | ✍ Declares the `bunkerSilo` XML keys (delegating to `BunkerSilo`) and `isExtendable`, `siloToSiloDistance`, `snapDistance` (default 1.1 times the silo distance) and `sellWarningText`. |
| `PlaceableBunkerSilo.registerSavegameXMLPaths(schema: any, basePath: any)` | 66 | ✍ Declares the savegame XML keys by delegating to `BunkerSilo.registerSavegameXMLPaths`. |
| `PlaceableBunkerSilo:onLoad(savegame: table)` | 75 | ✍ Creates and loads the `BunkerSilo` (deleting it on failure) and reads the extendable settings. If the silo is extendable but `siloToSiloDistance` is missing, logs an XML error and sets the loading state to ERROR. |
| `PlaceableBunkerSilo:onDelete()` | 99 | ✍ Restores the neighbour silos' walls, deletes the `BunkerSilo` and removes this placeable from the placeable system's bunker silo list. |
| `PlaceableBunkerSilo:onFinalizePlacement()` | 111 | ✍ Hides the walls shared with neighbouring silos, registers the `BunkerSilo` network object with the owner farm id and adds the placeable to the system's bunker silo list. |
| `PlaceableBunkerSilo:onReadStream(streamId: any, connection: any)` | 123 | ✍ Client side join: reads the bunker silo object id, reads its stream and finishes its registration. |
| `PlaceableBunkerSilo:onWriteStream(streamId: any, connection: any)` | 133 | ✍ Server side join: writes the bunker silo object id, its stream, and registers it in the connection's stream. |
| `PlaceableBunkerSilo:loadFromXMLFile(xmlFile: any, key: any)` | 143 | ✍ Loads the savegame data through the `BunkerSilo` and returns its result. |
| `PlaceableBunkerSilo:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 151 | ✍ Saves the `BunkerSilo` data to the savegame. |
| `PlaceableBunkerSilo:setWallVisibility(isLeftVisible: any, isRightVisible: any)` | 159 | ✍ Forwards the left and right wall visibility flags to the `BunkerSilo`. Passing nil for a side leaves it unchanged (UNVERIFIED: depends on `BunkerSilo`). |
| `PlaceableBunkerSilo:getIsBunkerSiloExtendable()` | 166 | ✍ Returns whether this silo is marked extendable in the XML. |
| `PlaceableBunkerSilo:updateBunkerSiloWalls(isDeleting: any)` | 173 | ✍ Finds extendable silos of the same config and farm within the silo spacing plus 0.5 m, and hides (or, when deleting, shows) their wall on the side facing this silo. |
| `PlaceableBunkerSilo:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 209 | ✍ Calls the parent, then propagates the new owner farm id to the `BunkerSilo` without sending an event. |
| `PlaceableBunkerSilo:onSell()` | 221 | ✍ Calls `clearSiloArea` on the `BunkerSilo` when the placeable is sold. |
| `PlaceableBunkerSilo:canBeSold(superFunc: any)` | 229 | ✍ Always allows the sale; returns the sell warning text as second value when the silo fill level is above zero, otherwise nil. |
| `PlaceableBunkerSilo:startPlacementCheck(superFunc: function, x: number?, y: number?, z: number?, rotY: number?)` | 247 | ✍ Runs the parent check, then for extendable silos finds the nearest owned silo of the same config within snap distance and stores it, with the side, as the snapping target. |
| `PlaceableBunkerSilo:getHasOverlap(superFunc: any, x: any, y: any, z: any, rotY: any, checkFunc: any)` | 280 | ✍ When a snapping silo is found, wraps the overlap check so that the snapping silo itself does not count as an obstruction, then calls the parent. |
| `PlaceableBunkerSilo:getPlacementRotation(superFunc: any, x: any, y: any, z: any)` | 305 | ✍ Returns the parent rotation, replaced by the snapping silo's Y orientation when snapping is active. |
| `PlaceableBunkerSilo:getPlacementPosition(superFunc: any, x: any, y: any, z: any)` | 319 | ✍ Returns the parent position, replaced by a point offset by the silo spacing to the left or right of the snapping silo when snapping is active. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 25 |
| registerEventListener | `onDelete` | 26 |
| registerEventListener | `onFinalizePlacement` | 27 |
| registerEventListener | `onReadStream` | 28 |
| registerEventListener | `onWriteStream` | 29 |
| registerEventListener | `onSell` | 30 |
| registerFunction | `updateBunkerSiloWalls` | 36 |
| registerFunction | `setWallVisibility` | 37 |
| registerFunction | `getIsBunkerSiloExtendable` | 38 |
| registerOverwrittenFunction | `getPlacementPosition` | 44 |
| registerOverwrittenFunction | `getPlacementRotation` | 45 |
| registerOverwrittenFunction | `getHasOverlap` | 46 |
| registerOverwrittenFunction | `startPlacementCheck` | 47 |
| registerOverwrittenFunction | `canBeSold` | 48 |
| registerOverwrittenFunction | `setOwnerFarmId` | 49 |
