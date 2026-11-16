---@meta
-- FS25 1.25.1.0 : ai/tasks/AITaskWaitForFilling.lua (generated stub, FS25 Lua Atlas)

--- AI task that waits on the server until a set of fill units is full, then waits a short extra delay (3 seconds) before finishing. If a unit holds a non-allowed fill type, the job is stopped with a no-valid-fill-type error. It prepares and releases loading on each unit via aiPrepareLoading and aiFinishLoading.
---@class AITaskWaitForFilling : AITask
AITaskWaitForFilling = {}

--- Creates the task with empty allowed fill types and fill unit list, a wait duration of 3000 ms and the not-fully-loaded state.
---@param isServer any
---@param job any
---@param customMt any
function AITaskWaitForFilling.new(isServer, job, customMt) end

--- Clears the vehicle, allowed fill types, fill units and wait state, then runs the parent reset.
function AITaskWaitForFilling:reset() end

--- Adds a fill type to the set of types considered valid in the watched units.
---@param fillType any
function AITaskWaitForFilling:addAllowedFillType(fillType) end

--- Server only. A unit is valid if empty or holding an allowed type; if none is valid, the job stops with an error. Once every unit has no free capacity, it waits waitDuration (g_time based) and then finishes.
---@param dt any
function AITaskWaitForFilling:update(dt) end

--- Runs the parent start; on the server resets the fully-loaded flag and calls aiPrepareLoading on every registered fill unit.
function AITaskWaitForFilling:start() end

--- Runs the parent stop; on the server calls aiFinishLoading on every registered fill unit.
---@param wasJobStopped any
function AITaskWaitForFilling:stop(wasJobStopped) end

--- Stores the vehicle reference. It is not used by the update logic, which relies on the registered fill units.
---@param vehicle any
function AITaskWaitForFilling:setVehicle(vehicle) end

--- Registers a vehicle and fill unit index to be watched. Despite the plural name it adds a single unit per call.
---@param vehicle any
---@param fillUnitIndex any
function AITaskWaitForFilling:addFillUnits(vehicle, fillUnitIndex) end
