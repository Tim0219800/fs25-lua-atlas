---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TreePlanterTreeTypeEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the selected tree type and variation of a tree planter. The variation defaults to 1 when writing if nil. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class TreePlanterTreeTypeEvent : Event
TreePlanterTreeTypeEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function TreePlanterTreeTypeEvent.emptyNew() end

--- Builds the event with the data to send (a node object, a 32-bit tree type index and a variation index (TreePlantManager.VARIATION_NUM_BITS bits)); stored on the instance for `writeStream`.
---@param object table
---@param treeTypeIndex integer
---@param treeVariationIndex any
function TreePlanterTreeTypeEvent.new(object, treeTypeIndex, treeVariationIndex) end

--- Reads a node object, a 32-bit tree type index and a variation index (TreePlantManager.VARIATION_NUM_BITS bits) from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function TreePlanterTreeTypeEvent:readStream(streamId, connection) end

--- Writes a node object, a 32-bit tree type index and a variation index (TreePlantManager.VARIATION_NUM_BITS bits) to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function TreePlanterTreeTypeEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: on the server re-broadcasts itself, then calls `setTreePlanterTreeTypeIndex(type, variation, true)` on the object if synchronized.
---@param connection Connection
function TreePlanterTreeTypeEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param object table
---@param treeTypeIndex integer
---@param treeVariationIndex boolean
---@param noEventSend boolean
function TreePlanterTreeTypeEvent.sendEvent(object, treeTypeIndex, treeVariationIndex, noEventSend) end
