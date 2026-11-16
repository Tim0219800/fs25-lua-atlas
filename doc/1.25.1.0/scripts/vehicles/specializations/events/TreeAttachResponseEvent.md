# vehicles/specializations/events/TreeAttachResponseEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/TreeAttachResponseEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TreeAttachResponseEvent.lua` — FS25 1.25.1.0

✍ Server-to-client answer to a refused tree attach request. It carries a failure reason code so the client can show a warning. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **TreeAttachResponseEvent** inherits from `Event` (l.20)

## Functions

| Function | Line | Description |
|---|---|---|
| `TreeAttachResponseEvent.emptyNew() → table` | 27 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `TreeAttachResponseEvent.new(object: table, failedReason: table, ropeIndex: any) → table` | 37 | ✍ Builds the event with the data to send (a node object, a failure reason (TreeAttachResponseEvent.TREE_ATTACH_FAIL_REASON_NUM_BITS bits) and an optional rope index (3 bits)); stored on the instance for `writeStream`. |
| `TreeAttachResponseEvent:readStream(streamId: integer, connection: Connection)` | 50 | ✍ Reads a node object, a failure reason (TreeAttachResponseEvent.TREE_ATTACH_FAIL_REASON_NUM_BITS bits) and an optional rope index (3 bits) from the stream, then calls `run(connection)`. |
| `TreeAttachResponseEvent:writeStream(streamId: integer, connection: Connection)` | 65 | ✍ Writes a node object, a failure reason (TreeAttachResponseEvent.TREE_ATTACH_FAIL_REASON_NUM_BITS bits) and an optional rope index (3 bits) to the stream (same order as `readStream`). |
| `TreeAttachResponseEvent:run(connection: Connection)` | 77 | ✍ Applies the event on the receiving side: calls `showCarriageTreeMountFailedWarning` or `showWinchTreeMountFailedWarning` on the object, depending on which one it has. |
