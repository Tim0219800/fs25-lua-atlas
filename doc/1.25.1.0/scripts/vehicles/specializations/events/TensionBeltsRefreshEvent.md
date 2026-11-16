# vehicles/specializations/events/TensionBeltsRefreshEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/TensionBeltsRefreshEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TensionBeltsRefreshEvent.lua` — FS25 1.25.1.0

✍ Network event asking all peers to recompute the tension belts of a vehicle; it carries no data beyond the vehicle. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **TensionBeltsRefreshEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `TensionBeltsRefreshEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `TensionBeltsRefreshEvent.new(object: table)` | 24 | ✍ Builds the event with the data to send (only the node object); stored on the instance for `writeStream`. |
| `TensionBeltsRefreshEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads only the node object from the stream, then calls `run(connection)`. |
| `TensionBeltsRefreshEvent:writeStream(streamId: integer, connection: Connection)` | 43 | ✍ Writes only the node object to the stream (same order as `readStream`). |
| `TensionBeltsRefreshEvent:run(connection: Connection)` | 50 | ✍ Applies the event on the receiving side: on the server re-broadcasts itself, then calls `refreshTensionBelts()` on the object if synchronized. |
