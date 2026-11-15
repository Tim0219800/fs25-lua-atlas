# placeables/specializations/PlaceableSolarPanels.lua

Source : `dataS/scripts/placeables/specializations/PlaceableSolarPanels.lua` — FS25 1.25.1.0

- **PlaceableSolarPanels** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableSolarPanels.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableSolarPanels.initSpecialization()` | 24 |  |
| `PlaceableSolarPanels.registerOverwrittenFunctions(placeableType: any)` | 30 |  |
| `PlaceableSolarPanels.registerFunctions(placeableType: any)` | 37 |  |
| `PlaceableSolarPanels.registerEventListeners(placeableType: any)` | 43 |  |
| `PlaceableSolarPanels.registerXMLPaths(schema: any, basePath: any)` | 54 |  |
| `PlaceableSolarPanels.registerSavegameXMLPaths(schema: any, basePath: any)` | 68 |  |
| `PlaceableSolarPanels:onLoad(savegame: any)` | 76 |  |
| `PlaceableSolarPanels:onFinalizePlacement()` | 115 |  |
| `PlaceableSolarPanels:loadFromXMLFile(xmlFile: any, key: any)` | 121 |  |
| `PlaceableSolarPanels:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 131 |  |
| `PlaceableSolarPanels:onReadStream(streamId: any, connection: any)` | 140 |  |
| `PlaceableSolarPanels:onWriteStream(streamId: any, connection: any)` | 149 |  |
| `PlaceableSolarPanels:onUpdate(dt: any)` | 158 |  |
| `PlaceableSolarPanels:onHourChanged()` | 180 |  |
| `PlaceableSolarPanels:updateHeadRotation()` | 186 |  |
| `PlaceableSolarPanels:getIncomePerHour(superFunc: any)` | 206 |  |
| `PlaceableSolarPanels:getNeedHourChanged(superFunc: any)` | 234 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `getIncomePerHour` | 31 |
| registerOverwrittenFunction | `getNeedHourChanged` | 32 |
| registerFunction | `updateHeadRotation` | 38 |
| registerEventListener | `onLoad` | 44 |
| registerEventListener | `onFinalizePlacement` | 45 |
| registerEventListener | `onReadStream` | 46 |
| registerEventListener | `onWriteStream` | 47 |
| registerEventListener | `onHourChanged` | 48 |
| registerEventListener | `onUpdate` | 49 |
