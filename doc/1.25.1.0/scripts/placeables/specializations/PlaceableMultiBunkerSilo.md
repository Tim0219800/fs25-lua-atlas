# placeables/specializations/PlaceableMultiBunkerSilo.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableMultiBunkerSilo.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableMultiBunkerSilo.lua` — FS25 1.25.1.0

✍ Placeable specialization for bunker silos that may contain several BunkerSilo objects chosen by a configuration, with optional side walls. Extendable silos of the same type and owner snap next to each other when being placed and hide the walls between them. It registers a bunkerSilo configuration type and registers itself with the mission placeable system; BunkerSilo itself is defined elsewhere.

- **PlaceableMultiBunkerSilo** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableMultiBunkerSilo.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: no prerequisite specialization is required. |
| `PlaceableMultiBunkerSilo.initSpecialization()` | 25 | ✍ Registers the placeable configuration type bunkerSilo (with its localised label) in the placeable configuration manager. |
| `PlaceableMultiBunkerSilo.registerEventListeners(placeableType: any)` | 31 | ✍ Subscribes to onLoad, onDelete, onFinalizePlacement, onReadStream, onWriteStream and onSell. |
| `PlaceableMultiBunkerSilo.registerFunctions(placeableType: any)` | 42 | ✍ Registers updateBunkerSiloWalls, setWallVisibility and getIsBunkerSiloExtendable on the placeable type. |
| `PlaceableMultiBunkerSilo.registerOverwrittenFunctions(placeableType: any)` | 50 | ✍ Overrides getPlacementPosition, getPlacementRotation, getHasOverlap, startPlacementCheck, canBeSold and setOwnerFarmId. |
| `PlaceableMultiBunkerSilo.registerXMLPaths(schema: any, basePath: any)` | 61 | ✍ Declares the bunkerSilo XML keys: isExtendable, siloToSiloDistance, snapDistance (default 1.1 times the distance), sell warning text, wallLeft/wallBack/wallRight node and collision, and per-configuration BunkerSilo entries. |
| `PlaceableMultiBunkerSilo.registerSavegameXMLPaths(schema: any, basePath: any)` | 84 | ✍ Registers savegame keys for each bunkerSilo entry by delegating to BunkerSilo.registerSavegameXMLPaths. |
| `PlaceableMultiBunkerSilo:onLoad(savegame: table)` | 93 | ✍ Loads wall nodes, the sell warning text and one BunkerSilo per entry of the selected configuration, then reads isExtendable and the spacing values (error and ERROR loading state if siloToSiloDistance is missing). Note: the back wall is read from wallRight and then overwrites spec.wallRight from wallBack, so spec.wallBack is never set. |
| `PlaceableMultiBunkerSilo:onDelete()` | 156 | ✍ Restores walls of neighbouring silos, deletes all BunkerSilo objects and removes this placeable from the placeable system's bunker silo list. |
| `PlaceableMultiBunkerSilo:onFinalizePlacement()` | 171 | ✍ Hides walls shared with neighbouring silos, registers each BunkerSilo as a network object with the owner farm, and adds the placeable to the placeable system's bunker silo list. |
| `PlaceableMultiBunkerSilo:onReadStream(streamId: any, connection: any)` | 187 | ✍ Client side on join: reads object id and stream data of each BunkerSilo and finishes its client registration. |
| `PlaceableMultiBunkerSilo:onWriteStream(streamId: any, connection: any)` | 199 | ✍ Server side on join: writes object id and stream data of each BunkerSilo and registers it in the connection stream. |
| `PlaceableMultiBunkerSilo:loadFromXMLFile(xmlFile: any, key: any)` | 211 | ✍ Savegame loading: loads each BunkerSilo from its indexed bunkerSilo key; returns false if any of them fails. |
| `PlaceableMultiBunkerSilo:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 227 | ✍ Savegame saving: writes each BunkerSilo under an indexed bunkerSilo key. |
| `PlaceableMultiBunkerSilo:setWallVisibility(isLeftVisible: any, isBackVisible: any, isRightVisible: any)` | 238 | ✍ Shows or hides the left, back and right walls (node visibility and static/none collision body). Note: each flag is combined with the current state by 'or', so a wall that is visible cannot be hidden this way, and the right wall uses the left flag. |
| `PlaceableMultiBunkerSilo:getIsBunkerSiloExtendable()` | 280 | ✍ Returns whether this silo was declared extendable in the XML. |
| `PlaceableMultiBunkerSilo:updateBunkerSiloWalls(isDeleting: any)` | 287 | ✍ For other extendable silos of the same config file and farm within siloToSiloDistance + 0.5 m, calls setWallVisibility on the neighbour: hides the facing wall on placement, shows it when deleting. |
| `PlaceableMultiBunkerSilo:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 328 | ✍ Override: calls the parent, then sets the same owner farm on every BunkerSilo without sending an event. |
| `PlaceableMultiBunkerSilo:onSell()` | 342 | ✍ When sold, clears the silo area of each BunkerSilo. |
| `PlaceableMultiBunkerSilo:canBeSold(superFunc: any)` | 351 | ✍ Override: always returns true, plus the sell warning text if any BunkerSilo still has fill level above zero, else nil. |
| `PlaceableMultiBunkerSilo:startPlacementCheck(superFunc: function, x: number?, y: number?, z: number?, rotY: number?)` | 371 | ✍ Override: after the parent, for extendable silos finds the nearest silo of the local farm and same config within snapDistance, storing it and the side (sign of local x) for snapping. |
| `PlaceableMultiBunkerSilo:getHasOverlap(superFunc: any, x: any, y: any, z: any, rotY: any, checkFunc: any)` | 404 | ✍ Override: when a snapping silo was found, wraps the overlap check so that hits on that silo are ignored; otherwise passes the check through to the parent. |
| `PlaceableMultiBunkerSilo:getPlacementRotation(superFunc: any, x: any, y: any, z: any)` | 428 | ✍ Override: returns the parent rotation, replaced by the snapping silo's Y orientation when one was found. |
| `PlaceableMultiBunkerSilo:getPlacementPosition(superFunc: any, x: any, y: any, z: any)` | 442 | ✍ Override: returns the parent position, replaced by a point at siloToSiloDistance to the side of the snapping silo when one was found. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 32 |
| registerEventListener | `onDelete` | 33 |
| registerEventListener | `onFinalizePlacement` | 34 |
| registerEventListener | `onReadStream` | 35 |
| registerEventListener | `onWriteStream` | 36 |
| registerEventListener | `onSell` | 37 |
| registerFunction | `updateBunkerSiloWalls` | 43 |
| registerFunction | `setWallVisibility` | 44 |
| registerFunction | `getIsBunkerSiloExtendable` | 45 |
| registerOverwrittenFunction | `getPlacementPosition` | 51 |
| registerOverwrittenFunction | `getPlacementRotation` | 52 |
| registerOverwrittenFunction | `getHasOverlap` | 53 |
| registerOverwrittenFunction | `startPlacementCheck` | 54 |
| registerOverwrittenFunction | `canBeSold` | 55 |
| registerOverwrittenFunction | `setOwnerFarmId` | 56 |
