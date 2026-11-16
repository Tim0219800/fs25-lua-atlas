---@meta
-- FS25 1.25.1.0 : missions/MissionManager.lua (generated stub, FS25 Lua Atlas)

--- Manager of contracts (missions), a subclass of AbstractManager. It keeps the registered mission types and their data, the list of generated and active missions, a per-pixel mission access map (InfoLayer) and the vehicle groups lent for field missions. On the server it generates missions on a timer, starts, cancels and dismisses them, and saves and loads them. Mission classes register themselves through registerMissionType (done elsewhere).
---@class MissionManager : AbstractManager
MissionManager = {}

--- Constructor. Sets a 512 by 512 mission map with 4 channels, on top of AbstractManager.new.
---@param customMt any
---@return table
function MissionManager.new(customMt) end

--- Resets mission lists, type tables, unique id index, mission map, generation indices and timer, vehicle group tables and the generated-mission counter.
function MissionManager:initDataStructures() end

--- Removes the debug bit vector map element from the debug manager if it exists.
function MissionManager:delete() end

--- Reads map.missions from the map XML (enabled flag, per-type maxNumInstances, vehicleFilename), creates the mission map, calls each mission class loadMapData, adds the manager as updateable on the server, loads vehicle groups (map, then pending mod and DLC files) and registers gsMission* test commands. Returns nothing (not true) when missions are disabled.
---@param xmlFile any
---@return boolean
function MissionManager:loadMapData(xmlFile) end

--- Unsubscribes from messages, removes the updateable, calls each mission class unloadMapData, destroys the mission map, removes the gsMission* commands and calls the parent.
function MissionManager:unloadMapData() end

--- Writes the missions file: per-type metadata, a version number, then every mission under missions.<typeName>(n). Note: always returns false, even on success.
---@param xmlFilename string
---@return boolean
function MissionManager:saveToXMLFile(xmlFilename) end

--- Reads saved missions if the version matches MissionManager.VERSION (otherwise warns and skips). Creates each mission from its type class, loads, registers and adds it, or queues it for deletion if loading fails or its farm no longer exists.
---@param xmlFilename string
function MissionManager:loadFromXMLFile(xmlFilename) end

--- True when no generation is in progress, the mission count is below MAX_MISSIONS and the generation timer has run below zero.
function MissionManager:getCanStartNewMissionGeneration() end

--- Server only, when the platform supports missions: decreases the generation timer by dt scaled with the effective time scale, updates missions and runs the generation state machine, one mission type per frame.
---@param dt string
function MissionManager:update(dt) end

--- Queues CREATED missions that fail validate for deletion, then deletes every mission in the deletion queue. The dt argument is not used.
---@param dt any
function MissionManager:updateMissions(dt) end

--- Publishes MISSION_GENERATION_START, picks a random starting mission type and marks generation as in progress.
function MissionManager:startMissionGeneration() end

--- Publishes MISSION_GENERATION_END, resets the timer to MISSION_GENERATION_INTERVAL and clears the in-progress flag.
function MissionManager:finishMissionGeneration() end

--- One step of generation: asks the current type tryGenerateMission, registers any mission returned, moves to the next type (wrapping), and finishes after a success or after a full cycle.
function MissionManager:generateMission() end

--- Sets the mission type, registers the mission, adds it to the list and publishes MISSION_GENERATED with it.
---@param mission any
---@param missionType any
function MissionManager:registerMission(mission, missionType) end

--- Adds a mission to the list and unique id index, giving it a unique id if none. Warns and ignores a mission whose unique id already exists.
---@param mission any
function MissionManager:addMission(mission) end

--- Removes a mission from the list and from the unique id index.
---@param mission any
function MissionManager:removeMission(mission) end

--- Adds the mission to the deletion queue, processed in updateMissions.
---@param mission any
function MissionManager:markMissionForDeletion(mission) end

--- Returns the mission with the given unique id, or nil.
---@param uniqueId any
function MissionManager:getMissionByUniqueId(uniqueId) end

--- Server only (asserts). Starts a mission for a farm and returns a MissionStartState: NO_ACCESS for spectators, LIMIT_REACHED, ALREADY_STARTED, PENDING_MISSION if another is preparing, NOT_AVAILABLE_ANYMORE (mission deleted), CANNOT_BE_STARTED_NOW, or OK after publishing MissionStartedEvent.
---@param mission any
---@param farmId any
---@param spawnVehicles any
function MissionManager:startMission(mission, farmId, spawnVehicles) end

--- Server only (asserts). Finishes an unfinished mission with MissionFinishState.CANCELED and returns true; false otherwise.
---@param mission any
function MissionManager:cancelMission(mission) end

--- Server only (asserts). Calls dismiss on the mission (money settlement) then deletes it. Returns true.
---@param mission any
function MissionManager:dismissMission(mission) end

--- Returns the internal list of all missions (not a copy).
function MissionManager:getMissions() end

--- Returns a filtered list of missions that have no farm yet or belong to the given farm, used by the contracts menu.
---@param farmId any
function MissionManager:getMissionsByFarmId(farmId) end

