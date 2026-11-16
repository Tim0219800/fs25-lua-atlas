# handTools/events/HandsPickUpFailedEvent.lua

*[Version française](../../../fr/scripts/handTools/events/HandsPickUpFailedEvent.md)*

Source: `dataS/scripts/handTools/events/HandsPickUpFailedEvent.lua` — FS25 1.25.1.0

✍ Server-to-client network event telling a client that its hands hand tool failed to pick up the requested object. It is only allowed in the server to client direction (asserted in `run`).

- **HandsPickUpFailedEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `HandsPickUpFailedEvent.emptyNew() → table` | 18 | ✍ Creates an empty event instance for the network layer to fill in `readStream`. |
| `HandsPickUpFailedEvent.new(hands: any)` | 26 | ✍ Creates the event for the given hands hand tool. |
| `HandsPickUpFailedEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Reads the hands (node object) from the stream, then runs the event. |
| `HandsPickUpFailedEvent:writeStream(streamId: integer, connection: Connection)` | 49 | ✍ Writes the hands as a node object to the stream. |
| `HandsPickUpFailedEvent:run(connection: Connection)` | 56 | ✍ Asserts it comes from the server; if the hands exist and are synchronized, calls `pickupFailed()` on them. |
