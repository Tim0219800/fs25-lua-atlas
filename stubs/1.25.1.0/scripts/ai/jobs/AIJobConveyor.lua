---@meta
-- FS25 1.25.1.0 : ai/jobs/AIJobConveyor.lua (generated stub, FS25 Lua Atlas)

--- Job that runs a conveyor belt vehicle (`spec_aiConveyorBelt`) with a single `AITaskConveyor` task and one vehicle parameter. The vehicle itself notifies clients of start and stop; the cost per ms is much lower than for driving jobs.
---@class AIJobConveyor : AIJob
AIJobConveyor = {}

--- Creates the job with one `AITaskConveyor`, a vehicle parameter named "vehicle" and its parameter group.
---@param isServer any
---@param customMt any
function AIJobConveyor.new(isServer, customMt) end

--- Returns 0.00005 per millisecond.
function AIJobConveyor:getPricePerMs() end

--- Calls the base start and, on the server, calls `vehicle:aiJobStarted` for the job's vehicle, which notifies clients. No agent is created.
---@param farmId any
function AIJobConveyor:start(farmId) end

--- On the server calls `vehicle:aiJobFinished()` before running the base stop.
---@param aiMessage any
function AIJobConveyor:stop(aiMessage) end

--- Stores the given vehicle in the vehicle parameter after the base initialization.
---@param vehicle any
---@param mission any
---@param farmId any
---@param isDirectStart any
function AIJobConveyor:applyCurrentState(vehicle, mission, farmId, isDirectStart) end

--- True when the vehicle has `spec_aiConveyorBelt`, can start AI and lists this job class as supported through `getIsAIJobSupported`.
---@param vehicle any
function AIJobConveyor:getIsAvailableForVehicle(vehicle) end

--- Returns the vehicle name from the vehicle parameter, or an empty string when there is no vehicle.
function AIJobConveyor:getTitle() end

--- Resets the tasks and passes the parameter's vehicle to the conveyor task.
function AIJobConveyor:setValues() end

--- Marks all parameters valid, then validates the vehicle parameter without requiring an AI target, flagging it invalid on failure. Returns the result and error text.
---@param farmId any
function AIJobConveyor:validate(farmId) end

--- Server-side check before starting: refuses if the AI limit is reached, the vehicle is gone, the player lacks the `hireAssistant` permission, or the vehicle is in use. Returns true plus `AIJob.START_SUCCESS`, else false plus a `AIJobConveyor.START_ERROR_*` state.
---@param connection any
function AIJobConveyor:getIsStartable(connection) end

--- Maps a start state returned by `getIsStartable` to a localized text: limit reached, vehicle deleted, no permission, vehicle in use, otherwise the success text. The `AIJobConveyor.START_ERROR_*` constants are not defined in this file (UNVERIFIED).
---@param state any
function AIJobConveyor.getIsStartErrorText(state) end
