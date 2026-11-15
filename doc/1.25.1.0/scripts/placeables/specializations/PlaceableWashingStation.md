# placeables/specializations/PlaceableWashingStation.lua

Source : `dataS/scripts/placeables/specializations/PlaceableWashingStation.lua` — FS25 1.25.1.0

- **PlaceableWashingStation** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableWashingStation.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableWashingStation.registerOverwrittenFunctions(placeableType: any)` | 24 |  |
| `PlaceableWashingStation.registerEventListeners(placeableType: any)` | 30 |  |
| `PlaceableWashingStation.registerXMLPaths(schema: any, basePath: any)` | 40 |  |
| `PlaceableWashingStation:onLoad(savegame: table)` | 49 |  |
| `PlaceableWashingStation:onDelete()` | 65 |  |
| `PlaceableWashingStation:onFinalizePlacement()` | 77 |  |
| `PlaceableWashingStation:onReadStream(streamId: any, connection: any)` | 89 |  |
| `PlaceableWashingStation:onWriteStream(streamId: any, connection: any)` | 103 |  |
| `PlaceableWashingStation:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 117 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `setOwnerFarmId` | 25 |
| registerEventListener | `onLoad` | 31 |
| registerEventListener | `onDelete` | 32 |
| registerEventListener | `onFinalizePlacement` | 33 |
| registerEventListener | `onReadStream` | 34 |
| registerEventListener | `onWriteStream` | 35 |
