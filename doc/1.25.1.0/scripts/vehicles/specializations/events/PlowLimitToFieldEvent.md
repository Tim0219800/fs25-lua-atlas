# vehicles/specializations/events/PlowLimitToFieldEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/PlowLimitToFieldEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/PlowLimitToFieldEvent.lua` — FS25 1.25.1.0

✍ Network event class `PlowLimitToFieldEvent` (extends `Event`) that replicates the limit-plowing-to-field option of a plow. It carries the vehicle and a boolean. It belongs to the vehicle specialization events and defines nothing else.

- **PlowLimitToFieldEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlowLimitToFieldEvent.emptyNew() → table` | 14 | ✍ Creates an empty `PlowLimitToFieldEvent` instance without data, used when the event is read from a network stream. |
| `PlowLimitToFieldEvent.new(object: table, plowLimitToField: boolean)` | 23 | ✍ Creates the event with its data: the vehicle and a boolean. |
| `PlowLimitToFieldEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the event data from the network stream (the vehicle and a boolean), then calls `run`. |
| `PlowLimitToFieldEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the event data to the network stream (the vehicle and a boolean). |
| `PlowLimitToFieldEvent:run(connection: Connection)` | 52 | ✍ Executes the event on the receiving side: calls `setPlowLimitToField(value, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
