---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SprayerDoubledAmountEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that synchronizes the 'doubled amount' mode of a sprayer between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.
---@class SprayerDoubledAmountEvent : Event
SprayerDoubledAmountEvent = {}

--- Creates an empty event instance with the event metatable, used when the network layer receives this event.
---@return table
function SprayerDoubledAmountEvent.emptyNew() end

--- Builds the event with the data to send (a node object and a boolean active flag); stored on the instance for `writeStream`.
---@param object table
---@param isActive integer
function SprayerDoubledAmountEvent.new(object, isActive) end

--- Reads a node object and a boolean active flag from the stream, then calls `run(connection)`.
---@param streamId integer
---@param connection Connection
function SprayerDoubledAmountEvent:readStream(streamId, connection) end

--- Writes a node object and a boolean active flag to the stream (same order as `readStream`).
---@param streamId integer
---@param connection Connection
function SprayerDoubledAmountEvent:writeStream(streamId, connection) end

--- Applies the event on the receiving side: calls `setSprayerDoubledAmountActive(flag, true)` on the object if synchronized, then the server re-broadcasts to the other clients.
---@param connection Connection
function SprayerDoubledAmountEvent:run(connection) end

--- Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true.
---@param vehicle table
---@param isActive boolean
---@param noEventSend boolean
function SprayerDoubledAmountEvent.sendEvent(vehicle, isActive, noEventSend) end
