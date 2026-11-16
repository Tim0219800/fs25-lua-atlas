# player/events/PlayerSetFarmEvent.lua

*[Version française](../../../fr/scripts/player/events/PlayerSetFarmEvent.md)*

Source: `dataS/scripts/player/events/PlayerSetFarmEvent.lua` — FS25 1.25.1.0

✍ Event used to change the farm a player belongs to. A client sends it to the server, which checks the farm password (master users bypass it), updates the player and farm user lists, and answers with `PlayerSetFarmAnswerEvent` and a `PlayerSwitchedFarmEvent` broadcast.

- **PlayerSetFarmEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerSetFarmEvent.emptyNew() → table` | 13 | ✍ Creates an empty event instance for stream reading. |
| `PlayerSetFarmEvent.new(player: table, farmId: integer, password: any) → table` | 23 | ✍ Builds the event with the player, target farm id and optional password. |
| `PlayerSetFarmEvent:writeStream(streamId: integer, connection: table)` | 37 | ✍ Writes the player node object, the farm id, and an optional password behind a boolean flag. |
| `PlayerSetFarmEvent:readStream(streamId: integer, connection: table)` | 53 | ✍ Reads player, farm id and optional password, then runs the event. |
| `PlayerSetFarmEvent:run(connection: table)` | 67 | ✍ Server: if the farm exists and the user is a master user or the password matches (or is unset), moves the user, updates the hotspot owner, publishes `PLAYER_FARM_CHANGED`, resets the finance counter and replies OK; otherwise replies PASSWORD_REQUIRED. Client: applies the farm id locally and publishes the message. Note: the server does not nil-check the old farm. |
| `PlayerSetFarmEvent.sendEvent(player: table, farmId: integer, noEventSend: boolean?)` | 122 | ✍ Unless `noEventSend` is true, the server broadcasts the event (excluding the player's own connection) and a client sends it to the server. No password argument is passed here. |

## Messages

- publishes `MessageType.PLAYER_FARM_CHANGED` (l.90)
- publishes `MessageType.PLAYER_FARM_CHANGED` (l.113)
