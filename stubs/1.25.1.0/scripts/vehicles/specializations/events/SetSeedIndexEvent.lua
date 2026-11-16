---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetSeedIndexEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the selected seed (fruit) index of a sower between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class SetSeedIndexEvent : Event
SetSeedIndexEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function SetSeedIndexEvent.emptyNew() end

--- Builds the event with the data to send (a node object and an 8-bit seed index); stored on the instance for `writeStream`.
---@param object table
---@param seedIndex integer
function SetSeedIndexEvent.new(object, seedIndex) end

--- Reads a node object and an 8-bit seed index from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function SetSeedIndexEvent:readStream(streamId, connection) end

--- Writes a node object and an 8-bit seed index to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function SetSeedIndexEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: on the server first re-broadcasts itself to the other clients, then calls `setSeedIndex(index, true)` on the object if synchronized.
---@param connection Connection
function SetSeedIndexEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param object table
---@param seedIndex integer
---@param noEventSend boolean
function SetSeedIndexEvent.sendEvent(object, seedIndex, noEventSend) end
