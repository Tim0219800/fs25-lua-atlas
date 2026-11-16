---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/YarderTowerFollowModeEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the carriage follow mode of a yarder tower (2-bit value). Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class YarderTowerFollowModeEvent : Event
YarderTowerFollowModeEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function YarderTowerFollowModeEvent.emptyNew() end

--- Builds the event with the data to send (a node object and a 2-bit follow mode); stored on the instance for `writeStream`.
---@param object table
---@param state table
---@return table
function YarderTowerFollowModeEvent.new(object, state) end

--- Reads a node object and a 2-bit follow mode from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function YarderTowerFollowModeEvent:readStream(streamId, connection) end

--- Writes a node object and a 2-bit follow mode to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function YarderTowerFollowModeEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: on the server re-broadcasts itself, then calls `setYarderCarriageFollowMode(state, connection, true)` on the object if synchronized.
---@param connection Connection
function YarderTowerFollowModeEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param vehicle table
---@param state integer
---@param noEventSend boolean
function YarderTowerFollowModeEvent.sendEvent(vehicle, state, noEventSend) end
