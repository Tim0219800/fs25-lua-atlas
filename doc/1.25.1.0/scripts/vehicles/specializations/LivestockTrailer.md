# vehicles/specializations/LivestockTrailer.lua

Source : `dataS/scripts/vehicles/specializations/LivestockTrailer.lua` — FS25 1.25.1.0

- **LivestockTrailer** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LivestockTrailer.initSpecialization()` | 17 |  |
| `LivestockTrailer.prerequisitesPresent(specializations: any)` | 42 |  |
| `LivestockTrailer.registerFunctions(vehicleType: any)` | 48 |  |
| `LivestockTrailer.registerOverwrittenFunctions(vehicleType: any)` | 75 |  |
| `LivestockTrailer.registerEventListeners(vehicleType: any)` | 84 |  |
| `LivestockTrailer:onLoad(savegame: table)` | 95 |  |
| `LivestockTrailer:onLoadFinished(savegame: any)` | 173 |  |
| `LivestockTrailer:onDelete()` | 186 |  |
| `LivestockTrailer:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 218 |  |
| `LivestockTrailer:onReadStream(streamId: any, connection: any)` | 225 |  |
| `LivestockTrailer:onWriteStream(streamId: any, connection: any)` | 232 |  |
| `LivestockTrailer:getSupportsAnimalType(animalTypeIndex: any)` | 239 |  |
| `LivestockTrailer:getSupportsAnimalSubType(subTypeIndex: any)` | 245 |  |
| `LivestockTrailer:getCurrentAnimalType()` | 255 |  |
| `LivestockTrailer:setLoadingTrigger(trigger: any)` | 271 |  |
| `LivestockTrailer:getLoadingTrigger()` | 277 |  |
| `LivestockTrailer:setAnimalScreenController(controller: any)` | 283 |  |
| `LivestockTrailer:addAnimals(subTypeIndex: any, numAnimals: any, age: any)` | 289 |  |
| `LivestockTrailer:addCluster(cluster: any)` | 309 |  |
| `LivestockTrailer:getClusters()` | 318 |  |
| `LivestockTrailer:getRideablesInTrigger()` | 325 |  |
| `LivestockTrailer:getClusterById(id: any)` | 332 |  |
| `LivestockTrailer:getClusterSystem()` | 339 |  |
| `LivestockTrailer:getNumOfAnimals()` | 346 |  |
| `LivestockTrailer:getMaxNumOfAnimals(animalType: any)` | 363 |  |
| `LivestockTrailer:getNumOfFreeAnimalSlots(subTypeIndex: any)` | 387 |  |
| `LivestockTrailer:updatedClusters(trailer: any)` | 399 |  |
| `LivestockTrailer:updateAnimals()` | 408 |  |
| `LivestockTrailer:clearAnimals()` | 443 |  |
| `LivestockTrailer:onAnimalLoaded(i3dNode: any, failedReason: any, args: any)` | 463 |  |
| `LivestockTrailer:getAdditionalComponentMass(superFunc: any, component: any)` | 483 |  |
| `LivestockTrailer:getSellPrice(superFunc: any)` | 502 |  |
| `LivestockTrailer:dayChanged(superFunc: any)` | 518 |  |
| `LivestockTrailer:periodChanged(superFunc: any)` | 530 |  |
| `LivestockTrailer:onAnimalLoadTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 542 |  |
| `LivestockTrailer:onAnimalRideableDeleted(rideable: any)` | 571 |  |
| `LivestockTrailer:getAnimalUnloadPlaces()` | 583 |  |
| `LivestockTrailer.loadSpecValueNumberAnimals(xmlFile: any, customEnvironment: any, baseDir: any, animalTypeName: any)` | 611 |  |
| `LivestockTrailer.loadSpecValueNumberAnimalsCow(xmlFile: any, customEnvironment: any, baseDir: any)` | 635 |  |
| `LivestockTrailer.loadSpecValueNumberAnimalsPig(xmlFile: any, customEnvironment: any, baseDir: any)` | 641 |  |
| `LivestockTrailer.loadSpecValueNumberAnimalsSheep(xmlFile: any, customEnvironment: any, baseDir: any)` | 647 |  |
| `LivestockTrailer.loadSpecValueNumberAnimalsHorse(xmlFile: any, customEnvironment: any, baseDir: any)` | 653 |  |
| `LivestockTrailer.getSpecValueNumberAnimals(storeItem: any, realItem: any, specName: any)` | 659 |  |
| `LivestockTrailer.getSpecValueNumberAnimalsCow(storeItem: any, realItem: any)` | 668 |  |
| `LivestockTrailer.getSpecValueNumberAnimalsPig(storeItem: any, realItem: any)` | 674 |  |
| `LivestockTrailer.getSpecValueNumberAnimalsSheep(storeItem: any, realItem: any)` | 680 |  |
| `LivestockTrailer.getSpecValueNumberAnimalsHorse(storeItem: any, realItem: any)` | 686 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getCurrentAnimalType` | 49 |
| registerFunction | `getSupportsAnimalType` | 50 |
| registerFunction | `getSupportsAnimalSubType` | 51 |
| registerFunction | `setLoadingTrigger` | 52 |
| registerFunction | `getLoadingTrigger` | 53 |
| registerFunction | `updateAnimals` | 54 |
| registerFunction | `updatedClusters` | 55 |
| registerFunction | `clearAnimals` | 56 |
| registerFunction | `addAnimals` | 57 |
| registerFunction | `addCluster` | 58 |
| registerFunction | `getClusters` | 59 |
| registerFunction | `getRideablesInTrigger` | 60 |
| registerFunction | `getClusterById` | 61 |
| registerFunction | `getClusterSystem` | 62 |
| registerFunction | `getNumOfAnimals` | 63 |
| registerFunction | `getMaxNumOfAnimals` | 64 |
| registerFunction | `getNumOfFreeAnimalSlots` | 65 |
| registerFunction | `onAnimalLoaded` | 66 |
| registerFunction | `onAnimalLoadTriggerCallback` | 67 |
| registerFunction | `getAnimalUnloadPlaces` | 68 |
| registerFunction | `setAnimalScreenController` | 69 |
| registerFunction | `onAnimalRideableDeleted` | 70 |
| registerOverwrittenFunction | `getAdditionalComponentMass` | 76 |
| registerOverwrittenFunction | `getSellPrice` | 77 |
| registerOverwrittenFunction | `dayChanged` | 78 |
| registerOverwrittenFunction | `periodChanged` | 79 |
| registerEventListener | `onLoad` | 85 |
| registerEventListener | `onLoadFinished` | 86 |
| registerEventListener | `onDelete` | 87 |
| registerEventListener | `onReadStream` | 88 |
| registerEventListener | `onWriteStream` | 89 |
