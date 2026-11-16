# vehicles/specializations/events/EnterablePassengerEnterRequestEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/EnterablePassengerEnterRequestEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/EnterablePassengerEnterRequestEvent.lua` — FS25 1.25.1.0

✍ Network event class `EnterablePassengerEnterRequestEvent` (extends `Event`) that is sent by a client to ask the server for a passenger seat in a vehicle. It carries the vehicle network id and a seat index sent as `seatIndex - 1` (`EnterablePassenger.SEAT_INDEX_SEND_NUM_BITS` bits). It belongs to the vehicle specialization events and defines nothing else.

- **EnterablePassengerEnterRequestEvent** inherits from `Event` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `EnterablePassengerEnterRequestEvent.emptyNew() → table` | 20 | ✍ Creates an empty `EnterablePassengerEnterRequestEvent` instance without data, used when the event is read from a network stream. |
| `EnterablePassengerEnterRequestEvent.new(object: table, seatIndex: table) → table` | 30 | ✍ Creates the event with its data: the vehicle network id and a seat index sent as `seatIndex - 1` (`EnterablePassenger.SEAT_INDEX_SEND_NUM_BITS` bits). |
| `EnterablePassengerEnterRequestEvent:readStream(streamId: integer, connection: Connection)` | 42 | ✍ Reads the event data from the network stream (the vehicle network id and a seat index sent as `seatIndex - 1` (`EnterablePassenger.SEAT_INDEX_SEND_NUM_BITS` bits)), then calls `run`. |
| `EnterablePassengerEnterRequestEvent:writeStream(streamId: integer, connection: Connection)` | 54 | ✍ Writes the event data to the network stream (the vehicle network id and a seat index sent as `seatIndex - 1` (`EnterablePassenger.SEAT_INDEX_SEND_NUM_BITS` bits)). |
| `EnterablePassengerEnterRequestEvent:run(connection: Connection)` | 62 | ✍ Executes the event on the receiving side: if `getIsPassengerSeatIndexAvailable` is true, looks up the user id and answers with `EnterablePassengerEnterResponseEvent` (broadcast to the others with isOwner false, sent to the requester with isOwner true). |
