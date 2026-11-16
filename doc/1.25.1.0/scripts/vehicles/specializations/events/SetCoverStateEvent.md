# vehicles/specializations/events/SetCoverStateEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/SetCoverStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetCoverStateEvent.lua` — FS25 1.25.1.0

✍ Network event class `SetCoverStateEvent` (extends `Event`) that replicates the cover (tarp) state of a vehicle. It carries the vehicle and a state (`Cover.SEND_NUM_BITS` bits). It belongs to the vehicle specialization events and defines nothing else.

- **SetCoverStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `SetCoverStateEvent.emptyNew() → table` | 14 | ✍ Creates an empty `SetCoverStateEvent` instance without data, used when the event is read from a network stream. |
| `SetCoverStateEvent.new(vehicle: table, state: integer)` | 22 | ✍ Creates the event with its data: the vehicle and a state (`Cover.SEND_NUM_BITS` bits). |
| `SetCoverStateEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Reads the event data from the network stream (the vehicle and a state (`Cover.SEND_NUM_BITS` bits)), then calls `run`. |
| `SetCoverStateEvent:writeStream(streamId: integer, connection: Connection)` | 45 | ✍ Writes the event data to the network stream (the vehicle and a state (`Cover.SEND_NUM_BITS` bits)). |
| `SetCoverStateEvent:run(connection: Connection)` | 53 | ✍ Executes the event on the receiving side: calls `setCoverState(state, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `SetCoverStateEvent.sendEvent(vehicle: table, state: integer, noEventSend: boolean)` | 70 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
