# animals/husbandry/placeables/PlaceableHusbandryLiquidManure.lua

Source : `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryLiquidManure.lua` — FS25 1.25.1.0

- **PlaceableHusbandryLiquidManure** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHusbandryLiquidManure.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableHusbandryLiquidManure.registerOverwrittenFunctions(placeableType: any)` | 24 |  |
| `PlaceableHusbandryLiquidManure.registerEventListeners(placeableType: any)` | 33 |  |
| `PlaceableHusbandryLiquidManure.registerXMLPaths(schema: any, basePath: any)` | 41 |  |
| `PlaceableHusbandryLiquidManure:onLoad(savegame: any)` | 51 |  |
| `PlaceableHusbandryLiquidManure:onFinalizePlacement()` | 61 |  |
| `PlaceableHusbandryLiquidManure:updateOutput(superFunc: any, foodFactor: any, productionFactor: any, globalProductionFactor: any)` | 70 |  |
| `PlaceableHusbandryLiquidManure:updateProduction(superFunc: any, foodFactor: any)` | 85 |  |
| `PlaceableHusbandryLiquidManure:onHusbandryAnimalsUpdate(clusters: any)` | 101 |  |
| `PlaceableHusbandryLiquidManure:getConditionInfos(superFunc: any)` | 122 |  |
| `PlaceableHusbandryLiquidManure:updateInfo(superFunc: any, infoTable: any)` | 150 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `updateOutput` | 25 |
| registerOverwrittenFunction | `updateProduction` | 26 |
| registerOverwrittenFunction | `updateInfo` | 27 |
| registerOverwrittenFunction | `getConditionInfos` | 28 |
| registerEventListener | `onLoad` | 34 |
| registerEventListener | `onFinalizePlacement` | 35 |
| registerEventListener | `onHusbandryAnimalsUpdate` | 36 |
