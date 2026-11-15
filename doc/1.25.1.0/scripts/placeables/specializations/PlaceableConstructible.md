# placeables/specializations/PlaceableConstructible.lua

Source : `dataS/scripts/placeables/specializations/PlaceableConstructible.lua` — FS25 1.25.1.0

- **PlaceableConstructible** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableConstructible.prerequisitesPresent(specializations: table) → boolean` | 25 |  |
| `PlaceableConstructible.registerFunctions(placeableType: any)` | 31 |  |
| `PlaceableConstructible.registerOverwrittenFunctions(placeableType: any)` | 49 |  |
| `PlaceableConstructible.registerEventListeners(placeableType: any)` | 57 |  |
| `PlaceableConstructible.registerXMLPaths(schema: any, basePath: any)` | 72 |  |
| `PlaceableConstructible.registerSavegameXMLPaths(schema: any, basePath: any)` | 94 |  |
| `PlaceableConstructible:onLoad(savegame: table)` | 104 |  |
| `PlaceableConstructible:onFinalizePlacement(savegame: any)` | 232 |  |
| `PlaceableConstructible:onDelete()` | 268 |  |
| `PlaceableConstructible:collectPickObjects(superFunc: any, node: any)` | 297 |  |
| `PlaceableConstructible:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 312 |  |
| `PlaceableConstructible:loadFromXMLFile(xmlFile: any, key: any)` | 327 |  |
| `PlaceableConstructible:onReadStream(streamId: any, connection: any)` | 346 |  |
| `PlaceableConstructible:onWriteStream(streamId: any, connection: any)` | 373 |  |
| `PlaceableConstructible.loadSpecValueFillTypes(xmlFile: XMLFile, customEnvironment: string?, baseDir: string?, resultTable: table?) → table?` | 687 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setConstructibleState` | 32 |
| registerFunction | `finalizeConstruction` | 33 |
| registerFunction | `getConstructibleFillLevel` | 34 |
| registerFunction | `getConstructibleSupportsFillType` | 35 |
| registerFunction | `removeConstructibleFillLevel` | 36 |
| registerFunction | `getConstructibleStateIndexByName` | 37 |
| registerFunction | `setConstructiblePreviewState` | 38 |
| registerFunction | `getConstructibleStateIndex` | 39 |
| registerFunction | `resetConstructibleToState` | 40 |
| registerFunction | `consoleCommandFinishConstructionState` | 41 |
| registerFunction | `removeConstructibleFinishStateCommand` | 42 |
| registerFunction | `getNumFinishedConstructibleStates` | 43 |
| registerFunction | `addConstructionProgressInfo` | 44 |
| registerOverwrittenFunction | `collectPickObjects` | 50 |
| registerOverwrittenFunction | `updateInfo` | 51 |
| registerOverwrittenFunction | `setOwnerFarmId` | 52 |
| registerEventListener | `onLoad` | 58 |
| registerEventListener | `onFinalizePlacement` | 59 |
| registerEventListener | `onDelete` | 60 |
| registerEventListener | `onUpdate` | 61 |
| registerEventListener | `onReadStream` | 62 |
| registerEventListener | `onWriteStream` | 63 |
| registerEventListener | `onReadUpdateStream` | 64 |
| registerEventListener | `onWriteUpdateStream` | 65 |
| registerEventListener | `onInfoTriggerEnter` | 66 |
| registerEventListener | `onInfoTriggerLeave` | 67 |
