---@meta
-- FS25 1.25.1.0 : ai/AISystem.lua (generated stub, FS25 Lua Atlas)

---@class AISystem
AISystem = {}

---@param _ integer
---@param node integer
function AISystem.onCreateAIRoadSpline(_, node) end

---@param isServer boolean
---@param mission table
---@param customMt table?
---@return AISystem
function AISystem.new(isServer, mission, customMt) end

---@param schema any
function AISystem:registerXMLPaths(schema) end

function AISystem:delete() end

---@param xmlFile integer
---@param missionInfo table?
---@param baseDirectory string?
function AISystem:loadMapData(xmlFile, missionInfo, baseDirectory) end

---@param spline integer
---@param maxWidth number?
---@param maxTurningRadius number?
---@param maxHeight number?
function AISystem:addRoadSpline(spline, maxWidth, maxTurningRadius, maxHeight) end

---@param spline integer
function AISystem:removeRoadSpline(spline) end

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

---@param blockingRegionId integer
function AISystem:removeBlockingRegion(blockingRegionId) end

---@param blockingRegionId integer
---@param isBlocking boolean
function AISystem:setBlockingRegionState(blockingRegionId, isBlocking) end

---@param terrainNode any
function AISystem:onTerrainLoad(terrainNode) end

---@param isNewSavegame any
function AISystem:onMissionStarted(isNewSavegame) end

---@param xmlFilename any
function AISystem:loadFromXMLFile(xmlFilename) end

---@param xmlFilename any
---@param usedModNames any
function AISystem:save(xmlFilename, usedModNames) end

function AISystem:getNavigationMapFilename() end

---@return integer
function AISystem:getNavigationMap() end

---@param dt any
function AISystem:update(dt) end

---@param connection any
function AISystem:onClientJoined(connection) end

---@param minX number
---@param maxX number
---@param minZ number
---@param maxZ number
function AISystem:setAreaDirty(minX, maxX, minZ, maxZ) end

---@param agentId any
---@param vehicle any
function AISystem:addAgent(agentId, vehicle) end

---@param agentId any
function AISystem:removeAgent(agentId) end

---@param agentId any
function AISystem:getVehicleByAgent(agentId) end

---@param job any
function AISystem:removeJob(job) end

---@param job any
function AISystem:addJob(job) end

function AISystem:getNumActiveJobs() end

function AISystem:getActiveJobs() end

---@param job any
---@param startFarmId any
function AISystem:startJob(job, startFarmId) end

---@param job any
---@param startFarmId any
function AISystem:startJobInternal(job, startFarmId) end

---@param job any
---@param aiMessage any
function AISystem:stopJob(job, aiMessage) end

---@param job any
---@param aiMessage any
function AISystem:stopJobInternal(job, aiMessage) end

---@param job any
function AISystem:skipCurrentTask(job) end

---@param job any
function AISystem:skipCurrentTaskInternal(job) end

---@param jobId any
---@param aiMessage any
---@param noEventSend any
function AISystem:stopJobById(jobId, aiMessage, noEventSend) end

---@param jobId any
function AISystem:getJobById(jobId) end

---@param vehicle any
function AISystem:addJobVehicle(vehicle) end

---@param vehicle any
function AISystem:removeJobVehicle(vehicle) end

function AISystem:getAILimitedReached() end

function AISystem:drawDebug() end

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

---@param node integer
function AISystem:removeObstacle(node) end

---@param node integer
---@param isPassable boolean
function AISystem:setObstacleIsPassable(node, isPassable) end

function AISystem:consoleCommandShowPlanningDebug() end

function AISystem:consoleCommandAIShowCosts() end

---@param offsetX any
---@param offsetZ any
function AISystem:consoleCommandAISetTarget(offsetX, offsetZ) end

function AISystem:consoleCommandAISetLastTarget() end

function AISystem:consoleCommandAIStart() end

function AISystem:consoleCommandAIEnableDebug() end

function AISystem:consoleCommandAIToggleSplineVisibility() end

function AISystem:consoleCommandAIToggleAINodeDebug() end

function AISystem:consoleCommandAIShowObstacles() end

---@param width any
function AISystem:consoleCommandAISetAreaDirty(width) end

---@param imageFormatStr any
function AISystem:consoleCommandAICostmapExport(imageFormatStr) end

---@param stepLength any
---@param heightOffset any
---@param defaultSplineWidth any
---@param defaultSplineHeight any
function AISystem:consoleCommandAICheckSplineInterference(stepLength, heightOffset, defaultSplineWidth, defaultSplineHeight) end

---@param index any
function AISystem.getAgentStateName(index) end
