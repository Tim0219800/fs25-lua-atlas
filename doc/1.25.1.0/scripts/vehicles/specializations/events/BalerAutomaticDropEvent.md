# vehicles/specializations/events/BalerAutomaticDropEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/BalerAutomaticDropEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BalerAutomaticDropEvent.lua` — FS25 1.25.1.0

✍ Network event class `BalerAutomaticDropEvent` (extends `Event`) that replicates the automatic bale drop setting of a baler. It carries the vehicle and a boolean. It belongs to the vehicle specialization events and defines nothing else.

- **BalerAutomaticDropEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `BalerAutomaticDropEvent.emptyNew() → table` | 14 | ✍ Creates an empty `BalerAutomaticDropEvent` instance without data, used when the event is read from a network stream. |
| `BalerAutomaticDropEvent.new(object: table, automaticDrop: boolean)` | 22 | ✍ Creates the event with its data: the vehicle and a boolean. |
| `BalerAutomaticDropEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Reads the event data from the network stream (the vehicle and a boolean), then calls `run`. |
| `BalerAutomaticDropEvent:writeStream(streamId: integer, connection: Connection)` | 43 | ✍ Writes the event data to the network stream (the vehicle and a boolean). |
| `BalerAutomaticDropEvent:run(connection: Connection)` | 51 | ✍ Executes the event on the receiving side: calls `setBalerAutomaticDrop(value, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `BalerAutomaticDropEvent.sendEvent(object: table, automaticDrop: boolean, noEventSend: boolean)` | 66 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
