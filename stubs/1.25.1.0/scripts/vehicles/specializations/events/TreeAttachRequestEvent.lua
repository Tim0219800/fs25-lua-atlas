---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TreeAttachRequestEvent.lua (generated stub, FS25 Lua Atlas)

--- Client-to-server request to attach a tree to a forestry carriage or winch. The server checks permission and either attaches the tree or answers with a TreeAttachResponseEvent carrying the failure reason. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class TreeAttachRequestEvent : Event
TreeAttachRequestEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function TreeAttachRequestEvent.emptyNew() end

--- Builds the event with the data to send (a node object, a split shape id, three float32 coordinates, an optional rope index (3 bits) and optional rope setup data (ForestryPhysicsRope)); stored on the instance for `writeStream`.
---@param object table
---@param splitShapeId table
---@param x any
---@param y any
---@param z any
---@param ropeIndex any
---@param setupRope any
---@return table
function TreeAttachRequestEvent.new(object, splitShapeId, x, y, z, ropeIndex, setupRope) end

--- Reads a node object, a split shape id, three float32 coordinates, an optional rope index (3 bits) and optional rope setup data (ForestryPhysicsRope) from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function TreeAttachRequestEvent:readStream(streamId, connection) end

--- Writes a node object, a split shape id, three float32 coordinates, an optional rope index (3 bits) and optional rope setup data (ForestryPhysicsRope) to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function TreeAttachRequestEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: asks `getIsCarriageTreeAttachAllowed` or `getIsWinchTreeAttachAllowed`; if allowed it calls `attachTreeToCarriage` or `attachTreeToWinch`, otherwise it sends a TreeAttachResponseEvent only to the requesting connection.
---@param connection Connection
function TreeAttachRequestEvent:run(connection) end
