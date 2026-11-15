# animals/husbandry/placeables/PlaceableHusbandryAnimalWorker.lua

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryAnimalWorker.lua` — FS25 1.25.1.0

- **PlaceableHusbandryAnimalWorker** (l.19)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableHusbandryAnimalWorker.registerXMLPaths(schema: XMLSchema, basePath: string)` | 31 |  |
| `PlaceableHusbandryAnimalWorker.registerSavegameXMLPaths(schema: XMLSchema, basePath: string)` | 43 |  |
| `PlaceableHusbandryAnimalWorker.registerFunctions(placeableType: table)` | 54 |  |
| `PlaceableHusbandryAnimalWorker.registerOverwrittenFunctions(placeableType: table)` | 68 |  |
| `PlaceableHusbandryAnimalWorker.registerEventListeners(placeableType: table)` | 75 |  |
| `PlaceableHusbandryAnimalWorker.prerequisitesPresent(specializations: table) → boolean` | 87 |  |
| `PlaceableHusbandryAnimalWorker:onLoad(savegame: table?)` | 95 |  |
| `PlaceableHusbandryAnimalWorker:loadAnimalWorkerPriceOverrides()` | 121 |  |
| `PlaceableHusbandryAnimalWorker:onReadStream(streamId: integer, connection: table)` | 142 |  |
| `PlaceableHusbandryAnimalWorker:onWriteStream(streamId: integer, connection: table)` | 159 |  |
| `PlaceableHusbandryAnimalWorker:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 174 |  |
| `PlaceableHusbandryAnimalWorker:saveToXMLFile(xmlFile: XMLFile, key: string)` | 198 |  |
| `PlaceableHusbandryAnimalWorker:onHourChanged(hour: integer)` | 220 |  |
| `PlaceableHusbandryAnimalWorker:onDayChanged(currentDay: integer)` | 246 |  |
| `PlaceableHusbandryAnimalWorker:getConditionInfos(superFunc: function) → table` | 277 |  |
| `PlaceableHusbandryAnimalWorker:performAnimalWorkerTask(task: table) → integer, integer` | 311 |  |
| `PlaceableHusbandryAnimalWorker:applyAnimalWorkerStateFromEvent(task: table, enabled: boolean) → boolean` | 349 |  |
| `PlaceableHusbandryAnimalWorker:getAnimalWorkerTaskState(task: table?) → table?` | 388 |  |
| `PlaceableHusbandryAnimalWorker:getAnimalWorkerAvailableTasks() → table` | 399 |  |
| `PlaceableHusbandryAnimalWorker:getAnimalWorkerTaskIsEnabled(task: table?) → boolean` | 421 |  |
| `PlaceableHusbandryAnimalWorker:getAnimalWorkerTaskCost(task: table?, numAnimals: integer) → integer` | 432 |  |
| `PlaceableHusbandryAnimalWorker:getAnimalWorkerTaskIsDue(task: table, hour: integer) → boolean` | 446 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadAnimalWorkerPriceOverrides` | 55 |
| registerFunction | `getAnimalWorkerTaskState` | 56 |
| registerFunction | `getAnimalWorkerAvailableTasks` | 57 |
| registerFunction | `getAnimalWorkerTaskIsEnabled` | 58 |
| registerFunction | `getAnimalWorkerTaskCost` | 59 |
| registerFunction | `getAnimalWorkerTaskIsDue` | 60 |
| registerFunction | `applyAnimalWorkerStateFromEvent` | 61 |
| registerFunction | `performAnimalWorkerTask` | 62 |
| registerOverwrittenFunction | `getConditionInfos` | 69 |
| registerEventListener | `onLoad` | 76 |
| registerEventListener | `onReadStream` | 77 |
| registerEventListener | `onWriteStream` | 78 |
| registerEventListener | `onHourChanged` | 79 |
| registerEventListener | `onDayChanged` | 80 |
