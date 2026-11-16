# player/events/PlayerSwitchedFarmEvent.lua

*[Version française](../../../fr/scripts/player/events/PlayerSwitchedFarmEvent.md)*

Source: `dataS/scripts/player/events/PlayerSwitchedFarmEvent.lua` — FS25 1.25.1.0

✍ Server-to-client notice that a user moved from one farm to another. Clients update the farm user lists and publish `PLAYER_FARM_CHANGED`. It is broadcast by `PlayerSetFarmEvent` on the server.

- **PlayerSwitchedFarmEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerSwitchedFarmEvent.emptyNew() → table` | 15 | ✍ Creates an empty event instance for stream reading. Note: this file defines no `new`, although `run` and `PlayerSetFarmEvent` call `PlayerSwitchedFarmEvent.new` (UNVERIFIED whether it is defined elsewhere). |
| `PlayerSwitchedFarmEvent:writeStream(streamId: integer, connection: table)` | 34 | ✍ Writes the new farm id, the old farm id and the user id. |
| `PlayerSwitchedFarmEvent:readStream(streamId: integer, connection: table)` | 44 | ✍ Reads new farm id, old farm id and user id, then runs the event. |
| `PlayerSwitchedFarmEvent:run(connection: table)` | 55 | ✍ Client: removes the user from the old farm and adds it to the new one (when valid and found), then publishes `PLAYER_FARM_CHANGED` for that user's player. Server: re-broadcasts to all clients. Note: the broadcast passes the ids in a different order than the constructor call in `PlayerSetFarmEvent`. |

## Messages

- publishes `MessageType.PLAYER_FARM_CHANGED` (l.72)
