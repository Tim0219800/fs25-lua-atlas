---@meta
-- FS25 1.25.1.0 : objects/BunkerSiloCloseEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event asking the server to close a bunker silo. It carries only the silo object. The run step sets the silo state to closed.
---@class BunkerSiloCloseEvent : Event
BunkerSiloCloseEvent = {}

--- Creates an empty event instance, used by the network layer before reading from a stream.
---@return table
function BunkerSiloCloseEvent.emptyNew() end

--- Creates an event for the given bunker silo.
---@param bunkerSilo table
---@return table
function BunkerSiloCloseEvent.new(bunkerSilo) end

--- Reads the silo node object from the stream when the connection is not to a server, then runs the event. Note: run is called whatever the connection type.
---@param streamId integer
---@param connection Connection
function BunkerSiloCloseEvent:readStream(streamId, connection) end

--- Writes the silo node object to the stream, only when the connection is to a server (client to server direction).
---@param streamId integer
---@param connection Connection
function BunkerSiloCloseEvent:writeStream(streamId, connection) end

--- When the connection is not to a server, sets the silo state to BunkerSilo.STATE_CLOSED.
---@param connection Connection
function BunkerSiloCloseEvent:run(connection) end
