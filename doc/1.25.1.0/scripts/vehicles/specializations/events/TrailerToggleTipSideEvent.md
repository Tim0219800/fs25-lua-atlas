# vehicles/specializations/events/TrailerToggleTipSideEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/TrailerToggleTipSideEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TrailerToggleTipSideEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes the preferred tip side of a trailer between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **TrailerToggleTipSideEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `TrailerToggleTipSideEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `TrailerToggleTipSideEvent.new(object: table, tipSideIndex: integer)` | 25 | ✍ Builds the event with the data to send (a node object and a tip side index (Trailer.TIP_SIDE_NUM_BITS bits)); stored on the instance for `writeStream`. |
| `TrailerToggleTipSideEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Reads a node object and a tip side index (Trailer.TIP_SIDE_NUM_BITS bits) from the stream, then calls `run(connection)`. |
| `TrailerToggleTipSideEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Writes a node object and a tip side index (Trailer.TIP_SIDE_NUM_BITS bits) to the stream (same order as `readStream`). |
| `TrailerToggleTipSideEvent:run(connection: Connection)` | 55 | ✍ Applies the event on the receiving side: on the server re-broadcasts itself, then calls `setPreferedTipSide(index, true)` on the object if synchronized. |
