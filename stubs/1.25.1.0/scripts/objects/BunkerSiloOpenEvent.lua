---@meta
-- FS25 1.25.1.0 : objects/BunkerSiloOpenEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event asking the server to open a bunker silo at a given world position. It carries the silo and three floats. The run step calls openSilo with that position.
---@class BunkerSiloOpenEvent : Event
BunkerSiloOpenEvent = {}

--- Creates an empty event instance, used by the network layer before reading from a stream.
---@return table
function BunkerSiloOpenEvent.emptyNew() end

--- Creates an event for the given bunker silo and the x, y, z opening position.
---@param bunkerSilo table
---@param x number
---@param y number
---@param z number
---@return table
function BunkerSiloOpenEvent.new(bunkerSilo, x, y, z) end

--- Reads the silo node object and three float32 coordinates when the connection is not to a server, then runs the event. Note: run is called whatever the connection type.
---@param streamId integer
---@param connection Connection
function BunkerSiloOpenEvent:readStream(streamId, connection) end

--- Writes the silo node object and the three float32 coordinates, only when the connection is to a server (client to server direction).
---@param streamId integer
---@param connection Connection
function BunkerSiloOpenEvent:writeStream(streamId, connection) end

--- When the connection is not to a server, calls openSilo on the silo with the stored x, y, z.
---@param connection Connection
function BunkerSiloOpenEvent:run(connection) end
