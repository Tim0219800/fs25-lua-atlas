# vehicles/specializations/events/BalerSetIsUnloadingBaleEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/BalerSetIsUnloadingBaleEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BalerSetIsUnloadingBaleEvent.lua` — FS25 1.25.1.0

✍ Network event class `BalerSetIsUnloadingBaleEvent` (extends `Event`) that replicates the unloading-bale state of a baler. It carries the vehicle and a boolean. It belongs to the vehicle specialization events and defines nothing else.

- **BalerSetIsUnloadingBaleEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `BalerSetIsUnloadingBaleEvent.emptyNew() → table` | 14 | ✍ Creates an empty `BalerSetIsUnloadingBaleEvent` instance without data, used when the event is read from a network stream. |
| `BalerSetIsUnloadingBaleEvent.new(object: table, isUnloadingBale: boolean)` | 23 | ✍ Creates the event with its data: the vehicle and a boolean. |
| `BalerSetIsUnloadingBaleEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the event data from the network stream (the vehicle and a boolean), then calls `run`. |
| `BalerSetIsUnloadingBaleEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the event data to the network stream (the vehicle and a boolean). |
| `BalerSetIsUnloadingBaleEvent:run(connection: Connection)` | 52 | ✍ Executes the event on the receiving side: calls `setIsUnloadingBale(value, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `BalerSetIsUnloadingBaleEvent.sendEvent(object: table, isUnloadingBale: boolean, noEventSend: boolean)` | 67 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
