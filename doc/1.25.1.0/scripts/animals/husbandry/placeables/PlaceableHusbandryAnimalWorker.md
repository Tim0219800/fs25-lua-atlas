# animals/husbandry/placeables/PlaceableHusbandryAnimalWorker.lua

*[Version française](../../../../fr/scripts/animals/husbandry/placeables/PlaceableHusbandryAnimalWorker.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryAnimalWorker.lua` — FS25 1.25.1.0

✍ Placeable specialization that lets a husbandry use hireable worker tasks (for example a recurring exercise or harvesting service). It requires PlaceableHusbandryAnimals. Each task from g_currentMission.animalWorkerTaskSystem has an enabled flag, a last-run day and prices that can be overridden in the placeable XML. The server runs due tasks hourly and charges wages; only the enabled flags are synchronized to clients.

- **PlaceableHusbandryAnimalWorker** (l.19)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableHusbandryAnimalWorker.registerXMLPaths(schema: XMLSchema, basePath: string)` | 31 | ✍ Registers the optional XML overrides `.husbandry.animalWorker.task(?)` with `#name`, `#basePrice` and `#pricePerAnimal`. |
| `PlaceableHusbandryAnimalWorker.registerSavegameXMLPaths(schema: XMLSchema, basePath: string)` | 43 | ✍ Registers the savegame paths `.task(?)` with `#name`, `#enabled` and `#lastRunDay`. |
| `PlaceableHusbandryAnimalWorker.registerFunctions(placeableType: table)` | 54 | ✍ Registers the task functions on the placeable type: price override loading, state, available tasks, enabled, cost, due check, event state application and task execution. |
| `PlaceableHusbandryAnimalWorker.registerOverwrittenFunctions(placeableType: table)` | 68 | ✍ Overrides getConditionInfos so the animal menu shows worker status. |
| `PlaceableHusbandryAnimalWorker.registerEventListeners(placeableType: table)` | 75 | ✍ Subscribes to onLoad, onReadStream, onWriteStream, onHourChanged and onDayChanged. |
| `PlaceableHusbandryAnimalWorker.prerequisitesPresent(specializations: table) → boolean` | 87 | ✍ Returns true only if the placeable type also has PlaceableHusbandryAnimals. |
| `PlaceableHusbandryAnimalWorker:onLoad(savegame: table?)` | 95 | ✍ Builds a state entry (disabled, last run day -1, default prices) for every task of the task system, keyed by task name, then loads XML price overrides. Does nothing if the task system is missing. |
| `PlaceableHusbandryAnimalWorker:loadAnimalWorkerPriceOverrides()` | 121 | ✍ Reads each `placeable.husbandry.animalWorker.task` entry and overrides base price and price per animal of the matching task state; unknown task names give an XML warning. |
| `PlaceableHusbandryAnimalWorker:onReadStream(streamId: integer, connection: table)` | 142 | ✍ Client join: reads one enabled bit per registered task, in task order, and applies it to the matching state. |
| `PlaceableHusbandryAnimalWorker:onWriteStream(streamId: integer, connection: table)` | 159 | ✍ Server join: writes one enabled bit per registered task in task order, false for tasks this husbandry does not offer. |
| `PlaceableHusbandryAnimalWorker:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 174 | ✍ Restores enabled flag and last run day per task by name from the savegame; unknown tasks are ignored. Always returns true. |
| `PlaceableHusbandryAnimalWorker:saveToXMLFile(xmlFile: XMLFile, key: string)` | 198 | ✍ Writes each offered task's name, enabled flag and last run day under indexed `.task` keys, in task system order. |
| `PlaceableHusbandryAnimalWorker:onHourChanged(hour: integer)` | 220 | ✍ Server only. For each available enabled task that has not run today and is due at this hour, runs performAnimalWorkerTask. |
| `PlaceableHusbandryAnimalWorker:onDayChanged(currentDay: integer)` | 246 | ✍ Client side, for the local player's farm only: when the day before a scheduled task comes (period matches notifyPeriod and it is the last day of the period) it shows the task's reminder as an in-game notification. |
| `PlaceableHusbandryAnimalWorker:getConditionInfos(superFunc: function) → table` | 277 | ✍ Override that appends a status entry to the condition infos, showing enabled over available tasks as text and ratio. Nothing is added if no tasks are available. |
| `PlaceableHusbandryAnimalWorker:performAnimalWorkerTask(task: table) → integer, integer` | 311 | ✍ Server only. Runs the task through AnimalWorkerTaskSystem.performTask. If animals were handled, it records the day, and charges base price plus price per animal as AI money to the farm (none for the spectator farm). Returns animals handled and cost; a run with nothing done costs nothing. |
| `PlaceableHusbandryAnimalWorker:applyAnimalWorkerStateFromEvent(task: table, enabled: boolean) → boolean` | 349 | ✍ Sets the enabled flag of a task, called by the state-change event. Returns the applied value, or false if the husbandry does not offer the task. |
| `PlaceableHusbandryAnimalWorker:getAnimalWorkerTaskState(task: table?) → table?` | 388 | ✍ Returns this husbandry's state table for the task, or nil if the task is nil or not offered. |
| `PlaceableHusbandryAnimalWorker:getAnimalWorkerAvailableTasks() → table` | 399 | ✍ Returns the tasks that have a state on this husbandry and are currently available according to AnimalWorkerTaskSystem, in task order. |
| `PlaceableHusbandryAnimalWorker:getAnimalWorkerTaskIsEnabled(task: table?) → boolean` | 421 | ✍ Returns true if the task state exists and is enabled. |
| `PlaceableHusbandryAnimalWorker:getAnimalWorkerTaskCost(task: table?, numAnimals: integer) → integer` | 432 | ✍ Returns base price plus price per animal times numAnimals, or 0 if the husbandry does not offer the task. |
| `PlaceableHusbandryAnimalWorker:getAnimalWorkerTaskIsDue(task: table, hour: integer) → boolean` | 446 | ✍ Decides whether a task is due at the given hour. Non-daily tasks need the scheduled period and day in period; the hour must be at or past the schedule hour (default from AnimalWorkerTaskSystem), so a missed hour still runs later that day. |

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
