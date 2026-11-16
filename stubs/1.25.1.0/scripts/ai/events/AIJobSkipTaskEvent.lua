---@meta
-- FS25 1.25.1.0 : ai/events/AIJobSkipTaskEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event sent by a client so that the server skips the current task of an AI job; it carries only the job id and publishes `MessageType.AI_TASK_SKIPPED` on mobile. It asserts client-to-server direction.
---@class AIJobSkipTaskEvent : Event
AIJobSkipTaskEvent = {}

--- Creates an empty event, used when the event is rebuilt from a stream.
function AIJobSkipTaskEvent.emptyNew() end

--- Creates the event for the given job.
---@param job any
function AIJobSkipTaskEvent.new(job) end

--- Reads the job id, resolves the job via `g_currentMission.aiSystem:getJobById` and runs the event immediately.
---@param streamId any
---@param connection any
function AIJobSkipTaskEvent:readStream(streamId, connection) end

--- Writes the job id as an int32.
---@param streamId any
---@param connection any
function AIJobSkipTaskEvent:writeStream(streamId, connection) end

--- Asserts it runs on the server side, then calls `aiSystem:skipCurrentTaskInternal` for the job. Publishes `AI_TASK_SKIPPED` when the platform is mobile.
---@param connection any
function AIJobSkipTaskEvent:run(connection) end
