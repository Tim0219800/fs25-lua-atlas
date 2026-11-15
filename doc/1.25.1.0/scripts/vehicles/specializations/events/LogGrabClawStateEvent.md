# vehicles/specializations/events/LogGrabClawStateEvent.lua

Source : `dataS/scripts/vehicles/specializations/events/LogGrabClawStateEvent.lua` — FS25 1.25.1.0

- **LogGrabClawStateEvent** hérite de `Event` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LogGrabClawStateEvent.emptyNew() → table` | 19 |  |
| `LogGrabClawStateEvent.new(object: table, state: table, grabIndex: any) → table` | 29 |  |
| `LogGrabClawStateEvent:readStream(streamId: integer, connection: Connection)` | 42 |  |
| `LogGrabClawStateEvent:writeStream(streamId: integer, connection: Connection)` | 54 |  |
| `LogGrabClawStateEvent:run(connection: Connection)` | 63 |  |
| `LogGrabClawStateEvent.sendEvent(vehicle: table, state: integer, grabIndex: boolean, noEventSend: boolean)` | 78 |  |
