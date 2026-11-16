# vehicles/specializations/events/TreePlanterTreeTypeEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/TreePlanterTreeTypeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TreePlanterTreeTypeEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes the selected tree type and variation of a tree planter. The variation defaults to 1 when writing if nil. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **TreePlanterTreeTypeEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `TreePlanterTreeTypeEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `TreePlanterTreeTypeEvent.new(object: table, treeTypeIndex: integer, treeVariationIndex: any)` | 23 | ✍ Builds the event with the data to send (a node object, a 32-bit tree type index and a variation index (TreePlantManager.VARIATION_NUM_BITS bits)); stored on the instance for `writeStream`. |
| `TreePlanterTreeTypeEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Reads a node object, a 32-bit tree type index and a variation index (TreePlantManager.VARIATION_NUM_BITS bits) from the stream, then calls `run(connection)`. |
| `TreePlanterTreeTypeEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Writes a node object, a 32-bit tree type index and a variation index (TreePlantManager.VARIATION_NUM_BITS bits) to the stream (same order as `readStream`). |
| `TreePlanterTreeTypeEvent:run(connection: Connection)` | 56 | ✍ Applies the event on the receiving side: on the server re-broadcasts itself, then calls `setTreePlanterTreeTypeIndex(type, variation, true)` on the object if synchronized. |
| `TreePlanterTreeTypeEvent.sendEvent(object: table, treeTypeIndex: integer, treeVariationIndex: boolean, noEventSend: boolean)` | 71 | ✍ Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true. |
