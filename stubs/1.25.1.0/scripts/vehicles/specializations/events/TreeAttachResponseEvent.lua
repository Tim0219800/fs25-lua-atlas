---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TreeAttachResponseEvent.lua (generated stub, FS25 Lua Atlas)

--- Server-to-client answer to a refused tree attach request. It carries a failure reason code so the client can show a warning. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class TreeAttachResponseEvent : Event
TreeAttachResponseEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function TreeAttachResponseEvent.emptyNew() end

--- Builds the event with the data to send (a node object, a failure reason (TreeAttachResponseEvent.TREE_ATTACH_FAIL_REASON_NUM_BITS bits) and an optional rope index (3 bits)); stored on the instance for `writeStream`.
---@param object table
---@param failedReason table
---@param ropeIndex any
---@return table
function TreeAttachResponseEvent.new(object, failedReason, ropeIndex) end

--- Reads a node object, a failure reason (TreeAttachResponseEvent.TREE_ATTACH_FAIL_REASON_NUM_BITS bits) and an optional rope index (3 bits) from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function TreeAttachResponseEvent:readStream(streamId, connection) end

--- Writes a node object, a failure reason (TreeAttachResponseEvent.TREE_ATTACH_FAIL_REASON_NUM_BITS bits) and an optional rope index (3 bits) to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function TreeAttachResponseEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: calls `showCarriageTreeMountFailedWarning` or `showWinchTreeMountFailedWarning` on the object, depending on which one it has.
---@param connection Connection
function TreeAttachResponseEvent:run(connection) end
