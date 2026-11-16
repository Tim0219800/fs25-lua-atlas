---@meta
-- FS25 1.25.1.0 : events/BaleOpenEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event asking the server to open a bale (client to server only). The server calls `bale:open()`; the effect on other clients is UNVERIFIED because `Bale` is not in this file. Note that the payload is only written by the client and read by the server.
---@class BaleOpenEvent : Event
BaleOpenEvent = {}

--- Creates an empty event, used when reading from a stream.
---@return table
function BaleOpenEvent.emptyNew() end

--- Creates the event for a bale. Note: the doc comment mentions x, y, z but the function only takes the bale.
---@param bale table
---@return table
function BaleOpenEvent.new(bale) end

--- Server side: reads the bale node object, then calls `run`. On a client connection nothing is read but `run` is still called.
---@param streamId integer
---@param connection Connection
function BaleOpenEvent:readStream(streamId, connection) end

--- Client side: writes the bale node object; writes nothing when sent by the server.
---@param streamId integer
---@param connection Connection
function BaleOpenEvent:writeStream(streamId, connection) end

--- Server only: calls `open()` on the bale. Does nothing on a client.
---@param connection Connection
function BaleOpenEvent:run(connection) end
