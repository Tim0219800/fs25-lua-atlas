# objects/ProductionPointProductionStatusEvent.lua

Source : `dataS/scripts/objects/ProductionPointProductionStatusEvent.lua` — FS25 1.25.1.0

- **ProductionPointProductionStatusEvent** hérite de `Event` (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ProductionPointProductionStatusEvent.emptyNew() → table` | 13 |  |
| `ProductionPointProductionStatusEvent.new(productionPoint: ProductionPoint, productionIndex: integer, status: integer) → ProductionPointProductionStatusEvent` | 24 |  |
| `ProductionPointProductionStatusEvent:readStream(streamId: any, connection: any)` | 34 |  |
| `ProductionPointProductionStatusEvent:writeStream(streamId: any, connection: any)` | 43 |  |
| `ProductionPointProductionStatusEvent:run(connection: any)` | 51 |  |
| `ProductionPointProductionStatusEvent.sendEvent(productionPoint: any, productionIndex: any, status: any, noEventSend: any)` | 64 |  |
