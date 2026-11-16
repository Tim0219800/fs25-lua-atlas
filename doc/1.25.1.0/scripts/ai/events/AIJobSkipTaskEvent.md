# ai/events/AIJobSkipTaskEvent.lua

*[Version française](../../../fr/scripts/ai/events/AIJobSkipTaskEvent.md)*

Source: `dataS/scripts/ai/events/AIJobSkipTaskEvent.lua` — FS25 1.25.1.0

✍ Network event sent by a client so that the server skips the current task of an AI job; it carries only the job id and publishes `MessageType.AI_TASK_SKIPPED` on mobile. It asserts client-to-server direction.

- **AIJobSkipTaskEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIJobSkipTaskEvent.emptyNew()` | 17 | ✍ Creates an empty event, used when the event is rebuilt from a stream. |
| `AIJobSkipTaskEvent.new(job: any)` | 24 | ✍ Creates the event for the given job. |
| `AIJobSkipTaskEvent:readStream(streamId: any, connection: any)` | 34 | ✍ Reads the job id, resolves the job via `g_currentMission.aiSystem:getJobById` and runs the event immediately. |
| `AIJobSkipTaskEvent:writeStream(streamId: any, connection: any)` | 43 | ✍ Writes the job id as an int32. |
| `AIJobSkipTaskEvent:run(connection: any)` | 49 | ✍ Asserts it runs on the server side, then calls `aiSystem:skipCurrentTaskInternal` for the job. Publishes `AI_TASK_SKIPPED` when the platform is mobile. |

## Messages

- publishes `MessageType.AI_TASK_SKIPPED` (l.55)
