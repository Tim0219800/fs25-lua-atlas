# vehicles/specializations/events/WoodHarvesterDropTreeEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/WoodHarvesterDropTreeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/WoodHarvesterDropTreeEvent.lua` — FS25 1.25.1.0

✍ Network event that makes a wood harvester drop its held tree, synchronized between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **WoodHarvesterDropTreeEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `WoodHarvesterDropTreeEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `WoodHarvesterDropTreeEvent.new(object: table)` | 23 | ✍ Builds the event with the data to send (only the node object); stored on the instance for `writeStream`. |
| `WoodHarvesterDropTreeEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Reads only the node object from the stream, then calls `run(connection)`. |
| `WoodHarvesterDropTreeEvent:writeStream(streamId: integer, connection: Connection)` | 42 | ✍ Writes only the node object to the stream (same order as `readStream`). |
| `WoodHarvesterDropTreeEvent:run(connection: Connection)` | 49 | ✍ Applies the event on the receiving side: calls `dropWoodHarvesterTree(true)` on the object if synchronized; on the server it first re-broadcasts a new event to the other clients. |
| `WoodHarvesterDropTreeEvent.sendEvent(object: table, noEventSend: boolean)` | 64 | ✍ Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true. |
