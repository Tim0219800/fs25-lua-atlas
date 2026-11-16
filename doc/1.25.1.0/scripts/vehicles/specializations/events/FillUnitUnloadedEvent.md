# vehicles/specializations/events/FillUnitUnloadedEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/FillUnitUnloadedEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/FillUnitUnloadedEvent.lua` — FS25 1.25.1.0

✍ Network event class `FillUnitUnloadedEvent` (extends `Event`) that is the server result of a fill unit unload, carrying either a created pallet position or a warning/result. It carries the vehicle plus either a pallet with compressed world position and Euler angles, or a show-warning flag and a 2-bit result (0 nil, 1 false, 2 true). It belongs to the vehicle specialization events and defines nothing else.

- **FillUnitUnloadedEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `FillUnitUnloadedEvent.emptyNew() → table` | 14 | ✍ Creates an empty `FillUnitUnloadedEvent` instance without data, used when the event is read from a network stream. |
| `FillUnitUnloadedEvent.new(object: table, pallet: any, showWarning: any, result: any)` | 22 | ✍ Creates the event with its data: the vehicle plus either a pallet with compressed world position and Euler angles, or a show-warning flag and a 2-bit result (0 nil, 1 false, 2 true). |
| `FillUnitUnloadedEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Reads the event data from the network stream (the vehicle plus either a pallet with compressed world position and Euler angles, or a show-warning flag and a 2-bit result (0 nil, 1 false, 2 true)), then calls `run`. |
| `FillUnitUnloadedEvent:writeStream(streamId: integer, connection: Connection)` | 70 | ✍ Writes the event data to the network stream (the vehicle plus either a pallet with compressed world position and Euler angles, or a show-warning flag and a 2-bit result (0 nil, 1 false, 2 true)). |
| `FillUnitUnloadedEvent:run(connection: Connection)` | 101 | ✍ Executes the event on the receiving side: with a pallet, unmounts it if needed, places it with `setWorldPositionQuaternion` and raises `onFillUnitUnloadPallet`; otherwise may show a no-space notification and raises `onFillUnitUnloaded` with the result. |
