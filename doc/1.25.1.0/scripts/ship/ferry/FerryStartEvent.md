# ship/ferry/FerryStartEvent.lua

*[Version française](../../../fr/scripts/ship/ferry/FerryStartEvent.md)*

Source: `dataS/scripts/ship/ferry/FerryStartEvent.lua` — FS25 1.25.1.0

✍ Network event to start a ferry. The client asks, the server runs `ferry:start(connection)` and answers with an error code; the client then calls `onStarted` or `onStartFailed`. The `Ferry` class and its `ERROR_*` constants are not in this file (UNVERIFIED). Note: the doc comment says washing stations, apparently copied.

- **FerryStartEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `FerryStartEvent.emptyNew() → table` | 14 | ✍ Creates an empty event, used when reading from a stream. |
| `FerryStartEvent.new(ferry: table) → table` | 23 | ✍ Creates the event for the given ferry. The error code is not set here; the server must set `errorCode` before sending its answer. |
| `FerryStartEvent:readStream(streamId: integer, connection: Connection)` | 40 | ✍ Reads the ferry node object, and on the client also the error code (`Ferry.ERROR_SEND_NUM_BITS` bits), then calls `run`. |
| `FerryStartEvent:writeStream(streamId: integer, connection: Connection)` | 54 | ✍ Writes the ferry node object; when sent by the server, also writes `errorCode`. |
| `FerryStartEvent:run(connection: Connection)` | 65 | ✍ Server: calls `ferry:start(connection)`. Client: calls `ferry:onStarted()` on `Ferry.ERROR_SUCCESS`, else `ferry:onStartFailed(errorCode)`. |
