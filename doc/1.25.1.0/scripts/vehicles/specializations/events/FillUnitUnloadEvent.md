# vehicles/specializations/events/FillUnitUnloadEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/FillUnitUnloadEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/FillUnitUnloadEvent.lua` — FS25 1.25.1.0

✍ Network event class `FillUnitUnloadEvent` (extends `Event`) that is a client request to unload the fill units of a vehicle. It carries the vehicle, written only when the stream goes to the server. It belongs to the vehicle specialization events and defines nothing else.

- **FillUnitUnloadEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `FillUnitUnloadEvent.emptyNew() → table` | 14 | ✍ Creates an empty `FillUnitUnloadEvent` instance without data, used when the event is read from a network stream. |
| `FillUnitUnloadEvent.new(object: table)` | 22 | ✍ Creates the event with its data: the vehicle, written only when the stream goes to the server. |
| `FillUnitUnloadEvent.newServerToClient()` | 30 | ✍ Creates the event instance meant to go from the server to clients; it carries no vehicle data. |
| `FillUnitUnloadEvent:readStream(streamId: integer, connection: Connection)` | 39 | ✍ Reads the event data from the network stream (the vehicle, written only when the stream goes to the server), then calls `run`. |
| `FillUnitUnloadEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Writes the event data to the network stream (the vehicle, written only when the stream goes to the server). |
| `FillUnitUnloadEvent:run(connection: Connection)` | 59 | ✍ Executes the event on the receiving side: on the server only, calls `unloadFillUnits(true)` on the vehicle. |
