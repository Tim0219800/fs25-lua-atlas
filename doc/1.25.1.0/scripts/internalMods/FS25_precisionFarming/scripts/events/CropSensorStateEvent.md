# internalMods/FS25_precisionFarming/scripts/events/CropSensorStateEvent.lua

Source : `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/CropSensorStateEvent.lua` — FS25 1.25.1.0

- **CropSensorStateEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `CropSensorStateEvent.emptyNew() → table` | 14 |  |
| `CropSensorStateEvent.new(object: table, state: boolean)` | 23 |  |
| `CropSensorStateEvent:readStream(streamId: integer, connection: Connection)` | 34 |  |
| `CropSensorStateEvent:writeStream(streamId: integer, connection: Connection)` | 44 |  |
| `CropSensorStateEvent:run(connection: Connection)` | 52 |  |
| `CropSensorStateEvent.sendEvent(object: table, state: boolean, noEventSend: boolean)` | 67 |  |
