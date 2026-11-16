# placeables/specializations/events/PlaceableFenceSegmentBatchEvent.lua

*[Version française](../../../../fr/scripts/placeables/specializations/events/PlaceableFenceSegmentBatchEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableFenceSegmentBatchEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event, main channel) that sends many fence segments in one message during bulk construction, instead of one add-segment event each. The server already validated and charged the segments, so it carries no price and is only processed by clients.

- **PlaceableFenceSegmentBatchEvent** inherits from `Event` (l.17)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableFenceSegmentBatchEvent.emptyNew() → PlaceableFenceSegmentBatchEvent` | 28 | ✍ Creates an empty event on `NetworkNode.CHANNEL_MAIN` for stream reading. |
| `PlaceableFenceSegmentBatchEvent.new(fencePlaceable: Placeable, segments: table) → PlaceableFenceSegmentBatchEvent` | 39 | ✍ Creates the event with the fence placeable and the list of segments. |
| `PlaceableFenceSegmentBatchEvent:readStream(streamId: integer, connection: Connection)` | 52 | ✍ Reads the placeable, logs an error and returns early if it is unknown (which would misalign the stream), then reads a count (UInt8, so at most 255) and each segment (coordinates and render flags) and creates it, then calls `run`. |
| `PlaceableFenceSegmentBatchEvent:writeStream(streamId: integer, connection: Connection)` | 87 | ✍ Writes the placeable, the segment count as UInt8 and each segment coordinates and render flags. |
| `PlaceableFenceSegmentBatchEvent:run(connection: Connection)` | 104 | ✍ Ignored unless received from the server and the placeable is synchronized; then queues each segment with `addSegment` (async build spread over frames) and publishes the add-segment message for it. |
