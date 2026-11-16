# vehicles/specializations/events/TreeAttachEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/TreeAttachEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TreeAttachEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes the attachment of a tree (split shape) to a forestry carriage or winch at a world position, optionally for a given rope index. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **TreeAttachEvent** inherits from `Event` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `TreeAttachEvent.emptyNew() → table` | 21 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `TreeAttachEvent.new(object: table, splitShapeId: table, x: any, y: any, z: any, ropeIndex: any) → table` | 31 | ✍ Builds the event with the data to send (a node object, a split shape id, three float32 coordinates and an optional rope index on 4 bits); stored on the instance for `writeStream`. |
| `TreeAttachEvent:readStream(streamId: integer, connection: Connection)` | 47 | ✍ Reads a node object, a split shape id, three float32 coordinates and an optional rope index on 4 bits from the stream, then calls `run(connection)`. |
| `TreeAttachEvent:writeStream(streamId: integer, connection: Connection)` | 65 | ✍ Writes a node object, a split shape id, three float32 coordinates and an optional rope index on 4 bits to the stream (same order as `readStream`). |
| `TreeAttachEvent:run(connection: Connection)` | 80 | ✍ Applies the event on the receiving side: calls `attachTreeToCarriage` if the object has it, otherwise `attachTreeToWinch`, passing noEventSend. It does not re-broadcast itself here. |
| `TreeAttachEvent.sendEvent(vehicle: table, splitShapeId: boolean, x: any, y: any, z: any, ropeIndex: any, noEventSend: boolean)` | 94 | ✍ Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true. |
