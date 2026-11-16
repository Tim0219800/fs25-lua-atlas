# vehicles/specializations/events/SetTurnedOnEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/SetTurnedOnEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetTurnedOnEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes the turned-on state of a vehicle or implement between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **SetTurnedOnEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `SetTurnedOnEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `SetTurnedOnEvent.new(object: table, isTurnedOn: boolean)` | 23 | ✍ Builds the event with the data to send (a node object and a boolean turned-on state); stored on the instance for `writeStream`. |
| `SetTurnedOnEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads a node object and a boolean turned-on state from the stream, then calls `run(connection)`. |
| `SetTurnedOnEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes a node object and a boolean turned-on state to the stream (same order as `readStream`). |
| `SetTurnedOnEvent:run(connection: Connection)` | 52 | ✍ Applies the event on the receiving side: on the server re-broadcasts itself to the other clients, then calls `setIsTurnedOn(state, true)` on the object if synchronized. |
| `SetTurnedOnEvent.sendEvent(vehicle: table, isTurnedOn: boolean, noEventSend: boolean)` | 67 | ✍ Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true. |
