# vehicles/specializations/events/BaleWrapperAutomaticDropEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/BaleWrapperAutomaticDropEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BaleWrapperAutomaticDropEvent.lua` — FS25 1.25.1.0

✍ Network event class `BaleWrapperAutomaticDropEvent` (extends `Event`) that replicates the automatic-drop setting of a bale wrapper. It carries the vehicle and a boolean. It belongs to the vehicle specialization events and defines nothing else.

- **BaleWrapperAutomaticDropEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `BaleWrapperAutomaticDropEvent.emptyNew() → table` | 14 | ✍ Creates an empty `BaleWrapperAutomaticDropEvent` instance without data, used when the event is read from a network stream. |
| `BaleWrapperAutomaticDropEvent.new(object: table, automaticDrop: boolean)` | 22 | ✍ Creates the event with its data: the vehicle and a boolean. |
| `BaleWrapperAutomaticDropEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Reads the event data from the network stream (the vehicle and a boolean), then calls `run`. |
| `BaleWrapperAutomaticDropEvent:writeStream(streamId: integer, connection: Connection)` | 43 | ✍ Writes the event data to the network stream (the vehicle and a boolean). |
| `BaleWrapperAutomaticDropEvent:run(connection: Connection)` | 51 | ✍ Executes the event on the receiving side: calls `setBaleWrapperAutomaticDrop(value, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `BaleWrapperAutomaticDropEvent.sendEvent(object: table, automaticDrop: boolean, noEventSend: boolean)` | 66 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
