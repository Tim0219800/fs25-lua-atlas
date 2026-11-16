---@meta
-- FS25 1.25.1.0 : ai/events/AITaskStartEvent.lua (generated stub, FS25 Lua Atlas)

--- Event synchronizing the start of one task of an AI job: it carries the job id, the task index (uint8), and calls `job:startTask(task)` on the receiver.
---@class AITaskStartEvent : Event
AITaskStartEvent = {}

--- Creates an empty event for stream reconstruction.
function AITaskStartEvent.emptyNew() end

--- Creates the event for a job and task.
---@param job any
---@param task any
function AITaskStartEvent.new(job, task) end

--- Reads job id and task index, resolves the job with `aiSystem:getJobById` and the task with `job:getTaskByIndex`, then runs the event.
---@param streamId any
---@param connection any
function AITaskStartEvent:readStream(streamId, connection) end

--- Writes the job id (int32) and the task index (uint8).
---@param streamId any
---@param connection any
function AITaskStartEvent:writeStream(streamId, connection) end

--- Logs a dev warning and returns if the job is unknown; otherwise calls `job:startTask(task)`.
---@param connection any
function AITaskStartEvent:run(connection) end
