# vehicles/specializations/events/JumpEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/JumpEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/JumpEvent.lua` — FS25 1.25.1.0

✍ Network event class `JumpEvent` (extends `Event`) that is a client request to make a vehicle jump. It carries the vehicle, written only when the stream goes to the server. It belongs to the vehicle specialization events and defines nothing else.

- **JumpEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `JumpEvent.emptyNew() → table` | 14 | ✍ Creates an empty `JumpEvent` instance without data, used when the event is read from a network stream. |
| `JumpEvent.new(object: table)` | 23 | ✍ Creates the event with its data: the vehicle, written only when the stream goes to the server. |
| `JumpEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Reads the event data from the network stream (the vehicle, written only when the stream goes to the server), then calls `run`. |
| `JumpEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the event data to the network stream (the vehicle, written only when the stream goes to the server). |
| `JumpEvent:run(connection: Connection)` | 53 | ✍ Executes the event on the receiving side: calls `jump(true)` on the vehicle once synchronized; there is no client/server check in `run`. |
