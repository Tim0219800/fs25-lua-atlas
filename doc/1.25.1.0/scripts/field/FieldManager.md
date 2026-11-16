# field/FieldManager.lua

*[Version française](../../fr/scripts/field/FieldManager.md)*

Source: `dataS/scripts/field/FieldManager.lua` — FS25 1.25.1.0

✍ Manager of the map fields, a subclass of AbstractManager. On map load it links each Field to its farmland, checks the field does not touch other farmlands, and on a new server savegame queues FieldUpdateTask objects to preplant or prepare the NPC fields. It also saves and loads field data and pending tasks, and registers gsField* cheat commands. Many methods it calls (getFieldById, addFieldUpdateTask, onFinishFieldUpdateTask, update logic) are not in this file: UNVERIFIED.

- **FieldManager** inherits from `AbstractManager` (l.37)

## Functions

| Function | Line | Description |
|---|---|---|
| `FieldManager.new(customMt: table) → FieldManager` | 63 | ✍ Constructor. Creates the manager from AbstractManager.new with the given or default metatable. |
| `FieldManager:initDataStructures()` | 71 | ✍ Resets the field list, farmland-to-field mapping, update task queues, pending field update tables, timers and debug field. |
| `FieldManager:loadMapData(xmlFile: XMLFile, missionInfo: any, baseDirectory: any) → boolean` | 93 | ✍ Large loader run through g_asyncTaskManager subtasks: registers as updateable, builds the available fruit list, links fields to farmlands with error logs for overlaps, creates random FieldUpdateTask for unowned mission-allowed fields on a new server savegame (or tasks from the map fields XML), registers cheat commands, subscribes to growth and mission-generation messages and creates a debug overlay. On clients it only sets all fields to cultivated ground. Pending tasks are then run to completion. |
| `FieldManager:unloadMapData()` | 352 | ✍ Removes the updateable, deletes all fields, clears references, unsubscribes from messages, removes the gsField* console commands and calls the parent. |
| `FieldManager:delete()` | 379 | ✍ Empty function; cleanup is done in unloadMapData. |
| `FieldManager:loadFromXMLFile(xmlFilename: string)` | 385 | ✍ Reads the savegame fields file: per-field data through Field:loadFromXMLFile, the pending update list, and saved update tasks instantiated by class name and queued. Logs and returns if the file is missing. |
| `FieldManager:saveToXMLFile(xmlFilename: string)` | 432 | ✍ Writes fields (id plus Field:saveToXMLFile data), pending updates and queued update tasks (skipped if needsSaving is false) to the savegame XML file. |

## Messages

- subscribes `MessageType.FINISHED_GROWTH_PERIOD` (l.321)
- subscribes `MessageType.MISSION_GENERATION_START` (l.322)
- subscribes `MessageType.MISSION_GENERATION_END` (l.323)
