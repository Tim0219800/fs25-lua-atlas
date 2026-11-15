---@meta
-- FS25 1.25.1.0 : ai/jobs/AIJobConveyor.lua (generated stub, FS25 Lua Atlas)

---@class AIJobConveyor : AIJob
AIJobConveyor = {}

---@param isServer any
---@param customMt any
function AIJobConveyor.new(isServer, customMt) end

function AIJobConveyor:getPricePerMs() end

---@param farmId any
function AIJobConveyor:start(farmId) end

---@param aiMessage any
function AIJobConveyor:stop(aiMessage) end

---@param vehicle any
---@param mission any
---@param farmId any
---@param isDirectStart any
function AIJobConveyor:applyCurrentState(vehicle, mission, farmId, isDirectStart) end

---@param vehicle any
function AIJobConveyor:getIsAvailableForVehicle(vehicle) end

function AIJobConveyor:getTitle() end

function AIJobConveyor:setValues() end

---@param farmId any
function AIJobConveyor:validate(farmId) end

---@param connection any
function AIJobConveyor:getIsStartable(connection) end

---@param state any
function AIJobConveyor.getIsStartErrorText(state) end
