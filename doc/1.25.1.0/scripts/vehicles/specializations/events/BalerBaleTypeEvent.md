# vehicles/specializations/events/BalerBaleTypeEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/BalerBaleTypeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BalerBaleTypeEvent.lua` — FS25 1.25.1.0

✍ Network event class `BalerBaleTypeEvent` (extends `Event`) that replicates the selected bale type of a baler. It carries the vehicle, a bale type index (`BalerBaleTypeEvent.BALE_TYPE_SEND_NUM_BITS` bits) and a force flag (false if nil). It belongs to the vehicle specialization events and defines nothing else.

- **BalerBaleTypeEvent** inherits from `Event` (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `BalerBaleTypeEvent.emptyNew() → table` | 17 | ✍ Creates an empty `BalerBaleTypeEvent` instance without data, used when the event is read from a network stream. |
| `BalerBaleTypeEvent.new(object: table, baleTypeIndex: integer, force: boolean)` | 26 | ✍ Creates the event with its data: the vehicle, a bale type index (`BalerBaleTypeEvent.BALE_TYPE_SEND_NUM_BITS` bits) and a force flag (false if nil). |
| `BalerBaleTypeEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Reads the event data from the network stream (the vehicle, a bale type index (`BalerBaleTypeEvent.BALE_TYPE_SEND_NUM_BITS` bits) and a force flag (false if nil)), then calls `run`. |
| `BalerBaleTypeEvent:writeStream(streamId: integer, connection: Connection)` | 49 | ✍ Writes the event data to the network stream (the vehicle, a bale type index (`BalerBaleTypeEvent.BALE_TYPE_SEND_NUM_BITS` bits) and a force flag (false if nil)). |
| `BalerBaleTypeEvent:run(connection: Connection)` | 58 | ✍ Executes the event on the receiving side: calls `setBaleTypeIndex(index, force, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `BalerBaleTypeEvent.sendEvent(object: table, baleTypeIndex: integer, force: boolean, noEventSend: boolean)` | 74 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
