# vehicles/specializations/events/HonkEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/HonkEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/HonkEvent.lua` — FS25 1.25.1.0

✍ Network event class `HonkEvent` (extends `Event`) that replicates the horn starting or stopping. It carries the vehicle and an isPlaying boolean. It belongs to the vehicle specialization events and defines nothing else.

- **HonkEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `HonkEvent.emptyNew() → table` | 14 | ✍ Creates an empty `HonkEvent` instance without data, used when the event is read from a network stream. |
| `HonkEvent.new(object: table, isPlaying: boolean)` | 23 | ✍ Creates the event with its data: the vehicle and an isPlaying boolean. |
| `HonkEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the event data from the network stream (the vehicle and an isPlaying boolean), then calls `run`. |
| `HonkEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the event data to the network stream (the vehicle and an isPlaying boolean). |
| `HonkEvent:run(connection: Connection)` | 52 | ✍ Executes the event on the receiving side: calls `playHonk(isPlaying, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `HonkEvent.sendEvent(vehicle: table, isPlaying: boolean, noEventSend: boolean)` | 67 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
