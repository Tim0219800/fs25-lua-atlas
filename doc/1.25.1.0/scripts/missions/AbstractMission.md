# missions/AbstractMission.lua

Source : `dataS/scripts/missions/AbstractMission.lua` — FS25 1.25.1.0

- **AbstractMission** hérite de `Object` (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AbstractMission.new(isServer: any, isClient: any, title: any, description: any, customMt: any)` | 44 |  |
| `AbstractMission:init()` | 76 |  |
| `AbstractMission:onSavegameLoaded()` | 89 |  |
| `AbstractMission:reactivate()` | 97 |  |
| `AbstractMission:getMapHotspots()` | 105 |  |
| `AbstractMission:delete()` | 111 |  |
| `AbstractMission:saveToXMLFile(xmlFile: any, key: any)` | 130 |  |
| `AbstractMission:loadFromXMLFile(xmlFile: any, key: any)` | 165 |  |
| `AbstractMission:writeStream(streamId: any, connection: any)` | 230 |  |
| `AbstractMission:readStream(streamId: any, connection: any)` | 261 |  |
| `AbstractMission:writeUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 299 |  |
| `AbstractMission:readUpdateStream(streamId: any, timestamp: any, connection: any)` | 306 |  |
| `AbstractMission:update(dt: any)` | 329 |  |
| `AbstractMission:updateTick(dt: any)` | 408 |  |
| `AbstractMission:start(spawnVehicles: any)` | 430 |  |
| `AbstractMission:prepare(spawnVehicles: any)` | 443 |  |
| `AbstractMission:getIsPrepared()` | 454 |  |
| `AbstractMission:finishedPreparing()` | 464 |  |
| `AbstractMission:started()` | 470 |  |
| `AbstractMission:finish(finishState: any)` | 475 |  |
| `AbstractMission:dismiss()` | 500 |  |
| `AbstractMission:calculateStealingCost()` | 528 |  |
| `AbstractMission:getUniqueId() → string` | 535 |  |
| `AbstractMission:setUniqueId(uniqueId: string)` | 542 |  |
| `AbstractMission:spawnVehicles()` | 550 |  |
| `AbstractMission:spawnVehicle(info: any)` | 560 |  |
| `AbstractMission:onSpawnedVehicle(vehicles: any, vehicleLoadState: any, loadingInfo: any)` | 582 |  |
| `AbstractMission:getStealingCosts()` | 630 |  |
| `AbstractMission:getVehicleCosts()` | 636 |  |
| `AbstractMission:getReward()` | 651 |  |
| `AbstractMission:getReimbursement()` | 657 |  |
| `AbstractMission:calculateReimbursement()` | 663 |  |
| `AbstractMission:getActualVehicleCosts()` | 668 |  |
| `AbstractMission:getActualReward()` | 678 |  |
| `AbstractMission:getActualStealingCosts()` | 688 |  |
| `AbstractMission:getTotalReward()` | 694 |  |
| `AbstractMission:validate(event: any)` | 705 |  |
| `AbstractMission:isTimedOut()` | 712 |  |
| `AbstractMission:getMinutesLeft()` | 723 |  |
| `AbstractMission:setDefaultEndDate()` | 755 |  |
| `AbstractMission:setEndDateByOffset(dayTimeOffset: any)` | 770 |  |
| `AbstractMission:setEndDate(endDay: any, endDayTime: any)` | 781 |  |
| `AbstractMission:getIsInProgress()` | 790 |  |
| `AbstractMission:getIsRunning()` | 796 |  |
| `AbstractMission:getWasRunning()` | 802 |  |
| `AbstractMission:getIsReadyToStart()` | 808 |  |
| `AbstractMission:getWasStarted()` | 814 |  |
| `AbstractMission:getIsFinished()` | 820 |  |
| `AbstractMission:getInfo()` | 826 |  |
| `AbstractMission:getLocation()` | 832 |  |
| `AbstractMission:getDescription()` | 838 |  |
| `AbstractMission:getDetails()` | 844 |  |
| `AbstractMission:getFinishedDetails()` | 856 |  |
| `AbstractMission:getTitle()` | 868 |  |
| `AbstractMission:getNPC()` | 874 |  |
| `AbstractMission:getExtraProgressText()` | 880 |  |
| `AbstractMission:getCompletion()` | 886 |  |
| `AbstractMission:farmDestroyed(farmId: any)` | 892 |  |
| `AbstractMission:getMissionTypeName()` | 900 |  |
| `AbstractMission:onVehicleReset(oldVehicle: any, newVehicle: any)` | 906 |  |
| `AbstractMission:getVehicleSize()` | 917 |  |
| `AbstractMission:getVehicleGroupFromIdentifier(identifier: any)` | 923 |  |
| `AbstractMission:getVehicleGroup() → array, integer` | 931 |  |
| `AbstractMission:getVehicleVariant()` | 938 |  |
| `AbstractMission:getVariant()` | 944 |  |
| `AbstractMission:removeAccess()` | 950 |  |
| `AbstractMission:hasLeasableVehicles()` | 965 |  |
| `AbstractMission:isSpawnSpaceAvailable()` | 971 |  |
| `AbstractMission:getIsWorkAllowed(farmId: any, x: any, z: any, workAreaType: any, vehicle: any)` | 1010 |  |
| `AbstractMission:getWorldPosition()` | 1016 |  |
| `AbstractMission.loadMapData(xmlFile: any, baseDirectory: any)` | 1022 |  |
| `AbstractMission.unloadMapData()` | 1027 |  |
| `AbstractMission.tryGenerateMission()` | 1032 |  |
| `AbstractMission.canRun()` | 1037 |  |

## Messages

- écoute `MessageType.FARM_DELETED` (l.65)
- écoute `MessageType.SAVEGAME_LOADED` (l.66)
- écoute `MessageType.VEHICLE_RESET` (l.99)
- écoute `MessageType.VEHICLE_RESET` (l.448)
- publie `MessageType.MISSION_DELETED` (l.119)
- publie `MessageType.MISSION_GENERATED` (l.294)
