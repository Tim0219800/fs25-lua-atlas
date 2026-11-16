# vehicles/specializations/events/RidgeMarkerSetStateEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/RidgeMarkerSetStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/RidgeMarkerSetStateEvent.lua` — FS25 1.25.1.0

✍ Network event class `RidgeMarkerSetStateEvent` (extends `Event`) that replicates the ridge marker state. It carries the vehicle and a state (`RidgeMarker.SEND_NUM_BITS` bits; the constructor asserts it is below `RidgeMarker.MAX_NUM_RIDGEMARKERS`). It belongs to the vehicle specialization events and defines nothing else.

- **RidgeMarkerSetStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `RidgeMarkerSetStateEvent.emptyNew() → table` | 14 | ✍ Creates an empty `RidgeMarkerSetStateEvent` instance without data, used when the event is read from a network stream. |
| `RidgeMarkerSetStateEvent.new(vehicle: table, state: integer)` | 23 | ✍ Creates the event with its data: the vehicle and a state (`RidgeMarker.SEND_NUM_BITS` bits; the constructor asserts it is below `RidgeMarker.MAX_NUM_RIDGEMARKERS`). |
| `RidgeMarkerSetStateEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Reads the event data from the network stream (the vehicle and a state (`RidgeMarker.SEND_NUM_BITS` bits; the constructor asserts it is below `RidgeMarker.MAX_NUM_RIDGEMARKERS`)), then calls `run`. |
| `RidgeMarkerSetStateEvent:writeStream(streamId: integer, connection: Connection)` | 45 | ✍ Writes the event data to the network stream (the vehicle and a state (`RidgeMarker.SEND_NUM_BITS` bits; the constructor asserts it is below `RidgeMarker.MAX_NUM_RIDGEMARKERS`)). |
| `RidgeMarkerSetStateEvent:run(connection: Connection)` | 53 | ✍ Executes the event on the receiving side: calls `setRidgeMarkerState(state, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `RidgeMarkerSetStateEvent.sendEvent(vehicle: table, state: integer, noEventSend: boolean)` | 68 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
