# vehicles/specializations/events/WoodHarvesterOnDelimbTreeEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/WoodHarvesterOnDelimbTreeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/WoodHarvesterOnDelimbTreeEvent.lua` — FS25 1.25.1.0

✍ Server-to-client event that tells clients a wood harvester started or stopped delimbing, so they can update effects. It has no sendEvent helper. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **WoodHarvesterOnDelimbTreeEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `WoodHarvesterOnDelimbTreeEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `WoodHarvesterOnDelimbTreeEvent.new(object: table, state: boolean)` | 22 | ✍ Builds the event with the data to send (a node object and a boolean state); stored on the instance for `writeStream`. |
| `WoodHarvesterOnDelimbTreeEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Reads a node object and a boolean state from the stream, then calls `run(connection)`. |
| `WoodHarvesterOnDelimbTreeEvent:writeStream(streamId: integer, connection: Connection)` | 43 | ✍ Writes a node object and a boolean state to the stream (same order as `readStream`). |
| `WoodHarvesterOnDelimbTreeEvent:run(connection: Connection)` | 51 | ✍ Applies the event on the receiving side: calls `onDelimbTree(state)` on the object if synchronized; on the server it first re-broadcasts a new event. |
