---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TreeDetachEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the detachment of a tree from a forestry carriage or winch, optionally for a given rope index. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class TreeDetachEvent : Event
TreeDetachEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function TreeDetachEvent.emptyNew() end

--- Builds the event with the data to send (a node object and an optional rope index on 4 bits); stored on the instance for `writeStream`.
---@param object table
---@param ropeIndex table
---@return table
function TreeDetachEvent.new(object, ropeIndex) end

--- Reads a node object and an optional rope index on 4 bits from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function TreeDetachEvent:readStream(streamId, connection) end

--- Writes a node object and an optional rope index on 4 bits to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function TreeDetachEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: on the server re-broadcasts itself, then calls `detachTreeFromCarriage` or `detachTreeFromWinch` with the rope index.
---@param connection Connection
function TreeDetachEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param vehicle table
---@param ropeIndex boolean
---@param noEventSend boolean
function TreeDetachEvent.sendEvent(vehicle, ropeIndex, noEventSend) end
