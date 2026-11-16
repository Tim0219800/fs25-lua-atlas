# fence/FenceRequestDeleteSegmentPartEvent.lua

*[Version française](../../fr/scripts/fence/FenceRequestDeleteSegmentPartEvent.md)*

Source: `dataS/scripts/fence/FenceRequestDeleteSegmentPartEvent.lua` — FS25 1.25.1.0

✍ Client-to-server request to delete a single panel of a fence segment, or the whole segment, with a Bool reply from the server. The server re-checks permissions, rebuilds the remaining sub-segments, and broadcasts FenceDeleteSegmentEvent plus FenceSegmentEvent to clients. Subclass of Event on the main channel.

- **FenceRequestDeleteSegmentPartEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `FenceRequestDeleteSegmentPartEvent.emptyNew() → table` | 14 | ✍ Creates an empty event on the main network channel, for reception from a stream. |
| `FenceRequestDeleteSegmentPartEvent.newClientToServer(fencePlaceable: Placeable, segmentId: integer, childIndex: integer, hitX: number, hitY: number, hitZ: number, wholeSegment: boolean) → FenceRequestDeleteSegmentPartEvent` | 28 | ✍ Builds the request: placeable, segment id, child index of the panel node, its world position as a fallback locator, and a flag choosing whole-segment deletion over a single panel. |
| `FenceRequestDeleteSegmentPartEvent.newServerToClient(success: boolean) → FenceRequestDeleteSegmentPartEvent` | 46 | ✍ Builds the server reply carrying only the success flag. |
| `FenceRequestDeleteSegmentPartEvent:readStream(streamId: integer, connection: Connection)` | 58 | ✍ Server side: reads placeable, UInt16 segment id and child index, three compressed world positions (using the mission's vehicle position compression params) and the whole-segment Bool. Client side: reads the success Bool. Then calls run. |
| `FenceRequestDeleteSegmentPartEvent:writeStream(streamId: integer, connection: Connection)` | 83 | ✍ Mirror of readStream: to the server writes placeable, ids, compressed hit position and whole-segment flag; to a client writes only the success Bool. |
| `FenceRequestDeleteSegmentPartEvent:run(connection: Connection)` | 126 | ✍ Client: publishes the result. Server: replies false unless the placeable is synchronized, the segment exists, deletion is allowed, and the player's farm may modify and delete it. It then resolves the panel by child index (fallback: nearest child to the hit position via findNearestChild, not defined in this file, UNVERIFIED) and calls deleteSegmentPart. It deletes the placeable if no segment remains, otherwise broadcasts the old segment's deletion and the new segments, then replies true. |
