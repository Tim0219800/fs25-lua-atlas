---@meta
-- FS25 1.25.1.0 : events/BaleUnpackEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event asking the server to unpack a bale (client to server). Unlike similar events it is not guarded in `run`, so the unpack call happens wherever the event is run; the behaviour of `Bale:unpack` is UNVERIFIED (class not in this file).
---@class BaleUnpackEvent : Event
BaleUnpackEvent = {}

--- Creates an empty event, used when reading from a stream.
---@return table
function BaleUnpackEvent.emptyNew() end

--- Creates the event for the given bale.
---@param bale table
---@return table
function BaleUnpackEvent.new(bale) end

--- Server side: reads the bale node object, then calls `run`. On a client connection nothing is read but `run` is still called.
---@param streamId integer
---@param connection Connection
function BaleUnpackEvent:readStream(streamId, connection) end

--- Client side: writes the bale node object; writes nothing when sent by the server.
---@param streamId integer
---@param connection Connection
function BaleUnpackEvent:writeStream(streamId, connection) end

--- Calls `unpack()` on the bale, with no server/client check. Would fail on a nil bale.
---@param connection Connection
function BaleUnpackEvent:run(connection) end
