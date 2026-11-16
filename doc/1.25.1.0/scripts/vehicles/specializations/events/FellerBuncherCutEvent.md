# vehicles/specializations/events/FellerBuncherCutEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/FellerBuncherCutEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/FellerBuncherCutEvent.lua` — FS25 1.25.1.0

✍ Network event class `FellerBuncherCutEvent` (extends `Event`) that replicates a tree cut by a feller buncher. It carries only the vehicle. It belongs to the vehicle specialization events and defines nothing else.

- **FellerBuncherCutEvent** inherits from `Event` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `FellerBuncherCutEvent.emptyNew() → table` | 19 | ✍ Creates an empty `FellerBuncherCutEvent` instance without data, used when the event is read from a network stream. |
| `FellerBuncherCutEvent.new(object: table) → table` | 29 | ✍ Creates the event with its data: only the vehicle. |
| `FellerBuncherCutEvent:readStream(streamId: integer, connection: Connection)` | 40 | ✍ Reads the event data from the network stream (only the vehicle), then calls `run`. |
| `FellerBuncherCutEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Writes the event data to the network stream (only the vehicle). |
| `FellerBuncherCutEvent:run(connection: Connection)` | 57 | ✍ Executes the event on the receiving side: calls `cutTree(true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `FellerBuncherCutEvent.sendEvent(vehicle: table, noEventSend: boolean)` | 72 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
