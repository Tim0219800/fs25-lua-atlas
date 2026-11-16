# vehicles/specializations/events/SetSeedIndexEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/SetSeedIndexEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetSeedIndexEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes the selected seed (fruit) index of a sower between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **SetSeedIndexEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `SetSeedIndexEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `SetSeedIndexEvent.new(object: table, seedIndex: integer)` | 23 | ✍ Builds the event with the data to send (a node object and an 8-bit seed index); stored on the instance for `writeStream`. |
| `SetSeedIndexEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads a node object and an 8-bit seed index from the stream, then calls `run(connection)`. |
| `SetSeedIndexEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes a node object and an 8-bit seed index to the stream (same order as `readStream`). |
| `SetSeedIndexEvent:run(connection: Connection)` | 52 | ✍ Applies the event on the receiving side: on the server first re-broadcasts itself to the other clients, then calls `setSeedIndex(index, true)` on the object if synchronized. |
| `SetSeedIndexEvent.sendEvent(object: table, seedIndex: integer, noEventSend: boolean)` | 67 | ✍ Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true. |
