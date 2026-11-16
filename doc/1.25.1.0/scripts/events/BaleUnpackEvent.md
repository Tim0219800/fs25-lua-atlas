# events/BaleUnpackEvent.lua

*[Version française](../../fr/scripts/events/BaleUnpackEvent.md)*

Source: `dataS/scripts/events/BaleUnpackEvent.lua` — FS25 1.25.1.0

✍ Network event asking the server to unpack a bale (client to server). Unlike similar events it is not guarded in `run`, so the unpack call happens wherever the event is run; the behaviour of `Bale:unpack` is UNVERIFIED (class not in this file).

- **BaleUnpackEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `BaleUnpackEvent.emptyNew() → table` | 13 | ✍ Creates an empty event, used when reading from a stream. |
| `BaleUnpackEvent.new(bale: table) → table` | 22 | ✍ Creates the event for the given bale. |
| `BaleUnpackEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Server side: reads the bale node object, then calls `run`. On a client connection nothing is read but `run` is still called. |
| `BaleUnpackEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Client side: writes the bale node object; writes nothing when sent by the server. |
| `BaleUnpackEvent:run(connection: Connection)` | 53 | ✍ Calls `unpack()` on the bale, with no server/client check. Would fail on a nil bale. |
