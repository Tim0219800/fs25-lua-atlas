# vehicles/specializations/events/SetCruiseControlStateEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/SetCruiseControlStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetCruiseControlStateEvent.lua` — FS25 1.25.1.0

✍ Network event class `SetCruiseControlStateEvent` (extends `Event`) that replicates the cruise control state. It carries the vehicle and a state (2 bits). It belongs to the vehicle specialization events and defines nothing else.

- **SetCruiseControlStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `SetCruiseControlStateEvent.emptyNew() → table` | 14 | ✍ Creates an empty `SetCruiseControlStateEvent` instance without data, used when the event is read from a network stream. |
| `SetCruiseControlStateEvent.new(vehicle: table, state: integer)` | 23 | ✍ Creates the event with its data: the vehicle and a state (2 bits). |
| `SetCruiseControlStateEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the event data from the network stream (the vehicle and a state (2 bits)), then calls `run`. |
| `SetCruiseControlStateEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the event data to the network stream (the vehicle and a state (2 bits)). |
| `SetCruiseControlStateEvent:run(connection: Connection)` | 52 | ✍ Executes the event on the receiving side: calls `setCruiseControlState(state, true)` on the vehicle (no rebroadcast in `run`). |
