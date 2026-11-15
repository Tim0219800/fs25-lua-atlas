# ai/AISystem.lua

Source: `dataS/scripts/ai/AISystem.lua` — FS25 1.25.1.0

- **AISystem** (l.25)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `AISystem.onCreateAIRoadSpline(_: integer, node: integer)` | 32 |  |
| `AISystem.new(isServer: boolean, mission: table, customMt: table?) → AISystem` | 47 |  |
| `AISystem:registerXMLPaths(schema: any)` | 73 |  |
| `AISystem:delete()` | 84 |  |
| `AISystem:loadMapData(xmlFile: integer, missionInfo: table?, baseDirectory: string?)` | 141 |  |
| `AISystem:addRoadSpline(spline: integer, maxWidth: number?, maxTurningRadius: number?, maxHeight: number?)` | 219 |  |
| `AISystem:removeRoadSpline(spline: integer)` | 261 |  |
| `AISystem:addBlockingRegion(x: number, y: number, z: number, rx: number, ry: number, rz: number, sizeX: number, sizeY: number, sizeZ: number, stopDistance: number, callbackFuncName: string, callbackTarget: table?) → integer?` | 295 |  |
| `AISystem:removeBlockingRegion(blockingRegionId: integer)` | 315 |  |
| `AISystem:setBlockingRegionState(blockingRegionId: integer, isBlocking: boolean)` | 331 |  |
| `AISystem:onTerrainLoad(terrainNode: any)` | 348 |  |
| `AISystem:onMissionStarted(isNewSavegame: any)` | 385 |  |
| `AISystem:loadFromXMLFile(xmlFilename: any)` | 393 |  |
| `AISystem:save(xmlFilename: any, usedModNames: any)` | 421 |  |
| `AISystem:getNavigationMapFilename()` | 447 |  |
| `AISystem:getNavigationMap() → integer` | 454 |  |
| `AISystem:update(dt: any)` | 460 |  |
| `AISystem:onClientJoined(connection: any)` | 482 |  |
| `AISystem:setAreaDirty(minX: number, maxX: number, minZ: number, maxZ: number)` | 494 |  |
| `AISystem:addAgent(agentId: any, vehicle: any)` | 505 |  |
| `AISystem:removeAgent(agentId: any)` | 511 |  |
| `AISystem:getVehicleByAgent(agentId: any)` | 517 |  |
| `AISystem:removeJob(job: any)` | 523 |  |
| `AISystem:addJob(job: any)` | 529 |  |
| `AISystem:getNumActiveJobs()` | 535 |  |
| `AISystem:getActiveJobs()` | 541 |  |
| `AISystem:startJob(job: any, startFarmId: any)` | 547 |  |
| `AISystem:startJobInternal(job: any, startFarmId: any)` | 561 |  |
| `AISystem:stopJob(job: any, aiMessage: any)` | 570 |  |
| `AISystem:stopJobInternal(job: any, aiMessage: any)` | 583 |  |
| `AISystem:skipCurrentTask(job: any)` | 592 |  |
| `AISystem:skipCurrentTaskInternal(job: any)` | 602 |  |
| `AISystem:stopJobById(jobId: any, aiMessage: any, noEventSend: any)` | 608 |  |
| `AISystem:getJobById(jobId: any)` | 620 |  |
| `AISystem:addJobVehicle(vehicle: any)` | 632 |  |
| `AISystem:removeJobVehicle(vehicle: any)` | 638 |  |
| `AISystem:getAILimitedReached()` | 644 |  |
| `AISystem:drawDebug()` | 674 |  |
| `AISystem:addObstacle(node: integer, centerOffsetX: number?, centerOffsetY: number?, centerOffsetZ: number?, sizeX: number?, sizeY: number?, sizeZ: number?, brakeAcceleration: number?, isPassable: boolean?)` | 741 |  |
| `AISystem:removeObstacle(node: integer)` | 763 |  |
| `AISystem:setObstacleIsPassable(node: integer, isPassable: boolean)` | 773 |  |
| `AISystem:consoleCommandShowPlanningDebug()` | 836 |  |
| `AISystem:consoleCommandAIShowCosts()` | 843 |  |
| `AISystem:consoleCommandAISetTarget(offsetX: any, offsetZ: any)` | 861 |  |
| `AISystem:consoleCommandAISetLastTarget()` | 913 |  |
| `AISystem:consoleCommandAIStart()` | 937 |  |
| `AISystem:consoleCommandAIEnableDebug()` | 991 |  |
| `AISystem:consoleCommandAIToggleSplineVisibility()` | 998 |  |
| `AISystem:consoleCommandAIToggleAINodeDebug()` | 1037 |  |
| `AISystem:consoleCommandAIShowObstacles()` | 1080 |  |
| `AISystem:consoleCommandAISetAreaDirty(width: any)` | 1093 |  |
| `AISystem:consoleCommandAICostmapExport(imageFormatStr: any)` | 1107 |  |
| `AISystem:consoleCommandAICheckSplineInterference(stepLength: any, heightOffset: any, defaultSplineWidth: any, defaultSplineHeight: any)` | 1207 |  |
| `AISystem.getAgentStateName(index: any)` | 1324 |  |

## Messages

- publishes `MessageType.AI_JOB_REMOVED` (l.94)
- publishes `MessageType.AI_SYSTEM_LOADED` (l.377)
- publishes `MessageType.AI_JOB_REMOVED` (l.468)
- publishes `MessageType.AI_JOB_STARTED` (l.565)
- publishes `MessageType.AI_JOB_STOPPED` (l.587)
