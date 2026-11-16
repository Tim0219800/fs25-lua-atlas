# player/events/PlayerHoldHandToolEvent.lua

*[Version française](../../../fr/scripts/player/events/PlayerHoldHandToolEvent.md)*

Source: `dataS/scripts/player/events/PlayerHoldHandToolEvent.lua` — FS25 1.25.1.0

✍ Network event that keeps the hand tool held by a player in sync across the server and clients. It is sent on the main channel; a client sends it to the server, which re-broadcasts it to the other clients.

- **PlayerHoldHandToolEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerHoldHandToolEvent.emptyNew() → table` | 18 | ✍ Creates an empty event on the main network channel, used when the event is read from a stream. |
| `PlayerHoldHandToolEvent.new(player: any, handToolId: any, isHolding: any)` | 25 | ✍ Builds the event for a player and a hand tool object id. The `isHolding` argument is accepted but never stored or used. A nil `handToolId` means the hand tool is put away. |
| `PlayerHoldHandToolEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Reads the player node object, then an optional hand tool object id (presence flag first), and immediately runs the event. |
| `PlayerHoldHandToolEvent:writeStream(streamId: integer, connection: Connection)` | 52 | ✍ Writes the player node object and, if set, the hand tool object id, preceded by a boolean presence flag. |
| `PlayerHoldHandToolEvent:run(connection: Connection)` | 62 | ✍ On the server, re-broadcasts the event to the other clients. Then resolves the hand tool and calls `setCurrentHandTool` on the player, only if the tool exists and is synchronized, or with nil to clear it. |
| `PlayerHoldHandToolEvent.sendEvent(player: table, handToolId: integer, noEventSend: boolean)` | 84 | ✍ Sends the event unless `noEventSend` is true: the server broadcasts it to all clients, a client sends it to the server. |
