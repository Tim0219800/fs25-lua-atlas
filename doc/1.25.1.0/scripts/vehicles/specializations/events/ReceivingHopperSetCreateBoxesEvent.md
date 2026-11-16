# vehicles/specializations/events/ReceivingHopperSetCreateBoxesEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/ReceivingHopperSetCreateBoxesEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/ReceivingHopperSetCreateBoxesEvent.lua` — FS25 1.25.1.0

✍ Network event class `ReceivingHopperSetCreateBoxesEvent` (extends `Event`) that replicates whether a receiving hopper creates boxes. It carries the vehicle and a boolean. It belongs to the vehicle specialization events and defines nothing else.

- **ReceivingHopperSetCreateBoxesEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `ReceivingHopperSetCreateBoxesEvent.emptyNew() → table` | 14 | ✍ Creates an empty `ReceivingHopperSetCreateBoxesEvent` instance without data, used when the event is read from a network stream. |
| `ReceivingHopperSetCreateBoxesEvent.new(object: table, state: boolean)` | 23 | ✍ Creates the event with its data: the vehicle and a boolean. |
| `ReceivingHopperSetCreateBoxesEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the event data from the network stream (the vehicle and a boolean), then calls `run`. |
| `ReceivingHopperSetCreateBoxesEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the event data to the network stream (the vehicle and a boolean). |
| `ReceivingHopperSetCreateBoxesEvent:run(connection: Connection)` | 52 | ✍ Executes the event on the receiving side: calls `setCreateBoxes(state, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `ReceivingHopperSetCreateBoxesEvent.sendEvent(vehicle: table, state: boolean, noEventSend: boolean)` | 67 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
