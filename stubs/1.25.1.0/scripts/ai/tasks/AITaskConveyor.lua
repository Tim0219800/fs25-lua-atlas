---@meta
-- FS25 1.25.1.0 : ai/tasks/AITaskConveyor.lua (generated stub, FS25 Lua Atlas)

--- AI task that switches a vehicle's field worker on while the task runs and off when it stops. It is used for conveyor-style work and is the same start and stop pattern as AITaskFieldWork. It extends AITask and relies on the vehicle providing startFieldWorker and stopFieldWorker.
---@class AITaskConveyor : AITask
AITaskConveyor = {}

--- Creates the task with no vehicle assigned.
---@param isServer any
---@param job any
---@param customMt any
function AITaskConveyor.new(isServer, job, customMt) end

--- Clears the vehicle reference, then runs the parent reset.
function AITaskConveyor:reset() end

--- Sets the vehicle on which the field worker is started and stopped.
---@param vehicle any
function AITaskConveyor:setVehicle(vehicle) end

--- Calls startFieldWorker on the vehicle, or logs a developer error if no vehicle is set, then runs the parent start.
function AITaskConveyor:start() end

--- Runs the parent stop, then calls stopFieldWorker on the vehicle, or logs a developer error if no vehicle is set.
---@param wasJobStopped any
function AITaskConveyor:stop(wasJobStopped) end
