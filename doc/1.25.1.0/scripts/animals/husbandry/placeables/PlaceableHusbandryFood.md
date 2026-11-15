# animals/husbandry/placeables/PlaceableHusbandryFood.lua

Source : `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryFood.lua` — FS25 1.25.1.0

- **PlaceableHusbandryFood** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHusbandryFood.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableHusbandryFood.registerFunctions(placeableType: any)` | 24 |  |
| `PlaceableHusbandryFood.registerOverwrittenFunctions(placeableType: any)` | 38 |  |
| `PlaceableHusbandryFood.registerEventListeners(placeableType: any)` | 48 |  |
| `PlaceableHusbandryFood.registerXMLPaths(schema: any, basePath: any)` | 64 |  |
| `PlaceableHusbandryFood.registerSavegameXMLPaths(schema: any, basePath: any)` | 81 |  |
| `PlaceableHusbandryFood.initSpecialization()` | 90 |  |
| `PlaceableHusbandryFood:onLoad(savegame: any)` | 96 |  |
| `PlaceableHusbandryFood:onPostLoad()` | 173 |  |
| `PlaceableHusbandryFood:onDelete()` | 201 |  |
| `PlaceableHusbandryFood:onFinalizePlacement()` | 224 |  |
| `PlaceableHusbandryFood:onPostFinalizePlacement()` | 235 |  |
| `PlaceableHusbandryFood:onReadStream(streamId: any, connection: any)` | 241 |  |
| `PlaceableHusbandryFood:onWriteStream(streamId: any, connection: any)` | 265 |  |
| `PlaceableHusbandryFood:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 288 |  |
| `PlaceableHusbandryFood:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 314 |  |
| `PlaceableHusbandryFood:loadFromXMLFile(xmlFile: any, key: any)` | 334 |  |
| `PlaceableHusbandryFood:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 350 |  |
| `PlaceableHusbandryFood:updateFeeding(superFunc: any)` | 368 |  |
| `PlaceableHusbandryFood:updateInfo(superFunc: any, infoTable: any)` | 391 |  |
| `PlaceableHusbandryFood:getFoodInfos(superFunc: any)` | 402 |  |
| `PlaceableHusbandryFood:updateFillPlanes(fillTypeIndex: any)` | 438 |  |
| `PlaceableHusbandryFood:collectPickObjects(superFunc: any, node: any)` | 459 |  |
| `PlaceableHusbandryFood:onHusbandryAnimalsCreated(husbandryId: any)` | 475 |  |
| `PlaceableHusbandryFood:updateFoodPlaces()` | 492 |  |
| `PlaceableHusbandryFood:getTotalFood()` | 506 |  |
| `PlaceableHusbandryFood:getFoodCapacity()` | 523 |  |
| `PlaceableHusbandryFood:getFreeFoodCapacity(fillTypeIndex: any)` | 529 |  |
| `PlaceableHusbandryFood:addFood(farmId: any, deltaFillLevel: any, fillTypeIndex: any, fillPositionData: any, toolType: any, extraAttributes: any)` | 540 |  |
| `PlaceableHusbandryFood:removeFood(absDeltaFillLevel: any, fillTypeIndex: any)` | 630 |  |
| `PlaceableHusbandryFood:onHusbandryAnimalsUpdate(clusters: any)` | 668 |  |
| `PlaceableHusbandryFood:getAnimalDescription(superFunc: any, cluster: any)` | 689 |  |
| `PlaceableHusbandryFood.loadSpecValueAnimalFoodFillTypes(xmlFile: any, customEnvironment: any, baseDir: any)` | 697 |  |
| `PlaceableHusbandryFood.getSpecValueAnimalFoodFillTypes(storeItem: any, realItem: any)` | 715 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `updateFillPlanes` | 25 |
| registerFunction | `updateFoodPlaces` | 26 |
| registerFunction | `addFood` | 27 |
| registerFunction | `removeFood` | 28 |
| registerFunction | `getTotalFood` | 29 |
| registerFunction | `getAvailableFood` | 30 |
| registerFunction | `getFoodCapacity` | 31 |
| registerFunction | `getFreeFoodCapacity` | 32 |
| registerFunction | `getFoodLitersPerHour` | 33 |
| registerOverwrittenFunction | `updateInfo` | 39 |
| registerOverwrittenFunction | `updateFeeding` | 40 |
| registerOverwrittenFunction | `getFoodInfos` | 41 |
| registerOverwrittenFunction | `collectPickObjects` | 42 |
| registerOverwrittenFunction | `getAnimalDescription` | 43 |
| registerEventListener | `onLoad` | 49 |
| registerEventListener | `onPostLoad` | 50 |
| registerEventListener | `onDelete` | 51 |
| registerEventListener | `onFinalizePlacement` | 52 |
| registerEventListener | `onPostFinalizePlacement` | 53 |
| registerEventListener | `onReadStream` | 54 |
| registerEventListener | `onWriteStream` | 55 |
| registerEventListener | `onReadUpdateStream` | 56 |
| registerEventListener | `onWriteUpdateStream` | 57 |
| registerEventListener | `onHusbandryAnimalsUpdate` | 58 |
| registerEventListener | `onHusbandryAnimalsCreated` | 59 |
