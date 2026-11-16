# vehicles/specializations/events/BaleCounterResetEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/BaleCounterResetEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BaleCounterResetEvent.lua` — FS25 1.25.1.0

✍ Network event class `BaleCounterResetEvent` (extends `Event`) that replicates a reset of the bale counter of a vehicle. It carries only the vehicle. It belongs to the vehicle specialization events and defines nothing else.

- **BaleCounterResetEvent** inherits from `Event` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `BaleCounterResetEvent.emptyNew() → table` | 19 | ✍ Creates an empty `BaleCounterResetEvent` instance without data, used when the event is read from a network stream. |
| `BaleCounterResetEvent.new(object: table) → table` | 29 | ✍ Creates the event with its data: only the vehicle. |
| `BaleCounterResetEvent:readStream(streamId: integer, connection: Connection)` | 40 | ✍ Reads the event data from the network stream (only the vehicle), then calls `run`. |
| `BaleCounterResetEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Writes the event data to the network stream (only the vehicle). |
| `BaleCounterResetEvent:run(connection: Connection)` | 57 | ✍ Executes the event on the receiving side: calls `doBaleCounterReset(true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `BaleCounterResetEvent.sendEvent(vehicle: table, noEventSend: boolean)` | 72 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
