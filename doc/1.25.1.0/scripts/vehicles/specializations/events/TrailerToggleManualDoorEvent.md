# vehicles/specializations/events/TrailerToggleManualDoorEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/TrailerToggleManualDoorEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TrailerToggleManualDoorEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes the manually operated door of a trailer tip side (open or closed) between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **TrailerToggleManualDoorEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `TrailerToggleManualDoorEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `TrailerToggleManualDoorEvent.new(object: table, tipSideIndex: boolean, state: boolean)` | 23 | ✍ Builds the event with the data to send (a node object, a boolean door state and a tip side index (Trailer.TIP_SIDE_NUM_BITS bits)); stored on the instance for `writeStream`. |
| `TrailerToggleManualDoorEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Reads a node object, a boolean door state and a tip side index (Trailer.TIP_SIDE_NUM_BITS bits) from the stream, then calls `run(connection)`. |
| `TrailerToggleManualDoorEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Writes a node object, a boolean door state and a tip side index (Trailer.TIP_SIDE_NUM_BITS bits) to the stream (same order as `readStream`). |
| `TrailerToggleManualDoorEvent:run(connection: Connection)` | 56 | ✍ Applies the event on the receiving side: on the server re-broadcasts itself, then calls `setTrailerDoorState(tipSideIndex, state, true)` on the object if synchronized. |
| `TrailerToggleManualDoorEvent.sendEvent(vehicle: table, tipSideIndex: boolean, state: integer, noEventSend: boolean)` | 72 | ✍ Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true. |
