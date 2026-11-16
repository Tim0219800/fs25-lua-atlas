# vehicles/specializations/events/WoodHarvesterCutTreeEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/WoodHarvesterCutTreeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/WoodHarvesterCutTreeEvent.lua` — FS25 1.25.1.0

✍ Network event that makes a wood harvester cut the held tree at a given length, synchronized between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **WoodHarvesterCutTreeEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `WoodHarvesterCutTreeEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `WoodHarvesterCutTreeEvent.new(object: table, length: number)` | 23 | ✍ Builds the event with the data to send (a node object and a float32 cut length); stored on the instance for `writeStream`. |
| `WoodHarvesterCutTreeEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads a node object and a float32 cut length from the stream, then calls `run(connection)`. |
| `WoodHarvesterCutTreeEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes a node object and a float32 cut length to the stream (same order as `readStream`). |
| `WoodHarvesterCutTreeEvent:run(connection: Connection)` | 52 | ✍ Applies the event on the receiving side: calls `cutTree(length, true)` on the object if synchronized; on the server it first re-broadcasts a new event to the other clients. |
| `WoodHarvesterCutTreeEvent.sendEvent(object: table, length: number, noEventSend: boolean)` | 67 | ✍ Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true. |
