# vehicles/specializations/events/SetDischargeStateEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/SetDischargeStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetDischargeStateEvent.lua` — FS25 1.25.1.0

✍ Network event class `SetDischargeStateEvent` (extends `Event`) that replicates the discharge state of a vehicle. It carries the vehicle and a state (2 bits). It belongs to the vehicle specialization events and defines nothing else.

- **SetDischargeStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `SetDischargeStateEvent.emptyNew() → table` | 14 | ✍ Creates an empty `SetDischargeStateEvent` instance without data, used when the event is read from a network stream. |
| `SetDischargeStateEvent.new(vehicle: table, state: integer)` | 23 | ✍ Creates the event with its data: the vehicle and a state (2 bits). |
| `SetDischargeStateEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the event data from the network stream (the vehicle and a state (2 bits)), then calls `run`. |
| `SetDischargeStateEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the event data to the network stream (the vehicle and a state (2 bits)). |
| `SetDischargeStateEvent:run(connection: Connection)` | 52 | ✍ Executes the event on the receiving side: calls `setDischargeState(state, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `SetDischargeStateEvent.sendEvent(vehicle: table, state: integer, noEventSend: boolean)` | 69 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
