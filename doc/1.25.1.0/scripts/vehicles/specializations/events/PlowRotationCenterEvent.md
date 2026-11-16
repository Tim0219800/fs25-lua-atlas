# vehicles/specializations/events/PlowRotationCenterEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/PlowRotationCenterEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/PlowRotationCenterEvent.lua` — FS25 1.25.1.0

✍ Network event class `PlowRotationCenterEvent` (extends `Event`) that replicates the plow rotation going to its centre position. It carries only the vehicle. It belongs to the vehicle specialization events and defines nothing else.

- **PlowRotationCenterEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlowRotationCenterEvent.emptyNew() → table` | 14 | ✍ Creates an empty `PlowRotationCenterEvent` instance without data, used when the event is read from a network stream. |
| `PlowRotationCenterEvent.new(object: table)` | 23 | ✍ Creates the event with its data: only the vehicle. |
| `PlowRotationCenterEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Reads the event data from the network stream (only the vehicle), then calls `run`. |
| `PlowRotationCenterEvent:writeStream(streamId: integer, connection: Connection)` | 42 | ✍ Writes the event data to the network stream (only the vehicle). |
| `PlowRotationCenterEvent:run(connection: Connection)` | 49 | ✍ Executes the event on the receiving side: calls `setRotationCenter(true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `PlowRotationCenterEvent.sendEvent(object: table, noEventSend: boolean)` | 63 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
