---@meta
-- FS25 1.25.1.0 : missions/AbstractMission.lua (generated stub, FS25 Lua Atlas)

---@class AbstractMission : Object
AbstractMission = {}

---@param isServer any
---@param isClient any
---@param title any
---@param description any
---@param customMt any
function AbstractMission.new(isServer, isClient, title, description, customMt) end

function AbstractMission:init() end

function AbstractMission:onSavegameLoaded() end

function AbstractMission:reactivate() end

function AbstractMission:getMapHotspots() end

function AbstractMission:delete() end

---@param xmlFile any
---@param key any
function AbstractMission:saveToXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
function AbstractMission:loadFromXMLFile(xmlFile, key) end

---@param streamId any
---@param connection any
function AbstractMission:writeStream(streamId, connection) end

---@param streamId any
---@param connection any
function AbstractMission:readStream(streamId, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function AbstractMission:writeUpdateStream(streamId, connection, dirtyMask) end

---@param streamId any
---@param timestamp any
---@param connection any
function AbstractMission:readUpdateStream(streamId, timestamp, connection) end

---@param dt any
function AbstractMission:update(dt) end

---@param dt any
function AbstractMission:updateTick(dt) end

---@param spawnVehicles any
function AbstractMission:start(spawnVehicles) end

---@param spawnVehicles any
function AbstractMission:prepare(spawnVehicles) end

function AbstractMission:getIsPrepared() end

function AbstractMission:finishedPreparing() end

function AbstractMission:started() end

---@param finishState any
function AbstractMission:finish(finishState) end

function AbstractMission:dismiss() end

function AbstractMission:calculateStealingCost() end

---@return string
function AbstractMission:getUniqueId() end

---@param uniqueId string
function AbstractMission:setUniqueId(uniqueId) end

function AbstractMission:spawnVehicles() end

---@param info any
function AbstractMission:spawnVehicle(info) end

---@param vehicles any
---@param vehicleLoadState any
---@param loadingInfo any
function AbstractMission:onSpawnedVehicle(vehicles, vehicleLoadState, loadingInfo) end

function AbstractMission:getStealingCosts() end

function AbstractMission:getVehicleCosts() end

function AbstractMission:getReward() end

function AbstractMission:getReimbursement() end

function AbstractMission:calculateReimbursement() end

function AbstractMission:getActualVehicleCosts() end

function AbstractMission:getActualReward() end

function AbstractMission:getActualStealingCosts() end

function AbstractMission:getTotalReward() end

---@param event any
function AbstractMission:validate(event) end

function AbstractMission:isTimedOut() end

function AbstractMission:getMinutesLeft() end

function AbstractMission:setDefaultEndDate() end

---@param dayTimeOffset any
function AbstractMission:setEndDateByOffset(dayTimeOffset) end

---@param endDay any
---@param endDayTime any
function AbstractMission:setEndDate(endDay, endDayTime) end

function AbstractMission:getIsInProgress() end

function AbstractMission:getIsRunning() end

function AbstractMission:getWasRunning() end

function AbstractMission:getIsReadyToStart() end

function AbstractMission:getWasStarted() end

function AbstractMission:getIsFinished() end

function AbstractMission:getInfo() end

function AbstractMission:getLocation() end

function AbstractMission:getDescription() end

function AbstractMission:getDetails() end

function AbstractMission:getFinishedDetails() end

function AbstractMission:getTitle() end

function AbstractMission:getNPC() end

function AbstractMission:getExtraProgressText() end

function AbstractMission:getCompletion() end

---@param farmId any
function AbstractMission:farmDestroyed(farmId) end

function AbstractMission:getMissionTypeName() end

---@param oldVehicle any
---@param newVehicle any
function AbstractMission:onVehicleReset(oldVehicle, newVehicle) end

function AbstractMission:getVehicleSize() end

---@param identifier any
function AbstractMission:getVehicleGroupFromIdentifier(identifier) end

---@return array
---@return integer
function AbstractMission:getVehicleGroup() end

function AbstractMission:getVehicleVariant() end

function AbstractMission:getVariant() end

function AbstractMission:removeAccess() end

function AbstractMission:hasLeasableVehicles() end

function AbstractMission:isSpawnSpaceAvailable() end

---@param farmId any
---@param x any
---@param z any
---@param workAreaType any
---@param vehicle any
function AbstractMission:getIsWorkAllowed(farmId, x, z, workAreaType, vehicle) end

function AbstractMission:getWorldPosition() end

---@param xmlFile any
---@param baseDirectory any
function AbstractMission.loadMapData(xmlFile, baseDirectory) end

function AbstractMission.unloadMapData() end

function AbstractMission.tryGenerateMission() end

function AbstractMission.canRun() end
