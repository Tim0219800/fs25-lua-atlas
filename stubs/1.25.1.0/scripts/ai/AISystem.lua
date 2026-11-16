---@meta
-- FS25 1.25.1.0 : ai/AISystem.lua (generated stub, FS25 Lua Atlas)

--- Central AI system of a mission: it owns the vehicle navigation map (cost map, road splines, blocking regions, physics obstacles) on the server and keeps the list of active AI jobs, their vehicles and path agents. It starts, stops and updates jobs, broadcasts job events, loads map settings from the XML named in map.aiSystem#filename and registers cheat/debug console commands (gs-prefixed). Engine calls such as createVehicleNavigationMap are not in the dump (UNVERIFIED); getRoadSplines, COSTMAP_MAX_VALUE and NEXT_JOB_ID are used here but defined elsewhere.
---@class AISystem
AISystem = {}

--- I3D onCreate callback: reads the maxWidth, maxTurningRadius and maxHeight user attributes of a node and registers it as an AI road spline in the current mission's AI system.
---@param _ integer
---@param node integer
function AISystem.onCreateAIRoadSpline(_, node) end

--- Constructor. Initialises empty agent, job and delayed-spline lists, the cost map filename (vehicleNavigationCostmap.dat), and creates the XML schema of the AI settings file.
---@param isServer boolean
---@param mission table
---@param customMt table?
---@return AISystem
function AISystem.new(isServer, mission, customMt) end

--- Registers the schema paths of the map AI settings file: maximum slope angle, blocked-area info layer name and channel, vehicle maximum height, spline height and left-hand traffic flag.
---@param schema any
function AISystem:registerXMLPaths(schema) end

--- Cleanup. On the server, finishes pending removals and stops all active jobs with an unknown-error message. Deletes the navigation map and the planning bit map, removes the debug marker, unsubscribes from messages and removes the console commands.
function AISystem:delete() end

--- Registers the console commands when cheat commands are on, sets defaults (1 m cells, 15 degree slope, navigationCollision layer, vehicle height 4 m), then overrides them from the map's AI settings XML if one is given. Initialises debug state and the road spline list.
---@param xmlFile integer
---@param missionInfo table?
---@param baseDirectory string?
function AISystem:loadMapData(xmlFile, missionInfo, baseDirectory) end

--- Adds a spline and its sub-splines to the AI road network. On the server before the navigation map exists, the request is queued. Splines with isAISpline false are skipped; widths, heights and turning radius fall back to defaults; spline visibility follows the debug toggle.
---@param spline integer
---@param maxWidth number?
---@param maxTurningRadius number?
---@param maxHeight number?
function AISystem:addRoadSpline(spline, maxWidth, maxTurningRadius, maxHeight) end

--- Server only. Removes a spline from the navigation map, hides it and drops it from the list; if the map does not exist yet, removes it from the delayed queue instead.
---@param spline integer
function AISystem:removeRoadSpline(spline) end

--- Server only. Adds a box-shaped blocking region to the navigation map (position, rotation, size, stop distance, callback name and target) and returns its id. Returns nil on clients or, with a warning, if the map is not initialised.
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
---@param sizeX number
---@param sizeY number
---@param sizeZ number
---@param stopDistance number
---@param callbackFuncName string
---@param callbackTarget table?
---@return integer?
function AISystem:addBlockingRegion(x, y, z, rx, ry, rz, sizeX, sizeY, sizeZ, stopDistance, callbackFuncName, callbackTarget) end

--- Server only. Removes a blocking region by id; does nothing if the map or id is missing.
---@param blockingRegionId integer
function AISystem:removeBlockingRegion(blockingRegionId) end

--- Server only. Enables or disables a blocking region by id. Logs a warning if the navigation map is not initialised.
---@param blockingRegionId integer
---@param isBlocking boolean
function AISystem:setBlockingRegionState(blockingRegionId, isBlocking) end

--- Server only. Creates the vehicle navigation map from the terrain, adds the traffic and delayed splines and tries to load the cost map from the savegame. If none is loaded, subscribes to the mission start to scan the map. Publishes AI_SYSTEM_LOADED after 2 frames and returns true.
---@param terrainNode any
function AISystem:onTerrainLoad(terrainNode) end

