---@meta
-- FS25 1.25.1.0 : ai/jobs/AIJobDeliver.lua (generated stub, FS25 Lua Atlas)

---@class AIJobDeliver : AIJob
AIJobDeliver = {}

---@param isServer any
---@param customMt any
function AIJobDeliver.new(isServer, customMt) end

function AIJobDeliver:setValues() end

---@param farmId any
function AIJobDeliver:validate(farmId) end

---@param vehicle any
---@param mission any
---@param farmId any
---@param isDirectStart any
function AIJobDeliver:applyCurrentState(vehicle, mission, farmId, isDirectStart) end

---@param farmId any
function AIJobDeliver:start(farmId) end

---@param aiMessage any
function AIJobDeliver:stop(aiMessage) end

---@param task any
function AIJobDeliver:startTask(task) end

function AIJobDeliver:getStartTaskIndex() end

---@param isSkipTask any
function AIJobDeliver:getNextTaskIndex(isSkipTask) end

function AIJobDeliver:canContinueWork() end

function AIJobDeliver:getHasLoadedValidFillType() end

function AIJobDeliver:getCanSkipTask() end

function AIJobDeliver:skipCurrentTask() end

---@param vehicle any
function AIJobDeliver:getIsAvailableForVehicle(vehicle) end

function AIJobDeliver:getTitle() end

function AIJobDeliver:getIsLooping() end

---@param connection any
function AIJobDeliver:getIsStartable(connection) end

function AIJobDeliver:getDescription() end

---@param state any
function AIJobDeliver.getIsStartErrorText(state) end
