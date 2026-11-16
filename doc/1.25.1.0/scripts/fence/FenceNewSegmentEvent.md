# fence/FenceNewSegmentEvent.lua

*[Version française](../../fr/scripts/fence/FenceNewSegmentEvent.md)*

Source: `dataS/scripts/fence/FenceNewSegmentEvent.lua` — FS25 1.25.1.0

✍ Client-to-server request to build a new fence segment, with a server-to-client reply giving a status code, the segment id and the end position. The server re-validates, charges the farm, finalizes the segment and broadcasts a FenceSegmentEvent. The status codes come from FenceNewSegmentEvent.STATUS_CODE, which is not defined in this file (UNVERIFIED).

- **FenceNewSegmentEvent** inherits from `Event` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `FenceNewSegmentEvent.emptyNew() → table` | 20 | ✍ Creates an empty event on the main network channel. The `new`/`newServerToClient` constructors called in run are not defined in this file (UNVERIFIED where they come from). |
| `FenceNewSegmentEvent:readStream(streamId: integer, connection: Connection)` | 50 | ✍ Server side: reads placeable, template index and the segment data, builds the segment and calls run. Client side: reads status code, segment id and end position (3 floats) and publishes them on the message center. |
| `FenceNewSegmentEvent:writeStream(streamId: integer, connection: Connection)` | 75 | ✍ Client to server: writes placeable, template index and segment data. Server to client: writes status code, segment id and the end position as three floats. |
| `FenceNewSegmentEvent:run(connection: Connection)` | 96 | ✍ Server authority: updates meshes, checks the optional getCanBeBuilt restriction, charges the segment price to the player's farm (shop property purchase), finalizes it, broadcasts a FenceSegmentEvent, and replies with status and end position (or publishes locally for a local connection). |
