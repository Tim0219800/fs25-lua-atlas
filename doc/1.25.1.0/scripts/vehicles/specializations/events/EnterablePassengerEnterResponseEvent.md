# vehicles/specializations/events/EnterablePassengerEnterResponseEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/EnterablePassengerEnterResponseEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/EnterablePassengerEnterResponseEvent.lua` — FS25 1.25.1.0

✍ Network event class `EnterablePassengerEnterResponseEvent` (extends `Event`) that is the server answer telling clients that a user took a passenger seat. It carries the vehicle network id, an isOwner flag, the seat index (sent minus one) and the user id. It belongs to the vehicle specialization events and defines nothing else.

- **EnterablePassengerEnterResponseEvent** inherits from `Event` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `EnterablePassengerEnterResponseEvent.emptyNew() → table` | 20 | ✍ Creates an empty `EnterablePassengerEnterResponseEvent` instance without data, used when the event is read from a network stream. |
| `EnterablePassengerEnterResponseEvent.new(id: table, isOwner: boolean, seatIndex: table, userId: any) → table` | 31 | ✍ Creates the event with its data: the vehicle network id, an isOwner flag, the seat index (sent minus one) and the user id. |
| `EnterablePassengerEnterResponseEvent:readStream(streamId: integer, connection: Connection)` | 46 | ✍ Reads the event data from the network stream (the vehicle network id, an isOwner flag, the seat index (sent minus one) and the user id), then calls `run`. |
| `EnterablePassengerEnterResponseEvent:writeStream(streamId: integer, connection: Connection)` | 59 | ✍ Writes the event data to the network stream (the vehicle network id, an isOwner flag, the seat index (sent minus one) and the user id). |
| `EnterablePassengerEnterResponseEvent:run(connection: Connection)` | 70 | ✍ Executes the event on the receiving side: finds the player whose `uniqueUserId` matches the user and calls `player:onEnterVehicleAsPassenger(vehicle, seatIndex)` (no rebroadcast; no nil check on the player). |
