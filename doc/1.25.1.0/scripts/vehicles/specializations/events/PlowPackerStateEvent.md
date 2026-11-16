# vehicles/specializations/events/PlowPackerStateEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/PlowPackerStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/PlowPackerStateEvent.lua` — FS25 1.25.1.0

✍ Network event class `PlowPackerStateEvent` (extends `Event`) that replicates the packer state of a plow. It carries the vehicle, a boolean state and an update-animations flag. It belongs to the vehicle specialization events and defines nothing else.

- **PlowPackerStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlowPackerStateEvent.emptyNew() → table` | 14 | ✍ Creates an empty `PlowPackerStateEvent` instance without data, used when the event is read from a network stream. |
| `PlowPackerStateEvent.new(object: table, state: boolean, updateAnimations: boolean)` | 23 | ✍ Creates the event with its data: the vehicle, a boolean state and an update-animations flag. |
| `PlowPackerStateEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Reads the event data from the network stream (the vehicle, a boolean state and an update-animations flag), then calls `run`. |
| `PlowPackerStateEvent:writeStream(streamId: integer, connection: Connection)` | 46 | ✍ Writes the event data to the network stream (the vehicle, a boolean state and an update-animations flag). |
| `PlowPackerStateEvent:run(connection: Connection)` | 55 | ✍ Executes the event on the receiving side: calls `setPackerState(state, updateAnimations, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `PlowPackerStateEvent.sendEvent(object: table, state: boolean, updateAnimations: boolean, noEventSend: boolean)` | 71 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
