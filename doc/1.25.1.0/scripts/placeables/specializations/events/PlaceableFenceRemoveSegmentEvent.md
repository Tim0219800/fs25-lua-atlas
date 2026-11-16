# placeables/specializations/events/PlaceableFenceRemoveSegmentEvent.lua

*[Version française](../../../../fr/scripts/placeables/specializations/events/PlaceableFenceRemoveSegmentEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableFenceRemoveSegmentEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) for removing a fence panel identified by segment and pole index. A client sends it to the server, which applies it and broadcasts it to all clients.

- **PlaceableFenceRemoveSegmentEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableFenceRemoveSegmentEvent.emptyNew() → table` | 13 | ✍ Creates an empty event instance for stream reading. |
| `PlaceableFenceRemoveSegmentEvent.new(fence: table, segmentIndex: integer, poleIndex: boolean)` | 22 | ✍ Creates the event with the fence, segment index and pole index. |
| `PlaceableFenceRemoveSegmentEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Reads the fence, segment index and pole index (32-bit integers), then calls `run`. |
| `PlaceableFenceRemoveSegmentEvent:writeStream(streamId: integer, connection: Connection)` | 48 | ✍ Writes the fence, segment index and pole index as 32-bit integers. |
| `PlaceableFenceRemoveSegmentEvent:run(connection: Connection)` | 57 | ✍ If the fence is synchronized, deletes the panel through `doDeletePanel` and publishes the remove-segment message; on the server it then broadcasts the event to all clients. |
