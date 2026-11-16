# vehicles/specializations/events/SetFillUnitCapacityEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/SetFillUnitCapacityEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetFillUnitCapacityEvent.lua` — FS25 1.25.1.0

✍ Network event class `SetFillUnitCapacityEvent` (extends `Event`) that replicates a new capacity for a fill unit. It carries the vehicle, a fill unit index (8 bits) and a capacity (float32). It belongs to the vehicle specialization events and defines nothing else.

- **SetFillUnitCapacityEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `SetFillUnitCapacityEvent.emptyNew() → table` | 14 | ✍ Creates an empty `SetFillUnitCapacityEvent` instance without data, used when the event is read from a network stream. |
| `SetFillUnitCapacityEvent.new(vehicle: table, fillUnitIndex: boolean, capacity: boolean)` | 23 | ✍ Creates the event with its data: the vehicle, a fill unit index (8 bits) and a capacity (float32). |
| `SetFillUnitCapacityEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Reads the event data from the network stream (the vehicle, a fill unit index (8 bits) and a capacity (float32)), then calls `run`. |
| `SetFillUnitCapacityEvent:writeStream(streamId: integer, connection: Connection)` | 46 | ✍ Writes the event data to the network stream (the vehicle, a fill unit index (8 bits) and a capacity (float32)). |
| `SetFillUnitCapacityEvent:run(connection: Connection)` | 55 | ✍ Executes the event on the receiving side: calls `setFillUnitCapacity(fillUnitIndex, capacity, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `SetFillUnitCapacityEvent.sendEvent(vehicle: table, fillUnitIndex: boolean, capacity: boolean, noEventSend: boolean)` | 70 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
