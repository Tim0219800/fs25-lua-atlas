# vehicles/specializations/events/CraneShovelEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/CraneShovelEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/CraneShovelEvent.lua` — FS25 1.25.1.0

✍ Network event class `CraneShovelEvent` (extends `Event`) that replicates the state of a crane shovel. It carries the vehicle and a boolean state. It belongs to the vehicle specialization events and defines nothing else.

- **CraneShovelEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `CraneShovelEvent.emptyNew() → table` | 14 | ✍ Creates an empty `CraneShovelEvent` instance without data, used when the event is read from a network stream. |
| `CraneShovelEvent.new(object: table, state: any)` | 22 | ✍ Creates the event with its data: the vehicle and a boolean state. |
| `CraneShovelEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Reads the event data from the network stream (the vehicle and a boolean state), then calls `run`. |
| `CraneShovelEvent:writeStream(streamId: integer, connection: Connection)` | 46 | ✍ Writes the event data to the network stream (the vehicle and a boolean state). |
| `CraneShovelEvent:run(connection: Connection)` | 54 | ✍ Executes the event on the receiving side: calls `setCraneShovelState(state, nil, true)` on the vehicle (no rebroadcast in `run`). |
| `CraneShovelEvent.sendEvent(object: table, state: boolean, noEventSend: boolean)` | 65 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
