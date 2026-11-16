---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/EnterablePassengerEnterRequestEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `EnterablePassengerEnterRequestEvent` (extends `Event`) that is sent by a client to ask the server for a passenger seat in a vehicle. It carries the vehicle network id and a seat index sent as `seatIndex - 1` (`EnterablePassenger.SEAT_INDEX_SEND_NUM_BITS` bits). It belongs to the vehicle specialization events and defines nothing else.
---@class EnterablePassengerEnterRequestEvent : Event
EnterablePassengerEnterRequestEvent = {}

--- Creates an empty `EnterablePassengerEnterRequestEvent` instance without data, used when the event is read from a network stream.
---@return table
function EnterablePassengerEnterRequestEvent.emptyNew() end

--- Creates the event with its data: the vehicle network id and a seat index sent as `seatIndex - 1` (`EnterablePassenger.SEAT_INDEX_SEND_NUM_BITS` bits).
---@param object table
---@param seatIndex table
---@return table
function EnterablePassengerEnterRequestEvent.new(object, seatIndex) end

--- Reads the event data from the network stream (the vehicle network id and a seat index sent as `seatIndex - 1` (`EnterablePassenger.SEAT_INDEX_SEND_NUM_BITS` bits)), then calls `run`.
---@param streamId integer
---@param connection Connection
function EnterablePassengerEnterRequestEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle network id and a seat index sent as `seatIndex - 1` (`EnterablePassenger.SEAT_INDEX_SEND_NUM_BITS` bits)).
---@param streamId integer
---@param connection Connection
function EnterablePassengerEnterRequestEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: if `getIsPassengerSeatIndexAvailable` is true, looks up the user id and answers with `EnterablePassengerEnterResponseEvent` (broadcast to the others with isOwner false, sent to the requester with isOwner true).
---@param connection Connection
function EnterablePassengerEnterRequestEvent:run(connection) end
