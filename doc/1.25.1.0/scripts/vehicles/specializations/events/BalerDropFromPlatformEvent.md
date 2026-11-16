# vehicles/specializations/events/BalerDropFromPlatformEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/BalerDropFromPlatformEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BalerDropFromPlatformEvent.lua` — FS25 1.25.1.0

✍ Network event class `BalerDropFromPlatformEvent` (extends `Event`) that replicates dropping a bale from the baler platform. It carries the vehicle and a wait-for-next-bale boolean. It belongs to the vehicle specialization events and defines nothing else.

- **BalerDropFromPlatformEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `BalerDropFromPlatformEvent.emptyNew() → table` | 14 | ✍ Creates an empty `BalerDropFromPlatformEvent` instance without data, used when the event is read from a network stream. |
| `BalerDropFromPlatformEvent.new(object: table, waitForNextBale: boolean)` | 23 | ✍ Creates the event with its data: the vehicle and a wait-for-next-bale boolean. |
| `BalerDropFromPlatformEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the event data from the network stream (the vehicle and a wait-for-next-bale boolean), then calls `run`. |
| `BalerDropFromPlatformEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the event data to the network stream (the vehicle and a wait-for-next-bale boolean). |
| `BalerDropFromPlatformEvent:run(connection: Connection)` | 52 | ✍ Executes the event on the receiving side: calls `dropBaleFromPlatform(waitForNextBale, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `BalerDropFromPlatformEvent.sendEvent(object: table, waitForNextBale: boolean, noEventSend: boolean)` | 66 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
