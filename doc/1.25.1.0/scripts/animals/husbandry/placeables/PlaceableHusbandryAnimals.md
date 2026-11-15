# animals/husbandry/placeables/PlaceableHusbandryAnimals.lua

Source : `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryAnimals.lua` — FS25 1.25.1.0

- **PlaceableHusbandryAnimals** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHusbandryAnimals.prerequisitesPresent(specializations: table) → boolean` | 19 |  |
| `PlaceableHusbandryAnimals.registerEvents(placeableType: any)` | 25 |  |
| `PlaceableHusbandryAnimals.registerFunctions(placeableType: any)` | 32 |  |
| `PlaceableHusbandryAnimals.registerOverwrittenFunctions(placeableType: any)` | 67 |  |
| `PlaceableHusbandryAnimals.registerEventListeners(placeableType: any)` | 79 |  |
| `PlaceableHusbandryAnimals.registerXMLPaths(schema: any, basePath: any)` | 92 |  |
| `PlaceableHusbandryAnimals.registerSavegameXMLPaths(schema: any, basePath: any)` | 116 |  |
| `PlaceableHusbandryAnimals.initSpecialization()` | 124 |  |
| `PlaceableHusbandryAnimals:onLoad(savegame: any)` | 142 |  |
| `PlaceableHusbandryAnimals:onDelete()` | 243 |  |
| `PlaceableHusbandryAnimals:onFinalizePlacement()` | 269 |  |
| `PlaceableHusbandryAnimals:onReadStream(streamId: any, connection: any)` | 279 |  |
| `PlaceableHusbandryAnimals:onWriteStream(streamId: any, connection: any)` | 286 |  |
| `PlaceableHusbandryAnimals:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 293 |  |
| `PlaceableHusbandryAnimals:loadFromXMLFile(xmlFile: any, key: any)` | 300 |  |
| `PlaceableHusbandryAnimals:onUpdate(dt: any)` | 307 |  |
| `PlaceableHusbandryAnimals:onExternalNavigationMeshLoaded(node: any, failedReason: any, args: any)` | 329 |  |
| `PlaceableHusbandryAnimals:createHusbandry()` | 488 |  |
| `PlaceableHusbandryAnimals:updateInfo(superFunc: any, infoTable: any)` | 539 |  |
| `PlaceableHusbandryAnimals:getNeedDayChanged(superFunc: any)` | 564 |  |
| `PlaceableHusbandryAnimals:onMissionStarted(isNewSavegame: any)` | 570 |  |
| `PlaceableHusbandryAnimals:updateVisualAnimals()` | 579 |  |
| `PlaceableHusbandryAnimals:getAnimalTypeIndex()` | 588 |  |
| `PlaceableHusbandryAnimals:updateOutput(superFunc: any, foodFactor: any, productionFactor: any, globalProductionFactor: any)` | 595 |  |
| `PlaceableHusbandryAnimals:onPeriodChanged()` | 611 |  |
| `PlaceableHusbandryAnimals:onDayChanged()` | 649 |  |
| `PlaceableHusbandryAnimals:getNumOfAnimals()` | 661 |  |
| `PlaceableHusbandryAnimals:getMaxNumOfAnimals()` | 674 |  |
| `PlaceableHusbandryAnimals:getNumOfFreeAnimalSlots()` | 681 |  |
| `PlaceableHusbandryAnimals:getSupportsAnimalSubType(subTypeIndex: any)` | 689 |  |
| `PlaceableHusbandryAnimals:getNumOfClusters()` | 699 |  |
| `PlaceableHusbandryAnimals:getClusters()` | 707 |  |
| `PlaceableHusbandryAnimals:getCluster(index: any)` | 714 |  |
| `PlaceableHusbandryAnimals:getClusterById(id: any)` | 721 |  |
| `PlaceableHusbandryAnimals:addCluster(cluster: any)` | 728 |  |
| `PlaceableHusbandryAnimals:addAnimals(subTypeIndex: any, numAnimals: any, age: any)` | 738 |  |
| `PlaceableHusbandryAnimals:getClusterSystem()` | 759 |  |
| `PlaceableHusbandryAnimals:updatedClusters(husbandry: any)` | 766 |  |
| `PlaceableHusbandryAnimals:renameAnimal(clusterId: any, name: any, noEventSend: any)` | 782 |  |
| `PlaceableHusbandryAnimals:getAnimalSupportsRiding(clusterId: any)` | 794 |  |
| `PlaceableHusbandryAnimals:getAnimalCanBeRidden(clusterId: any)` | 809 |  |
| `PlaceableHusbandryAnimals:startRiding(clusterId: any, player: any)` | 816 |  |
| `PlaceableHusbandryAnimals:onLoadedRideable(vehicles: any, vehicleLoadState: any, arguments: any)` | 851 |  |
| `PlaceableHusbandryAnimals:loadDeliveryArea(xmlFile: any, key: any, area: any)` | 870 |  |
| `PlaceableHusbandryAnimals:getIsInAnimalDeliveryArea(x: any, z: any)` | 898 |  |
| `PlaceableHusbandryAnimals.loadSpecValueNumberAnimals(xmlFile: any, customEnvironment: any, baseDir: any)` | 935 |  |
| `PlaceableHusbandryAnimals.getSpecValueNumberAnimals(storeItem: any, realItem: any)` | 949 |  |
| `PlaceableHusbandryAnimals:canBeSold(superFunc: any)` | 976 |  |
| `PlaceableHusbandryAnimals:getConditionInfos(superFunc: any)` | 986 |  |
| `PlaceableHusbandryAnimals:getAnimalInfos(superFunc: any, cluster: any)` | 1006 |  |
| `PlaceableHusbandryAnimals:getAnimalDescription(superFunc: any, cluster: any)` | 1016 |  |
| `PlaceableHusbandryAnimals.consoleCommandAddAnimals(_: any, numAnimals: any, subTypeIndex: any)` | 1099 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onHusbandryAnimalsCreated` | 26 |
| registerEvent | `onHusbandryAnimalsUpdate` | 27 |
| registerFunction | `onExternalNavigationMeshLoaded` | 33 |
| registerFunction | `createNavigationMeshFromContour` | 34 |
| registerFunction | `createNavigationMesh` | 35 |
| registerFunction | `setMaxNumAnimals` | 36 |
| registerFunction | `createHusbandry` | 37 |
| registerFunction | `updateVisualAnimals` | 38 |
| registerFunction | `getNumOfFreeAnimalSlots` | 39 |
| registerFunction | `getNumOfAnimals` | 40 |
| registerFunction | `getMaxNumOfAnimals` | 41 |
| registerFunction | `getNumOfClusters` | 42 |
| registerFunction | `getSupportsAnimalSubType` | 43 |
| registerFunction | `getClusters` | 44 |
| registerFunction | `getCluster` | 45 |
| registerFunction | `getClusterById` | 46 |
| registerFunction | `getClusterSystem` | 47 |
| registerFunction | `getAnimalTypeIndex` | 48 |
| registerFunction | `renameAnimal` | 49 |
| registerFunction | `addCluster` | 50 |
| registerFunction | `addAnimals` | 51 |
| registerFunction | `updatedClusters` | 52 |
| registerFunction | `consoleCommandAddAnimals` | 53 |
| registerFunction | `getAnimalSupportsRiding` | 54 |
| registerFunction | `getAnimalCanBeRidden` | 55 |
| registerFunction | `startRiding` | 56 |
| registerFunction | `onLoadedRideable` | 57 |
| registerFunction | `getIsInAnimalDeliveryArea` | 58 |
| registerFunction | `loadDeliveryArea` | 59 |
| registerFunction | `getOutdoorContourPolygon` | 60 |
| registerFunction | `createNavigationMeshPlacementCollision` | 61 |
| registerFunction | `deleteNavigationMeshPlacementCollision` | 62 |
| registerOverwrittenFunction | `getNeedDayChanged` | 68 |
| registerOverwrittenFunction | `updateInfo` | 69 |
| registerOverwrittenFunction | `updateOutput` | 70 |
| registerOverwrittenFunction | `canBeSold` | 71 |
| registerOverwrittenFunction | `getConditionInfos` | 72 |
| registerOverwrittenFunction | `getAnimalInfos` | 73 |
| registerOverwrittenFunction | `getAnimalDescription` | 74 |
| registerEventListener | `onLoad` | 80 |
| registerEventListener | `onDelete` | 81 |
| registerEventListener | `onFinalizePlacement` | 82 |
| registerEventListener | `onReadStream` | 83 |
| registerEventListener | `onWriteStream` | 84 |
| registerEventListener | `onUpdate` | 85 |
| registerEventListener | `onPeriodChanged` | 86 |
| registerEventListener | `onDayChanged` | 87 |

## Messages

- publie `MessageType.HUSBANDRY_ANIMALS_CHANGED` (l.773)
