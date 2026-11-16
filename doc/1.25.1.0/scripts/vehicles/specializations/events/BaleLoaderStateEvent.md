# vehicles/specializations/events/BaleLoaderStateEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/BaleLoaderStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BaleLoaderStateEvent.lua` — FS25 1.25.1.0

✍ Network event class `BaleLoaderStateEvent` (extends `Event`) that replicates a state change of a bale loader. It carries the vehicle, an int8 state id and, only for `BaleLoader.CHANGE_GRAB_BALE`, the network id of the nearest bale. It belongs to the vehicle specialization events and defines nothing else.

- **BaleLoaderStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `BaleLoaderStateEvent.emptyNew() → table` | 14 | ✍ Creates an empty `BaleLoaderStateEvent` instance without data, used when the event is read from a network stream. |
| `BaleLoaderStateEvent.new(object: table, stateId: integer, nearestBaleServerId: integer?) → BaleLoaderStateEvent` | 25 | ✍ Creates the event with its data: the vehicle, an int8 state id and, only for `BaleLoader.CHANGE_GRAB_BALE`, the network id of the nearest bale. |
| `BaleLoaderStateEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Reads the event data from the network stream (the vehicle, an int8 state id and, only for `BaleLoader.CHANGE_GRAB_BALE`, the network id of the nearest bale), then calls `run`. |
| `BaleLoaderStateEvent:writeStream(streamId: integer, connection: Connection)` | 52 | ✍ Writes the event data to the network stream (the vehicle, an int8 state id and, only for `BaleLoader.CHANGE_GRAB_BALE`, the network id of the nearest bale). |
| `BaleLoaderStateEvent:run(connection: Connection)` | 63 | ✍ Executes the event on the receiving side: calls `doStateChange(stateId, nearestBaleServerId)` on the vehicle (no rebroadcast in `run`). |
