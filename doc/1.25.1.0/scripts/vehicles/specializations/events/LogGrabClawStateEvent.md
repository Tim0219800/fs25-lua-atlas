# vehicles/specializations/events/LogGrabClawStateEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/LogGrabClawStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/LogGrabClawStateEvent.lua` — FS25 1.25.1.0

✍ Network event class `LogGrabClawStateEvent` (extends `Event`) that replicates the state of one claw of a log grab. It carries the vehicle, a boolean state and a grab index (`LogGrab.GRAB_INDEX_NUM_BITS` bits). It belongs to the vehicle specialization events and defines nothing else.

- **LogGrabClawStateEvent** inherits from `Event` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `LogGrabClawStateEvent.emptyNew() → table` | 19 | ✍ Creates an empty `LogGrabClawStateEvent` instance without data, used when the event is read from a network stream. |
| `LogGrabClawStateEvent.new(object: table, state: table, grabIndex: any) → table` | 29 | ✍ Creates the event with its data: the vehicle, a boolean state and a grab index (`LogGrab.GRAB_INDEX_NUM_BITS` bits). |
| `LogGrabClawStateEvent:readStream(streamId: integer, connection: Connection)` | 42 | ✍ Reads the event data from the network stream (the vehicle, a boolean state and a grab index (`LogGrab.GRAB_INDEX_NUM_BITS` bits)), then calls `run`. |
| `LogGrabClawStateEvent:writeStream(streamId: integer, connection: Connection)` | 54 | ✍ Writes the event data to the network stream (the vehicle, a boolean state and a grab index (`LogGrab.GRAB_INDEX_NUM_BITS` bits)). |
| `LogGrabClawStateEvent:run(connection: Connection)` | 63 | ✍ Executes the event on the receiving side: calls `setLogGrabClawState(grabIndex, state, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `LogGrabClawStateEvent.sendEvent(vehicle: table, state: integer, grabIndex: boolean, noEventSend: boolean)` | 78 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
