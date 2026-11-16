---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/EnterablePassengerEnterResponseEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `EnterablePassengerEnterResponseEvent` (extends `Event`) that is the server answer telling clients that a user took a passenger seat. It carries the vehicle network id, an isOwner flag, the seat index (sent minus one) and the user id. It belongs to the vehicle specialization events and defines nothing else.
---@class EnterablePassengerEnterResponseEvent : Event
EnterablePassengerEnterResponseEvent = {}

--- Creates an empty `EnterablePassengerEnterResponseEvent` instance without data, used when the event is read from a network stream.
---@return table
function EnterablePassengerEnterResponseEvent.emptyNew() end

--- Creates the event with its data: the vehicle network id, an isOwner flag, the seat index (sent minus one) and the user id.
---@param id table
---@param isOwner boolean
---@param seatIndex table
---@param userId any
---@return table
function EnterablePassengerEnterResponseEvent.new(id, isOwner, seatIndex, userId) end

--- Reads the event data from the network stream (the vehicle network id, an isOwner flag, the seat index (sent minus one) and the user id), then calls `run`.
---@param streamId integer
---@param connection Connection
function EnterablePassengerEnterResponseEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle network id, an isOwner flag, the seat index (sent minus one) and the user id).
---@param streamId integer
---@param connection Connection
function EnterablePassengerEnterResponseEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: finds the player whose `uniqueUserId` matches the user and calls `player:onEnterVehicleAsPassenger(vehicle, seatIndex)` (no rebroadcast; no nil check on the player).
---@param connection Connection
function EnterablePassengerEnterResponseEvent:run(connection) end
