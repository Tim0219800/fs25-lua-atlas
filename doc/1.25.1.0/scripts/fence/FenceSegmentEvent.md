# fence/FenceSegmentEvent.lua

*[Version française](../../fr/scripts/fence/FenceSegmentEvent.md)*

Source: `dataS/scripts/fence/FenceSegmentEvent.lua` — FS25 1.25.1.0

✍ Network event, sent by the server to all clients, that announces a newly built fence segment. Carries the fence placeable, the segment template index and the segment's own serialized data. Subclass of Event on the main channel.

- **FenceSegmentEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `FenceSegmentEvent.emptyNew() → table` | 14 | ✍ Creates an empty event on the main network channel, for use when reading from a stream. |
| `FenceSegmentEvent.new(fencePlaceable: Placeable, segment: Segment) → FenceSegmentEvent` | 23 | ✍ Creates an event holding the given fence placeable and segment, ready to be broadcast. |
| `FenceSegmentEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Reads the placeable and a UInt8 template index, asks the fence to create a segment for that template, lets the segment read its own data, then calls run. |
| `FenceSegmentEvent:writeStream(streamId: integer, connection: Connection)` | 53 | ✍ Writes the placeable, the UInt8 template index looked up from the segment id, then the segment's own data. |
| `FenceSegmentEvent:run(connection: Connection)` | 67 | ✍ If the placeable is synchronized, updates the segment meshes (flags true, false) and finalizes it. No validation here: the server is assumed to have validated it already. |
