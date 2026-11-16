---@meta
-- FS25 1.25.1.0 : construction/events/OrchardBuildFinishedEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event sent from the server to the requesting client to close an orchard build run and report the outcome as a status code plus the number of completed steps. On the client it publishes a message through `g_messageCenter`. The `STATUS` table and `STATUS_NUM_BITS` constants are referenced but not present in the dump, so their values are UNVERIFIED.
---@class OrchardBuildFinishedEvent : Event
OrchardBuildFinishedEvent = {}

--- Creates an empty event on the main network channel, used when reading from a stream.
---@return OrchardBuildFinishedEvent
function OrchardBuildFinishedEvent.emptyNew() end

--- Creates the answer with the run id, a status code and the count of completed build steps.
---@param requestId integer
---@param statusCode integer
---@param builtSteps integer
---@return OrchardBuildFinishedEvent
function OrchardBuildFinishedEvent.new(requestId, statusCode, builtSteps) end

--- Client side: reads request id (UInt8), status (UIntN of `STATUS_NUM_BITS` bits) and built steps (UInt16), then calls `run`.
---@param streamId integer
---@param connection Connection
function OrchardBuildFinishedEvent:readStream(streamId, connection) end

--- Server side: writes request id, status and built steps in the same layout that `readStream` expects.
---@param streamId integer
---@param connection Connection
function OrchardBuildFinishedEvent:writeStream(streamId, connection) end

--- Publishes `OrchardBuildFinishedEvent` on `g_messageCenter` with request id, status code and built steps; subscribers (UI, not in this dump) react to it.
---@param connection Connection
function OrchardBuildFinishedEvent:run(connection) end
