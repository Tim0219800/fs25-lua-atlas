# vehicles/specializations/events/WoodHarvesterHeaderTiltEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/WoodHarvesterHeaderTiltEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/WoodHarvesterHeaderTiltEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes the tilt state of a wood harvester head between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **WoodHarvesterHeaderTiltEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `WoodHarvesterHeaderTiltEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `WoodHarvesterHeaderTiltEvent.new(object: table, state: number)` | 23 | ✍ Builds the event with the data to send (a node object and a boolean tilt state); stored on the instance for `writeStream`. |
| `WoodHarvesterHeaderTiltEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads a node object and a boolean tilt state from the stream, then calls `run(connection)`. |
| `WoodHarvesterHeaderTiltEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes a node object and a boolean tilt state to the stream (same order as `readStream`). |
| `WoodHarvesterHeaderTiltEvent:run(connection: Connection)` | 52 | ✍ Applies the event on the receiving side: calls `setWoodHarvesterTiltState(state, true)` on the object if synchronized. Unlike most events it does not re-broadcast from `run`. |
| `WoodHarvesterHeaderTiltEvent.sendEvent(object: table, state: number, noEventSend: boolean)` | 63 | ✍ Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true. |
