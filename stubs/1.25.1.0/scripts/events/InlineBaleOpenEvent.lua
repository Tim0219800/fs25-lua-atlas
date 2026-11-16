---@meta
-- FS25 1.25.1.0 : events/InlineBaleOpenEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event asking the server to open an inline bale (a bale in a wrapped chain) at a world position. Sent by a client, applied on the server through `openBaleAtPosition`, whose behaviour is UNVERIFIED (InlineBale class not in this file).
---@class InlineBaleOpenEvent : Event
InlineBaleOpenEvent = {}

--- Creates an empty event, used when reading from a stream.
---@return table
function InlineBaleOpenEvent.emptyNew() end

--- Creates the event for an inline bale and an opening position (x, y, z, world coordinates).
---@param inlineBale table
---@param x number
---@param y number
---@param z number
---@return table
function InlineBaleOpenEvent.new(inlineBale, x, y, z) end

--- Server side: reads the inline bale node object and three Float32 coordinates, then calls `run`.
---@param streamId integer
---@param connection Connection
function InlineBaleOpenEvent:readStream(streamId, connection) end

--- Client side: writes the inline bale node object and the x, y, z floats; nothing when sent by the server.
---@param streamId integer
---@param connection Connection
function InlineBaleOpenEvent:writeStream(streamId, connection) end

--- Server only: calls `openBaleAtPosition(x, y, z)` on the inline bale.
---@param connection Connection
function InlineBaleOpenEvent:run(connection) end
