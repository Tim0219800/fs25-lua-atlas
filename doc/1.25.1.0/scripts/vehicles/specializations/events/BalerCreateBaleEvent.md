# vehicles/specializations/events/BalerCreateBaleEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/BalerCreateBaleEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BalerCreateBaleEvent.lua` — FS25 1.25.1.0

✍ Network event class `BalerCreateBaleEvent` (extends `Event`) that tells clients that a baler created a bale. It carries the vehicle, the bale time (float32), the bale fill type, and optionally the network id of the bale object. It belongs to the vehicle specialization events and defines nothing else.

- **BalerCreateBaleEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `BalerCreateBaleEvent.emptyNew() → table` | 14 | ✍ Creates an empty `BalerCreateBaleEvent` instance without data, used when the event is read from a network stream. |
| `BalerCreateBaleEvent.new(object: table, baleFillType: integer, baleTime: number, baleServerId: any)` | 24 | ✍ Creates the event with its data: the vehicle, the bale time (float32), the bale fill type, and optionally the network id of the bale object. |
| `BalerCreateBaleEvent:readStream(streamId: integer, connection: Connection)` | 37 | ✍ Reads the event data from the network stream (the vehicle, the bale time (float32), the bale fill type, and optionally the network id of the bale object), then calls `run`. |
| `BalerCreateBaleEvent:writeStream(streamId: integer, connection: Connection)` | 52 | ✍ Writes the event data to the network stream (the vehicle, the bale time (float32), the bale fill type, and optionally the network id of the bale object). |
| `BalerCreateBaleEvent:run(connection: Connection)` | 64 | ✍ Executes the event on the receiving side: calls `createBale(fillType, nil, baleServerId)`, then sets the time of the last entry of `spec_baler.bales` (no rebroadcast in `run`). |
