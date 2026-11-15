# vehicles/specializations/events/WearableRepairEvent.lua

Source : `dataS/scripts/vehicles/specializations/events/WearableRepairEvent.lua` — FS25 1.25.1.0

- **WearableRepairEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WearableRepairEvent.emptyNew() → table` | 14 |  |
| `WearableRepairEvent.new(vehicle: table, atSellingPoint: any)` | 21 |  |
| `WearableRepairEvent:readStream(streamId: integer, connection: Connection)` | 32 |  |
| `WearableRepairEvent:writeStream(streamId: integer, connection: Connection)` | 42 |  |
| `WearableRepairEvent:run(connection: Connection)` | 50 |  |

## Messages

- publie `MessageType.VEHICLE_REPAIRED` (l.59)
