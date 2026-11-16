# vehicles/specializations/events/LocomotiveStateEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/LocomotiveStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/LocomotiveStateEvent.lua` — FS25 1.25.1.0

✍ Network event class `LocomotiveStateEvent` (extends `Event`) that replicates the state of a locomotive. It carries the vehicle and a state (`Locomotive.NUM_BITS_STATE` bits). It belongs to the vehicle specialization events and defines nothing else.

- **LocomotiveStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `LocomotiveStateEvent.emptyNew() → table` | 14 | ✍ Creates an empty `LocomotiveStateEvent` instance without data, used when the event is read from a network stream. |
| `LocomotiveStateEvent.new(object: table, state: boolean)` | 23 | ✍ Creates the event with its data: the vehicle and a state (`Locomotive.NUM_BITS_STATE` bits). |
| `LocomotiveStateEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the event data from the network stream (the vehicle and a state (`Locomotive.NUM_BITS_STATE` bits)), then calls `run`. |
| `LocomotiveStateEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the event data to the network stream (the vehicle and a state (`Locomotive.NUM_BITS_STATE` bits)). |
| `LocomotiveStateEvent:run(connection: Connection)` | 52 | ✍ Executes the event on the receiving side: calls `setLocomotiveState(state, true)` on the vehicle (no rebroadcast in `run`). |
