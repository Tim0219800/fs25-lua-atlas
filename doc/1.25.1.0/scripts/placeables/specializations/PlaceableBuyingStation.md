# placeables/specializations/PlaceableBuyingStation.lua

Source : `dataS/scripts/placeables/specializations/PlaceableBuyingStation.lua` — FS25 1.25.1.0

- **PlaceableBuyingStation** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableBuyingStation.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableBuyingStation.registerFunctions(placeableType: any)` | 24 |  |
| `PlaceableBuyingStation.registerOverwrittenFunctions(placeableType: any)` | 30 |  |
| `PlaceableBuyingStation.registerEventListeners(placeableType: any)` | 36 |  |
| `PlaceableBuyingStation.registerXMLPaths(schema: any, basePath: any)` | 46 |  |
| `PlaceableBuyingStation.initSpecialization()` | 54 |  |
| `PlaceableBuyingStation:onLoad(savegame: table)` | 61 |  |
| `PlaceableBuyingStation:onDelete()` | 78 |  |
| `PlaceableBuyingStation:onFinalizePlacement()` | 89 |  |
| `PlaceableBuyingStation:onReadStream(streamId: any, connection: any)` | 99 |  |
| `PlaceableBuyingStation:onWriteStream(streamId: integer, connection: table)` | 112 |  |
| `PlaceableBuyingStation:collectPickObjects(superFunc: any, node: any)` | 123 |  |
| `PlaceableBuyingStation:getBuyingStation()` | 138 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getBuyingStation` | 25 |
| registerOverwrittenFunction | `collectPickObjects` | 31 |
| registerEventListener | `onLoad` | 37 |
| registerEventListener | `onDelete` | 38 |
| registerEventListener | `onFinalizePlacement` | 39 |
| registerEventListener | `onReadStream` | 40 |
| registerEventListener | `onWriteStream` | 41 |
