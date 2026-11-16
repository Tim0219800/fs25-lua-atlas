# player/events/PlayerSetNicknameEvent.lua

*[Version française](../../../fr/scripts/player/events/PlayerSetNicknameEvent.md)*

Source: `dataS/scripts/player/events/PlayerSetNicknameEvent.lua` — FS25 1.25.1.0

✍ Event that propagates a player's nickname change. Both server and client simply forward the data to `g_currentMission:setPlayerNickname`; the client side passes an extra flag, probably to avoid re-sending (UNVERIFIED, the function lives in a class missing from the dump).

- **PlayerSetNicknameEvent** inherits from `Event` (l.4)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerSetNicknameEvent.emptyNew() → table` | 11 | ✍ Creates an empty event instance for stream reading. |
| `PlayerSetNicknameEvent.new(player: any, nickname: any, userId: any)` | 18 | ✍ Builds the event with the player, new nickname and user id. |
| `PlayerSetNicknameEvent:writeStream(streamId: integer, connection: table)` | 32 | ✍ Writes the player node object, the nickname string and the user id. |
| `PlayerSetNicknameEvent:readStream(streamId: integer, connection: table)` | 42 | ✍ Reads player, nickname and user id, then runs the event. |
| `PlayerSetNicknameEvent:run(connection: table)` | 53 | ✍ Calls `g_currentMission:setPlayerNickname` with the data; on the client a fourth argument `true` is added. Its further effects are UNVERIFIED. |
