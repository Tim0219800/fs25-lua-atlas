# construction/events/OrchardBuildCancelEvent.lua

*[Version française](../../../fr/scripts/construction/events/OrchardBuildCancelEvent.md)*

Source: `dataS/scripts/construction/events/OrchardBuildCancelEvent.lua` — FS25 1.25.1.0

✍ Network event sent by a client to ask the server to stop a running orchard build, identified by a request id (one byte). It sends on the main channel and only does anything on the server, which forwards to `g_currentMission.orchardBuildManager:cancelRequest`. The manager class is not in the dump, so its behaviour is UNVERIFIED.

- **OrchardBuildCancelEvent** inherits from `Event` (l.17)

## Functions

| Function | Line | Description |
|---|---|---|
| `OrchardBuildCancelEvent.emptyNew() → OrchardBuildCancelEvent` | 24 | ✍ Creates an empty event on the main network channel, used when reading from a stream. |
| `OrchardBuildCancelEvent.new(requestId: integer) → OrchardBuildCancelEvent` | 34 | ✍ Creates a cancel request for the given build run id. |
| `OrchardBuildCancelEvent:readStream(streamId: integer, connection: Connection)` | 46 | ✍ Reads the request id (UInt8) and immediately calls `run`. Executed on the server when a client request arrives. |
| `OrchardBuildCancelEvent:writeStream(streamId: integer, connection: Connection)` | 56 | ✍ Writes the request id as a UInt8. Used by the client when sending. |
| `OrchardBuildCancelEvent:run(connection: Connection)` | 63 | ✍ Server only: returns early if the connection leads to a server, or if the mission has no `orchardBuildManager`; otherwise asks the manager to cancel the request for this connection. |
