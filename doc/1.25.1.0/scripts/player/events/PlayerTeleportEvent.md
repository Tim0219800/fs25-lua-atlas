# player/events/PlayerTeleportEvent.lua

Source : `dataS/scripts/player/events/PlayerTeleportEvent.lua` — FS25 1.25.1.0

- **PlayerTeleportEvent** hérite de `Event` (l.4)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerTeleportEvent.emptyNew() → table` | 11 |  |
| `PlayerTeleportEvent.new(x: number, y: number, z: number, isAbsolute: boolean, isRootNode: boolean) → table` | 24 |  |
| `PlayerTeleportEvent.newExitVehicle(exitVehicle: table) → table` | 38 |  |
| `PlayerTeleportEvent:readStream(streamId: integer, connection: table)` | 48 |  |
| `PlayerTeleportEvent:writeStream(streamId: integer, connection: table)` | 65 |  |
| `PlayerTeleportEvent:run(connection: table)` | 80 |  |
