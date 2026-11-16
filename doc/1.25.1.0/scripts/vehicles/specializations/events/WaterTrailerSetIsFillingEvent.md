# vehicles/specializations/events/WaterTrailerSetIsFillingEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/WaterTrailerSetIsFillingEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/WaterTrailerSetIsFillingEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes whether a water trailer is currently filling, between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **WaterTrailerSetIsFillingEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `WaterTrailerSetIsFillingEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `WaterTrailerSetIsFillingEvent.new(vehicle: table, isFilling: boolean)` | 23 | ✍ Builds the event with the data to send (a node object and a boolean filling flag); stored on the instance for `writeStream`. |
| `WaterTrailerSetIsFillingEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads a node object and a boolean filling flag from the stream, then calls `run(connection)`. |
| `WaterTrailerSetIsFillingEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes a node object and a boolean filling flag to the stream (same order as `readStream`). |
| `WaterTrailerSetIsFillingEvent:run(connection: Connection)` | 52 | ✍ Applies the event on the receiving side: on the server re-broadcasts itself, then calls `setIsWaterTrailerFilling(flag, true)` on the vehicle if synchronized. |
| `WaterTrailerSetIsFillingEvent.sendEvent(vehicle: table, isFilling: boolean, noEventSend: boolean)` | 67 | ✍ Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true. |
