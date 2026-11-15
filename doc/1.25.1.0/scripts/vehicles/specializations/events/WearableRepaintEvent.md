# vehicles/specializations/events/WearableRepaintEvent.lua

Source : `dataS/scripts/vehicles/specializations/events/WearableRepaintEvent.lua` — FS25 1.25.1.0

- **WearableRepaintEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WearableRepaintEvent.emptyNew() → table` | 14 |  |
| `WearableRepaintEvent.new(vehicle: table)` | 21 |  |
| `WearableRepaintEvent:readStream(streamId: integer, connection: Connection)` | 31 |  |
| `WearableRepaintEvent:writeStream(streamId: integer, connection: Connection)` | 40 |  |
| `WearableRepaintEvent:run(connection: Connection)` | 47 |  |

## Messages

- publie `MessageType.VEHICLE_REPAINTED` (l.56)
