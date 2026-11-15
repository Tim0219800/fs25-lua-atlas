---@meta
-- FS25 1.25.1.0 : ai/tasks/AITaskWaitForFilling.lua (stub généré, atlas Lua FS25)

---@class AITaskWaitForFilling : AITask
AITaskWaitForFilling = {}

---@param isServer any
---@param job any
---@param customMt any
function AITaskWaitForFilling.new(isServer, job, customMt) end

function AITaskWaitForFilling:reset() end

---@param fillType any
function AITaskWaitForFilling:addAllowedFillType(fillType) end

---@param dt any
function AITaskWaitForFilling:update(dt) end

function AITaskWaitForFilling:start() end

---@param wasJobStopped any
function AITaskWaitForFilling:stop(wasJobStopped) end

---@param vehicle any
function AITaskWaitForFilling:setVehicle(vehicle) end

---@param vehicle any
---@param fillUnitIndex any
function AITaskWaitForFilling:addFillUnits(vehicle, fillUnitIndex) end
