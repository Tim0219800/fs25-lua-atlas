# vehicles/specializations/events/EnterablePassengerLeaveEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/EnterablePassengerLeaveEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/EnterablePassengerLeaveEvent.lua` — FS25 1.25.1.0

✍ Network event class `EnterablePassengerLeaveEvent` (extends `Event`) that replicates a user leaving a passenger seat. It carries the vehicle and the user id. It belongs to the vehicle specialization events and defines nothing else.

- **EnterablePassengerLeaveEvent** inherits from `Event` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `EnterablePassengerLeaveEvent.emptyNew() → table` | 20 | ✍ Creates an empty `EnterablePassengerLeaveEvent` instance without data, used when the event is read from a network stream. |
| `EnterablePassengerLeaveEvent.new(vehicle: table, userId: any) → table` | 29 | ✍ Creates the event with its data: the vehicle and the user id. |
| `EnterablePassengerLeaveEvent:readStream(streamId: integer, connection: Connection)` | 40 | ✍ Reads the event data from the network stream (the vehicle and the user id), then calls `run`. |
| `EnterablePassengerLeaveEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Writes the event data to the network stream (the vehicle and the user id). |
| `EnterablePassengerLeaveEvent:run(connection: Connection)` | 58 | ✍ Executes the event on the receiving side: if the vehicle is synchronized, finds the player by user id and calls `player:leaveVehicle(vehicle, true)`, otherwise logs a dev message. On the server it also forwards the event to the other clients, except the sender. |
| `EnterablePassengerLeaveEvent.sendEvent(vehicle: any, userId: any, noEventSend: any)` | 77 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
