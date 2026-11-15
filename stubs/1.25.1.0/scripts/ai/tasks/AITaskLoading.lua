---@meta
-- FS25 1.25.1.0 : ai/tasks/AITaskLoading.lua (stub généré, atlas Lua FS25)

---@class AITaskLoading : AITask
AITaskLoading = {}

---@param isServer any
---@param job any
---@param customMt any
function AITaskLoading.new(isServer, job, customMt) end

function AITaskLoading:reset() end

---@param vehicle any
function AITaskLoading:setVehicle(vehicle) end

---@param loadTrigger any
function AITaskLoading:setLoadTrigger(loadTrigger) end

---@param fillType any
function AITaskLoading:setFillType(fillType) end

---@param vehicle any
---@param fillUnitIndex any
---@param offsetZ any
function AITaskLoading:setFillUnit(vehicle, fillUnitIndex, offsetZ) end

function AITaskLoading:start() end

function AITaskLoading:finishedLoading() end

function AITaskLoading:onTargetReached() end

---@param errorMessage any
function AITaskLoading:onError(errorMessage) end
