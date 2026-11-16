# vehicles/specializations/events/BaleWrapperStateEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/BaleWrapperStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BaleWrapperStateEvent.lua` — FS25 1.25.1.0

✍ Network event class `BaleWrapperStateEvent` (extends `Event`) that replicates a state change of a bale wrapper. It carries the vehicle, an int8 state id and, only for `BaleWrapper.CHANGE_GRAB_BALE`, the network id of the nearest bale. It belongs to the vehicle specialization events and defines nothing else.

- **BaleWrapperStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `BaleWrapperStateEvent.emptyNew() → table` | 14 | ✍ Creates an empty `BaleWrapperStateEvent` instance without data, used when the event is read from a network stream. |
| `BaleWrapperStateEvent.new(object: table, stateId: integer, nearestBaleServerId: integer?) → BaleWrapperStateEvent` | 25 | ✍ Creates the event with its data: the vehicle, an int8 state id and, only for `BaleWrapper.CHANGE_GRAB_BALE`, the network id of the nearest bale. |
| `BaleWrapperStateEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Reads the event data from the network stream (the vehicle, an int8 state id and, only for `BaleWrapper.CHANGE_GRAB_BALE`, the network id of the nearest bale), then calls `run`. |
| `BaleWrapperStateEvent:writeStream(streamId: integer, connection: Connection)` | 51 | ✍ Writes the event data to the network stream (the vehicle, an int8 state id and, only for `BaleWrapper.CHANGE_GRAB_BALE`, the network id of the nearest bale). |
| `BaleWrapperStateEvent:run(connection: Connection)` | 62 | ✍ Executes the event on the receiving side: calls `doStateChange(stateId, nearestBaleServerId)` on the vehicle (no rebroadcast in `run`). |
