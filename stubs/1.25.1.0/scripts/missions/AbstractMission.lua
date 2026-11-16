---@meta
-- FS25 1.25.1.0 : missions/AbstractMission.lua (generated stub, FS25 Lua Atlas)

--- Base class (subclass of Object, so a network object) of every contract mission. It holds status (MissionStatus), finish state, reward, completion, optional end date, and borrowed vehicles, and handles savegame XML, network streams, the status flow CREATED, PREPARING, RUNNING, FINISHED, DISMISSED, and payout. Concrete missions override hooks like getCompletion, getReward, getMissionTypeName and getVehicleSize. It talks to g_missionManager, g_messageCenter, g_farmManager and the HUD side-notification progress bar. Environment and MissionManager are not in the dump (UNVERIFIED).
---@class AbstractMission : Object
AbstractMission = {}

--- Creates a mission with title and description, status CREATED, zero reward and completion, and empty vehicle lists. Allocates a dirty flag, subscribes to FARM_DELETED and SAVEGAME_LOADED, and increments the instance counter of its mission type in g_missionManager.
---@param isServer any
---@param isClient any
---@param title any
---@param description any
---@param customMt any
function AbstractMission.new(isServer, isClient, title, description, customMt) end

--- Initialises the mission by picking a vehicle group and its identifier through getVehicleGroup. Returns true; subclasses extend it with their own set-up.
function AbstractMission:init() end

--- Message handler after a savegame load: calls reactivate if the mission had been started.
function AbstractMission:onSavegameLoaded() end

--- Restores runtime hooks after loading: if vehicles were spawned, subscribes to VEHICLE_RESET so replaced vehicles stay tracked.
function AbstractMission:reactivate() end

--- Hook returning the map hotspots of the mission; the base returns nil.
function AbstractMission:getMapHotspots() end

--- Deletes the mission: calls the parent delete, removes access (deletes borrowed vehicles on the server), unsubscribes messages, removes it from g_missionManager, publishes MISSION_DELETED and decrements the type's instance count.
function AbstractMission:delete() end

--- Writes uniqueId, status, finish state, farm id, active id, reward, reimbursement, completion, stealing cost, spawned flag, vehicle group, vehicle unique ids and end date under the key. Subclasses add their own fields.
---@param xmlFile any
---@param key any
function AbstractMission:saveToXMLFile(xmlFile, key) end

--- Reads the data written by saveToXMLFile. Returns false (with a log) if the status is invalid, the vehicle group no longer matches the variant, or no vehicle group can be found. Queues vehicle unique ids to re-attach and flags missing vehicles to be respawned for unfinished missions.
---@param xmlFile any
---@param key any
function AbstractMission:loadFromXMLFile(xmlFile, key) end

--- Server to client initial sync: writes the parent state, type id, reward, reimbursement, status, spawned flag and vehicle group id, then farm id if started, active id or stealing cost and finish state depending on the status, and the end date.
---@param streamId any
---@param connection any
function AbstractMission:writeStream(streamId, connection) end

--- Client counterpart of writeStream: reads those fields in the same order, then registers the mission in g_missionManager.missions and publishes MISSION_GENERATED on the next frame.
---@param streamId any
---@param connection any
function AbstractMission:readStream(streamId, connection) end

--- Writes the live update: current status and completion as a float. The dirty mask is ignored.
---@param streamId any
---@param connection any
---@param dirtyMask any
function AbstractMission:writeUpdateStream(streamId, connection, dirtyMask) end

--- Reads the live update: applies the status through setStatus and stores the completion value.
---@param streamId any
---@param timestamp any
---@param connection any
function AbstractMission:readUpdateStream(streamId, timestamp, connection) end

--- Per-frame update. Re-attaches saved vehicles by unique id and respawns missing ones. Server: finishes preparation when vehicles are ready, fails the mission if vehicle loading failed, and ends a running mission on timeout or failed validation. Clients of the owning farm get a HUD progress bar.
---@param dt any
function AbstractMission:update(dt) end

--- Server only, while running: recomputes completion from getCompletion about every 2.5 s of mission time, finishes with SUCCESS at 0.995 or more, and raises the dirty flag when the value changed.
---@param dt any
function AbstractMission:updateTick(dt) end

--- Starts the mission: calls prepare, raises active and broadcasts MissionStartedEvent from the server. Returns true.
---@param spawnVehicles any
function AbstractMission:start(spawnVehicles) end

