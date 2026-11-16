---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TreePlanterCreateTreeEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that triggers creation of a tree on a tree planter on all peers. The constructor accepts tree type and variation arguments but they are ignored and not sent. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class TreePlanterCreateTreeEvent : Event
TreePlanterCreateTreeEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function TreePlanterCreateTreeEvent.emptyNew() end

--- Builds the event with the data to send (only the node object); stored on the instance for `writeStream`.
---@param object table
---@param treeTypeIndex integer
---@param treeVariationIndex any
function TreePlanterCreateTreeEvent.new(object, treeTypeIndex, treeVariationIndex) end

--- Reads only the node object from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function TreePlanterCreateTreeEvent:readStream(streamId, connection) end

--- Writes only the node object to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function TreePlanterCreateTreeEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: on the server re-broadcasts itself, then calls `createTree(true)` on the object if synchronized.
---@param connection Connection
function TreePlanterCreateTreeEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param object table
---@param noEventSend boolean
function TreePlanterCreateTreeEvent.sendEvent(object, noEventSend) end
