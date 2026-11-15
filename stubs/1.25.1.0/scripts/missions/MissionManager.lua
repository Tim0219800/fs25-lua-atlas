---@meta
-- FS25 1.25.1.0 : missions/MissionManager.lua (generated stub, FS25 Lua Atlas)

---@class MissionManager : AbstractManager
MissionManager = {}

---@param customMt any
---@return table
function MissionManager.new(customMt) end

function MissionManager:initDataStructures() end

function MissionManager:delete() end

---@param xmlFile any
---@return boolean
function MissionManager:loadMapData(xmlFile) end

function MissionManager:unloadMapData() end

---@param xmlFilename string
---@return boolean
function MissionManager:saveToXMLFile(xmlFilename) end

---@param xmlFilename string
function MissionManager:loadFromXMLFile(xmlFilename) end

function MissionManager:getCanStartNewMissionGeneration() end

---@param dt string
function MissionManager:update(dt) end

---@param dt any
function MissionManager:updateMissions(dt) end

function MissionManager:startMissionGeneration() end

function MissionManager:finishMissionGeneration() end

function MissionManager:generateMission() end

---@param mission any
---@param missionType any
function MissionManager:registerMission(mission, missionType) end

---@param mission any
function MissionManager:addMission(mission) end

---@param mission any
function MissionManager:removeMission(mission) end

---@param mission any
function MissionManager:markMissionForDeletion(mission) end

---@param uniqueId any
function MissionManager:getMissionByUniqueId(uniqueId) end

---@param mission any
---@param farmId any
---@param spawnVehicles any
function MissionManager:startMission(mission, farmId, spawnVehicles) end

---@param mission any
function MissionManager:cancelMission(mission) end

---@param mission any
function MissionManager:dismissMission(mission) end

function MissionManager:getMissions() end

---@param farmId any
function MissionManager:getMissionsByFarmId(farmId) end

---@param farmland any
function MissionManager:getIsMissionRunningOnFarmland(farmland) end

---@param typeIndex any
function MissionManager:getMissionsByType(typeIndex) end

---@param farmId any
function MissionManager:hasFarmReachedMissionLimit(farmId) end

function MissionManager:createMissionMap() end

function MissionManager:destroyMissionMap() end

---@param area any
---@param missionId any
function MissionManager:setMissionMapActiveMissionId(area, missionId) end

---@param worldX any
---@param worldZ any
function MissionManager:getMissionMapActiveMissionIdAtWorldPosition(worldX, worldZ) end

---@param worldX any
---@param worldZ any
---@return mission
function MissionManager:getMissionAtWorldPosition(worldX, worldZ) end

---@param activeMissionId any
function MissionManager:getMissionByActiveMissionId(activeMissionId) end

function MissionManager:getFreeActiveMissionId() end

---@param farmId any
---@param x any
---@param z any
---@param workAreaType any
---@param vehicle any
function MissionManager:getIsMissionWorkAllowed(farmId, x, z, workAreaType, vehicle) end

---@param classObject any
---@param name any
---@param defaultMaxNumInstances any
function MissionManager:registerMissionType(classObject, name, defaultMaxNumInstances) end

---@param name any
function MissionManager:unregisterMissionType(name) end

---@param name any
function MissionManager:getMissionType(name) end

---@param id any
function MissionManager:getMissionTypeById(id) end

---@param name any
function MissionManager:getMissionTypeDataByName(name) end

---@param shape any
function MissionManager:getMissionBySplitShape(shape) end

---@param shape any
---@param x any
---@param z any
---@param farmId any
function MissionManager:getIsShapeCutAllowed(shape, x, z, farmId) end

---@param farmId any
---@param nodeId any
function MissionManager:getIsMissionDestructible(farmId, nodeId) end

---@param filename any
---@param baseDirectory any
function MissionManager:addPendingMissionVehiclesFile(filename, baseDirectory) end

---@param xmlFilename any
---@param baseDirectory any
function MissionManager:loadVehicleGroups(xmlFilename, baseDirectory) end

---@param missionType string
---@param size string
---@param variant string
---@return array
---@return integer
function MissionManager:getRandomVehicleGroup(missionType, size, variant) end

---@param missionType string
---@param fieldSize string
---@param identifier integer
---@return array?
---@return number
---@return string?
function MissionManager:getVehicleGroupFromIdentifier(missionType, fieldSize, identifier) end

---@param mission any
function MissionManager:assignGenerationTime(mission) end
