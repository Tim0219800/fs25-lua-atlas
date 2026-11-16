# missions/MissionManager.lua

*[Version française](../../fr/scripts/missions/MissionManager.md)*

Source: `dataS/scripts/missions/MissionManager.lua` — FS25 1.25.1.0

✍ Manager of contracts (missions), a subclass of AbstractManager. It keeps the registered mission types and their data, the list of generated and active missions, a per-pixel mission access map (InfoLayer) and the vehicle groups lent for field missions. On the server it generates missions on a timer, starts, cancels and dismisses them, and saves and loads them. Mission classes register themselves through registerMissionType (done elsewhere).

- **MissionManager** inherits from `AbstractManager` (l.21)

## Functions

| Function | Line | Description |
|---|---|---|
| `MissionManager.new(customMt: any) → table` | 77 | ✍ Constructor. Sets a 512 by 512 mission map with 4 channels, on top of AbstractManager.new. |
| `MissionManager:initDataStructures()` | 89 | ✍ Resets mission lists, type tables, unique id index, mission map, generation indices and timer, vehicle group tables and the generated-mission counter. |
| `MissionManager:delete()` | 111 | ✍ Removes the debug bit vector map element from the debug manager if it exists. |
| `MissionManager:loadMapData(xmlFile: any) → boolean` | 120 | ✍ Reads map.missions from the map XML (enabled flag, per-type maxNumInstances, vehicleFilename), creates the mission map, calls each mission class loadMapData, adds the manager as updateable on the server, loads vehicle groups (map, then pending mod and DLC files) and registers gsMission* test commands. Returns nothing (not true) when missions are disabled. |
| `MissionManager:unloadMapData()` | 174 | ✍ Unsubscribes from messages, removes the updateable, calls each mission class unloadMapData, destroys the mission map, removes the gsMission* commands and calls the parent. |
| `MissionManager:saveToXMLFile(xmlFilename: string) → boolean` | 200 | ✍ Writes the missions file: per-type metadata, a version number, then every mission under missions.<typeName>(n). Note: always returns false, even on success. |
| `MissionManager:loadFromXMLFile(xmlFilename: string)` | 231 | ✍ Reads saved missions if the version matches MissionManager.VERSION (otherwise warns and skips). Creates each mission from its type class, loads, registers and adds it, or queues it for deletion if loading fails or its farm no longer exists. |
| `MissionManager:getCanStartNewMissionGeneration()` | 297 | ✍ True when no generation is in progress, the mission count is below MAX_MISSIONS and the generation timer has run below zero. |
| `MissionManager:update(dt: string)` | 304 | ✍ Server only, when the platform supports missions: decreases the generation timer by dt scaled with the effective time scale, updates missions and runs the generation state machine, one mission type per frame. |
| `MissionManager:updateMissions(dt: any)` | 325 | ✍ Queues CREATED missions that fail validate for deletion, then deletes every mission in the deletion queue. The dt argument is not used. |
| `MissionManager:startMissionGeneration()` | 342 | ✍ Publishes MISSION_GENERATION_START, picks a random starting mission type and marks generation as in progress. |
| `MissionManager:finishMissionGeneration()` | 351 | ✍ Publishes MISSION_GENERATION_END, resets the timer to MISSION_GENERATION_INTERVAL and clears the in-progress flag. |
| `MissionManager:generateMission()` | 359 | ✍ One step of generation: asks the current type tryGenerateMission, registers any mission returned, moves to the next type (wrapping), and finishes after a success or after a full cycle. |
| `MissionManager:registerMission(mission: any, missionType: any)` | 394 | ✍ Sets the mission type, registers the mission, adds it to the list and publishes MISSION_GENERATED with it. |
| `MissionManager:addMission(mission: any)` | 403 | ✍ Adds a mission to the list and unique id index, giving it a unique id if none. Warns and ignores a mission whose unique id already exists. |
| `MissionManager:removeMission(mission: any)` | 421 | ✍ Removes a mission from the list and from the unique id index. |
| `MissionManager:markMissionForDeletion(mission: any)` | 432 | ✍ Adds the mission to the deletion queue, processed in updateMissions. |
| `MissionManager:getMissionByUniqueId(uniqueId: any)` | 438 | ✍ Returns the mission with the given unique id, or nil. |
| `MissionManager:startMission(mission: any, farmId: any, spawnVehicles: any)` | 444 | ✍ Server only (asserts). Starts a mission for a farm and returns a MissionStartState: NO_ACCESS for spectators, LIMIT_REACHED, ALREADY_STARTED, PENDING_MISSION if another is preparing, NOT_AVAILABLE_ANYMORE (mission deleted), CANNOT_BE_STARTED_NOW, or OK after publishing MissionStartedEvent. |
| `MissionManager:cancelMission(mission: any)` | 492 | ✍ Server only (asserts). Finishes an unfinished mission with MissionFinishState.CANCELED and returns true; false otherwise. |
| `MissionManager:dismissMission(mission: any)` | 507 | ✍ Server only (asserts). Calls dismiss on the mission (money settlement) then deletes it. Returns true. |
| `MissionManager:getMissions()` | 519 | ✍ Returns the internal list of all missions (not a copy). |
| `MissionManager:getMissionsByFarmId(farmId: any)` | 525 | ✍ Returns a filtered list of missions that have no farm yet or belong to the given farm, used by the contracts menu. |
| `MissionManager:getIsMissionRunningOnFarmland(farmland: any)` | 534 | ✍ True if a mission whose getFarmlandId matches the farmland id is in progress. False for a nil farmland. For field missions that value is the field id (see AbstractFieldMission). |
| `MissionManager:getMissionsByType(typeIndex: any)` | 567 | ✍ Returns the missions that are instances of the class of the mission type at the given index, or nil if the index is unknown. |
| `MissionManager:hasFarmReachedMissionLimit(farmId: any)` | 580 | ✍ True when the number of started missions of the farm reaches MAX_MISSIONS_PER_FARM. |
| `MissionManager:createMissionMap()` | 594 | ✍ Creates the mission access InfoLayer; on the server sets it as the growth mask so mission fields do not grow. Optionally creates a debug view. |
| `MissionManager:destroyMissionMap()` | 622 | ✍ On the server resets the growth mask, then deletes the mission map. |
| `MissionManager:setMissionMapActiveMissionId(area: any, missionId: any)` | 637 | ✍ Writes a mission id into the mission map over the given area (polygon); does nothing if there is no map. |
| `MissionManager:getMissionMapActiveMissionIdAtWorldPosition(worldX: any, worldZ: any)` | 645 | ✍ Returns the active mission id stored in the map at a world X/Z position, or 0 when there is no map. |
| `MissionManager:getMissionAtWorldPosition(worldX: any, worldZ: any) → mission` | 656 | ✍ Returns the mission whose active id is stored at the world position, or nil. |
| `MissionManager:getMissionByActiveMissionId(activeMissionId: any)` | 668 | ✍ Linear search for the mission with the given activeMissionId; nil if none. |
| `MissionManager:getFreeActiveMissionId()` | 680 | ✍ Returns the first id from 1 to MAX_MISSIONS not used by a mission, or 0 if all are taken. |
| `MissionManager:getIsMissionWorkAllowed(farmId: any, x: any, z: any, workAreaType: any, vehicle: any)` | 692 | ✍ True if the mission at the position belongs to the farm and its getIsWorkAllowed accepts the work area type and vehicle. |
| `MissionManager:registerMissionType(classObject: any, name: any, defaultMaxNumInstances: any)` | 706 | ✍ Adds a mission type (name, class, sequential typeId, data with numInstances and maxNumInstances, default max 2) and indexes it by upper-case name. Ignored if class or name is nil. |
| `MissionManager:unregisterMissionType(name: any)` | 725 | ✍ Removes a type from the list. Note: it uses self.missionType (singular, nil) instead of self.missionTypes, so a match would raise an error; it also leaves nameToMissionType untouched. |
| `MissionManager:getMissionType(name: any)` | 738 | ✍ Returns the mission type table for a name (case-insensitive), or nil. |
| `MissionManager:getMissionTypeById(id: any)` | 744 | ✍ Returns the mission type at the given list index, or nil. |
| `MissionManager:getMissionTypeDataByName(name: any)` | 750 | ✍ Returns the data table (numInstances, maxNumInstances, plus values added by the class) of a type by name; nil with a dev error if the name is nil, or nil if unknown. |
| `MissionManager:getMissionBySplitShape(shape: any)` | 770 | ✍ Returns the first mission whose getIsMissionSplitShape accepts the shape, or nil. Nil for a nil or 0 shape. |
| `MissionManager:getIsShapeCutAllowed(shape: any, x: any, z: any, farmId: any)` | 788 | ✍ Asks missions in order and returns the first non-nil answer of getIsShapeCutAllowed, or nil if none decides. |
| `MissionManager:getIsMissionDestructible(farmId: any, nodeId: any)` | 803 | ✍ True if any mission reports through getDestructibleIsInMissionArea that the node is in its area for that farm. |
| `MissionManager:addPendingMissionVehiclesFile(filename: any, baseDirectory: any)` | 817 | ✍ Queues a mission vehicles XML file and its base directory, used by mods and DLC, to be loaded in loadMapData. |
| `MissionManager:loadVehicleGroups(xmlFilename: any, baseDirectory: any)` | 823 | ✍ Parses a missionVehicles XML: per mission type, groups by size (default medium) with rewardScale, variant and vehicles (store item filename plus configurations). Invalid groups are skipped with errors. Returns false if the file cannot be loaded. |
| `MissionManager:getRandomVehicleGroup(missionType: string, size: string, variant: string) → array, integer` | 935 | ✍ Returns a random vehicle list for a mission type, size and optional variant, plus the group identifier. Returns nil and 1 if none matches. |
| `MissionManager:getVehicleGroupFromIdentifier(missionType: string, fieldSize: string, identifier: integer) → array?, number, string?` | 966 | ✍ Client-safe lookup of a group by type, field size and identifier. Returns vehicles, rewardScale, an error message and the group; with nil vehicles, rewardScale 1 and a message when missing. |
| `MissionManager:assignGenerationTime(mission: any)` | 987 | ✍ Gives the mission an increasing generationTime (a per-run counter, not saved) used to sort missions identically on server and clients. |

## Messages

- publishes `MessageType.MISSION_GENERATION_START` (l.343)
- publishes `MessageType.MISSION_GENERATION_END` (l.352)
- publishes `MessageType.MISSION_GENERATED` (l.398)
