# missions/MissionManager.lua

Source : `dataS/scripts/missions/MissionManager.lua` — FS25 1.25.1.0

- **MissionManager** hérite de `AbstractManager` (l.21)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MissionManager.new(customMt: any) → table` | 77 |  |
| `MissionManager:initDataStructures()` | 89 |  |
| `MissionManager:delete()` | 111 |  |
| `MissionManager:loadMapData(xmlFile: any) → boolean` | 120 |  |
| `MissionManager:unloadMapData()` | 174 |  |
| `MissionManager:saveToXMLFile(xmlFilename: string) → boolean` | 200 |  |
| `MissionManager:loadFromXMLFile(xmlFilename: string)` | 231 |  |
| `MissionManager:getCanStartNewMissionGeneration()` | 297 |  |
| `MissionManager:update(dt: string)` | 304 |  |
| `MissionManager:updateMissions(dt: any)` | 325 |  |
| `MissionManager:startMissionGeneration()` | 342 |  |
| `MissionManager:finishMissionGeneration()` | 351 |  |
| `MissionManager:generateMission()` | 359 |  |
| `MissionManager:registerMission(mission: any, missionType: any)` | 394 |  |
| `MissionManager:addMission(mission: any)` | 403 |  |
| `MissionManager:removeMission(mission: any)` | 421 |  |
| `MissionManager:markMissionForDeletion(mission: any)` | 432 |  |
| `MissionManager:getMissionByUniqueId(uniqueId: any)` | 438 |  |
| `MissionManager:startMission(mission: any, farmId: any, spawnVehicles: any)` | 444 |  |
| `MissionManager:cancelMission(mission: any)` | 492 |  |
| `MissionManager:dismissMission(mission: any)` | 507 |  |
| `MissionManager:getMissions()` | 519 |  |
| `MissionManager:getMissionsByFarmId(farmId: any)` | 525 |  |
| `MissionManager:getIsMissionRunningOnFarmland(farmland: any)` | 534 |  |
| `MissionManager:getMissionsByType(typeIndex: any)` | 567 |  |
| `MissionManager:hasFarmReachedMissionLimit(farmId: any)` | 580 |  |
| `MissionManager:createMissionMap()` | 594 |  |
| `MissionManager:destroyMissionMap()` | 622 |  |
| `MissionManager:setMissionMapActiveMissionId(area: any, missionId: any)` | 637 |  |
| `MissionManager:getMissionMapActiveMissionIdAtWorldPosition(worldX: any, worldZ: any)` | 645 |  |
| `MissionManager:getMissionAtWorldPosition(worldX: any, worldZ: any) → mission` | 656 |  |
| `MissionManager:getMissionByActiveMissionId(activeMissionId: any)` | 668 |  |
| `MissionManager:getFreeActiveMissionId()` | 680 |  |
| `MissionManager:getIsMissionWorkAllowed(farmId: any, x: any, z: any, workAreaType: any, vehicle: any)` | 692 |  |
| `MissionManager:registerMissionType(classObject: any, name: any, defaultMaxNumInstances: any)` | 706 |  |
| `MissionManager:unregisterMissionType(name: any)` | 725 |  |
| `MissionManager:getMissionType(name: any)` | 738 |  |
| `MissionManager:getMissionTypeById(id: any)` | 744 |  |
| `MissionManager:getMissionTypeDataByName(name: any)` | 750 |  |
| `MissionManager:getMissionBySplitShape(shape: any)` | 770 |  |
| `MissionManager:getIsShapeCutAllowed(shape: any, x: any, z: any, farmId: any)` | 788 |  |
| `MissionManager:getIsMissionDestructible(farmId: any, nodeId: any)` | 803 |  |
| `MissionManager:addPendingMissionVehiclesFile(filename: any, baseDirectory: any)` | 817 |  |
| `MissionManager:loadVehicleGroups(xmlFilename: any, baseDirectory: any)` | 823 |  |
| `MissionManager:getRandomVehicleGroup(missionType: string, size: string, variant: string) → array, integer` | 935 |  |
| `MissionManager:getVehicleGroupFromIdentifier(missionType: string, fieldSize: string, identifier: integer) → array?, number, string?` | 966 |  |
| `MissionManager:assignGenerationTime(mission: any)` | 987 |  |

## Messages

- publie `MessageType.MISSION_GENERATION_START` (l.343)
- publie `MessageType.MISSION_GENERATION_END` (l.352)
- publie `MessageType.MISSION_GENERATED` (l.398)
