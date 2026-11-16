# player/events/PlayerSetStyleEvent.lua

*[Version française](../../../fr/scripts/player/events/PlayerSetStyleEvent.md)*

Source: `dataS/scripts/player/events/PlayerSetStyleEvent.lua` — FS25 1.25.1.0

✍ Event that synchronizes a player's appearance (`PlayerStyle`). It is used both for a client announcing its style to the server, which relays it to the others, and for the server answering a `PlayerRequestStyleEvent`.

- **PlayerSetStyleEvent** inherits from `Event` (l.4)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerSetStyleEvent.emptyNew() → table` | 11 | ✍ Creates an empty event instance for stream reading. |
| `PlayerSetStyleEvent.new(player: any, style: any, playerObjectId: any)` | 18 | ✍ Builds the event with a player, a style object and optionally the player's network object id (used instead of the player when set). |
| `PlayerSetStyleEvent:writeStream(streamId: integer, connection: table)` | 32 | ✍ Writes the player's network object id (the stored id if given, else the player node object) and then the style through its own `writeStream`. |
| `PlayerSetStyleEvent:readStream(streamId: integer, connection: table)` | 48 | ✍ Reads the player object id, resolves the player, builds a new `PlayerStyle` and reads it from the stream, then runs the event. |
| `PlayerSetStyleEvent:run(connection: table)` | 65 | ✍ On the server, re-broadcasts to the other clients. Then applies the style with `player:setStyleAsync`, with the event-send flag off. Crashes if the player object could not be resolved (no nil check). |
| `PlayerSetStyleEvent.sendEvent(player: Player, style: PlayerStyle, playerObjectId: integer?, noEventSend: boolean?)` | 80 | ✍ Unless `noEventSend` is true, the server broadcasts the event (excluding the player's own connection) and a client sends it to the server. |
