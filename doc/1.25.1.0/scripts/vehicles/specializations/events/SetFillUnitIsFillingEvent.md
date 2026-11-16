# vehicles/specializations/events/SetFillUnitIsFillingEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/SetFillUnitIsFillingEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetFillUnitIsFillingEvent.lua` — FS25 1.25.1.0

✍ Network event class `SetFillUnitIsFillingEvent` (extends `Event`) that replicates whether a fill unit is being filled. It carries the vehicle and an isFilling boolean. It belongs to the vehicle specialization events and defines nothing else.

- **SetFillUnitIsFillingEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `SetFillUnitIsFillingEvent.emptyNew() → table` | 14 | ✍ Creates an empty `SetFillUnitIsFillingEvent` instance without data, used when the event is read from a network stream. |
| `SetFillUnitIsFillingEvent.new(vehicle: table, isFilling: boolean)` | 23 | ✍ Creates the event with its data: the vehicle and an isFilling boolean. |
| `SetFillUnitIsFillingEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the event data from the network stream (the vehicle and an isFilling boolean), then calls `run`. |
| `SetFillUnitIsFillingEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the event data to the network stream (the vehicle and an isFilling boolean). |
| `SetFillUnitIsFillingEvent:run(connection: Connection)` | 52 | ✍ Executes the event on the receiving side: calls `setFillUnitIsFilling(isFilling, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
