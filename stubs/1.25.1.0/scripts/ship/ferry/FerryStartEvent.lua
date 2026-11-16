---@meta
-- FS25 1.25.1.0 : ship/ferry/FerryStartEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event to start a ferry. The client asks, the server runs `ferry:start(connection)` and answers with an error code; the client then calls `onStarted` or `onStartFailed`. The `Ferry` class and its `ERROR_*` constants are not in this file (UNVERIFIED). Note: the doc comment says washing stations, apparently copied.
---@class FerryStartEvent : Event
FerryStartEvent = {}

--- Creates an empty event, used when reading from a stream.
---@return table
function FerryStartEvent.emptyNew() end

--- Creates the event for the given ferry. The error code is not set here; the server must set `errorCode` before sending its answer.
---@param ferry table
---@return table
function FerryStartEvent.new(ferry) end

--- Reads the ferry node object, and on the client also the error code (`Ferry.ERROR_SEND_NUM_BITS` bits), then calls `run`.
---@param streamId integer
---@param connection Connection
function FerryStartEvent:readStream(streamId, connection) end

--- Writes the ferry node object; when sent by the server, also writes `errorCode`.
---@param streamId integer
---@param connection Connection
function FerryStartEvent:writeStream(streamId, connection) end

--- Server: calls `ferry:start(connection)`. Client: calls `ferry:onStarted()` on `Ferry.ERROR_SUCCESS`, else `ferry:onStartFailed(errorCode)`.
---@param connection Connection
function FerryStartEvent:run(connection) end
