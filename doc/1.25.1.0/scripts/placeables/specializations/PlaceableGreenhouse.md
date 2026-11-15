# placeables/specializations/PlaceableGreenhouse.lua

Source : `dataS/scripts/placeables/specializations/PlaceableGreenhouse.lua` — FS25 1.25.1.0

- **PlaceableGreenhouse** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableGreenhouse.getRandomGrowthInterval()` | 23 |  |
| `PlaceableGreenhouse.getRandomWateringInterval()` | 29 |  |
| `PlaceableGreenhouse.prerequisitesPresent(specializations: table) → boolean` | 39 |  |
| `PlaceableGreenhouse.initSpecialization()` | 45 |  |
| `PlaceableGreenhouse.registerFunctions(placeableType: any)` | 58 |  |
| `PlaceableGreenhouse.registerEventListeners(placeableType: any)` | 69 |  |
| `PlaceableGreenhouse.registerXMLPaths(schema: any, basePath: any)` | 80 |  |
| `PlaceableGreenhouse:onLoad(savegame: any)` | 97 |  |
| `PlaceableGreenhouse:addPlantPlace(node: any, useRandomYRot: any)` | 183 |  |
| `PlaceableGreenhouse:loadPlantFromXml(xmlFilename: any)` | 195 |  |
| `PlaceableGreenhouse:plantI3DLoadedCallback(i3dNode: any, failedReason: any, args: any)` | 232 |  |
| `PlaceableGreenhouse:onDelete()` | 269 |  |
| `PlaceableGreenhouse:onFinalizePlacement()` | 305 |  |
| `PlaceableGreenhouse:onUpdate()` | 313 |  |
| `PlaceableGreenhouse:onOutputFillTypesChanged(outputs: any, state: any)` | 321 |  |
| `PlaceableGreenhouse:onProductionStatusChanged(production: any, status: any)` | 345 |  |
| `PlaceableGreenhouse:updatePlantDistribution()` | 364 |  |
| `PlaceableGreenhouse:setPlantAtPlace(fillType: any, plantPlace: any)` | 386 |  |
| `PlaceableGreenhouse:updatePlantsStage()` | 418 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadPlantFromXml` | 59 |
| registerFunction | `plantI3DLoadedCallback` | 60 |
| registerFunction | `addPlantPlace` | 61 |
| registerFunction | `updatePlantDistribution` | 62 |
| registerFunction | `setPlantAtPlace` | 63 |
| registerFunction | `updatePlantsStage` | 64 |
| registerEventListener | `onLoad` | 70 |
| registerEventListener | `onDelete` | 71 |
| registerEventListener | `onFinalizePlacement` | 72 |
| registerEventListener | `onOutputFillTypesChanged` | 73 |
| registerEventListener | `onProductionStatusChanged` | 74 |
| registerEventListener | `onUpdate` | 75 |
