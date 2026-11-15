# fence/FenceSegmentBatchEvent.lua

Source : `dataS/scripts/fence/FenceSegmentBatchEvent.lua` — FS25 1.25.1.0

- **FenceSegmentBatchEvent** hérite de `Event` (l.28)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FenceSegmentBatchEvent.emptyNew() → FenceSegmentBatchEvent` | 39 |  |
| `FenceSegmentBatchEvent.newSegments(fencePlaceable: Placeable, segments: table) → FenceSegmentBatchEvent` | 50 |  |
| `FenceSegmentBatchEvent.newProgress(requestId: integer, doneSteps: integer, totalSteps: integer) → FenceSegmentBatchEvent` | 67 |  |
| `FenceSegmentBatchEvent:readStream(streamId: integer, connection: Connection)` | 81 |  |
| `FenceSegmentBatchEvent:writeStream(streamId: integer, connection: Connection)` | 123 |  |
| `FenceSegmentBatchEvent:run(connection: Connection)` | 149 |  |
