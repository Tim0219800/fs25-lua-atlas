# vehicles/specializations/events/SprayerDoubledAmountEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/SprayerDoubledAmountEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SprayerDoubledAmountEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes the 'doubled amount' mode of a sprayer between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **SprayerDoubledAmountEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `SprayerDoubledAmountEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `SprayerDoubledAmountEvent.new(object: table, isActive: integer)` | 23 | ✍ Builds the event with the data to send (a node object and a boolean active flag); stored on the instance for `writeStream`. |
| `SprayerDoubledAmountEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Reads a node object and a boolean active flag from the stream, then calls `run(connection)`. |
| `SprayerDoubledAmountEvent:writeStream(streamId: integer, connection: Connection)` | 45 | ✍ Writes a node object and a boolean active flag to the stream (same order as `readStream`). |
| `SprayerDoubledAmountEvent:run(connection: Connection)` | 53 | ✍ Applies the event on the receiving side: calls `setSprayerDoubledAmountActive(flag, true)` on the object if synchronized, then the server re-broadcasts to the other clients. |
| `SprayerDoubledAmountEvent.sendEvent(vehicle: table, isActive: boolean, noEventSend: boolean)` | 68 | ✍ Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true. |
