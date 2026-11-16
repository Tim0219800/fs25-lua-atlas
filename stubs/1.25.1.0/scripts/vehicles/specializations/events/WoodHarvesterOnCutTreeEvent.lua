---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/WoodHarvesterOnCutTreeEvent.lua (generated stub, FS25 Lua Atlas)

--- Server-to-client event that raises the `onCutTree` specialization event with the cut radius so clients can play cut effects. It has no sendEvent helper. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class WoodHarvesterOnCutTreeEvent : Event
WoodHarvesterOnCutTreeEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function WoodHarvesterOnCutTreeEvent.emptyNew() end

--- Builds the event with the data to send (a node object and a float32 radius); stored on the instance for `writeStream`.
---@param object table
---@param radius number
function WoodHarvesterOnCutTreeEvent.new(object, radius) end

--- Reads a node object and a float32 radius from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function WoodHarvesterOnCutTreeEvent:readStream(streamId, connection) end

--- Writes a node object and a float32 radius to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function WoodHarvesterOnCutTreeEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: calls `SpecializationUtil.raiseEvent(object, 'onCutTree', radius)` if synchronized; on the server it first re-broadcasts a new event.
---@param connection Connection
function WoodHarvesterOnCutTreeEvent:run(connection) end
