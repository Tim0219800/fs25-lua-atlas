# placeables/specializations/PlaceableSellingStation.lua

Source : `dataS/scripts/placeables/specializations/PlaceableSellingStation.lua` — FS25 1.25.1.0

- **PlaceableSellingStation** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableSellingStation.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableSellingStation.registerFunctions(placeableType: any)` | 24 |  |
| `PlaceableSellingStation.registerOverwrittenFunctions(placeableType: any)` | 30 |  |
| `PlaceableSellingStation.registerEventListeners(placeableType: any)` | 36 |  |
| `PlaceableSellingStation.registerXMLPaths(schema: any, basePath: any)` | 46 |  |
| `PlaceableSellingStation.registerSavegameXMLPaths(schema: any, basePath: any)` | 54 |  |
| `PlaceableSellingStation.initSpecialization()` | 62 |  |
| `PlaceableSellingStation:onLoad(savegame: table)` | 69 |  |
| `PlaceableSellingStation:onDelete()` | 80 |  |
| `PlaceableSellingStation:onFinalizePlacement()` | 91 |  |
| `PlaceableSellingStation:onReadStream(streamId: any, connection: any)` | 100 |  |
| `PlaceableSellingStation:onWriteStream(streamId: any, connection: any)` | 110 |  |
| `PlaceableSellingStation:getSellingStation()` | 120 |  |
| `PlaceableSellingStation:collectPickObjects(superFunc: any, node: any)` | 126 |  |
| `PlaceableSellingStation:loadFromXMLFile(xmlFile: any, key: any)` | 144 |  |
| `PlaceableSellingStation:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 151 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getSellingStation` | 25 |
| registerOverwrittenFunction | `collectPickObjects` | 31 |
| registerEventListener | `onLoad` | 37 |
| registerEventListener | `onDelete` | 38 |
| registerEventListener | `onFinalizePlacement` | 39 |
| registerEventListener | `onReadStream` | 40 |
| registerEventListener | `onWriteStream` | 41 |
