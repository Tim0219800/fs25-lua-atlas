---@meta
-- FS25 1.25.1.0 : ai/tasks/AITaskFieldWork.lua (generated stub, FS25 Lua Atlas)

--- AI task that runs the vehicle's field worker for the duration of the task. It calls startFieldWorker when started and stopFieldWorker when stopped, and expects the vehicle to provide both. The actual work (steering, tool control) is implemented in the vehicle, not here.
---@class AITaskFieldWork : AITask
AITaskFieldWork = {}

--- Creates the task with no vehicle assigned.
---@param isServer any
---@param job any
---@param customMt any
function AITaskFieldWork.new(isServer, job, customMt) end

--- Clears the vehicle reference, then runs the parent reset.
function AITaskFieldWork:reset() end

--- Empty per-frame override; nothing happens here.
---@param dt any
function AITaskFieldWork:update(dt) end

--- Sets the vehicle whose field worker is started and stopped.
---@param vehicle any
function AITaskFieldWork:setVehicle(vehicle) end

--- Calls startFieldWorker on the vehicle, or logs a developer error if no vehicle is set, then runs the parent start.
function AITaskFieldWork:start() end

--- Runs the parent stop, then calls stopFieldWorker on the vehicle, or logs a developer error if no vehicle is set.
---@param wasJobStopped any
function AITaskFieldWork:stop(wasJobStopped) end
