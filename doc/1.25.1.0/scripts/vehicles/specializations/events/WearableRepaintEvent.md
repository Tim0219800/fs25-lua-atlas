# vehicles/specializations/events/WearableRepaintEvent.lua

Source: `dataS/scripts/vehicles/specializations/events/WearableRepaintEvent.lua` — FS25 1.25.1.0

- **WearableRepaintEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `WearableRepaintEvent.emptyNew() → table` | 14 |  |
| `WearableRepaintEvent.new(vehicle: table)` | 21 |  |
| `WearableRepaintEvent:readStream(streamId: integer, connection: Connection)` | 31 |  |
| `WearableRepaintEvent:writeStream(streamId: integer, connection: Connection)` | 40 |  |
| `WearableRepaintEvent:run(connection: Connection)` | 47 |  |

## Messages

- publishes `MessageType.VEHICLE_REPAINTED` (l.56)
