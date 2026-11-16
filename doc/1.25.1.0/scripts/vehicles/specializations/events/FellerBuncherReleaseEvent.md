# vehicles/specializations/events/FellerBuncherReleaseEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/FellerBuncherReleaseEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/FellerBuncherReleaseEvent.lua` — FS25 1.25.1.0

✍ Network event class `FellerBuncherReleaseEvent` (extends `Event`) that replicates the release of the trees held by a feller buncher. It carries only the vehicle. It belongs to the vehicle specialization events and defines nothing else.

- **FellerBuncherReleaseEvent** inherits from `Event` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `FellerBuncherReleaseEvent.emptyNew() → table` | 19 | ✍ Creates an empty `FellerBuncherReleaseEvent` instance without data, used when the event is read from a network stream. |
| `FellerBuncherReleaseEvent.new(object: table) → table` | 29 | ✍ Creates the event with its data: only the vehicle. |
| `FellerBuncherReleaseEvent:readStream(streamId: integer, connection: Connection)` | 40 | ✍ Reads the event data from the network stream (only the vehicle), then calls `run`. |
| `FellerBuncherReleaseEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Writes the event data to the network stream (only the vehicle). |
| `FellerBuncherReleaseEvent:run(connection: Connection)` | 57 | ✍ Executes the event on the receiving side: calls `releaseMountedTrees(true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `FellerBuncherReleaseEvent.sendEvent(vehicle: table, noEventSend: boolean)` | 72 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
