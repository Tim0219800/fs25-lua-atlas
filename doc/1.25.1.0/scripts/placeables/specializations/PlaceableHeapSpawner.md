# placeables/specializations/PlaceableHeapSpawner.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableHeapSpawner.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableHeapSpawner.lua` — FS25 1.25.1.0

✍ Placeable specialization that continuously spawns a fill type as a heap inside rectangular areas at a rate in liters per in-game hour, with optional effects, sounds and animation nodes on clients. The server keeps the placeable active so its update tick does the actual spawning; the onUpdateTick and onDelete handlers are registered but have no body in the SDK dump (UNVERIFIED).

- **PlaceableHeapSpawner** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableHeapSpawner.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ No prerequisite: always returns true. |
| `PlaceableHeapSpawner.registerEventListeners(placeableType: any)` | 24 | ✍ Subscribes to load, finalize-placement, update-tick and delete events. |
| `PlaceableHeapSpawner.registerXMLPaths(schema: any, basePath: any)` | 33 | ✍ Declares each spawnArea: area start, width and height nodes, fillType, litersPerHour, effect nodes, work/work2/dropping sounds and animation nodes. |
| `PlaceableHeapSpawner:onLoad(savegame: table)` | 51 | ✍ Reads each spawn area, skipping with a logged error those missing a node, a valid fill type or a positive litersPerHour (default 150). Stores liters per millisecond. On clients loads and starts effects, three looping samples and animations. |
| `PlaceableHeapSpawner:onFinalizePlacement(savegame: any)` | 123 | ✍ On the server, wakes the update loop so spawning can begin. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 25 |
| registerEventListener | `onFinalizePlacement` | 26 |
| registerEventListener | `onUpdateTick` | 27 |
| registerEventListener | `onDelete` | 28 |
