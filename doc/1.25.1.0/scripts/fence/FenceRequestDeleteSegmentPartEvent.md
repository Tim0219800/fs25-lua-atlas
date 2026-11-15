# fence/FenceRequestDeleteSegmentPartEvent.lua

Source: `dataS/scripts/fence/FenceRequestDeleteSegmentPartEvent.lua` — FS25 1.25.1.0

- **FenceRequestDeleteSegmentPartEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `FenceRequestDeleteSegmentPartEvent.emptyNew() → table` | 14 |  |
| `FenceRequestDeleteSegmentPartEvent.newClientToServer(fencePlaceable: Placeable, segmentId: integer, childIndex: integer, hitX: number, hitY: number, hitZ: number, wholeSegment: boolean) → FenceRequestDeleteSegmentPartEvent` | 28 |  |
| `FenceRequestDeleteSegmentPartEvent.newServerToClient(success: boolean) → FenceRequestDeleteSegmentPartEvent` | 46 |  |
| `FenceRequestDeleteSegmentPartEvent:readStream(streamId: integer, connection: Connection)` | 58 |  |
| `FenceRequestDeleteSegmentPartEvent:writeStream(streamId: integer, connection: Connection)` | 83 |  |
| `FenceRequestDeleteSegmentPartEvent:run(connection: Connection)` | 126 |  |