--- Mission start handler used when no saved cost map was found: logs it and asks the engine to scan the whole map area to build the navigation costs.
---@param isNewSavegame any
function AISystem:onMissionStarted(isNewSavegame) end

--- Loads the saved debug AI target (position and direction) from an XML file if all six values exist. Does nothing if the file cannot be loaded.
---@param xmlFilename any
function AISystem:loadFromXMLFile(xmlFilename) end

--- Writes the debug AI target to a new aiSystem XML file, but only saves the file if a target exists. The usedModNames argument is not used.
---@param xmlFilename any
---@param usedModNames any
function AISystem:save(xmlFilename, usedModNames) end

--- Returns the cost map filename (vehicleNavigationCostmap.dat).
function AISystem:getNavigationMapFilename() end

--- Returns the engine navigation map handle, or nil on clients or before terrain load.
---@return integer
function AISystem:getNavigationMap() end

--- Per-frame update. Finalises queued job removals (publishing AI_JOB_REMOVED), then updates every active job and, on the server while the mission runs, updates its cost.
---@param dt any
function AISystem:update(dt) end

--- Sends an AIJobStartEvent for each active job to a newly joined client connection.
---@param connection any
function AISystem:onClientJoined(connection) end

--- Marks a rectangle (minX, maxX, minZ, maxZ in world metres) of the navigation cost map for re-evaluation, e.g. after static objects change. Does nothing without a map.
---@param minX number
---@param maxX number
---@param minZ number
---@param maxZ number
function AISystem:setAreaDirty(minX, maxX, minZ, maxZ) end

--- Registers a vehicle for a path agent id.
---@param agentId any
---@param vehicle any
function AISystem:addAgent(agentId, vehicle) end

--- Removes the vehicle registered for an agent id.
---@param agentId any
function AISystem:removeAgent(agentId) end

--- Returns the vehicle registered for an agent id, or nil.
---@param agentId any
function AISystem:getVehicleByAgent(agentId) end

--- Queues a job for removal; it is actually removed at the start of the next update.
---@param job any
function AISystem:removeJob(job) end

--- Appends a job to the active job list. It does not start the job; use startJob for that.
---@param job any
function AISystem:addJob(job) end

--- Returns the number of active jobs.
function AISystem:getNumActiveJobs() end

--- Returns the active job list itself (not a copy).
function AISystem:getActiveJobs() end

--- Server only (asserts). Gives the job the next job id, broadcasts an AIJobStartEvent to clients and starts the job locally via startJobInternal.
---@param job any
---@param startFarmId any
function AISystem:startJob(job, startFarmId) end

--- Starts the job for the farm, adds it to the active list and publishes AI_JOB_STARTED. Called directly on clients when they receive the start event.
---@param job any
---@param startFarmId any
function AISystem:startJobInternal(job, startFarmId) end

--- Stops a job with an AI message. On the server it stops locally and broadcasts an AIJobStopEvent; on a client it sends the stop event to the server.
---@param job any
---@param aiMessage any
function AISystem:stopJob(job, aiMessage) end

--- Stops the job locally, queues it for removal and publishes AI_JOB_STOPPED with the message.
---@param job any
---@param aiMessage any
function AISystem:stopJobInternal(job, aiMessage) end

--- Client side: sends an AIJobSkipTaskEvent for the job to the server. It uses the client's server connection, so it should not be called on a dedicated server.
---@param job any
function AISystem:skipCurrentTask(job) end

--- Asks the job to skip its current task locally.
---@param job any
function AISystem:skipCurrentTaskInternal(job) end

--- Stops the job with the given id if it exists and returns true, otherwise false. Note: the noEventSend argument is passed on but stopJob does not use it.
---@param jobId any
---@param aiMessage any
---@param noEventSend any
function AISystem:stopJobById(jobId, aiMessage, noEventSend) end

--- Returns the active job with the given id, or nil.
---@param jobId any
function AISystem:getJobById(jobId) end

--- Adds a vehicle to the list of vehicles used by active jobs (no duplicates).
---@param vehicle any
function AISystem:addJobVehicle(vehicle) end

--- Removes a vehicle from the list of vehicles used by active jobs.
---@param vehicle any
function AISystem:removeJobVehicle(vehicle) end

--- True if the number of job vehicles has reached the mission's maxNumHirables limit.
function AISystem:getAILimitedReached() end

