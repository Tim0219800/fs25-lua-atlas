# ai/events/AIJobStopEvent.lua

*[Version française](../../../fr/scripts/ai/events/AIJobStopEvent.md)*

Source: `dataS/scripts/ai/events/AIJobStopEvent.lua` — FS25 1.25.1.0

✍ Event that stops an AI job and optionally carries the AI message explaining why. The server broadcasts it to clients; a client's request is applied on the server through `aiSystem:stopJob`.

- **AIJobStopEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIJobStopEvent.emptyNew()` | 17 | ✍ Creates an empty event for stream reconstruction. |
| `AIJobStopEvent.new(job: any, aiMessage: any)` | 24 | ✍ Creates the event for a job and an optional AI message (may be nil). |
| `AIJobStopEvent:readStream(streamId: any, connection: any)` | 35 | ✍ Reads the job id and resolves the job, then, if a flag is set, reads a message index, creates the message through `aiMessageManager:createMessage` and lets it read its data. Runs the event. |
| `AIJobStopEvent:writeStream(streamId: any, connection: any)` | 51 | ✍ Writes the job id, a bool for message presence, and if present the message index and its own data. |
| `AIJobStopEvent:run(connection: any)` | 62 | ✍ Does nothing if the job is unknown. On a client it calls `aiSystem:stopJobInternal` with the message; on the server it calls `aiSystem:stopJob`. |
