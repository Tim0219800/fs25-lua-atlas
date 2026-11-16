# guidedTour/GuidedTourManager.lua

*[Version française](../../fr/scripts/guidedTour/GuidedTourManager.md)*

Source: `dataS/scripts/guidedTour/GuidedTourManager.lua` — FS25 1.25.1.0

✍ Manager for guided tours, subclass of `AbstractManager`. It loads tour definitions listed in the map XML (`map.guidedTours.guidedTour` with `#filename` and `#name`), builds them with `GuidedTourUtil.createFromXML`, and saves/restores the active tour in the savegame. `GuidedTourUtil`, `GuidedTourHelp` and `onMissionStarted` are not in this file (UNVERIFIED).

- **GuidedTourManager** inherits from `AbstractManager` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `GuidedTourManager.new(customMt: any) → table` | 32 | ✍ Creates the manager through `AbstractManager.new` with the given or default metatable. |
| `GuidedTourManager:initDataStructures()` | 40 | ✍ Resets the tour list, name lookup tables for tours, vehicles and placeables, and the goal, action and progress class registries. |
| `GuidedTourManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 58 | ✍ Loads the map's `guidedTours` section through `XMLUtil.loadDataFromMapXML`; on success calls `GuidedTourHelp.init()`. Returns whether loading succeeded. |
| `GuidedTourManager:loadGuidedTours(xmlFileHandle: any, missionInfo: any, baseDirectory: any, isBaseType: any) → boolean` | 73 | ✍ Iterates the guided tour entries, skipping those without filename or name or with a duplicate name (case-insensitive, stored uppercase). Each tour gets its name and index. Subscribes once to `CURRENT_MISSION_START` and always returns true. |
| `GuidedTourManager:saveToXMLFile(xmlFilename: string) → boolean` | 122 | ✍ Writes the active tour's name and its own saved state to the given XML file. Returns false if the file cannot be created, otherwise true (also when no tour is active). |
| `GuidedTourManager:loadFromXMLFile(xmlFilename: string) → boolean` | 145 | ✍ Reads the saved tour name and, if the tour exists and loads its state, stores it as `pendingStartTour`; otherwise a warning is logged. Returns false only when the file is missing or unreadable. |