--- True if a mission whose getFarmlandId matches the farmland id is in progress. False for a nil farmland. For field missions that value is the field id (see AbstractFieldMission).
---@param farmland any
function MissionManager:getIsMissionRunningOnFarmland(farmland) end

--- Returns the missions that are instances of the class of the mission type at the given index, or nil if the index is unknown.
---@param typeIndex any
function MissionManager:getMissionsByType(typeIndex) end

--- True when the number of started missions of the farm reaches MAX_MISSIONS_PER_FARM.
---@param farmId any
function MissionManager:hasFarmReachedMissionLimit(farmId) end

--- Creates the mission access InfoLayer; on the server sets it as the growth mask so mission fields do not grow. Optionally creates a debug view.
function MissionManager:createMissionMap() end

--- On the server resets the growth mask, then deletes the mission map.
function MissionManager:destroyMissionMap() end

--- Writes a mission id into the mission map over the given area (polygon); does nothing if there is no map.
---@param area any
---@param missionId any
function MissionManager:setMissionMapActiveMissionId(area, missionId) end

--- Returns the active mission id stored in the map at a world X/Z position, or 0 when there is no map.
---@param worldX any
---@param worldZ any
function MissionManager:getMissionMapActiveMissionIdAtWorldPosition(worldX, worldZ) end

--- Returns the mission whose active id is stored at the world position, or nil.
---@param worldX any
---@param worldZ any
---@return mission
function MissionManager:getMissionAtWorldPosition(worldX, worldZ) end

--- Linear search for the mission with the given activeMissionId; nil if none.
---@param activeMissionId any
function MissionManager:getMissionByActiveMissionId(activeMissionId) end

--- Returns the first id from 1 to MAX_MISSIONS not used by a mission, or 0 if all are taken.
function MissionManager:getFreeActiveMissionId() end

--- True if the mission at the position belongs to the farm and its getIsWorkAllowed accepts the work area type and vehicle.
---@param farmId any
---@param x any
---@param z any
---@param workAreaType any
---@param vehicle any
function MissionManager:getIsMissionWorkAllowed(farmId, x, z, workAreaType, vehicle) end

--- Adds a mission type (name, class, sequential typeId, data with numInstances and maxNumInstances, default max 2) and indexes it by upper-case name. Ignored if class or name is nil.
---@param classObject any
---@param name any
---@param defaultMaxNumInstances any
function MissionManager:registerMissionType(classObject, name, defaultMaxNumInstances) end

--- Removes a type from the list. Note: it uses self.missionType (singular, nil) instead of self.missionTypes, so a match would raise an error; it also leaves nameToMissionType untouched.
---@param name any
function MissionManager:unregisterMissionType(name) end

--- Returns the mission type table for a name (case-insensitive), or nil.
---@param name any
function MissionManager:getMissionType(name) end

--- Returns the mission type at the given list index, or nil.
---@param id any
function MissionManager:getMissionTypeById(id) end

--- Returns the data table (numInstances, maxNumInstances, plus values added by the class) of a type by name; nil with a dev error if the name is nil, or nil if unknown.
---@param name any
function MissionManager:getMissionTypeDataByName(name) end

--- Returns the first mission whose getIsMissionSplitShape accepts the shape, or nil. Nil for a nil or 0 shape.
---@param shape any
function MissionManager:getMissionBySplitShape(shape) end

--- Asks missions in order and returns the first non-nil answer of getIsShapeCutAllowed, or nil if none decides.
---@param shape any
---@param x any
---@param z any
---@param farmId any
function MissionManager:getIsShapeCutAllowed(shape, x, z, farmId) end

--- True if any mission reports through getDestructibleIsInMissionArea that the node is in its area for that farm.
---@param farmId any
---@param nodeId any
function MissionManager:getIsMissionDestructible(farmId, nodeId) end

--- Queues a mission vehicles XML file and its base directory, used by mods and DLC, to be loaded in loadMapData.
---@param filename any
---@param baseDirectory any
function MissionManager:addPendingMissionVehiclesFile(filename, baseDirectory) end

--- Parses a missionVehicles XML: per mission type, groups by size (default medium) with rewardScale, variant and vehicles (store item filename plus configurations). Invalid groups are skipped with errors. Returns false if the file cannot be loaded.
---@param xmlFilename any
---@param baseDirectory any
function MissionManager:loadVehicleGroups(xmlFilename, baseDirectory) end

--- Returns a random vehicle list for a mission type, size and optional variant, plus the group identifier. Returns nil and 1 if none matches.
---@param missionType string
---@param size string
---@param variant string
---@return array
---@return integer
function MissionManager:getRandomVehicleGroup(missionType, size, variant) end

--- Client-safe lookup of a group by type, field size and identifier. Returns vehicles, rewardScale, an error message and the group; with nil vehicles, rewardScale 1 and a message when missing.
---@param missionType string
---@param fieldSize string
---@param identifier integer
---@return array?
---@return number
---@return string?
function MissionManager:getVehicleGroupFromIdentifier(missionType, fieldSize, identifier) end

--- Gives the mission an increasing generationTime (a per-run counter, not saved) used to sort missions identically on server and clients.
---@param mission any
function MissionManager:assignGenerationTime(mission) end
