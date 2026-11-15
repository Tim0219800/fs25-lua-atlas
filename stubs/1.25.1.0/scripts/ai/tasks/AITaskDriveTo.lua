---@meta
-- FS25 1.25.1.0 : ai/tasks/AITaskDriveTo.lua (stub généré, atlas Lua FS25)

---@class AITaskDriveTo : AITask
AITaskDriveTo = {}

---@param isServer any
---@param job any
---@param customMt any
function AITaskDriveTo.new(isServer, job, customMt) end

function AITaskDriveTo:reset() end

---@param vehicle any
function AITaskDriveTo:setVehicle(vehicle) end

---@param offset any
function AITaskDriveTo:setTargetOffset(offset) end

---@param x any
---@param z any
function AITaskDriveTo:setTargetPosition(x, z) end

---@param dirX any
---@param dirZ any
function AITaskDriveTo:setTargetDirection(dirX, dirZ) end

---@param dt any
function AITaskDriveTo:update(dt) end

function AITaskDriveTo:start() end

---@param wasJobStopped any
function AITaskDriveTo:stop(wasJobStopped) end

function AITaskDriveTo:startDriving() end

function AITaskDriveTo:onTargetReached() end

---@param errorMessage any
function AITaskDriveTo:onError(errorMessage) end
