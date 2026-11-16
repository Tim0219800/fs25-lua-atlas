---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AIJobVehicleStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Server-to-client event telling clients that an AI job started or finished on a vehicle. The job is sent as its id and looked up in the client's AI system, so it must already exist there.
---@class AIJobVehicleStateEvent : Event
AIJobVehicleStateEvent = {}

--- Creates an empty event instance with the class metatable; used by the network layer before `readStream` fills it.
---@return table
function AIJobVehicleStateEvent.emptyNew() end

--- Creates the event for a vehicle with the AI job (nil when the job ended), helper index and the farm id that started it.
---@param vehicle table
---@param job boolean
---@param helperIndex any
---@param startedFarmId any
function AIJobVehicleStateEvent.new(vehicle, job, helperIndex, startedFarmId) end

--- Reads the vehicle and, if flagged, the job id (resolved through `g_currentMission.aiSystem`), farm id and helper index, then calls `run`.
---@param streamId integer
---@param connection Connection
function AIJobVehicleStateEvent:readStream(streamId, connection) end

--- Writes the vehicle, a job-present flag and, if present, job id, farm id and helper index. Asserts server-to-client use.
---@param streamId integer
---@param connection Connection
function AIJobVehicleStateEvent:writeStream(streamId, connection) end

--- On a synchronized vehicle, calls `aiJobStarted(job, helperIndex, farmId)` when a job is set, otherwise `aiJobFinished()`.
---@param connection Connection
function AIJobVehicleStateEvent:run(connection) end
