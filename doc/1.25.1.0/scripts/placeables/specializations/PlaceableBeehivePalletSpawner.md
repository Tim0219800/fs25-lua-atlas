# placeables/specializations/PlaceableBeehivePalletSpawner.lua

Source : `dataS/scripts/placeables/specializations/PlaceableBeehivePalletSpawner.lua` — FS25 1.25.1.0

- **PlaceableBeehivePalletSpawner** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableBeehivePalletSpawner.prerequisitesPresent(specializations: table) → boolean` | 17 |  |
| `PlaceableBeehivePalletSpawner.registerFunctions(placeableType: any)` | 23 |  |
| `PlaceableBeehivePalletSpawner.registerOverwrittenFunctions(placeableType: any)` | 31 |  |
| `PlaceableBeehivePalletSpawner.registerEventListeners(placeableType: any)` | 38 |  |
| `PlaceableBeehivePalletSpawner.registerXMLPaths(schema: any, basePath: any)` | 50 |  |
| `PlaceableBeehivePalletSpawner.registerSavegameXMLPaths(schema: any, basePath: any)` | 58 |  |
| `PlaceableBeehivePalletSpawner:onLoad(savegame: table)` | 65 |  |
| `PlaceableBeehivePalletSpawner:onDelete()` | 88 |  |
| `PlaceableBeehivePalletSpawner:onFinalizePlacement()` | 98 |  |
| `PlaceableBeehivePalletSpawner:onReadStream(streamId: any, connection: any)` | 104 |  |
| `PlaceableBeehivePalletSpawner:onWriteStream(streamId: any, connection: any)` | 113 |  |
| `PlaceableBeehivePalletSpawner:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 123 |  |
| `PlaceableBeehivePalletSpawner:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 132 |  |
| `PlaceableBeehivePalletSpawner:loadFromXMLFile(xmlFile: any, key: any)` | 142 |  |
| `PlaceableBeehivePalletSpawner:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 150 |  |
| `PlaceableBeehivePalletSpawner:addFillLevel(fillLevel: any)` | 161 |  |
| `PlaceableBeehivePalletSpawner:updatePallets()` | 173 |  |
| `PlaceableBeehivePalletSpawner:getPalletCallback(pallet: any, result: any, fillTypeIndex: any)` | 186 |  |
| `PlaceableBeehivePalletSpawner:updateInfo(superFunc: any, infoTable: any)` | 215 |  |
| `PlaceableBeehivePalletSpawner:canBuy(superFunc: any)` | 225 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `addFillLevel` | 24 |
| registerFunction | `updatePallets` | 25 |
| registerFunction | `getPalletCallback` | 26 |
| registerOverwrittenFunction | `canBuy` | 32 |
| registerOverwrittenFunction | `updateInfo` | 33 |
| registerEventListener | `onLoad` | 39 |
| registerEventListener | `onDelete` | 40 |
| registerEventListener | `onFinalizePlacement` | 41 |
| registerEventListener | `onReadStream` | 42 |
| registerEventListener | `onWriteStream` | 43 |
| registerEventListener | `onReadUpdateStream` | 44 |
| registerEventListener | `onWriteUpdateStream` | 45 |
