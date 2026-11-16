# vehicles/specializations/events/CombineStrawEnableEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/CombineStrawEnableEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/CombineStrawEnableEvent.lua` — FS25 1.25.1.0

✍ Network event class `CombineStrawEnableEvent` (extends `Event`) that replicates the swath (straw) output toggle of a combine. It carries the vehicle and a swath-active boolean. It belongs to the vehicle specialization events and defines nothing else.

- **CombineStrawEnableEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `CombineStrawEnableEvent.emptyNew() → table` | 14 | ✍ Creates an empty `CombineStrawEnableEvent` instance without data, used when the event is read from a network stream. |
| `CombineStrawEnableEvent.new(vehicle: table, isSwathActive: boolean)` | 23 | ✍ Creates the event with its data: the vehicle and a swath-active boolean. |
| `CombineStrawEnableEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the event data from the network stream (the vehicle and a swath-active boolean), then calls `run`. |
| `CombineStrawEnableEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the event data to the network stream (the vehicle and a swath-active boolean). |
| `CombineStrawEnableEvent:run(connection: Connection)` | 52 | ✍ Executes the event on the receiving side: calls `setIsSwathActive(value, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `CombineStrawEnableEvent.sendEvent(vehicle: table, isSwathActive: boolean, noEventSend: boolean)` | 67 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
