---@meta
-- FS25 1.25.1.0 : ai/jobs/AIJob.lua (generated stub, FS25 Lua Atlas)

---@class AIJob
AIJob = {}

---@param isServer any
---@param customMt any
function AIJob.new(isServer, customMt) end

function AIJob:delete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function AIJob:saveToXMLFile(xmlFile, key, usedModNames) end

---@param xmlFile any
---@param key any
function AIJob:loadFromXMLFile(xmlFile, key) end

---@param streamId any
---@param connection any
function AIJob:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AIJob:writeStream(streamId, connection) end

---@param dt any
function AIJob:update(dt) end

---@param dt any
function AIJob:updateCost(dt) end

function AIJob:canContinueWork() end

function AIJob:canStartWork() end

function AIJob:getPricePerMs() end

function AIJob:getNextTaskIndex() end

---@param farmId any
function AIJob:validate(farmId) end

function AIJob:getIsLooping() end

function AIJob:setValues() end

---@param task any
function AIJob:startTask(task) end

---@param task any
---@param wasJobStopped any
function AIJob:stopTask(task, wasJobStopped) end

---@param farmId any
function AIJob:start(farmId) end

function AIJob:getCanSkipTask() end

function AIJob:skipCurrentTask() end

---@param aiMessage any
function AIJob:stop(aiMessage) end

---@param task any
function AIJob:addTask(task) end

function AIJob:resetTasks() end

---@param taskIndex any
function AIJob:getTaskByIndex(taskIndex) end

function AIJob:getTitle() end

function AIJob:getDescription() end

function AIJob:getHelperName() end

---@param aiMessage any
function AIJob:showNotification(aiMessage) end

function AIJob:getStartTaskIndex() end

---@param name any
---@param parameter any
function AIJob:addNamedParameter(name, parameter) end

---@param isValid any
function AIJob:setParameterValid(isValid) end

function AIJob:getNamedParameters() end

---@param name any
function AIJob:getNamedParameter(name) end

function AIJob:getGroupedParameters() end

---@param vehicle any
---@param mission any
---@param farmId any
---@param isDirectStart any
function AIJob:applyCurrentState(vehicle, mission, farmId, isDirectStart) end

---@param vehicle any
function AIJob:getIsAvailableForVehicle(vehicle) end

---@param id any
function AIJob:setId(id) end

---@param parameter any
function AIJob:onParameterValueChanged(parameter) end

---@param connection any
function AIJob:getIsStartable(connection) end
