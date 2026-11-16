---@meta
-- FS25 1.25.1.0 : construction/events/OrchardBuildCancelEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event sent by a client to ask the server to stop a running orchard build, identified by a request id (one byte). It sends on the main channel and only does anything on the server, which forwards to `g_currentMission.orchardBuildManager:cancelRequest`. The manager class is not in the dump, so its behaviour is UNVERIFIED.
---@class OrchardBuildCancelEvent : Event
OrchardBuildCancelEvent = {}

--- Creates an empty event on the main network channel, used when reading from a stream.
---@return OrchardBuildCancelEvent
function OrchardBuildCancelEvent.emptyNew() end

--- Creates a cancel request for the given build run id.
---@param requestId integer
---@return OrchardBuildCancelEvent
function OrchardBuildCancelEvent.new(requestId) end

--- Reads the request id (UInt8) and immediately calls `run`. Executed on the server when a client request arrives.
---@param streamId integer
---@param connection Connection
function OrchardBuildCancelEvent:readStream(streamId, connection) end

--- Writes the request id as a UInt8. Used by the client when sending.
---@param streamId integer
---@param connection Connection
function OrchardBuildCancelEvent:writeStream(streamId, connection) end

--- Server only: returns early if the connection leads to a server, or if the mission has no `orchardBuildManager`; otherwise asks the manager to cancel the request for this connection.
---@param connection Connection
function OrchardBuildCancelEvent:run(connection) end
