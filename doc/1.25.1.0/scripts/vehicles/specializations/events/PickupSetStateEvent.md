# vehicles/specializations/events/PickupSetStateEvent.lua

Source : `dataS/scripts/vehicles/specializations/events/PickupSetStateEvent.lua` — FS25 1.25.1.0

- **PickupSetStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PickupSetStateEvent.emptyNew() → table` | 14 |  |
| `PickupSetStateEvent.new(object: table, isPickupLowered: boolean)` | 23 |  |
| `PickupSetStateEvent:readStream(streamId: integer, connection: Connection)` | 34 |  |
| `PickupSetStateEvent:writeStream(streamId: integer, connection: Connection)` | 44 |  |
| `PickupSetStateEvent:run(connection: Connection)` | 52 |  |
| `PickupSetStateEvent.sendEvent(vehicle: table, isPickupLowered: boolean, noEventSend: boolean)` | 67 |  |
