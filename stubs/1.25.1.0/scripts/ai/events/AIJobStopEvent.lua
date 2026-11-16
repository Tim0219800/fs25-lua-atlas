---@meta
-- FS25 1.25.1.0 : ai/events/AIJobStopEvent.lua (generated stub, FS25 Lua Atlas)

--- Event that stops an AI job and optionally carries the AI message explaining why. The server broadcasts it to clients; a client's request is applied on the server through `aiSystem:stopJob`.
---@class AIJobStopEvent : Event
AIJobStopEvent = {}

--- Creates an empty event for stream reconstruction.
function AIJobStopEvent.emptyNew() end

--- Creates the event for a job and an optional AI message (may be nil).
---@param job any
---@param aiMessage any
function AIJobStopEvent.new(job, aiMessage) end

--- Reads the job id and resolves the job, then, if a flag is set, reads a message index, creates the message through `aiMessageManager:createMessage` and lets it read its data. Runs the event.
---@param streamId any
---@param connection any
function AIJobStopEvent:readStream(streamId, connection) end

--- Writes the job id, a bool for message presence, and if present the message index and its own data.
---@param streamId any
---@param connection any
function AIJobStopEvent:writeStream(streamId, connection) end

--- Does nothing if the job is unknown. On a client it calls `aiSystem:stopJobInternal` with the message; on the server it calls `aiSystem:stopJob`.
---@param connection any
function AIJobStopEvent:run(connection) end
