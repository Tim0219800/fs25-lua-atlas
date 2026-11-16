# vehicles/specializations/events/PlantLimitToFieldEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/PlantLimitToFieldEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/PlantLimitToFieldEvent.lua` — FS25 1.25.1.0

✍ Network event class `PlantLimitToFieldEvent` (extends `Event`) that replicates the limit-planting-to-field option of a planter. It carries the vehicle and a boolean. It belongs to the vehicle specialization events and defines nothing else.

- **PlantLimitToFieldEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlantLimitToFieldEvent.emptyNew() → table` | 14 | ✍ Creates an empty `PlantLimitToFieldEvent` instance without data, used when the event is read from a network stream. |
| `PlantLimitToFieldEvent.new(object: table, plantLimitToField: boolean)` | 23 | ✍ Creates the event with its data: the vehicle and a boolean. |
| `PlantLimitToFieldEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the event data from the network stream (the vehicle and a boolean), then calls `run`. |
| `PlantLimitToFieldEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the event data to the network stream (the vehicle and a boolean). |
| `PlantLimitToFieldEvent:run(connection: Connection)` | 52 | ✍ Executes the event on the receiving side: calls `setPlantLimitToField(value, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `PlantLimitToFieldEvent.sendEvent(vehicle: table, plantLimitToField: boolean, noEventSend: boolean)` | 67 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
