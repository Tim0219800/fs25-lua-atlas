# construction/events/OrchardBuildFinishedEvent.lua

*[Version française](../../../fr/scripts/construction/events/OrchardBuildFinishedEvent.md)*

Source: `dataS/scripts/construction/events/OrchardBuildFinishedEvent.lua` — FS25 1.25.1.0

✍ Network event sent from the server to the requesting client to close an orchard build run and report the outcome as a status code plus the number of completed steps. On the client it publishes a message through `g_messageCenter`. The `STATUS` table and `STATUS_NUM_BITS` constants are referenced but not present in the dump, so their values are UNVERIFIED.

- **OrchardBuildFinishedEvent** inherits from `Event` (l.17)

## Functions

| Function | Line | Description |
|---|---|---|
| `OrchardBuildFinishedEvent.emptyNew() → OrchardBuildFinishedEvent` | 39 | ✍ Creates an empty event on the main network channel, used when reading from a stream. |
| `OrchardBuildFinishedEvent.new(requestId: integer, statusCode: integer, builtSteps: integer) → OrchardBuildFinishedEvent` | 51 | ✍ Creates the answer with the run id, a status code and the count of completed build steps. |
| `OrchardBuildFinishedEvent:readStream(streamId: integer, connection: Connection)` | 65 | ✍ Client side: reads request id (UInt8), status (UIntN of `STATUS_NUM_BITS` bits) and built steps (UInt16), then calls `run`. |
| `OrchardBuildFinishedEvent:writeStream(streamId: integer, connection: Connection)` | 77 | ✍ Server side: writes request id, status and built steps in the same layout that `readStream` expects. |
| `OrchardBuildFinishedEvent:run(connection: Connection)` | 86 | ✍ Publishes `OrchardBuildFinishedEvent` on `g_messageCenter` with request id, status code and built steps; subscribers (UI, not in this dump) react to it. |
