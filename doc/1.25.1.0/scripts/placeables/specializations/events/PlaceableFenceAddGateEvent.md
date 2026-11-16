# placeables/specializations/events/PlaceableFenceAddGateEvent.lua

*[Version française](../../../../fr/scripts/placeables/specializations/events/PlaceableFenceAddGateEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableFenceAddGateEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) used when a client joins: it carries a fence placeable, a segment index and the animated gate object of that segment so the gate can be registered as a network object. Its `run` is empty.

- **PlaceableFenceAddGateEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableFenceAddGateEvent.emptyNew() → table` | 13 | ✍ Creates an empty event instance for stream reading. |
| `PlaceableFenceAddGateEvent.new(fence: table, segmentIndex: integer, animatedObject: boolean)` | 22 | ✍ Creates the event with the fence, segment index and animated gate object. |
| `PlaceableFenceAddGateEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Client side on join: reads the fence and segment index, fetches the segment animated object, reads its id and state, finishes its registration, then calls `run`. |
| `PlaceableFenceAddGateEvent:writeStream(streamId: integer, connection: Connection)` | 53 | ✍ Server side on join: writes the fence, segment index, animated object id and state, and registers the object in the connection stream. |
| `PlaceableFenceAddGateEvent:run(connection: Connection)` | 65 | ✍ Does nothing; all the work happens while reading the stream. |
