# vehicles/specializations/events/TreeDetachEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/TreeDetachEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TreeDetachEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes the detachment of a tree from a forestry carriage or winch, optionally for a given rope index. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **TreeDetachEvent** inherits from `Event` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `TreeDetachEvent.emptyNew() → table` | 21 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `TreeDetachEvent.new(object: table, ropeIndex: table) → table` | 31 | ✍ Builds the event with the data to send (a node object and an optional rope index on 4 bits); stored on the instance for `writeStream`. |
| `TreeDetachEvent:readStream(streamId: integer, connection: Connection)` | 43 | ✍ Reads a node object and an optional rope index on 4 bits from the stream, then calls `run(connection)`. |
| `TreeDetachEvent:writeStream(streamId: integer, connection: Connection)` | 57 | ✍ Writes a node object and an optional rope index on 4 bits to the stream (same order as `readStream`). |
| `TreeDetachEvent:run(connection: Connection)` | 68 | ✍ Applies the event on the receiving side: on the server re-broadcasts itself, then calls `detachTreeFromCarriage` or `detachTreeFromWinch` with the rope index. |
| `TreeDetachEvent.sendEvent(vehicle: table, ropeIndex: boolean, noEventSend: boolean)` | 86 | ✍ Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true. |
