# animals/husbandry/placeables/PlaceableHusbandryMeadow.lua

*[Version française](../../../../fr/scripts/animals/husbandry/placeables/PlaceableHusbandryMeadow.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryMeadow.lua` — FS25 1.25.1.0

✍ Placeable specialization that lets a husbandry graze on a meadow. It requires `PlaceableHusbandryFood`, `PlaceableHusbandryFence` and `PlaceableHusbandryAnimals`, reads the edible fruit types (growth states eatable and eaten) from `husbandry.meadow`, and optionally uses `MeadowCreationTask` tasks to create or clear the meadow in the density map. It tracks fill level and capacity per windrow fill type, syncs them over the network and saves pending tasks; most of the meadow logic (growth updates, eating, tasks) is not present in the SDK dump.

- **PlaceableHusbandryMeadow** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableHusbandryMeadow.prerequisitesPresent(specializations: table) → boolean` | 22 | ✍ Returns true only if `PlaceableHusbandryFood`, `PlaceableHusbandryFence` and `PlaceableHusbandryAnimals` are all present. |
| `PlaceableHusbandryMeadow.registerOverwrittenFunctions(placeableType: any)` | 41 | ✍ Registers overrides of `updateInfo`, `getFoodInfos`, `getAvailableFood` and `removeFood`. The bodies of `getAvailableFood` and `removeFood` are not in the SDK dump. |
| `PlaceableHusbandryMeadow.registerEventListeners(placeableType: any)` | 50 | ✍ Subscribes to the load, delete, update, stream and update-stream events plus `onFinishedFeeding`, `onHusbandryAnimalsCreated` and `onHusbandryFenceCustomizingUserLeft`. |
| `PlaceableHusbandryMeadow.registerXMLPaths(schema: any, basePath: any)` | 66 | ✍ Registers the XML keys under `husbandry.meadow`: supported fruit types with eatable start/end and eaten growth state names, create and clear tasks, and the clear polygon nodes. |
| `PlaceableHusbandryMeadow.registerSavegameXMLPaths(schema: any, basePath: any)` | 81 | ✍ Registers the savegame keys: create and clear tasks, and per fill type name, fill level and capacity. |
| `PlaceableHusbandryMeadow:onLoad(savegame: any)` | 93 | ✍ Initializes the meadow state and reads each supported fruit type with its three growth states (types with a missing or unknown state are skipped with a warning). Builds the optional create task and a clear task from polygon nodes, and sets `canCreateMeadow` if either exists. |
| `PlaceableHusbandryMeadow:onReadStream(streamId: any, connection: any)` | 268 | ✍ Network read: reads fill level and capacity for each fill type, then refreshes the meadow info (`updateMeadowInfo`, not in the dump). |
| `PlaceableHusbandryMeadow:onWriteStream(streamId: any, connection: any)` | 280 | ✍ Network write: writes fill level and capacity for each fill type. |
| `PlaceableHusbandryMeadow:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 291 | ✍ Client side update read: if the server sent data, reads fill levels and capacities and refreshes the meadow info. Ignored if the connection is not from the server. |
| `PlaceableHusbandryMeadow:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 307 | ✍ Server side update write: sends the fill levels and capacities when the meadow dirty flag is set. Does nothing for the server connection. |
| `PlaceableHusbandryMeadow:loadFromXMLFile(xmlFile: any, key: any)` | 322 | ✍ Loads saved fill levels and capacities for known fill types, refreshes the info, re-enqueues saved create and clear tasks as pending, and subscribes to growth period messages only when no task is pending. |
| `PlaceableHusbandryMeadow:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 370 | ✍ Saves the name, fill level and capacity of each fill type, and the pending create and clear tasks if any. |
| `PlaceableHusbandryMeadow:getFoodInfos(superFunc: any)` | 704 | ✍ Override: adds the meadow food info entry when at least one fruit type is configured. |
| `PlaceableHusbandryMeadow:updateInfo(superFunc: any, infoTable: any)` | 717 | ✍ Override: adds the meadow info entry to the info list when at least one fruit type is configured. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `updateInfo` | 42 |
| registerOverwrittenFunction | `getFoodInfos` | 43 |
| registerOverwrittenFunction | `getAvailableFood` | 44 |
| registerOverwrittenFunction | `removeFood` | 45 |
| registerEventListener | `onLoad` | 51 |
| registerEventListener | `onPostLoad` | 52 |
| registerEventListener | `onDelete` | 53 |
| registerEventListener | `onUpdate` | 54 |
| registerEventListener | `onReadStream` | 55 |
| registerEventListener | `onWriteStream` | 56 |
| registerEventListener | `onReadUpdateStream` | 57 |
| registerEventListener | `onWriteUpdateStream` | 58 |
| registerEventListener | `onFinishedFeeding` | 59 |
| registerEventListener | `onHusbandryAnimalsCreated` | 60 |
| registerEventListener | `onHusbandryFenceCustomizingUserLeft` | 61 |

## Messages

- subscribes `MessageType.START_GROWTH_PERIOD` (l.363)
- subscribes `MessageType.FINISHED_GROWTH_PERIOD` (l.364)
