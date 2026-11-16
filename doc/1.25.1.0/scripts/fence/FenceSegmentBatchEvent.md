# fence/FenceSegmentBatchEvent.lua

*[Version française](../../fr/scripts/fence/FenceSegmentBatchEvent.md)*

Source: `dataS/scripts/fence/FenceSegmentBatchEvent.lua` — FS25 1.25.1.0

✍ Server-to-client event with two forms in one class: a batch of freshly built fence segments (bulk construction), or a progress report (request id, done steps, total steps) with no segments, sent only to the requesting client. The first stream Bool selects the form. Subclass of Event on the main channel.

- **FenceSegmentBatchEvent** inherits from `Event` (l.28)

## Functions

| Function | Line | Description |
|---|---|---|
| `FenceSegmentBatchEvent.emptyNew() → FenceSegmentBatchEvent` | 39 | ✍ Creates an empty event on the main network channel. |
| `FenceSegmentBatchEvent.newSegments(fencePlaceable: Placeable, segments: table) → FenceSegmentBatchEvent` | 50 | ✍ Creates the batch form for a placeable and an array of built segments. The source documents a cap named MAX_SEGMENTS (not defined in this file, UNVERIFIED); the count is written as a UInt8. |
| `FenceSegmentBatchEvent.newProgress(requestId: integer, doneSteps: integer, totalSteps: integer) → FenceSegmentBatchEvent` | 67 | ✍ Creates the progress form from a build-run request id, steps done and total steps. Meant for the requesting client only, since run ids are per client. |
| `FenceSegmentBatchEvent:readStream(streamId: integer, connection: Connection)` | 81 | ✍ Reads the form Bool. Progress form: UInt8 request id and two UInt16 counters, then run. Batch form: reads the placeable (logs an error and aborts if unknown, which misaligns the stream), then per segment a UInt8 template index and the segment data (no chained previous segment), then run. |
| `FenceSegmentBatchEvent:writeStream(streamId: integer, connection: Connection)` | 123 | ✍ Writes the form Bool (true if segments are set), then either the progress counters or the placeable, the segment count and each segment's template index and data. |
| `FenceSegmentBatchEvent:run(connection: Connection)` | 149 | ✍ Progress form: publishes request id, done and total steps on the message center. Batch form: if the placeable is not synchronized, deletes the segments just created; otherwise updates meshes (true, false) and finalizes each one. |
