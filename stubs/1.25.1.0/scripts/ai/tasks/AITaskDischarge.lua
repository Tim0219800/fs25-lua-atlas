---@meta
-- FS25 1.25.1.0 : ai/tasks/AITaskDischarge.lua (generated stub, FS25 Lua Atlas)

---@class AITaskDischarge : AITask
AITaskDischarge = {}

---@param isServer any
---@param job any
---@param customMt any
function AITaskDischarge.new(isServer, job, customMt) end

function AITaskDischarge:reset() end

---@param vehicle any
function AITaskDischarge:setVehicle(vehicle) end

---@param unloadTrigger any
function AITaskDischarge:setUnloadTrigger(unloadTrigger) end

---@param vehicle any
---@param dischargeNode any
---@param offsetZ any
function AITaskDischarge:setDischargeNode(vehicle, dischargeNode, offsetZ) end

function AITaskDischarge:start() end

function AITaskDischarge:onTargetReached() end

---@param errorMessage any
function AITaskDischarge:onError(errorMessage) end

function AITaskDischarge:finishedDischarge() end
