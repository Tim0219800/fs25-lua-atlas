# ai/events/AIJobSkipTaskEvent.lua

Source: `dataS/scripts/ai/events/AIJobSkipTaskEvent.lua` — FS25 1.25.1.0

- **AIJobSkipTaskEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `AIJobSkipTaskEvent.emptyNew()` | 17 |  |
| `AIJobSkipTaskEvent.new(job: any)` | 24 |  |
| `AIJobSkipTaskEvent:readStream(streamId: any, connection: any)` | 34 |  |
| `AIJobSkipTaskEvent:writeStream(streamId: any, connection: any)` | 43 |  |
| `AIJobSkipTaskEvent:run(connection: any)` | 49 |  |

## Messages

- publishes `MessageType.AI_TASK_SKIPPED` (l.55)
