---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/WoodHarvesterCutTreeEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that makes a wood harvester cut the held tree at a given length, synchronized between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class WoodHarvesterCutTreeEvent : Event
WoodHarvesterCutTreeEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function WoodHarvesterCutTreeEvent.emptyNew() end

--- Builds the event with the data to send (a node object and a float32 cut length); stored on the instance for `writeStream`.
---@param object table
---@param length number
function WoodHarvesterCutTreeEvent.new(object, length) end

--- Reads a node object and a float32 cut length from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function WoodHarvesterCutTreeEvent:readStream(streamId, connection) end

--- Writes a node object and a float32 cut length to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function WoodHarvesterCutTreeEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: calls `cutTree(length, true)` on the object if synchronized; on the server it first re-broadcasts a new event to the other clients.
---@param connection Connection
function WoodHarvesterCutTreeEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param object table
---@param length number
---@param noEventSend boolean
function WoodHarvesterCutTreeEvent.sendEvent(object, length, noEventSend) end
