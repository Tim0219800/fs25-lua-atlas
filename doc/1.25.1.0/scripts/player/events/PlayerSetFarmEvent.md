# player/events/PlayerSetFarmEvent.lua

Source : `dataS/scripts/player/events/PlayerSetFarmEvent.lua` — FS25 1.25.1.0

- **PlayerSetFarmEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerSetFarmEvent.emptyNew() → table` | 13 |  |
| `PlayerSetFarmEvent.new(player: table, farmId: integer, password: any) → table` | 23 |  |
| `PlayerSetFarmEvent:writeStream(streamId: integer, connection: table)` | 37 |  |
| `PlayerSetFarmEvent:readStream(streamId: integer, connection: table)` | 53 |  |
| `PlayerSetFarmEvent:run(connection: table)` | 67 |  |
| `PlayerSetFarmEvent.sendEvent(player: table, farmId: integer, noEventSend: boolean?)` | 122 |  |

## Messages

- publie `MessageType.PLAYER_FARM_CHANGED` (l.90)
- publie `MessageType.PLAYER_FARM_CHANGED` (l.113)
