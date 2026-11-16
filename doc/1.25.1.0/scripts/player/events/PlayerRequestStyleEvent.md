# player/events/PlayerRequestStyleEvent.lua

*[Version française](../../../fr/scripts/player/events/PlayerRequestStyleEvent.md)*

Source: `dataS/scripts/player/events/PlayerRequestStyleEvent.lua` — FS25 1.25.1.0

✍ Client-to-server request asking for the current appearance (style) of a given player. The server answers with a `PlayerSetStyleEvent` sent only to the requesting connection.

- **PlayerRequestStyleEvent** inherits from `Event` (l.4)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerRequestStyleEvent.emptyNew() → table` | 11 | ✍ Creates an empty event instance for stream reading. |
| `PlayerRequestStyleEvent.new(playerObjectId: any)` | 18 | ✍ Builds the request from the network object id of the player whose style is wanted. |
| `PlayerRequestStyleEvent:writeStream(streamId: integer, connection: table)` | 30 | ✍ Writes the player's network object id to the stream. |
| `PlayerRequestStyleEvent:readStream(streamId: integer, connection: table)` | 38 | ✍ Reads the player object id, resolves it to the player object with `NetworkUtil.getObject`, then runs the event. |
| `PlayerRequestStyleEvent:run(connection: table)` | 48 | ✍ Server side only: reads the player's style from `graphicsComponent` and replies to the sender with a `PlayerSetStyleEvent`. If the player is unknown (already left), only an info log is written. |
