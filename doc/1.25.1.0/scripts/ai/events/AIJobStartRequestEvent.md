# ai/events/AIJobStartRequestEvent.lua

*[Version française](../../../fr/scripts/ai/events/AIJobStartRequestEvent.md)*

Source: `dataS/scripts/ai/events/AIJobStartRequestEvent.lua` — FS25 1.25.1.0

✍ Two-way event for starting an AI job. A client sends job and farm id; the server checks `getIsStartable`, answers with a state code and, if startable, starts the job through `aiSystem:startJob`. The client then publishes the answer on the message center.

- **AIJobStartRequestEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIJobStartRequestEvent.emptyNew()` | 17 | ✍ Creates an empty event for stream reconstruction. |
| `AIJobStartRequestEvent.new(job: any, startFarmId: any)` | 24 | ✍ Creates the client-to-server request for a job and farm id. |
| `AIJobStartRequestEvent.newServerToClient(state: any, jobTypeIndex: any)` | 35 | ✍ Creates the server reply carrying a state code (0 is sent when the job is accepted) and the job type index. |
| `AIJobStartRequestEvent:readStream(streamId: any, connection: any)` | 46 | ✍ On the server reads farm id, job type (uint16) and job data; on a client reads the state (uint8) and job type index. Then runs the event. |
| `AIJobStartRequestEvent:writeStream(streamId: any, connection: any)` | 62 | ✍ Mirror of `readStream`: a client writes farm id, job type and job data; the server writes state and job type index. |
| `AIJobStartRequestEvent:run(connection: any)` | 76 | ✍ Server side: calls `job:getIsStartable(connection)`, sends the state back, and only if startable starts the job with `aiSystem:startJob`. Client side: publishes `AIJobStartRequestEvent` with state and job type on `g_messageCenter`. |
