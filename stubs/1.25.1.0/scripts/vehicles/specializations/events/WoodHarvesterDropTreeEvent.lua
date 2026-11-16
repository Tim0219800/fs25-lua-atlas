---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/WoodHarvesterDropTreeEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that makes a wood harvester drop its held tree, synchronized between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class WoodHarvesterDropTreeEvent : Event
WoodHarvesterDropTreeEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function WoodHarvesterDropTreeEvent.emptyNew() end

--- Builds the event with the data to send (only the node object); stored on the instance for `writeStream`.
---@param object table
function WoodHarvesterDropTreeEvent.new(object) end

--- Reads only the node object from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function WoodHarvesterDropTreeEvent:readStream(streamId, connection) end

--- Writes only the node object to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function WoodHarvesterDropTreeEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: calls `dropWoodHarvesterTree(true)` on the object if synchronized; on the server it first re-broadcasts a new event to the other clients.
---@param connection Connection
function WoodHarvesterDropTreeEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param object table
---@param noEventSend boolean
function WoodHarvesterDropTreeEvent.sendEvent(object, noEventSend) end
