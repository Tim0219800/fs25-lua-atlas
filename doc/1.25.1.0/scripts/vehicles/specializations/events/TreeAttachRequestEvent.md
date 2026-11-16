# vehicles/specializations/events/TreeAttachRequestEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/TreeAttachRequestEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TreeAttachRequestEvent.lua` — FS25 1.25.1.0

✍ Client-to-server request to attach a tree to a forestry carriage or winch. The server checks permission and either attaches the tree or answers with a TreeAttachResponseEvent carrying the failure reason. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **TreeAttachRequestEvent** inherits from `Event` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `TreeAttachRequestEvent.emptyNew() → table` | 21 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `TreeAttachRequestEvent.new(object: table, splitShapeId: table, x: any, y: any, z: any, ropeIndex: any, setupRope: any) → table` | 31 | ✍ Builds the event with the data to send (a node object, a split shape id, three float32 coordinates, an optional rope index (3 bits) and optional rope setup data (ForestryPhysicsRope)); stored on the instance for `writeStream`. |
| `TreeAttachRequestEvent:readStream(streamId: integer, connection: Connection)` | 48 | ✍ Reads a node object, a split shape id, three float32 coordinates, an optional rope index (3 bits) and optional rope setup data (ForestryPhysicsRope) from the stream, then calls `run(connection)`. |
| `TreeAttachRequestEvent:writeStream(streamId: integer, connection: Connection)` | 70 | ✍ Writes a node object, a split shape id, three float32 coordinates, an optional rope index (3 bits) and optional rope setup data (ForestryPhysicsRope) to the stream (same order as `readStream`). |
| `TreeAttachRequestEvent:run(connection: Connection)` | 89 | ✍ Applies the event on the receiving side: asks `getIsCarriageTreeAttachAllowed` or `getIsWinchTreeAttachAllowed`; if allowed it calls `attachTreeToCarriage` or `attachTreeToWinch`, otherwise it sends a TreeAttachResponseEvent only to the requesting connection. |
