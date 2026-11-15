---@meta
-- FS25 1.25.1.0 : ai/jobs/AIJobLoadAndDeliver.lua (stub généré, atlas Lua FS25)

---@class AIJobLoadAndDeliver : AIJob
AIJobLoadAndDeliver = {}

---@param isServer any
---@param customMt any
function AIJobLoadAndDeliver.new(isServer, customMt) end

function AIJobLoadAndDeliver:setValues() end

---@param farmId any
function AIJobLoadAndDeliver:validate(farmId) end

---@param vehicle any
---@param mission any
---@param farmId any
---@param isDirectStart any
function AIJobLoadAndDeliver:applyCurrentState(vehicle, mission, farmId, isDirectStart) end

---@param loadingStation any
function AIJobLoadAndDeliver:updateFillTypes(loadingStation) end

---@param parameter any
function AIJobLoadAndDeliver:onParameterValueChanged(parameter) end

---@param farmId any
function AIJobLoadAndDeliver:start(farmId) end

---@param aiMessage any
function AIJobLoadAndDeliver:stop(aiMessage) end

---@param task any
function AIJobLoadAndDeliver:startTask(task) end

function AIJobLoadAndDeliver:getStartTaskIndex() end

function AIJobLoadAndDeliver:canContinueWork() end

---@param isSkipTask any
function AIJobLoadAndDeliver:getNextTaskIndex(isSkipTask) end

---@param vehicle any
function AIJobLoadAndDeliver:getIsAvailableForVehicle(vehicle) end

function AIJobLoadAndDeliver:getTitle() end

function AIJobLoadAndDeliver:getDescription() end

function AIJobLoadAndDeliver:getIsLooping() end

---@param connection any
function AIJobLoadAndDeliver:getIsStartable(connection) end

---@param state any
function AIJobLoadAndDeliver.getIsStartErrorText(state) end
