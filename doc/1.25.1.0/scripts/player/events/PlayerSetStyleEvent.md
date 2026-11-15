# player/events/PlayerSetStyleEvent.lua

Source: `dataS/scripts/player/events/PlayerSetStyleEvent.lua` — FS25 1.25.1.0

- **PlayerSetStyleEvent** inherits from `Event` (l.4)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlayerSetStyleEvent.emptyNew() → table` | 11 |  |
| `PlayerSetStyleEvent.new(player: any, style: any, playerObjectId: any)` | 18 |  |
| `PlayerSetStyleEvent:writeStream(streamId: integer, connection: table)` | 32 |  |
| `PlayerSetStyleEvent:readStream(streamId: integer, connection: table)` | 48 |  |
| `PlayerSetStyleEvent:run(connection: table)` | 65 |  |
| `PlayerSetStyleEvent.sendEvent(player: Player, style: PlayerStyle, playerObjectId: integer?, noEventSend: boolean?)` | 80 |  |
