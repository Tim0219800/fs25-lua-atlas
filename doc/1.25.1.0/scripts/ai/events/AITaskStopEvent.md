# ai/events/AITaskStopEvent.lua

*[Version française](../../../fr/scripts/ai/events/AITaskStopEvent.md)*

Source: `dataS/scripts/ai/events/AITaskStopEvent.lua` — FS25 1.25.1.0

✍ Event synchronizing the stop of one task of an AI job: it carries the job id, the task index (uint8) and a flag telling whether the whole job was stopped, and calls `job:stopTask(task, wasJobStopped)` on the receiver.

- **AITaskStopEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `AITaskStopEvent.emptyNew()` | 17 | ✍ Creates an empty event for stream reconstruction. |
| `AITaskStopEvent.new(job: any, task: any, wasJobStopped: any)` | 24 | ✍ Creates the event for a job and task, plus the stop flag. |
| `AITaskStopEvent:readStream(streamId: any, connection: any)` | 36 | ✍ Reads job id and task index, resolves the job with `aiSystem:getJobById` and the task with `job:getTaskByIndex`, reads the stop flag, then runs the event. |
| `AITaskStopEvent:writeStream(streamId: any, connection: any)` | 53 | ✍ Writes the job id (int32) and the task index (uint8) and the stop flag. |
| `AITaskStopEvent:run(connection: any)` | 61 | ✍ Logs a dev warning and returns if the job is unknown; otherwise calls `job:stopTask(task, wasJobStopped)`. |
