---@meta
-- FS25 1.25.1.0 : missions/field/AbstractFieldMission.lua (generated stub, FS25 Lua Atlas)

---@class AbstractFieldMission : AbstractMission
AbstractFieldMission = {}

---@param isServer any
---@param isClient any
---@param title any
---@param description any
---@param customMt any
function AbstractFieldMission.new(isServer, isClient, title, description, customMt) end

---@param field any
function AbstractFieldMission:init(field) end

---@param field any
function AbstractFieldMission:setField(field) end

function AbstractFieldMission:createMapHotspot() end

function AbstractFieldMission:getField() end

function AbstractFieldMission:getMapHotspots() end

function AbstractFieldMission:getWorldPosition() end

function AbstractFieldMission:getLocation() end

function AbstractFieldMission:reactivate() end

function AbstractFieldMission:delete() end

---@param xmlFile any
---@param key any
function AbstractFieldMission:saveToXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
function AbstractFieldMission:loadFromXMLFile(xmlFile, key) end

---@param streamId any
---@param connection any
function AbstractFieldMission:writeStream(streamId, connection) end

---@param streamId any
---@param connection any
function AbstractFieldMission:readStream(streamId, connection) end

---@param dt any
function AbstractFieldMission:update(dt) end

---@param spawnVehicles any
function AbstractFieldMission:start(spawnVehicles) end

---@param spawnVehicles any
function AbstractFieldMission:prepare(spawnVehicles) end

function AbstractFieldMission:prepareField() end

function AbstractFieldMission:getFieldPreparingTask() end

function AbstractFieldMission:getIsPrepared() end

function AbstractFieldMission:finishField() end

function AbstractFieldMission:getFieldFinishTask() end

function AbstractFieldMission:started() end

---@param finishState any
function AbstractFieldMission:finish(finishState) end

function AbstractFieldMission:dismiss() end

function AbstractFieldMission:removeAccess() end

function AbstractFieldMission:validate() end

function AbstractFieldMission:createModifier() end

function AbstractFieldMission:initializeModifier() end

---@param partitionIndex any
function AbstractFieldMission:setPartitionRegion(partitionIndex) end

---@param partitionIndex any
function AbstractFieldMission:getPartitionCompletion(partitionIndex) end

function AbstractFieldMission:getCompletion() end

function AbstractFieldMission:getFieldCompletion() end

function AbstractFieldMission:getVehicleSize() end

function AbstractFieldMission:getDetails() end

function AbstractFieldMission:getRewardPerHa() end

function AbstractFieldMission:getReward() end

function AbstractFieldMission:getFarmlandId() end

function AbstractFieldMission:addToMissionMap() end

function AbstractFieldMission:removeFromMissionMap() end

---@param missionId any
function AbstractFieldMission:updateMissionMap(missionId) end

function AbstractFieldMission:getNPC() end

---@param farmId any
---@param x any
---@param z any
---@param workAreaType any
---@param vehicle any
function AbstractFieldMission:getIsWorkAllowed(farmId, x, z, workAreaType, vehicle) end

function AbstractFieldMission:addHotspots() end

function AbstractFieldMission:removeHotspot() end
