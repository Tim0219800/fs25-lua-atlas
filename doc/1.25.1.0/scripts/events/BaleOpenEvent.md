# events/BaleOpenEvent.lua

*[Version française](../../fr/scripts/events/BaleOpenEvent.md)*

Source: `dataS/scripts/events/BaleOpenEvent.lua` — FS25 1.25.1.0

✍ Network event asking the server to open a bale (client to server only). The server calls `bale:open()`; the effect on other clients is UNVERIFIED because `Bale` is not in this file. Note that the payload is only written by the client and read by the server.

- **BaleOpenEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `BaleOpenEvent.emptyNew() → table` | 13 | ✍ Creates an empty event, used when reading from a stream. |
| `BaleOpenEvent.new(bale: table) → table` | 25 | ✍ Creates the event for a bale. Note: the doc comment mentions x, y, z but the function only takes the bale. |
| `BaleOpenEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Server side: reads the bale node object, then calls `run`. On a client connection nothing is read but `run` is still called. |
| `BaleOpenEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Client side: writes the bale node object; writes nothing when sent by the server. |
| `BaleOpenEvent:run(connection: Connection)` | 56 | ✍ Server only: calls `open()` on the bale. Does nothing on a client. |
