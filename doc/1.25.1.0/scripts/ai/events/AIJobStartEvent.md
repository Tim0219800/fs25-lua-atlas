# ai/events/AIJobStartEvent.lua

*[Version française](../../../fr/scripts/ai/events/AIJobStartEvent.md)*

Source: `dataS/scripts/ai/events/AIJobStartEvent.lua` — FS25 1.25.1.0

✍ Server-to-client event that tells clients an AI job has started: it carries the farm id, the job type index and the job data, then starts the job locally through `aiSystem:startJobInternal`.

- **AIJobStartEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIJobStartEvent.emptyNew()` | 17 | ✍ Creates an empty event for stream reconstruction. |
| `AIJobStartEvent.new(job: any, startFarmId: any)` | 24 | ✍ Creates the event for a job and the farm id that starts it. |
| `AIJobStartEvent:readStream(streamId: any, connection: any)` | 35 | ✍ Asserts the sender is the server, reads farm id and job type index, creates the job with `aiJobTypeManager:createJob`, reads its data and runs the event. |
| `AIJobStartEvent:writeStream(streamId: any, connection: any)` | 49 | ✍ Writes farm id, job type index (from `aiJobTypeManager:getJobTypeIndex`) and the job data. |
| `AIJobStartEvent:run(connection: any)` | 58 | ✍ Starts the job through `g_currentMission.aiSystem:startJobInternal` with the farm id. |
