---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/WoodHarvesterCutLengthEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the selected cut length index of a wood harvester between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class WoodHarvesterCutLengthEvent : Event
WoodHarvesterCutLengthEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function WoodHarvesterCutLengthEvent.emptyNew() end

--- Builds the event with the data to send (a node object and a cut length index (WoodHarvester.NUM_BITS_CUT_LENGTH bits)); stored on the instance for `writeStream`.
---@param object table
---@param index number
function WoodHarvesterCutLengthEvent.new(object, index) end

--- Reads a node object and a cut length index (WoodHarvester.NUM_BITS_CUT_LENGTH bits) from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function WoodHarvesterCutLengthEvent:readStream(streamId, connection) end

--- Writes a node object and a cut length index (WoodHarvester.NUM_BITS_CUT_LENGTH bits) to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function WoodHarvesterCutLengthEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: on the server re-broadcasts itself, then calls `setWoodHarvesterCutLengthIndex(index, true)` on the object if synchronized.
---@param connection Connection
function WoodHarvesterCutLengthEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param object table
---@param index number
---@param noEventSend boolean
function WoodHarvesterCutLengthEvent.sendEvent(object, index, noEventSend) end
