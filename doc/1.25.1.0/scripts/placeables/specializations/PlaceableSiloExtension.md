# placeables/specializations/PlaceableSiloExtension.lua

Source: `dataS/scripts/placeables/specializations/PlaceableSiloExtension.lua` — FS25 1.25.1.0

- **PlaceableSiloExtension** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableSiloExtension.prerequisitesPresent(specializations: table) → boolean` | 19 |  |
| `PlaceableSiloExtension.registerOverwrittenFunctions(placeableType: any)` | 25 |  |
| `PlaceableSiloExtension.registerEventListeners(placeableType: any)` | 33 |  |
| `PlaceableSiloExtension.registerXMLPaths(schema: any, basePath: any)` | 44 |  |
| `PlaceableSiloExtension.registerSavegameXMLPaths(schema: any, basePath: any)` | 55 |  |
| `PlaceableSiloExtension.initSpecialization()` | 63 |  |
| `PlaceableSiloExtension:onLoad(savegame: table)` | 70 |  |
| `PlaceableSiloExtension:onDelete()` | 90 |  |
| `PlaceableSiloExtension:onFinalizePlacement()` | 109 |  |
| `PlaceableSiloExtension:onReadStream(streamId: any, connection: any)` | 128 |  |
| `PlaceableSiloExtension:onWriteStream(streamId: any, connection: any)` | 140 |  |
| `PlaceableSiloExtension:getCanBePlacedAt(superFunc: any, x: any, y: any, z: any, farmId: any)` | 152 |  |
| `PlaceableSiloExtension:canBeSold(superFunc: any)` | 179 |  |
| `PlaceableSiloExtension:loadFromXMLFile(xmlFile: any, key: any)` | 228 |  |
| `PlaceableSiloExtension:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 238 |  |
| `PlaceableSiloExtension:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 247 |  |
| `PlaceableSiloExtension:onSell()` | 259 |  |
| `PlaceableSiloExtension.loadSpecValueVolume(xmlFile: any, customEnvironment: any, baseDir: any)` | 271 |  |
| `PlaceableSiloExtension.getSpecValueVolume(storeItem: any, realItem: any)` | 277 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `setOwnerFarmId` | 26 |
| registerOverwrittenFunction | `getCanBePlacedAt` | 27 |
| registerOverwrittenFunction | `canBeSold` | 28 |
| registerEventListener | `onLoad` | 34 |
| registerEventListener | `onDelete` | 35 |
| registerEventListener | `onFinalizePlacement` | 36 |
| registerEventListener | `onReadStream` | 37 |
| registerEventListener | `onWriteStream` | 38 |
| registerEventListener | `onSell` | 39 |
