# placeables/specializations/events/PlaceableFenceAddSegmentEvent.lua

*[Version française](../../../../fr/scripts/placeables/specializations/events/PlaceableFenceAddSegmentEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableFenceAddSegmentEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) for adding one fence segment from the build tool. A client sends it to the server, which creates the segment, charges the purchase price to the fence owner farm and broadcasts it to the other clients. Local listeners are told via a message-center publish.

- **PlaceableFenceAddSegmentEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableFenceAddSegmentEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance for stream reading. |
| `PlaceableFenceAddSegmentEvent.new(fence: table, x1: integer, z1: boolean, x2: any, z2: any, renderFirst: any, renderLast: any, gateIndex: any, price: any)` | 23 | ✍ Creates the event with the fence, segment end points (x1, z1, x2, z2), the render-first and render-last flags, an optional gate index and the price. |
| `PlaceableFenceAddSegmentEvent:readStream(streamId: integer, connection: Connection)` | 43 | ✍ Reads the fence, four coordinates, both render flags, the gate index (0 means none) and the price, then calls `run`. |
| `PlaceableFenceAddSegmentEvent:writeStream(streamId: integer, connection: Connection)` | 65 | ✍ Writes the same fields in the same order (gate index written as 0 when nil). |
| `PlaceableFenceAddSegmentEvent:run(connection: Connection)` | 81 | ✍ If the fence is synchronized, creates and adds the segment (built synchronously on clients when it has a gate) and publishes the add-segment message. On the server side it also deducts the price from the owner farm as a property purchase and broadcasts the event. |
