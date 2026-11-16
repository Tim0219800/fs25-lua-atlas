# vehicles/specializations/events/WoodContainerWrongLengthEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/WoodContainerWrongLengthEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/WoodContainerWrongLengthEvent.lua` — FS25 1.25.1.0

✍ Server-to-client notification that a log of the wrong length was delivered to a wood container. Only the owning farm, within 40 m of the camera, sees a critical in-game notification. The constructor's extra arguments (state, x, y, z) are ignored. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **WoodContainerWrongLengthEvent** inherits from `Event` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `WoodContainerWrongLengthEvent.emptyNew() → table` | 19 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `WoodContainerWrongLengthEvent.new(object: table, state: table, x: any, y: any, z: any) → table` | 29 | ✍ Builds the event with the data to send (only the node object); stored on the instance for `writeStream`. |
| `WoodContainerWrongLengthEvent:readStream(streamId: integer, connection: integer)` | 40 | ✍ Reads only the node object from the stream, then calls `run(connection)`. |
| `WoodContainerWrongLengthEvent:writeStream(streamId: integer, connection: integer)` | 50 | ✍ Writes only the node object to the stream (same order as `readStream`). |
| `WoodContainerWrongLengthEvent:run(connection: integer)` | 57 | ✍ Applies the event on the receiving side: if the local farm owns the object and the camera is closer than 40 m, adds a critical in-game notification showing the target length from `spec_woodContainer`. |