--- Sets the status to PREPARING. On the server, when requested and vehicles are defined, spawns them and subscribes to VEHICLE_RESET.
---@param spawnVehicles any
function AbstractMission:prepare(spawnVehicles) end

--- Returns true if no vehicles were spawned, or if the number of loaded vehicles equals the number expected.
function AbstractMission:getIsPrepared() end

--- Moves the mission from PREPARING to RUNNING.
function AbstractMission:finishedPreparing() end

--- Empty hook for subclasses, called when the mission has started.
function AbstractMission:started() end

--- Sets status FINISHED and the finish state; removes vehicle access unless it succeeded. On the server it counts a success in the farm stats, computes the stealing cost and broadcasts MissionFinishedEvent. Also removes the progress bar and publishes MissionFinishedEvent locally.
---@param finishState any
function AbstractMission:finish(finishState) end

--- Moves the mission to DISMISSED once. After a success it removes vehicle access; on the server it pays the farm the total reward (can be negative) as MoneyType.MISSIONS when non-zero.
function AbstractMission:dismiss() end

--- Hook computing the penalty applied after completion; the base returns 0.
function AbstractMission:calculateStealingCost() end

--- Returns the mission's unique id string (nil until set).
---@return string
function AbstractMission:getUniqueId() end

--- Stores the unique id. It should be set only once; debug builds assert it is a string and was previously nil.
---@param uniqueId string
function AbstractMission:setUniqueId(uniqueId) end

--- Calls spawnVehicle for each entry of vehiclesToLoad and sets spawnedVehicles to true if there was at least one.
function AbstractMission:spawnVehicles() end

--- Starts asynchronous loading of one vehicle (filename and optional configurations) at the store spawn places, with MISSION property state and the mission farm as owner. Calls onSpawnedVehicle when done; nothing happens if the data is invalid.
---@param info any
function AbstractMission:spawnVehicle(info) end

--- Callback of vehicle loading. On success adds random wear and operating time (about 30 to 70 hours) to each vehicle and tracks it. On failure marks the mission as failed to load, deletes loaded vehicles, cancels pending loads and clears vehicle lists.
---@param vehicles any
---@param vehicleLoadState any
---@param loadingInfo any
function AbstractMission:onSpawnedVehicle(vehicles, vehicleLoadState, loadingInfo) end

--- Hook returning the stealing cost; the base returns 0. getActualStealingCosts uses it.
function AbstractMission:getStealingCosts() end

--- Returns the cost of borrowed vehicles: number of vehicles times AbstractMission.VEHICLE_USE_COST times a difficulty factor (0.7 plus 0.3 times economic difficulty). Returns 0 without vehicles.
function AbstractMission:getVehicleCosts() end

--- Hook returning the base reward; the base returns 0.
function AbstractMission:getReward() end

--- Returns the stored reimbursement amount.
function AbstractMission:getReimbursement() end

--- Empty hook, called from removeAccess on the server, for subclasses to compute a reimbursement.
function AbstractMission:calculateReimbursement() end

--- Returns the vehicle costs only if vehicles were actually spawned, otherwise 0.
function AbstractMission:getActualVehicleCosts() end

--- Returns the reward only when the finish state is SUCCESS, otherwise 0.
function AbstractMission:getActualReward() end

--- Returns the stealing costs that apply, currently the same as getStealingCosts.
function AbstractMission:getActualStealingCosts() end

--- Net payout: actual reward minus vehicle costs minus stealing costs plus reimbursement. Used by dismiss.
function AbstractMission:getTotalReward() end

--- Returns whether the mission can still run, which is false only when it has timed out. Subclasses extend it; a false result fails the running mission.
---@param event any
function AbstractMission:validate(event) end

--- Returns true if an end date exists and no minutes are left; false when there is no end date.
function AbstractMission:isTimedOut() end

--- Returns in-game minutes until the end date (day and day time in ms) using the current environment, or nil without an end date. Depends on Environment fields not in the dump (UNVERIFIED).
function AbstractMission:getMinutesLeft() end

--- Sets the end date to the last millisecond of the final day of the current period, computed from daysPerPeriod and the day in period.
function AbstractMission:setDefaultEndDate() end

--- Sets the end date from the current day plus a day-time offset in ms, resolved with environment:getDayAndDayTime.
---@param dayTimeOffset any
function AbstractMission:setEndDateByOffset(dayTimeOffset) end

--- Stores the end date as a table with endDay (monotonic day) and endDayTime (ms).
---@param endDay any
---@param endDayTime any
function AbstractMission:setEndDate(endDay, endDayTime) end

