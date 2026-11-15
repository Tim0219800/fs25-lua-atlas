---@meta
-- FS25 1.25.1.0 : ai/jobs/AIJobFieldWork.lua (generated stub, FS25 Lua Atlas)

---@class AIJobFieldWork : AIJob
AIJobFieldWork = {}

---@param isServer any
---@param customMt any
function AIJobFieldWork.new(isServer, customMt) end

---@param streamId any
---@param connection any
function AIJobFieldWork:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AIJobFieldWork:writeStream(streamId, connection) end

function AIJobFieldWork:getStartTaskIndex() end

---@param farmId any
function AIJobFieldWork:start(farmId) end

---@param aiMessage any
function AIJobFieldWork:stop(aiMessage) end

---@param vehicle any
---@param mission any
---@param farmId any
---@param isDirectStart any
function AIJobFieldWork:applyCurrentState(vehicle, mission, farmId, isDirectStart) end

---@param vehicle any
function AIJobFieldWork:getIsAvailableForVehicle(vehicle) end

function AIJobFieldWork:getTarget() end

function AIJobFieldWork:getTitle() end

function AIJobFieldWork:setValues() end

---@param farmId any
function AIJobFieldWork:validate(farmId) end

function AIJobFieldWork:getDescription() end

---@param connection any
function AIJobFieldWork:getIsStartable(connection) end

---@param state any
function AIJobFieldWork.getIsStartErrorText(state) end

function AIJobFieldWork:getPricePerMs() end
