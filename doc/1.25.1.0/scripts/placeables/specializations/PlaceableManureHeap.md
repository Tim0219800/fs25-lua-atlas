# placeables/specializations/PlaceableManureHeap.lua

Source : `dataS/scripts/placeables/specializations/PlaceableManureHeap.lua` — FS25 1.25.1.0

- **PlaceableManureHeap** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableManureHeap.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableManureHeap.registerOverwrittenFunctions(placeableType: any)` | 24 |  |
| `PlaceableManureHeap.registerEventListeners(placeableType: any)` | 33 |  |
| `PlaceableManureHeap.registerXMLPaths(schema: any, basePath: any)` | 43 |  |
| `PlaceableManureHeap.registerSavegameXMLPaths(schema: any, basePath: any)` | 53 |  |
| `PlaceableManureHeap.initSpecialization()` | 61 |  |
| `PlaceableManureHeap:onLoad(savegame: table)` | 68 |  |
| `PlaceableManureHeap:onDelete()` | 96 |  |
| `PlaceableManureHeap:onFinalizePlacement()` | 125 |  |
| `PlaceableManureHeap:onReadStream(streamId: any, connection: any)` | 160 |  |
| `PlaceableManureHeap:onWriteStream(streamId: any, connection: any)` | 176 |  |
| `PlaceableManureHeap:loadFromXMLFile(xmlFile: any, key: any)` | 192 |  |
| `PlaceableManureHeap:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 201 |  |
| `PlaceableManureHeap:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 210 |  |
| `PlaceableManureHeap:collectPickObjects(superFunc: any, node: any)` | 241 |  |
| `PlaceableManureHeap:getCanBePlacedAt(superFunc: any, x: any, y: any, z: any, farmId: any)` | 263 |  |
| `PlaceableManureHeap:updateInfo(superFunc: any, infoTable: any)` | 284 |  |
| `PlaceableManureHeap.loadSpecValueCapacity(xmlFile: any, customEnvironment: any, baseDir: any)` | 300 |  |
| `PlaceableManureHeap.getSpecValueCapacity(storeItem: any, realItem: any)` | 306 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `setOwnerFarmId` | 25 |
| registerOverwrittenFunction | `collectPickObjects` | 26 |
| registerOverwrittenFunction | `getCanBePlacedAt` | 27 |
| registerOverwrittenFunction | `updateInfo` | 28 |
| registerEventListener | `onLoad` | 34 |
| registerEventListener | `onDelete` | 35 |
| registerEventListener | `onFinalizePlacement` | 36 |
| registerEventListener | `onReadStream` | 37 |
| registerEventListener | `onWriteStream` | 38 |
