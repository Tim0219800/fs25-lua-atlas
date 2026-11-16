# ai/AISystem.lua

*[Version française](../../fr/scripts/ai/AISystem.md)*

Source: `dataS/scripts/ai/AISystem.lua` — FS25 1.25.1.0

✍ Central AI system of a mission: it owns the vehicle navigation map (cost map, road splines, blocking regions, physics obstacles) on the server and keeps the list of active AI jobs, their vehicles and path agents. It starts, stops and updates jobs, broadcasts job events, loads map settings from the XML named in map.aiSystem#filename and registers cheat/debug console commands (gs-prefixed). Engine calls such as createVehicleNavigationMap are not in the dump (UNVERIFIED); getRoadSplines, COSTMAP_MAX_VALUE and NEXT_JOB_ID are used here but defined elsewhere.

- **AISystem** (l.25)

## Functions

| Function | Line | Description |
|---|---|---|
| `AISystem.onCreateAIRoadSpline(_: integer, node: integer)` | 32 | ✍ I3D onCreate callback: reads the maxWidth, maxTurningRadius and maxHeight user attributes of a node and registers it as an AI road spline in the current mission's AI system. |
| `AISystem.new(isServer: boolean, mission: table, customMt: table?) → AISystem` | 47 | ✍ Constructor. Initialises empty agent, job and delayed-spline lists, the cost map filename (vehicleNavigationCostmap.dat), and creates the XML schema of the AI settings file. |
| `AISystem:registerXMLPaths(schema: any)` | 73 | ✍ Registers the schema paths of the map AI settings file: maximum slope angle, blocked-area info layer name and channel, vehicle maximum height, spline height and left-hand traffic flag. |
| `AISystem:delete()` | 84 | ✍ Cleanup. On the server, finishes pending removals and stops all active jobs with an unknown-error message. Deletes the navigation map and the planning bit map, removes the debug marker, unsubscribes from messages and removes the console commands. |
| `AISystem:loadMapData(xmlFile: integer, missionInfo: table?, baseDirectory: string?)` | 141 | ✍ Registers the console commands when cheat commands are on, sets defaults (1 m cells, 15 degree slope, navigationCollision layer, vehicle height 4 m), then overrides them from the map's AI settings XML if one is given. Initialises debug state and the road spline list. |
| `AISystem:addRoadSpline(spline: integer, maxWidth: number?, maxTurningRadius: number?, maxHeight: number?)` | 219 | ✍ Adds a spline and its sub-splines to the AI road network. On the server before the navigation map exists, the request is queued. Splines with isAISpline false are skipped; widths, heights and turning radius fall back to defaults; spline visibility follows the debug toggle. |
| `AISystem:removeRoadSpline(spline: integer)` | 261 | ✍ Server only. Removes a spline from the navigation map, hides it and drops it from the list; if the map does not exist yet, removes it from the delayed queue instead. |
| `AISystem:addBlockingRegion(x: number, y: number, z: number, rx: number, ry: number, rz: number, sizeX: number, sizeY: number, sizeZ: number, stopDistance: number, callbackFuncName: string, callbackTarget: table?) → integer?` | 295 | ✍ Server only. Adds a box-shaped blocking region to the navigation map (position, rotation, size, stop distance, callback name and target) and returns its id. Returns nil on clients or, with a warning, if the map is not initialised. |
| `AISystem:removeBlockingRegion(blockingRegionId: integer)` | 315 | ✍ Server only. Removes a blocking region by id; does nothing if the map or id is missing. |
| `AISystem:setBlockingRegionState(blockingRegionId: integer, isBlocking: boolean)` | 331 | ✍ Server only. Enables or disables a blocking region by id. Logs a warning if the navigation map is not initialised. |
| `AISystem:onTerrainLoad(terrainNode: any)` | 348 | ✍ Server only. Creates the vehicle navigation map from the terrain, adds the traffic and delayed splines and tries to load the cost map from the savegame. If none is loaded, subscribes to the mission start to scan the map. Publishes AI_SYSTEM_LOADED after 2 frames and returns true. |
| `AISystem:onMissionStarted(isNewSavegame: any)` | 385 | ✍ Mission start handler used when no saved cost map was found: logs it and asks the engine to scan the whole map area to build the navigation costs. |
| `AISystem:loadFromXMLFile(xmlFilename: any)` | 393 | ✍ Loads the saved debug AI target (position and direction) from an XML file if all six values exist. Does nothing if the file cannot be loaded. |
| `AISystem:save(xmlFilename: any, usedModNames: any)` | 421 | ✍ Writes the debug AI target to a new aiSystem XML file, but only saves the file if a target exists. The usedModNames argument is not used. |
| `AISystem:getNavigationMapFilename()` | 447 | ✍ Returns the cost map filename (vehicleNavigationCostmap.dat). |
| `AISystem:getNavigationMap() → integer` | 454 | ✍ Returns the engine navigation map handle, or nil on clients or before terrain load. |
| `AISystem:update(dt: any)` | 460 | ✍ Per-frame update. Finalises queued job removals (publishing AI_JOB_REMOVED), then updates every active job and, on the server while the mission runs, updates its cost. |
| `AISystem:onClientJoined(connection: any)` | 482 | ✍ Sends an AIJobStartEvent for each active job to a newly joined client connection. |
| `AISystem:setAreaDirty(minX: number, maxX: number, minZ: number, maxZ: number)` | 494 | ✍ Marks a rectangle (minX, maxX, minZ, maxZ in world metres) of the navigation cost map for re-evaluation, e.g. after static objects change. Does nothing without a map. |
| `AISystem:addAgent(agentId: any, vehicle: any)` | 505 | ✍ Registers a vehicle for a path agent id. |
| `AISystem:removeAgent(agentId: any)` | 511 | ✍ Removes the vehicle registered for an agent id. |
| `AISystem:getVehicleByAgent(agentId: any)` | 517 | ✍ Returns the vehicle registered for an agent id, or nil. |
| `AISystem:removeJob(job: any)` | 523 | ✍ Queues a job for removal; it is actually removed at the start of the next update. |
| `AISystem:addJob(job: any)` | 529 | ✍ Appends a job to the active job list. It does not start the job; use startJob for that. |
| `AISystem:getNumActiveJobs()` | 535 | ✍ Returns the number of active jobs. |
| `AISystem:getActiveJobs()` | 541 | ✍ Returns the active job list itself (not a copy). |
| `AISystem:startJob(job: any, startFarmId: any)` | 547 | ✍ Server only (asserts). Gives the job the next job id, broadcasts an AIJobStartEvent to clients and starts the job locally via startJobInternal. |
| `AISystem:startJobInternal(job: any, startFarmId: any)` | 561 | ✍ Starts the job for the farm, adds it to the active list and publishes AI_JOB_STARTED. Called directly on clients when they receive the start event. |
| `AISystem:stopJob(job: any, aiMessage: any)` | 570 | ✍ Stops a job with an AI message. On the server it stops locally and broadcasts an AIJobStopEvent; on a client it sends the stop event to the server. |
| `AISystem:stopJobInternal(job: any, aiMessage: any)` | 583 | ✍ Stops the job locally, queues it for removal and publishes AI_JOB_STOPPED with the message. |
| `AISystem:skipCurrentTask(job: any)` | 592 | ✍ Client side: sends an AIJobSkipTaskEvent for the job to the server. It uses the client's server connection, so it should not be called on a dedicated server. |
| `AISystem:skipCurrentTaskInternal(job: any)` | 602 | ✍ Asks the job to skip its current task locally. |
| `AISystem:stopJobById(jobId: any, aiMessage: any, noEventSend: any)` | 608 | ✍ Stops the job with the given id if it exists and returns true, otherwise false. Note: the noEventSend argument is passed on but stopJob does not use it. |
| `AISystem:getJobById(jobId: any)` | 620 | ✍ Returns the active job with the given id, or nil. |
| `AISystem:addJobVehicle(vehicle: any)` | 632 | ✍ Adds a vehicle to the list of vehicles used by active jobs (no duplicates). |
| `AISystem:removeJobVehicle(vehicle: any)` | 638 | ✍ Removes a vehicle from the list of vehicles used by active jobs. |
| `AISystem:getAILimitedReached()` | 644 | ✍ True if the number of job vehicles has reached the mission's maxNumHirables limit. |
| `AISystem:drawDebug()` | 674 | ✍ Debug drawing: renders the navigation cost, as coloured text, for the cells within 15 cells of the camera or the current vehicle. Blocking cells are red; others blend green to red by cost. Skipped when cost display is off or a GUI is open (except the construction screen). |
| `AISystem:addObstacle(node: integer, centerOffsetX: number?, centerOffsetY: number?, centerOffsetZ: number?, sizeX: number?, sizeY: number?, sizeZ: number?, brakeAcceleration: number?, isPassable: boolean?)` | 741 | ✍ Server only. Registers a node as a physics obstacle in the navigation map with a centre offset, size and brake acceleration (missing values default to 0), and optionally marks it not passable (passable by default). |
| `AISystem:removeObstacle(node: integer)` | 763 | ✍ Server only. Removes a node's physics obstacle from the navigation map. |
| `AISystem:setObstacleIsPassable(node: integer, isPassable: boolean)` | 773 | ✍ Server only. Sets whether a registered obstacle node can be driven through. |
| `AISystem:consoleCommandShowPlanningDebug()` | 836 | ✍ Console command (gsAIPlanningDebug): toggles the planning debug flag and logs its new state. |
| `AISystem:consoleCommandAIShowCosts()` | 843 | ✍ Console command (gsAICostsShow), server only: toggles drawing of per-cell navigation costs through the debug manager. |
| `AISystem:consoleCommandAISetTarget(offsetX: any, offsetZ: any)` | 861 | ✍ Console command (gsAISetTarget), server only: sets the debug AI target at the player or vehicle position and direction, shifted by optional forward and sideways offsets, and places a debug flag marker. |
| `AISystem:consoleCommandAISetLastTarget()` | 913 | ✍ Console command (gsAISetLastTarget), server only: moves the existing debug marker back to the stored last target, if there is one. |
| `AISystem:consoleCommandAIStart()` | 937 | ✍ Console command (gsAIStart), server only: creates a GOTO job for the vehicle the local player is in, aimed at the debug target, validates it for the player's farm and starts it. Returns a status or error text. |
| `AISystem:consoleCommandAIEnableDebug()` | 991 | ✍ Console command (gsAIEnableDebug): toggles the AI debugging flag and returns its new value. Works on clients too. |
| `AISystem:consoleCommandAIToggleSplineVisibility()` | 998 | ✍ Console command (gsAISplinesShow), server only: toggles debug display of AI road splines (and the traffic root node) with colours. Note: it iterates getRoadSplines() with pairs and takes the key as the spline, which looks inconsistent with the roadSplines list, whose splines are values (getRoadSplines is not in the dump). |
| `AISystem:consoleCommandAIToggleAINodeDebug()` | 1037 | ✍ Console command (gsAIStationsShow): toggles gizmos at the AI nodes of unloading and loading stations, with a warning that reloaded placeables are not refreshed automatically. |
| `AISystem:consoleCommandAIShowObstacles()` | 1080 | ✍ Console command (gsAIObstaclesShow), server only: toggles the engine's debug rendering of the navigation map obstacles. |
| `AISystem:consoleCommandAISetAreaDirty(width: any)` | 1093 | ✍ Console command (gsAICostsUpdate), server only: marks a square of the given width (default 30, clamped to 2 up to the terrain size) around the camera for cost map recomputation. |
| `AISystem:consoleCommandAICostmapExport(imageFormatStr: any)` | 1107 | ✍ Console command (gsAICostsExport), server only: writes the cost map, with splines, as an image named navigationMap in the savegame folder; format from BitmapUtil.FORMAT (default PIXELMAP). Returns an error if the savegame folder does not exist. |
| `AISystem:consoleCommandAICheckSplineInterference(stepLength: any, heightOffset: any, defaultSplineWidth: any, defaultSplineHeight: any)` | 1207 | ✍ Console command (gsAISplinesCheckInterference), server only: walks every AI spline and tests overlap boxes along it against non-terrain, non-vehicle, non-road objects, logging each hit and drawing debug boxes. Parameters: step length, height offset, default width and height. |
| `AISystem.getAgentStateName(index: any)` | 1324 | ✍ Returns the name of the AgentState entry matching an index, or the text UNKNOWN. AgentState itself is defined outside the dump. |

## Messages

- publishes `MessageType.AI_JOB_REMOVED` (l.94)
- publishes `MessageType.AI_SYSTEM_LOADED` (l.377)
- publishes `MessageType.AI_JOB_REMOVED` (l.468)
- publishes `MessageType.AI_JOB_STARTED` (l.565)
- publishes `MessageType.AI_JOB_STOPPED` (l.587)
