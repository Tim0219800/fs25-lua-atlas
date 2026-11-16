---@meta
-- FS25 1.25.1.0 : ai/events/AIJobStartEvent.lua (generated stub, FS25 Lua Atlas)

--- Server-to-client event that tells clients an AI job has started: it carries the farm id, the job type index and the job data, then starts the job locally through `aiSystem:startJobInternal`.
---@class AIJobStartEvent : Event
AIJobStartEvent = {}

--- Creates an empty event for stream reconstruction.
function AIJobStartEvent.emptyNew() end

--- Creates the event for a job and the farm id that starts it.
---@param job any
---@param startFarmId any
function AIJobStartEvent.new(job, startFarmId) end

--- Asserts the sender is the server, reads farm id and job type index, creates the job with `aiJobTypeManager:createJob`, reads its data and runs the event.
---@param streamId any
---@param connection any
function AIJobStartEvent:readStream(streamId, connection) end

--- Writes farm id, job type index (from `aiJobTypeManager:getJobTypeIndex`) and the job data.
---@param streamId any
---@param connection any
function AIJobStartEvent:writeStream(streamId, connection) end

--- Starts the job through `g_currentMission.aiSystem:startJobInternal` with the farm id.
---@param connection any
function AIJobStartEvent:run(connection) end