--- Returns true while the status is PREPARING or RUNNING.
function AbstractMission:getIsInProgress() end

--- Returns true when the status is RUNNING.
function AbstractMission:getIsRunning() end

--- Returns true if the status is RUNNING, FINISHED or DISMISSED.
function AbstractMission:getWasRunning() end

--- Returns true when the status is CREATED.
function AbstractMission:getIsReadyToStart() end

--- Returns true when the status is anything other than CREATED.
function AbstractMission:getWasStarted() end

--- Returns true when the status is FINISHED.
function AbstractMission:getIsFinished() end

--- Returns the info table of the mission.
function AbstractMission:getInfo() end

--- Hook returning a location text; the base returns an empty string.
function AbstractMission:getLocation() end

--- Returns the description given at construction.
function AbstractMission:getDescription() end

--- Returns a list of title/value rows for the contract screen; the base adds the formatted vehicle costs row when not started or when vehicles were spawned.
function AbstractMission:getDetails() end

--- Returns rows for the finished-mission summary: reward, reimbursement, vehicle costs and stealing costs (costs shown as negative money).
function AbstractMission:getFinishedDetails() end

--- Returns the mission title.
function AbstractMission:getTitle() end

--- Hook returning the NPC tied to the mission; the base returns nil.
function AbstractMission:getNPC() end

--- Hook returning extra text shown beside the progress bar; the base returns an empty string.
function AbstractMission:getExtraProgressText() end

--- Hook returning completion from 0 to 1; the base returns 0. The mission succeeds once it reaches about 0.995.
function AbstractMission:getCompletion() end

--- FARM_DELETED handler: if the deleted farm is this mission's farm, asks g_missionManager to delete the mission.
---@param farmId any
function AbstractMission:farmDestroyed(farmId) end

--- Hook returning the mission type name; the base returns nil. Used in the constructor to count instances, so subclasses must override it.
function AbstractMission:getMissionTypeName() end

--- VEHICLE_RESET handler, server only: if the old vehicle belonged to the mission, replaces it with the new vehicle.
---@param oldVehicle any
---@param newVehicle any
function AbstractMission:onVehicleReset(oldVehicle, newVehicle) end

--- Hook returning the vehicle size class; the base returns "small".
function AbstractMission:getVehicleSize() end

--- Looks up a borrowed-vehicle group by identifier for this mission type and size via g_missionManager.
---@param identifier any
function AbstractMission:getVehicleGroupFromIdentifier(identifier) end

--- Picks a random vehicle group for the mission type, size and variant from g_missionManager. Returns the vehicle list (or nil) and the group identifier.
---@return array
---@return integer
function AbstractMission:getVehicleGroup() end

--- Hook returning the required vehicle variant name; nil means no filter.
function AbstractMission:getVehicleVariant() end

--- Hook returning the mission variant; the base returns nil.
function AbstractMission:getVariant() end

--- Server only: calls calculateReimbursement, then deletes every borrowed vehicle not already being deleted and empties the vehicle list.
function AbstractMission:removeAccess() end

--- Returns true when the mission has a vehicle list to borrow (vehiclesToLoad is not nil).
function AbstractMission:hasLeasableVehicles() end

--- Checks that every vehicle to load fits at the store spawn places, using size from the store item with minimum spawn dimensions. Places are temporarily marked used during the check and released afterwards. Returns a boolean.
function AbstractMission:isSpawnSpaceAvailable() end

--- Hook asked whether a work area may operate at a position for a farm and vehicle; the base always returns true.
---@param farmId any
---@param x any
---@param z any
---@param workAreaType any
---@param vehicle any
function AbstractMission:getIsWorkAllowed(farmId, x, z, workAreaType, vehicle) end

--- Hook returning the mission's world x and z; the base returns 0, 0.
function AbstractMission:getWorldPosition() end

--- Static hook called with map XML and base directory to load mission-type data; empty in the base class.
---@param xmlFile any
---@param baseDirectory any
function AbstractMission.loadMapData(xmlFile, baseDirectory) end

--- Static hook called when the map is unloaded to free mission-type data; empty in the base class.
function AbstractMission.unloadMapData() end

--- Static hook that subclasses implement to try creating a new mission of their type; empty here and returns nothing.
function AbstractMission.tryGenerateMission() end

--- Static hook that subclasses implement to tell whether this mission type can run on the current map; empty here and returns nothing (nil).
function AbstractMission.canRun() end
