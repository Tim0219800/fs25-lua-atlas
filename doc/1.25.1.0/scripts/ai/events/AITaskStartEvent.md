# ai/events/AITaskStartEvent.lua

*[Version française](../../../fr/scripts/ai/events/AITaskStartEvent.md)*

Source: `dataS/scripts/ai/events/AITaskStartEvent.lua` — FS25 1.25.1.0

✍ Event synchronizing the start of one task of an AI job: it carries the job id, the task index (uint8), and calls `job:startTask(task)` on the receiver.

- **AITaskStartEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `AITaskStartEvent.emptyNew()` | 17 | ✍ Creates an empty event for stream reconstruction. |
| `AITaskStartEvent.new(job: any, task: any)` | 24 | ✍ Creates the event for a job and task. |
| `AITaskStartEvent:readStream(streamId: any, connection: any)` | 35 | ✍ Reads job id and task index, resolves the job with `aiSystem:getJobById` and the task with `job:getTaskByIndex`, then runs the event. |
| `AITaskStartEvent:writeStream(streamId: any, connection: any)` | 49 | ✍ Writes the job id (int32) and the task index (uint8). |
| `AITaskStartEvent:run(connection: any)` | 56 | ✍ Logs a dev warning and returns if the job is unknown; otherwise calls `job:startTask(task)`. |
