# missions/field/AbstractFieldMission.lua

Source : `dataS/scripts/missions/field/AbstractFieldMission.lua` — FS25 1.25.1.0

- **AbstractFieldMission** hérite de `AbstractMission` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AbstractFieldMission.new(isServer: any, isClient: any, title: any, description: any, customMt: any)` | 31 |  |
| `AbstractFieldMission:init(field: any)` | 50 |  |
| `AbstractFieldMission:setField(field: any)` | 57 |  |
| `AbstractFieldMission:createMapHotspot()` | 73 |  |
| `AbstractFieldMission:getField()` | 86 |  |
| `AbstractFieldMission:getMapHotspots()` | 92 |  |
| `AbstractFieldMission:getWorldPosition()` | 98 |  |
| `AbstractFieldMission:getLocation()` | 104 |  |
| `AbstractFieldMission:reactivate()` | 111 |  |
| `AbstractFieldMission:delete()` | 119 |  |
| `AbstractFieldMission:saveToXMLFile(xmlFile: any, key: any)` | 141 |  |
| `AbstractFieldMission:loadFromXMLFile(xmlFile: any, key: any)` | 154 |  |
| `AbstractFieldMission:writeStream(streamId: any, connection: any)` | 194 |  |
| `AbstractFieldMission:readStream(streamId: any, connection: any)` | 202 |  |
| `AbstractFieldMission:update(dt: any)` | 217 |  |
| `AbstractFieldMission:start(spawnVehicles: any)` | 227 |  |
| `AbstractFieldMission:prepare(spawnVehicles: any)` | 239 |  |
| `AbstractFieldMission:prepareField()` | 248 |  |
| `AbstractFieldMission:getFieldPreparingTask()` | 260 |  |
| `AbstractFieldMission:getIsPrepared()` | 275 |  |
| `AbstractFieldMission:finishField()` | 289 |  |
| `AbstractFieldMission:getFieldFinishTask()` | 301 |  |
| `AbstractFieldMission:started()` | 312 |  |
| `AbstractFieldMission:finish(finishState: any)` | 318 |  |
| `AbstractFieldMission:dismiss()` | 337 |  |
| `AbstractFieldMission:removeAccess()` | 344 |  |
| `AbstractFieldMission:validate()` | 351 |  |
| `AbstractFieldMission:createModifier()` | 365 |  |
| `AbstractFieldMission:initializeModifier()` | 370 |  |
| `AbstractFieldMission:setPartitionRegion(partitionIndex: any)` | 425 |  |
| `AbstractFieldMission:getPartitionCompletion(partitionIndex: any)` | 438 |  |
| `AbstractFieldMission:getCompletion()` | 452 |  |
| `AbstractFieldMission:getFieldCompletion()` | 460 |  |
| `AbstractFieldMission:getVehicleSize()` | 519 |  |
| `AbstractFieldMission:getDetails()` | 533 |  |
| `AbstractFieldMission:getRewardPerHa()` | 544 |  |
| `AbstractFieldMission:getReward()` | 550 |  |
| `AbstractFieldMission:getFarmlandId()` | 565 |  |
| `AbstractFieldMission:addToMissionMap()` | 577 |  |
| `AbstractFieldMission:removeFromMissionMap()` | 586 |  |
| `AbstractFieldMission:updateMissionMap(missionId: any)` | 595 |  |
| `AbstractFieldMission:getNPC()` | 602 |  |
| `AbstractFieldMission:getIsWorkAllowed(farmId: any, x: any, z: any, workAreaType: any, vehicle: any)` | 608 |  |
| `AbstractFieldMission:addHotspots()` | 614 |  |
| `AbstractFieldMission:removeHotspot()` | 623 |  |
