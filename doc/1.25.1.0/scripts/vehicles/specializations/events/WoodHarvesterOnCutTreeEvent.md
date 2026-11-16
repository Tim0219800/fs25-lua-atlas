# vehicles/specializations/events/WoodHarvesterOnCutTreeEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/WoodHarvesterOnCutTreeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/WoodHarvesterOnCutTreeEvent.lua` — FS25 1.25.1.0

✍ Server-to-client event that raises the `onCutTree` specialization event with the cut radius so clients can play cut effects. It has no sendEvent helper. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **WoodHarvesterOnCutTreeEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `WoodHarvesterOnCutTreeEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `WoodHarvesterOnCutTreeEvent.new(object: table, radius: number)` | 23 | ✍ Builds the event with the data to send (a node object and a float32 radius); stored on the instance for `writeStream`. |
| `WoodHarvesterOnCutTreeEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads a node object and a float32 radius from the stream, then calls `run(connection)`. |
| `WoodHarvesterOnCutTreeEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes a node object and a float32 radius to the stream (same order as `readStream`). |
| `WoodHarvesterOnCutTreeEvent:run(connection: Connection)` | 52 | ✍ Applies the event on the receiving side: calls `SpecializationUtil.raiseEvent(object, 'onCutTree', radius)` if synchronized; on the server it first re-broadcasts a new event. |
