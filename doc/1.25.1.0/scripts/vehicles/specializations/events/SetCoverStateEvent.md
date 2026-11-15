# vehicles/specializations/events/SetCoverStateEvent.lua

Source : `dataS/scripts/vehicles/specializations/events/SetCoverStateEvent.lua` — FS25 1.25.1.0

- **SetCoverStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SetCoverStateEvent.emptyNew() → table` | 14 |  |
| `SetCoverStateEvent.new(vehicle: table, state: integer)` | 22 |  |
| `SetCoverStateEvent:readStream(streamId: integer, connection: Connection)` | 35 |  |
| `SetCoverStateEvent:writeStream(streamId: integer, connection: Connection)` | 45 |  |
| `SetCoverStateEvent:run(connection: Connection)` | 53 |  |
| `SetCoverStateEvent.sendEvent(vehicle: table, state: integer, noEventSend: boolean)` | 70 |  |