--- Debug drawing: renders the navigation cost, as coloured text, for the cells within 15 cells of the camera or the current vehicle. Blocking cells are red; others blend green to red by cost. Skipped when cost display is off or a GUI is open (except the construction screen).
function AISystem:drawDebug() end

--- Server only. Registers a node as a physics obstacle in the navigation map with a centre offset, size and brake acceleration (missing values default to 0), and optionally marks it not passable (passable by default).
---@param node integer
---@param centerOffsetX number?
---@param centerOffsetY number?
---@param centerOffsetZ number?
---@param sizeX number?
---@param sizeY number?
---@param sizeZ number?
---@param brakeAcceleration number?
---@param isPassable boolean?
function AISystem:addObstacle(node, centerOffsetX, centerOffsetY, centerOffsetZ, sizeX, sizeY, sizeZ, brakeAcceleration, isPassable) end

--- Server only. Removes a node's physics obstacle from the navigation map.
---@param node integer
function AISystem:removeObstacle(node) end

--- Server only. Sets whether a registered obstacle node can be driven through.
---@param node integer
---@param isPassable boolean
function AISystem:setObstacleIsPassable(node, isPassable) end

--- Console command (gsAIPlanningDebug): toggles the planning debug flag and logs its new state.
function AISystem:consoleCommandShowPlanningDebug() end

--- Console command (gsAICostsShow), server only: toggles drawing of per-cell navigation costs through the debug manager.
function AISystem:consoleCommandAIShowCosts() end

--- Console command (gsAISetTarget), server only: sets the debug AI target at the player or vehicle position and direction, shifted by optional forward and sideways offsets, and places a debug flag marker.
---@param offsetX any
---@param offsetZ any
function AISystem:consoleCommandAISetTarget(offsetX, offsetZ) end

--- Console command (gsAISetLastTarget), server only: moves the existing debug marker back to the stored last target, if there is one.
function AISystem:consoleCommandAISetLastTarget() end

--- Console command (gsAIStart), server only: creates a GOTO job for the vehicle the local player is in, aimed at the debug target, validates it for the player's farm and starts it. Returns a status or error text.
function AISystem:consoleCommandAIStart() end

--- Console command (gsAIEnableDebug): toggles the AI debugging flag and returns its new value. Works on clients too.
function AISystem:consoleCommandAIEnableDebug() end

--- Console command (gsAISplinesShow), server only: toggles debug display of AI road splines (and the traffic root node) with colours. Note: it iterates getRoadSplines() with pairs and takes the key as the spline, which looks inconsistent with the roadSplines list, whose splines are values (getRoadSplines is not in the dump).
function AISystem:consoleCommandAIToggleSplineVisibility() end

--- Console command (gsAIStationsShow): toggles gizmos at the AI nodes of unloading and loading stations, with a warning that reloaded placeables are not refreshed automatically.
function AISystem:consoleCommandAIToggleAINodeDebug() end

--- Console command (gsAIObstaclesShow), server only: toggles the engine's debug rendering of the navigation map obstacles.
function AISystem:consoleCommandAIShowObstacles() end

--- Console command (gsAICostsUpdate), server only: marks a square of the given width (default 30, clamped to 2 up to the terrain size) around the camera for cost map recomputation.
---@param width any
function AISystem:consoleCommandAISetAreaDirty(width) end

--- Console command (gsAICostsExport), server only: writes the cost map, with splines, as an image named navigationMap in the savegame folder; format from BitmapUtil.FORMAT (default PIXELMAP). Returns an error if the savegame folder does not exist.
---@param imageFormatStr any
function AISystem:consoleCommandAICostmapExport(imageFormatStr) end

--- Console command (gsAISplinesCheckInterference), server only: walks every AI spline and tests overlap boxes along it against non-terrain, non-vehicle, non-road objects, logging each hit and drawing debug boxes. Parameters: step length, height offset, default width and height.
---@param stepLength any
---@param heightOffset any
---@param defaultSplineWidth any
---@param defaultSplineHeight any
function AISystem:consoleCommandAICheckSplineInterference(stepLength, heightOffset, defaultSplineWidth, defaultSplineHeight) end

--- Returns the name of the AgentState entry matching an index, or the text UNKNOWN. AgentState itself is defined outside the dump.
---@param index any
function AISystem.getAgentStateName(index) end
