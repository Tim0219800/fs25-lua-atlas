# vehicles/specializations/events/PlowRotationEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/PlowRotationEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/PlowRotationEvent.lua` — FS25 1.25.1.0

✍ Network event class `PlowRotationEvent` (extends `Event`) that replicates the target side of the plow rotation. It carries the vehicle and a rotationMax boolean. It belongs to the vehicle specialization events and defines nothing else.

- **PlowRotationEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlowRotationEvent.emptyNew() → table` | 14 | ✍ Creates an empty `PlowRotationEvent` instance without data, used when the event is read from a network stream. |
| `PlowRotationEvent.new(object: table, rotationMax: boolean)` | 23 | ✍ Creates the event with its data: the vehicle and a rotationMax boolean. |
| `PlowRotationEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the event data from the network stream (the vehicle and a rotationMax boolean), then calls `run`. |
| `PlowRotationEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the event data to the network stream (the vehicle and a rotationMax boolean). |
| `PlowRotationEvent:run(connection: Connection)` | 52 | ✍ Executes the event on the receiving side: calls `setRotationMax(rotationMax, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `PlowRotationEvent.sendEvent(object: table, rotationMax: boolean, noEventSend: boolean)` | 67 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
