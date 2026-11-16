---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/WoodHarvesterHeaderTiltEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the tilt state of a wood harvester head between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class WoodHarvesterHeaderTiltEvent : Event
WoodHarvesterHeaderTiltEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function WoodHarvesterHeaderTiltEvent.emptyNew() end

--- Builds the event with the data to send (a node object and a boolean tilt state); stored on the instance for `writeStream`.
---@param object table
---@param state number
function WoodHarvesterHeaderTiltEvent.new(object, state) end

--- Reads a node object and a boolean tilt state from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function WoodHarvesterHeaderTiltEvent:readStream(streamId, connection) end

--- Writes a node object and a boolean tilt state to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function WoodHarvesterHeaderTiltEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: calls `setWoodHarvesterTiltState(state, true)` on the object if synchronized. Unlike most events it does not re-broadcast from `run`.
---@param connection Connection
function WoodHarvesterHeaderTiltEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param object table
---@param state number
---@param noEventSend boolean
function WoodHarvesterHeaderTiltEvent.sendEvent(object, state, noEventSend) end
