# missions/AbstractMission.lua

*[Version française](../../fr/scripts/missions/AbstractMission.md)*

Source: `dataS/scripts/missions/AbstractMission.lua` — FS25 1.25.1.0

✍ Base class (subclass of Object, so a network object) of every contract mission. It holds status (MissionStatus), finish state, reward, completion, optional end date, and borrowed vehicles, and handles savegame XML, network streams, the status flow CREATED, PREPARING, RUNNING, FINISHED, DISMISSED, and payout. Concrete missions override hooks like getCompletion, getReward, getMissionTypeName and getVehicleSize. It talks to g_missionManager, g_messageCenter, g_farmManager and the HUD side-notification progress bar. Environment and MissionManager are not in the dump (UNVERIFIED).

- **AbstractMission** inherits from `Object` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `AbstractMission.new(isServer: any, isClient: any, title: any, description: any, customMt: any)` | 44 | ✍ Creates a mission with title and description, status CREATED, zero reward and completion, and empty vehicle lists. Allocates a dirty flag, subscribes to FARM_DELETED and SAVEGAME_LOADED, and increments the instance counter of its mission type in g_missionManager. |
| `AbstractMission:init()` | 76 | ✍ Initialises the mission by picking a vehicle group and its identifier through getVehicleGroup. Returns true; subclasses extend it with their own set-up. |
| `AbstractMission:onSavegameLoaded()` | 89 | ✍ Message handler after a savegame load: calls reactivate if the mission had been started. |
| `AbstractMission:reactivate()` | 97 | ✍ Restores runtime hooks after loading: if vehicles were spawned, subscribes to VEHICLE_RESET so replaced vehicles stay tracked. |
| `AbstractMission:getMapHotspots()` | 105 | ✍ Hook returning the map hotspots of the mission; the base returns nil. |
| `AbstractMission:delete()` | 111 | ✍ Deletes the mission: calls the parent delete, removes access (deletes borrowed vehicles on the server), unsubscribes messages, removes it from g_missionManager, publishes MISSION_DELETED and decrements the type's instance count. |
| `AbstractMission:saveToXMLFile(xmlFile: any, key: any)` | 130 | ✍ Writes uniqueId, status, finish state, farm id, active id, reward, reimbursement, completion, stealing cost, spawned flag, vehicle group, vehicle unique ids and end date under the key. Subclasses add their own fields. |
| `AbstractMission:loadFromXMLFile(xmlFile: any, key: any)` | 165 | ✍ Reads the data written by saveToXMLFile. Returns false (with a log) if the status is invalid, the vehicle group no longer matches the variant, or no vehicle group can be found. Queues vehicle unique ids to re-attach and flags missing vehicles to be respawned for unfinished missions. |
| `AbstractMission:writeStream(streamId: any, connection: any)` | 230 | ✍ Server to client initial sync: writes the parent state, type id, reward, reimbursement, status, spawned flag and vehicle group id, then farm id if started, active id or stealing cost and finish state depending on the status, and the end date. |
| `AbstractMission:readStream(streamId: any, connection: any)` | 261 | ✍ Client counterpart of writeStream: reads those fields in the same order, then registers the mission in g_missionManager.missions and publishes MISSION_GENERATED on the next frame. |
| `AbstractMission:writeUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 299 | ✍ Writes the live update: current status and completion as a float. The dirty mask is ignored. |
| `AbstractMission:readUpdateStream(streamId: any, timestamp: any, connection: any)` | 306 | ✍ Reads the live update: applies the status through setStatus and stores the completion value. |
| `AbstractMission:update(dt: any)` | 329 | ✍ Per-frame update. Re-attaches saved vehicles by unique id and respawns missing ones. Server: finishes preparation when vehicles are ready, fails the mission if vehicle loading failed, and ends a running mission on timeout or failed validation. Clients of the owning farm get a HUD progress bar. |
| `AbstractMission:updateTick(dt: any)` | 408 | ✍ Server only, while running: recomputes completion from getCompletion about every 2.5 s of mission time, finishes with SUCCESS at 0.995 or more, and raises the dirty flag when the value changed. |
| `AbstractMission:start(spawnVehicles: any)` | 430 | ✍ Starts the mission: calls prepare, raises active and broadcasts MissionStartedEvent from the server. Returns true. |
| `AbstractMission:prepare(spawnVehicles: any)` | 443 | ✍ Sets the status to PREPARING. On the server, when requested and vehicles are defined, spawns them and subscribes to VEHICLE_RESET. |
| `AbstractMission:getIsPrepared()` | 454 | ✍ Returns true if no vehicles were spawned, or if the number of loaded vehicles equals the number expected. |
| `AbstractMission:finishedPreparing()` | 464 | ✍ Moves the mission from PREPARING to RUNNING. |
| `AbstractMission:started()` | 470 | ✍ Empty hook for subclasses, called when the mission has started. |
| `AbstractMission:finish(finishState: any)` | 475 | ✍ Sets status FINISHED and the finish state; removes vehicle access unless it succeeded. On the server it counts a success in the farm stats, computes the stealing cost and broadcasts MissionFinishedEvent. Also removes the progress bar and publishes MissionFinishedEvent locally. |
| `AbstractMission:dismiss()` | 500 | ✍ Moves the mission to DISMISSED once. After a success it removes vehicle access; on the server it pays the farm the total reward (can be negative) as MoneyType.MISSIONS when non-zero. |
| `AbstractMission:calculateStealingCost()` | 528 | ✍ Hook computing the penalty applied after completion; the base returns 0. |
| `AbstractMission:getUniqueId() → string` | 535 | ✍ Returns the mission's unique id string (nil until set). |
| `AbstractMission:setUniqueId(uniqueId: string)` | 542 | ✍ Stores the unique id. It should be set only once; debug builds assert it is a string and was previously nil. |
| `AbstractMission:spawnVehicles()` | 550 | ✍ Calls spawnVehicle for each entry of vehiclesToLoad and sets spawnedVehicles to true if there was at least one. |
| `AbstractMission:spawnVehicle(info: any)` | 560 | ✍ Starts asynchronous loading of one vehicle (filename and optional configurations) at the store spawn places, with MISSION property state and the mission farm as owner. Calls onSpawnedVehicle when done; nothing happens if the data is invalid. |
| `AbstractMission:onSpawnedVehicle(vehicles: any, vehicleLoadState: any, loadingInfo: any)` | 582 | ✍ Callback of vehicle loading. On success adds random wear and operating time (about 30 to 70 hours) to each vehicle and tracks it. On failure marks the mission as failed to load, deletes loaded vehicles, cancels pending loads and clears vehicle lists. |
| `AbstractMission:getStealingCosts()` | 630 | ✍ Hook returning the stealing cost; the base returns 0. getActualStealingCosts uses it. |
| `AbstractMission:getVehicleCosts()` | 636 | ✍ Returns the cost of borrowed vehicles: number of vehicles times AbstractMission.VEHICLE_USE_COST times a difficulty factor (0.7 plus 0.3 times economic difficulty). Returns 0 without vehicles. |
| `AbstractMission:getReward()` | 651 | ✍ Hook returning the base reward; the base returns 0. |
| `AbstractMission:getReimbursement()` | 657 | ✍ Returns the stored reimbursement amount. |
| `AbstractMission:calculateReimbursement()` | 663 | ✍ Empty hook, called from removeAccess on the server, for subclasses to compute a reimbursement. |
| `AbstractMission:getActualVehicleCosts()` | 668 | ✍ Returns the vehicle costs only if vehicles were actually spawned, otherwise 0. |
| `AbstractMission:getActualReward()` | 678 | ✍ Returns the reward only when the finish state is SUCCESS, otherwise 0. |
| `AbstractMission:getActualStealingCosts()` | 688 | ✍ Returns the stealing costs that apply, currently the same as getStealingCosts. |
| `AbstractMission:getTotalReward()` | 694 | ✍ Net payout: actual reward minus vehicle costs minus stealing costs plus reimbursement. Used by dismiss. |
| `AbstractMission:validate(event: any)` | 705 | ✍ Returns whether the mission can still run, which is false only when it has timed out. Subclasses extend it; a false result fails the running mission. |
| `AbstractMission:isTimedOut()` | 712 | ✍ Returns true if an end date exists and no minutes are left; false when there is no end date. |
| `AbstractMission:getMinutesLeft()` | 723 | ✍ Returns in-game minutes until the end date (day and day time in ms) using the current environment, or nil without an end date. Depends on Environment fields not in the dump (UNVERIFIED). |
| `AbstractMission:setDefaultEndDate()` | 755 | ✍ Sets the end date to the last millisecond of the final day of the current period, computed from daysPerPeriod and the day in period. |
| `AbstractMission:setEndDateByOffset(dayTimeOffset: any)` | 770 | ✍ Sets the end date from the current day plus a day-time offset in ms, resolved with environment:getDayAndDayTime. |
| `AbstractMission:setEndDate(endDay: any, endDayTime: any)` | 781 | ✍ Stores the end date as a table with endDay (monotonic day) and endDayTime (ms). |
| `AbstractMission:getIsInProgress()` | 790 | ✍ Returns true while the status is PREPARING or RUNNING. |
| `AbstractMission:getIsRunning()` | 796 | ✍ Returns true when the status is RUNNING. |
| `AbstractMission:getWasRunning()` | 802 | ✍ Returns true if the status is RUNNING, FINISHED or DISMISSED. |
| `AbstractMission:getIsReadyToStart()` | 808 | ✍ Returns true when the status is CREATED. |
| `AbstractMission:getWasStarted()` | 814 | ✍ Returns true when the status is anything other than CREATED. |
| `AbstractMission:getIsFinished()` | 820 | ✍ Returns true when the status is FINISHED. |
| `AbstractMission:getInfo()` | 826 | ✍ Returns the info table of the mission. |
| `AbstractMission:getLocation()` | 832 | ✍ Hook returning a location text; the base returns an empty string. |
| `AbstractMission:getDescription()` | 838 | ✍ Returns the description given at construction. |
| `AbstractMission:getDetails()` | 844 | ✍ Returns a list of title/value rows for the contract screen; the base adds the formatted vehicle costs row when not started or when vehicles were spawned. |
| `AbstractMission:getFinishedDetails()` | 856 | ✍ Returns rows for the finished-mission summary: reward, reimbursement, vehicle costs and stealing costs (costs shown as negative money). |
| `AbstractMission:getTitle()` | 868 | ✍ Returns the mission title. |
| `AbstractMission:getNPC()` | 874 | ✍ Hook returning the NPC tied to the mission; the base returns nil. |
| `AbstractMission:getExtraProgressText()` | 880 | ✍ Hook returning extra text shown beside the progress bar; the base returns an empty string. |
| `AbstractMission:getCompletion()` | 886 | ✍ Hook returning completion from 0 to 1; the base returns 0. The mission succeeds once it reaches about 0.995. |
| `AbstractMission:farmDestroyed(farmId: any)` | 892 | ✍ FARM_DELETED handler: if the deleted farm is this mission's farm, asks g_missionManager to delete the mission. |
| `AbstractMission:getMissionTypeName()` | 900 | ✍ Hook returning the mission type name; the base returns nil. Used in the constructor to count instances, so subclasses must override it. |
| `AbstractMission:onVehicleReset(oldVehicle: any, newVehicle: any)` | 906 | ✍ VEHICLE_RESET handler, server only: if the old vehicle belonged to the mission, replaces it with the new vehicle. |
| `AbstractMission:getVehicleSize()` | 917 | ✍ Hook returning the vehicle size class; the base returns "small". |
| `AbstractMission:getVehicleGroupFromIdentifier(identifier: any)` | 923 | ✍ Looks up a borrowed-vehicle group by identifier for this mission type and size via g_missionManager. |
| `AbstractMission:getVehicleGroup() → array, integer` | 931 | ✍ Picks a random vehicle group for the mission type, size and variant from g_missionManager. Returns the vehicle list (or nil) and the group identifier. |
| `AbstractMission:getVehicleVariant()` | 938 | ✍ Hook returning the required vehicle variant name; nil means no filter. |
| `AbstractMission:getVariant()` | 944 | ✍ Hook returning the mission variant; the base returns nil. |
| `AbstractMission:removeAccess()` | 950 | ✍ Server only: calls calculateReimbursement, then deletes every borrowed vehicle not already being deleted and empties the vehicle list. |
| `AbstractMission:hasLeasableVehicles()` | 965 | ✍ Returns true when the mission has a vehicle list to borrow (vehiclesToLoad is not nil). |
| `AbstractMission:isSpawnSpaceAvailable()` | 971 | ✍ Checks that every vehicle to load fits at the store spawn places, using size from the store item with minimum spawn dimensions. Places are temporarily marked used during the check and released afterwards. Returns a boolean. |
| `AbstractMission:getIsWorkAllowed(farmId: any, x: any, z: any, workAreaType: any, vehicle: any)` | 1010 | ✍ Hook asked whether a work area may operate at a position for a farm and vehicle; the base always returns true. |
| `AbstractMission:getWorldPosition()` | 1016 | ✍ Hook returning the mission's world x and z; the base returns 0, 0. |
| `AbstractMission.loadMapData(xmlFile: any, baseDirectory: any)` | 1022 | ✍ Static hook called with map XML and base directory to load mission-type data; empty in the base class. |
| `AbstractMission.unloadMapData()` | 1027 | ✍ Static hook called when the map is unloaded to free mission-type data; empty in the base class. |
| `AbstractMission.tryGenerateMission()` | 1032 | ✍ Static hook that subclasses implement to try creating a new mission of their type; empty here and returns nothing. |
| `AbstractMission.canRun()` | 1037 | ✍ Static hook that subclasses implement to tell whether this mission type can run on the current map; empty here and returns nothing (nil). |

## Messages

- subscribes `MessageType.FARM_DELETED` (l.65)
- subscribes `MessageType.SAVEGAME_LOADED` (l.66)
- subscribes `MessageType.VEHICLE_RESET` (l.99)
- subscribes `MessageType.VEHICLE_RESET` (l.448)
- publishes `MessageType.MISSION_DELETED` (l.119)
- publishes `MessageType.MISSION_GENERATED` (l.294)
