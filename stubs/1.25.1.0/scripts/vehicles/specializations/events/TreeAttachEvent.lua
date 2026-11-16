---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TreeAttachEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the attachment of a tree (split shape) to a forestry carriage or winch at a world position, optionally for a given rope index. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class TreeAttachEvent : Event
TreeAttachEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function TreeAttachEvent.emptyNew() end

--- Builds the event with the data to send (a node object, a split shape id, three float32 coordinates and an optional rope index on 4 bits); stored on the instance for `writeStream`.
---@param object table
---@param splitShapeId table
---@param x any
---@param y any
---@param z any
---@param ropeIndex any
---@return table
function TreeAttachEvent.new(object, splitShapeId, x, y, z, ropeIndex) end

--- Reads a node object, a split shape id, three float32 coordinates and an optional rope index on 4 bits from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function TreeAttachEvent:readStream(streamId, connection) end

--- Writes a node object, a split shape id, three float32 coordinates and an optional rope index on 4 bits to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function TreeAttachEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: calls `attachTreeToCarriage` if the object has it, otherwise `attachTreeToWinch`, passing noEventSend. It does not re-broadcast itself here.
---@param connection Connection
function TreeAttachEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param vehicle table
---@param splitShapeId boolean
---@param x any
---@param y any
---@param z any
---@param ropeIndex any
---@param noEventSend boolean
function TreeAttachEvent.sendEvent(vehicle, splitShapeId, x, y, z, ropeIndex, noEventSend) end
