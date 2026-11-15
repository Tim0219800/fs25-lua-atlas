# internalMods/FS25_precisionFarming/scripts/events/TramlineMapSetEvent.lua

Source : `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/TramlineMapSetEvent.lua` — FS25 1.25.1.0

- **TramlineMapSetEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TramlineMapSetEvent.emptyNew() → table` | 14 |  |
| `TramlineMapSetEvent.new(farmlandId: table, workingWidth: any, workDirection: any, spacing: any, enabled: any, clearFruit: any)` | 22 |  |
| `TramlineMapSetEvent:readStream(streamId: integer, connection: Connection)` | 38 |  |
| `TramlineMapSetEvent:writeStream(streamId: integer, connection: Connection)` | 53 |  |
| `TramlineMapSetEvent:run(connection: Connection)` | 65 |  |
| `TramlineMapSetEvent.sendEvent(farmlandId: table, workingWidth: boolean, workDirection: any, spacing: any, enabled: any, clearFruit: any, noEventSend: boolean)` | 81 |  |
