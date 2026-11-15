# player/events/PlayerSwitchedFarmEvent.lua

Source: `dataS/scripts/player/events/PlayerSwitchedFarmEvent.lua` — FS25 1.25.1.0

- **PlayerSwitchedFarmEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlayerSwitchedFarmEvent.emptyNew() → table` | 15 |  |
| `PlayerSwitchedFarmEvent:writeStream(streamId: integer, connection: table)` | 34 |  |
| `PlayerSwitchedFarmEvent:readStream(streamId: integer, connection: table)` | 44 |  |
| `PlayerSwitchedFarmEvent:run(connection: table)` | 55 |  |

## Messages

- publishes `MessageType.PLAYER_FARM_CHANGED` (l.72)
