# vehicles/specializations/events/AttachableStartDetachEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/AttachableStartDetachEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AttachableStartDetachEvent.lua` — FS25 1.25.1.0

✍ Network event class `AttachableStartDetachEvent` (extends `Event`) that replicates the start of the detach process of an attachable implement. It carries only the vehicle (the attachable). It belongs to the vehicle specialization events and defines nothing else.

- **AttachableStartDetachEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `AttachableStartDetachEvent.emptyNew() → table` | 14 | ✍ Creates an empty `AttachableStartDetachEvent` instance without data, used when the event is read from a network stream. |
| `AttachableStartDetachEvent.new(vehicle: table, state: integer, segmentIndex: any, segmentIsLeft: any)` | 23 | ✍ Creates the event with its data: only the vehicle (the attachable). |
| `AttachableStartDetachEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the event data from the network stream (only the vehicle (the attachable)), then calls `run`. |
| `AttachableStartDetachEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the event data to the network stream (only the vehicle (the attachable)). |
| `AttachableStartDetachEvent:run(connection: Connection)` | 51 | ✍ Executes the event on the receiving side: calls `startDetachProcess(true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `AttachableStartDetachEvent.sendEvent(vehicle: table, noEventSend: boolean)` | 66 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
