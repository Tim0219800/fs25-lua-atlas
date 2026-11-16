# placeables/specializations/PlaceableBoatyard.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableBoatyard.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableBoatyard.lua` — FS25 1.25.1.0

✍ Placeable specialization for the boatyard, a boat-building site driven by a state machine of `BoatyardState*` classes loaded from XML. It manages a spline the boat travels on, an unloading (selling) station and storage, a player trigger, and sailing boats that react to wind via the wind updater. Several of its registered functions have no body in the SDK dump (UNVERIFIED).

- **PlaceableBoatyard** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableBoatyard.prerequisitesPresent(specializations: table) → boolean` | 26 | ✍ Always returns true: no prerequisite specializations. |
| `PlaceableBoatyard.registerFunctions(placeableType: any)` | 32 | ✍ Registers 13 functions on the placeable type (boat loading, mesh progress, state and spline time handling, boat creation/release, wind values, fill level, player trigger, buy request). Their bodies are not in the dump: UNVERIFIED. |
| `PlaceableBoatyard.registerOverwrittenFunctions(placeableType: any)` | 50 | ✍ Overrides `collectPickObjects`, `updateInfo` and `setOwnerFarmId`. |
| `PlaceableBoatyard.registerEventListeners(placeableType: any)` | 58 | ✍ Subscribes to `onLoad`, `onDelete`, `onUpdate` and the four network stream events. |
| `PlaceableBoatyard.registerXMLPaths(schema: any, basePath: any)` | 70 | ✍ Declares the `boatyard` XML keys: spline, link node, player trigger, boat file and reward, progressive-visibility meshes, state machine states/transitions (delegating to the `BoatyardState*` classes), sailing splines with bobbing and swaying values, selling station and storage. |
| `PlaceableBoatyard.registerSavegameXMLPaths(schema: any, basePath: any)` | 109 | ✍ Declares the savegame keys `state#index` and `splineTime`, and delegates to `BoatyardStateBuilding` and `Storage`. |
| `PlaceableBoatyard:onLoad(savegame: table)` | 121 | ✍ Loads the spline, the boat I3D (asynchronously), the unloading station and storage, the player trigger, the XML-defined state machine with its transitions, the sailing splines, and registers as a wind-change listener. Logs XML errors for duplicate or unknown states or classes. |
| `PlaceableBoatyard:collectPickObjects(superFunc: any, node: any)` | 365 | ✍ Skips picking nodes that are the exact-fill root node of one of the unloading station's triggers; any other node goes to the parent implementation. |
| `PlaceableBoatyard:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 381 | ✍ Saves the state index, spline time and the current state's data only when the state index is above 0, and always saves the storage. |
| `PlaceableBoatyard:loadFromXMLFile(xmlFile: any, key: any)` | 398 | ✍ Replays states from 0 up to the saved index through `setState`, restores the spline time, then loads the current state's data and the storage. |
| `PlaceableBoatyard:onReadStream(streamId: any, connection: any)` | 420 | ✍ Client side join: reads and registers the unloading station and storage, replays states up to the received index, then reads spline time, mesh progress values and the next sailing spline index. |
| `PlaceableBoatyard:onWriteStream(streamId: any, connection: any)` | 458 | ✍ Server side join: writes the unloading station and storage, the state index and current state data, spline time, mesh progress values and the next sailing spline index (mirror of `onReadStream`). |
| `PlaceableBoatyard:setOwnerFarmId(superFunc: any, farmId: any)` | 615 | ✍ Calls the parent, then, when the owner is `AccessHandler.EVERYONE`, registers the unloading station as a selling station and storage unloading station, otherwise removes it. The player trigger is visible only when the owner is EVERYONE. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onBoatI3DFileLoaded` | 33 |
| registerFunction | `setMeshProgress` | 34 |
| registerFunction | `setState` | 35 |
| registerFunction | `setSplineTime` | 36 |
| registerFunction | `addSplineDistanceDelta` | 37 |
| registerFunction | `getSplineTime` | 38 |
| registerFunction | `releaseBoat` | 39 |
| registerFunction | `createBoat` | 40 |
| registerFunction | `setWindValues` | 41 |
| registerFunction | `getFillLevel` | 42 |
| registerFunction | `removeFillLevel` | 43 |
| registerFunction | `playerTriggerCallback` | 44 |
| registerFunction | `buyRequest` | 45 |
| registerOverwrittenFunction | `collectPickObjects` | 51 |
| registerOverwrittenFunction | `updateInfo` | 52 |
| registerOverwrittenFunction | `setOwnerFarmId` | 53 |
| registerEventListener | `onLoad` | 59 |
| registerEventListener | `onDelete` | 60 |
| registerEventListener | `onUpdate` | 61 |
| registerEventListener | `onReadStream` | 62 |
| registerEventListener | `onWriteStream` | 63 |
| registerEventListener | `onReadUpdateStream` | 64 |
| registerEventListener | `onWriteUpdateStream` | 65 |
