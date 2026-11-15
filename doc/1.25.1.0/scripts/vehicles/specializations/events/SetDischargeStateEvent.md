# vehicles/specializations/events/SetDischargeStateEvent.lua

Source : `dataS/scripts/vehicles/specializations/events/SetDischargeStateEvent.lua` — FS25 1.25.1.0

- **SetDischargeStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SetDischargeStateEvent.emptyNew() → table` | 14 |  |
| `SetDischargeStateEvent.new(vehicle: table, state: integer)` | 23 |  |
| `SetDischargeStateEvent:readStream(streamId: integer, connection: Connection)` | 34 |  |
| `SetDischargeStateEvent:writeStream(streamId: integer, connection: Connection)` | 44 |  |
| `SetDischargeStateEvent:run(connection: Connection)` | 52 |  |
| `SetDischargeStateEvent.sendEvent(vehicle: table, state: integer, noEventSend: boolean)` | 69 |  |
