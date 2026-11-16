# placeables/specializations/PlaceableConstructible.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableConstructible.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableConstructible.lua` — FS25 1.25.1.0

✍ Placeable specialization for buildings erected in stages by a state machine of `ConstructibleState` classes (building, finalize, etc.) defined in the XML, with named states, transitions, a start state and a preview state. It owns a selling (unloading) station and a storage that receive construction materials, syncs the current state to joining clients, and saves the state name. Several registered functions (`setConstructibleState`, `finalizeConstruction`, `getConstructibleFillLevel`, etc.) have no body in the dump: UNVERIFIED.

- **PlaceableConstructible** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableConstructible.prerequisitesPresent(specializations: table) → boolean` | 25 | ✍ Always returns true: no prerequisite specializations. |
| `PlaceableConstructible.registerFunctions(placeableType: any)` | 31 | ✍ Registers 13 functions: state setting and lookup, finalize, fill level and fill type support, preview state, reset, a console command to finish a state and its removal, finished-state count and progress info. Their bodies are not in the dump: UNVERIFIED. |
| `PlaceableConstructible.registerOverwrittenFunctions(placeableType: any)` | 49 | ✍ Overrides `collectPickObjects`, `updateInfo` and `setOwnerFarmId`. Only `collectPickObjects` has a body in the dump. |
| `PlaceableConstructible.registerEventListeners(placeableType: any)` | 57 | ✍ Subscribes to `onLoad`, `onFinalizePlacement`, `onDelete`, `onUpdate`, the four network stream events, and the info trigger enter/leave events. |
| `PlaceableConstructible.registerXMLPaths(schema: any, basePath: any)` | 72 | ✍ Declares the `constructible` keys: state definitions (`name`, `class`, `isStartState`, `isPreviewState` plus the `ConstructibleState*` keys), transitions (`from`/`to`), selling station and storage. |
| `PlaceableConstructible.registerSavegameXMLPaths(schema: any, basePath: any)` | 94 | ✍ Declares the savegame keys `state#index`, `state#name`, and delegates to `ConstructibleStateBuilding` and `Storage`. |
| `PlaceableConstructible:onLoad(savegame: table)` | 104 | ✍ Creates the unloading station and storage and registers them with the storage and economy systems, then builds the state machine from the XML (up to 255 states, state classes must derive from `ConstructibleState`, dirty flags are shared round-robin over 10 flags) and its transitions. Applies the preview state when the placeable is in construction preview. |
| `PlaceableConstructible:onFinalizePlacement(savegame: any)` | 232 | ✍ Sets the owner farm on the station and storage. On the server it replays states from 1 up to the loaded (or start) state, runs the pending post-finalize load step and keeps itself active. |
| `PlaceableConstructible:onDelete()` | 268 | ✍ Removes the finish-state console command, unsubscribes from messages, unregisters and deletes the unloading station, deletes the storage and every state. |
| `PlaceableConstructible:collectPickObjects(superFunc: any, node: any)` | 297 | ✍ Skips picking nodes that are the exact-fill root node of one of the unloading triggers; other nodes go to the parent implementation. |
| `PlaceableConstructible:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 312 | ✍ Saves the current state name and its own data, then the storage. |
| `PlaceableConstructible:loadFromXMLFile(xmlFile: any, key: any)` | 327 | ✍ Reads the saved state name into a pending state index (falling back to 1), schedules the state's own data to load after finalization (so physics is not overwritten), and loads the storage. |
| `PlaceableConstructible:onReadStream(streamId: any, connection: any)` | 346 | ✍ Client side join: reads and registers the unloading station and storage, then, if a state was sent, replays states up to that index and reads the state's stream data. |
| `PlaceableConstructible:onWriteStream(streamId: any, connection: any)` | 373 | ✍ Server side join: writes the station and storage, then a flag telling whether a state exists, followed by the state index and its stream data. |
| `PlaceableConstructible.loadSpecValueFillTypes(xmlFile: XMLFile, customEnvironment: string?, baseDir: string?, resultTable: table?) → table?` | 687 | ✍ Store spec loader: if the XML has a `constructible` section, adds every fill type named by a state's `input` entry to the result table (keyed by name) and returns it. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `setConstructibleState` | 32 |
| registerFunction | `finalizeConstruction` | 33 |
| registerFunction | `getConstructibleFillLevel` | 34 |
| registerFunction | `getConstructibleSupportsFillType` | 35 |
| registerFunction | `removeConstructibleFillLevel` | 36 |
| registerFunction | `getConstructibleStateIndexByName` | 37 |
| registerFunction | `setConstructiblePreviewState` | 38 |
| registerFunction | `getConstructibleStateIndex` | 39 |
| registerFunction | `resetConstructibleToState` | 40 |
| registerFunction | `consoleCommandFinishConstructionState` | 41 |
| registerFunction | `removeConstructibleFinishStateCommand` | 42 |
| registerFunction | `getNumFinishedConstructibleStates` | 43 |
| registerFunction | `addConstructionProgressInfo` | 44 |
| registerOverwrittenFunction | `collectPickObjects` | 50 |
| registerOverwrittenFunction | `updateInfo` | 51 |
| registerOverwrittenFunction | `setOwnerFarmId` | 52 |
| registerEventListener | `onLoad` | 58 |
| registerEventListener | `onFinalizePlacement` | 59 |
| registerEventListener | `onDelete` | 60 |
| registerEventListener | `onUpdate` | 61 |
| registerEventListener | `onReadStream` | 62 |
| registerEventListener | `onWriteStream` | 63 |
| registerEventListener | `onReadUpdateStream` | 64 |
| registerEventListener | `onWriteUpdateStream` | 65 |
| registerEventListener | `onInfoTriggerEnter` | 66 |
| registerEventListener | `onInfoTriggerLeave` | 67 |
