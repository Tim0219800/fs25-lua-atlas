# vehicles/specializations/events/BalerSetBaleTimeEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/BalerSetBaleTimeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BalerSetBaleTimeEvent.lua` — FS25 1.25.1.0

✍ Network event class `BalerSetBaleTimeEvent` (extends `Event`) that synchronizes the time value of one bale held by a baler. It carries the vehicle, a bale index (int32) and a time (float32). It belongs to the vehicle specialization events and defines nothing else.


## Functions

| Function | Line | Description |
|---|---|---|
| `BalerSetBaleTimeEvent.emptyNew() → table` | 15 | ✍ Creates an empty `BalerSetBaleTimeEvent` instance without data, used when the event is read from a network stream. |
| `BalerSetBaleTimeEvent.new(object: table, bale: integer, baleTime: number)` | 25 | ✍ Creates the event with its data: the vehicle, a bale index (int32) and a time (float32). |
| `BalerSetBaleTimeEvent:readStream(streamId: integer, connection: Connection)` | 37 | ✍ Reads the event data from the network stream (the vehicle, a bale index (int32) and a time (float32)), then calls `run`. |
| `BalerSetBaleTimeEvent:writeStream(streamId: integer, connection: Connection)` | 48 | ✍ Writes the event data to the network stream (the vehicle, a bale index (int32) and a time (float32)). |
| `BalerSetBaleTimeEvent:run(connection: Connection)` | 57 | ✍ Executes the event on the receiving side: calls `setBaleTime(bale, baleTime)` on the vehicle (no rebroadcast in `run`). |
