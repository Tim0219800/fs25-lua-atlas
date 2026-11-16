# fence/FenceRequestDeleteSegmentEvent.lua

*[Version française](../../fr/scripts/fence/FenceRequestDeleteSegmentEvent.md)*

Source: `dataS/scripts/fence/FenceRequestDeleteSegmentEvent.lua` — FS25 1.25.1.0

✍ Client-to-server request to delete a fence segment, with a server-to-client reply carrying a success flag. The server deletes the segment, replies, and broadcasts a FenceDeleteSegmentEvent to the other clients. Subclass of Event on the main channel.

- **FenceRequestDeleteSegmentEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `FenceRequestDeleteSegmentEvent.emptyNew() → table` | 14 | ✍ Creates an empty event on the main network channel. The `new`/`newServerToClient` constructors used elsewhere in this file are not defined here (UNVERIFIED where they come from). |
| `FenceRequestDeleteSegmentEvent:readStream(streamId: integer, connection: Connection)` | 40 | ✍ On the server side reads placeable and UInt16 segment id; on the client side reads the Bool success flag. Then calls run. |
| `FenceRequestDeleteSegmentEvent:writeStream(streamId: integer, connection: Connection)` | 55 | ✍ When sending to the server writes placeable and segment id; when sending to a client writes the success Bool. |
| `FenceRequestDeleteSegmentEvent:run(connection: Connection)` | 67 | ✍ Client: publishes the success flag on the message center. Server: finds the segment, replies false if missing, otherwise removes and deletes it, replies true, and broadcasts a FenceDeleteSegmentEvent to all other connections. |
