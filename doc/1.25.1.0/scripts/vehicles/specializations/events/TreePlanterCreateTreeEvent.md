# vehicles/specializations/events/TreePlanterCreateTreeEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/TreePlanterCreateTreeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TreePlanterCreateTreeEvent.lua` — FS25 1.25.1.0

✍ Network event that triggers creation of a tree on a tree planter on all peers. The constructor accepts tree type and variation arguments but they are ignored and not sent. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **TreePlanterCreateTreeEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `TreePlanterCreateTreeEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `TreePlanterCreateTreeEvent.new(object: table, treeTypeIndex: integer, treeVariationIndex: any)` | 23 | ✍ Builds the event with the data to send (only the node object); stored on the instance for `writeStream`. |
| `TreePlanterCreateTreeEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Reads only the node object from the stream, then calls `run(connection)`. |
| `TreePlanterCreateTreeEvent:writeStream(streamId: integer, connection: Connection)` | 42 | ✍ Writes only the node object to the stream (same order as `readStream`). |
| `TreePlanterCreateTreeEvent:run(connection: Connection)` | 49 | ✍ Applies the event on the receiving side: on the server re-broadcasts itself, then calls `createTree(true)` on the object if synchronized. |
| `TreePlanterCreateTreeEvent.sendEvent(object: table, noEventSend: boolean)` | 64 | ✍ Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true. |
