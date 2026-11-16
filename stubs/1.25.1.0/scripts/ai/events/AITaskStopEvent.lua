---@meta
-- FS25 1.25.1.0 : ai/events/AITaskStopEvent.lua (generated stub, FS25 Lua Atlas)

--- Event synchronizing the stop of one task of an AI job: it carries the job id, the task index (uint8) and a flag telling whether the whole job was stopped, and calls `job:stopTask(task, wasJobStopped)` on the receiver.
---@class AITaskStopEvent : Event
AITaskStopEvent = {}

--- Creates an empty event for stream reconstruction.
function AITaskStopEvent.emptyNew() end

--- Creates the event for a job and task, plus the stop flag.
---@param job any
---@param task any
---@param wasJobStopped any
function AITaskStopEvent.new(job, task, wasJobStopped) end

--- Reads job id and task index, resolves the job with `aiSystem:getJobById` and the task with `job:getTaskByIndex`, reads the stop flag, then runs the event.
---@param streamId any
---@param connection any
function AITaskStopEvent:readStream(streamId, connection) end

--- Writes the job id (int32) and the task index (uint8) and the stop flag.
---@param streamId any
---@param connection any
function AITaskStopEvent:writeStream(streamId, connection) end

--- Logs a dev warning and returns if the job is unknown; otherwise calls `job:stopTask(task, wasJobStopped)`.
---@param connection any
function AITaskStopEvent:run(connection) end
