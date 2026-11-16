---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/WoodHarvesterOnDelimbTreeEvent.lua (generated stub, FS25 Lua Atlas)

--- Server-to-client event that tells clients a wood harvester started or stopped delimbing, so they can update effects. It has no sendEvent helper. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class WoodHarvesterOnDelimbTreeEvent : Event
WoodHarvesterOnDelimbTreeEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function WoodHarvesterOnDelimbTreeEvent.emptyNew() end

--- Builds the event with the data to send (a node object and a boolean state); stored on the instance for `writeStream`.
---@param object table
---@param state boolean
function WoodHarvesterOnDelimbTreeEvent.new(object, state) end

--- Reads a node object and a boolean state from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function WoodHarvesterOnDelimbTreeEvent:readStream(streamId, connection) end

--- Writes a node object and a boolean state to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function WoodHarvesterOnDelimbTreeEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: calls `onDelimbTree(state)` on the object if synchronized; on the server it first re-broadcasts a new event.
---@param connection Connection
function WoodHarvesterOnDelimbTreeEvent:run(connection) end
