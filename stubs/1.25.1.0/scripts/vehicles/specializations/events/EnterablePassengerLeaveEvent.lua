---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/EnterablePassengerLeaveEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `EnterablePassengerLeaveEvent` (extends `Event`) that replicates a user leaving a passenger seat. It carries the vehicle and the user id. It belongs to the vehicle specialization events and defines nothing else.
---@class EnterablePassengerLeaveEvent : Event
EnterablePassengerLeaveEvent = {}

--- Creates an empty `EnterablePassengerLeaveEvent` instance without data, used when the event is read from a network stream.
---@return table
function EnterablePassengerLeaveEvent.emptyNew() end

--- Creates the event with its data: the vehicle and the user id.
---@param vehicle table
---@param userId any
---@return table
function EnterablePassengerLeaveEvent.new(vehicle, userId) end

--- Reads the event data from the network stream (the vehicle and the user id), then calls `run`.
---@param streamId integer
---@param connection Connection
function EnterablePassengerLeaveEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle and the user id).
---@param streamId integer
---@param connection Connection
function EnterablePassengerLeaveEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: if the vehicle is synchronized, finds the player by user id and calls `player:leaveVehicle(vehicle, true)`, otherwise logs a dev message. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function EnterablePassengerLeaveEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle any
---@param userId any
---@param noEventSend any
function EnterablePassengerLeaveEvent.sendEvent(vehicle, userId, noEventSend) end
