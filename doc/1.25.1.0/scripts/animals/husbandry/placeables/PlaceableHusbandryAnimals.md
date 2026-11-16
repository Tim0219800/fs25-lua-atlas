# animals/husbandry/placeables/PlaceableHusbandryAnimals.lua

*[Version française](../../../../fr/scripts/animals/husbandry/placeables/PlaceableHusbandryAnimals.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryAnimals.lua` — FS25 1.25.1.0

✍ Placeable specialization that turns a husbandry placeable into a herd holder. It requires the `PlaceableHusbandry` specialization, reads the animal type, navigation mesh, capacity and delivery areas from `placeable.husbandry.animals`, and owns an `AnimalClusterSystem` (the animal data, server authoritative) plus an `AnimalClusterHusbandry` (the visible animals driven by the engine). It also handles reproduction on period change, health updates, riding, delivery-area checks and the shop capacity spec.

- **PlaceableHusbandryAnimals** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableHusbandryAnimals.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Returns true only if the `PlaceableHusbandry` specialization is among the placeable type's specializations. |
| `PlaceableHusbandryAnimals.registerEvents(placeableType: any)` | 25 | ✍ Declares the events `onHusbandryAnimalsCreated` and `onHusbandryAnimalsUpdate` on the placeable type. |
| `PlaceableHusbandryAnimals.registerFunctions(placeableType: any)` | 32 | ✍ Registers the specialization's public methods (cluster access, animal counts, riding, delivery area, navigation mesh helpers) on the placeable type. Some registered methods have no body in the SDK dump. |
| `PlaceableHusbandryAnimals.registerOverwrittenFunctions(placeableType: any)` | 67 | ✍ Registers overrides of `getNeedDayChanged`, `updateInfo`, `updateOutput`, `canBeSold`, `getConditionInfos`, `getAnimalInfos` and `getAnimalDescription`. |
| `PlaceableHusbandryAnimals.registerEventListeners(placeableType: any)` | 79 | ✍ Subscribes the specialization to `onLoad`, `onDelete`, `onFinalizePlacement`, `onReadStream`, `onWriteStream`, `onUpdate`, `onPeriodChanged` and `onDayChanged`. |
| `PlaceableHusbandryAnimals.registerXMLPaths(schema: any, basePath: any)` | 92 | ✍ Registers the XML keys under `husbandry.animals`: navigation nodes and external file, animal type and config file, raycast distance, max animals, area per animal, visual animal limit, loading trigger and delivery areas. |
| `PlaceableHusbandryAnimals.registerSavegameXMLPaths(schema: any, basePath: any)` | 116 | ✍ Registers the savegame XML paths of the animal clusters by delegating to `AnimalClusterSystem.registerSavegameXMLPaths` under `.clusters`. |
| `PlaceableHusbandryAnimals.initSpecialization()` | 124 | ✍ Adds the `numberAnimals` store spec (capacity icon) and, only in a development version, the console commands `gsHusbandryAddAnimals` and `gsHusbandryDebugToggle`. |
| `PlaceableHusbandryAnimals:onLoad(savegame: any)` | 142 | ✍ Reads the animal type (error state if missing or unknown), navigation mesh settings, capacity values and delivery areas, creates the cluster husbandry and cluster system, and subscribes to `AnimalClusterUpdateEvent`. May start an async load of an external navigation mesh and creates the loading trigger. |
| `PlaceableHusbandryAnimals:onDelete()` | 243 | ✍ Unsubscribes from messages, removes the navigation placement collision, removes and deletes the cluster husbandry, deletes the loading trigger and releases the shared navigation i3D file. |
| `PlaceableHusbandryAnimals:onFinalizePlacement()` | 269 | ✍ Creates the navigation mesh once placement is final; for placeables loaded from a savegame it also schedules a one-shot callback at mission start. |
| `PlaceableHusbandryAnimals:onReadStream(streamId: any, connection: any)` | 279 | ✍ Network read: lets the cluster system read the animal data sent by the server when a client joins. |
| `PlaceableHusbandryAnimals:onWriteStream(streamId: any, connection: any)` | 286 | ✍ Network write: lets the cluster system write its animal data to the stream for a joining client. |
| `PlaceableHusbandryAnimals:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 293 | ✍ Saves the animal clusters under the `.clusters` key of the savegame. |
| `PlaceableHusbandryAnimals:loadFromXMLFile(xmlFile: any, key: any)` | 300 | ✍ Loads the animal clusters from the `.clusters` key of the savegame. |
| `PlaceableHusbandryAnimals:onUpdate(dt: any)` | 307 | ✍ Per-frame update: on the server updates the cluster system, then updates the cluster husbandry, refreshes the visual animals if flagged, and keeps the placeable active while the husbandry still needs updates. |
| `PlaceableHusbandryAnimals:onExternalNavigationMeshLoaded(node: any, failedReason: any, args: any)` | 329 | ✍ Callback of the async external navigation file load: picks the mesh node by path, links it under the navigation root node, deletes the loaded root and finishes the loading task. Logs an error if the node is missing. |
| `PlaceableHusbandryAnimals:createHusbandry()` | 488 | ✍ Validates the navigation mesh (exists, is a navigation mesh, has surface area), then creates the engine husbandry with the single- or multiplayer animal collision mask and registers it in the husbandry system. Raises `onHusbandryAnimalsCreated` on success. |
| `PlaceableHusbandryAnimals:updateInfo(superFunc: any, infoTable: any)` | 539 | ✍ Extends the base info list with the animal count (current / maximum) and the average health percentage across all clusters. |
| `PlaceableHusbandryAnimals:getNeedDayChanged(superFunc: any)` | 564 | ✍ Override that always returns true, so this husbandry always asks for day-change callbacks. |
| `PlaceableHusbandryAnimals:onMissionStarted(isNewSavegame: any)` | 570 | ✍ One-shot callback at mission start that refreshes the visual animals, so a dedicated server (paused at startup) shows them to the first joining player. |
| `PlaceableHusbandryAnimals:updateVisualAnimals()` | 579 | ✍ Pushes the current clusters to the cluster husbandry so the visible animals match the data, and keeps the placeable active. |
| `PlaceableHusbandryAnimals:getAnimalTypeIndex()` | 588 | ✍ Returns the animal type index of this husbandry. |
| `PlaceableHusbandryAnimals:updateOutput(superFunc: any, foodFactor: any, productionFactor: any, globalProductionFactor: any)` | 595 | ✍ Override: on the server updates each cluster's health with the food factor, then calls the parent implementation. |
| `PlaceableHusbandryAnimals:onPeriodChanged()` | 611 | ✍ Server only. For each cluster runs its period logic and reproduction; newborns are added as a new pending cluster, limited by the free slots, and the breeding farm stat is updated. |
| `PlaceableHusbandryAnimals:onDayChanged()` | 649 | ✍ Server only: calls the day-change handler of every animal cluster. |
| `PlaceableHusbandryAnimals:getNumOfAnimals()` | 661 | ✍ Returns the total number of animals, summed over all clusters. |
| `PlaceableHusbandryAnimals:getMaxNumOfAnimals()` | 674 | ✍ Returns the current capacity: `spec.maxNumAnimals` if set, otherwise the base maximum from the XML. |
| `PlaceableHusbandryAnimals:getNumOfFreeAnimalSlots()` | 681 | ✍ Returns the number of free slots (capacity minus animals), never below zero. |
| `PlaceableHusbandryAnimals:getSupportsAnimalSubType(subTypeIndex: any)` | 689 | ✍ Returns true if the given animal subtype belongs to this husbandry's animal type. |
| `PlaceableHusbandryAnimals:getNumOfClusters()` | 699 | ✍ Returns the number of animal clusters in the husbandry. |
| `PlaceableHusbandryAnimals:getClusters()` | 707 | ✍ Returns the list of animal clusters from the cluster system. |
| `PlaceableHusbandryAnimals:getCluster(index: any)` | 714 | ✍ Returns the cluster at the given index from the cluster system. |
| `PlaceableHusbandryAnimals:getClusterById(id: any)` | 721 | ✍ Returns the cluster with the given id from the cluster system. |
| `PlaceableHusbandryAnimals:addCluster(cluster: any)` | 728 | ✍ Queues a cluster as pending add in the cluster system and wakes the placeable. Does nothing if the cluster is nil. |
| `PlaceableHusbandryAnimals:addAnimals(subTypeIndex: any, numAnimals: any, age: any)` | 738 | ✍ Adds animals of a subtype with a given age: as one merged cluster if the cluster supports merging, otherwise as one single-animal cluster per animal. |
| `PlaceableHusbandryAnimals:getClusterSystem()` | 759 | ✍ Returns the `AnimalClusterSystem` of this husbandry. |
| `PlaceableHusbandryAnimals:updatedClusters(husbandry: any)` | 766 | ✍ Handler for `AnimalClusterUpdateEvent`; if it concerns this husbandry, raises `onHusbandryAnimalsUpdate`, publishes `HUSBANDRY_ANIMALS_CHANGED` and flags a visual refresh. |
| `PlaceableHusbandryAnimals:renameAnimal(clusterId: any, name: any, noEventSend: any)` | 782 | ✍ Sends an `AnimalNameEvent` (network sync unless `noEventSend`) and sets the new name on the cluster with that id. |
| `PlaceableHusbandryAnimals:getAnimalSupportsRiding(clusterId: any)` | 794 | ✍ Returns true if the cluster with this id has a rideable vehicle file. |
| `PlaceableHusbandryAnimals:getAnimalCanBeRidden(clusterId: any)` | 809 | ✍ Asks the husbandry system whether the owning farm may add another rideable animal; the cluster id is not used. |
| `PlaceableHusbandryAnimals:startRiding(clusterId: any, player: any)` | 816 | ✍ On a client sends an `AnimalRidingEvent` to the server. On the server removes one animal from the cluster and spawns the rideable vehicle at its position; the player enters it once loaded. |
| `PlaceableHusbandryAnimals:onLoadedRideable(vehicles: any, vehicleLoadState: any, arguments: any)` | 851 | ✍ Callback after the rideable loads: on failure gives the animal back to the cluster; on success clones the cluster with one animal, assigns it to the vehicle and sets the player to enter. |
| `PlaceableHusbandryAnimals:loadDeliveryArea(xmlFile: any, key: any, area: any)` | 870 | ✍ Reads one delivery area (start, width and height nodes) from the XML; logs a warning and returns false if any node is missing. |
| `PlaceableHusbandryAnimals:getIsInAnimalDeliveryArea(x: any, z: any)` | 898 | ✍ Tests whether the world position (x, z) is in the delivery zone: the outdoor contour polygon if present, else any delivery parallelogram, else within 30 m of the placeable root when no area is defined. |
| `PlaceableHusbandryAnimals.loadSpecValueNumberAnimals(xmlFile: any, customEnvironment: any, baseDir: any)` | 935 | ✍ Store spec loader: returns the max animal count and the animal type name if the XML has `placeable.husbandry.animals`, otherwise nil. |
| `PlaceableHusbandryAnimals.getSpecValueNumberAnimals(storeItem: any, realItem: any)` | 949 | ✍ Store spec getter: returns the maximum animal count and the shop icon profile matching cow, sheep, horse, pig or chicken (nil profile for other types). |
| `PlaceableHusbandryAnimals:canBeSold(superFunc: any)` | 976 | ✍ Override: refuses the sale with a message while the husbandry contains animals, otherwise defers to the parent. |
| `PlaceableHusbandryAnimals:getConditionInfos(superFunc: any)` | 986 | ✍ Override: for animal types other than horse and pig, appends a productivity entry (global times local production factor, as a percentage). |
| `PlaceableHusbandryAnimals:getAnimalInfos(superFunc: any, cluster: any)` | 1006 | ✍ Override: gets the parent info list and lets the cluster append its own entries. Note: calls the parent without forwarding the cluster argument. |
| `PlaceableHusbandryAnimals:getAnimalDescription(superFunc: any, cluster: any)` | 1016 | ✍ Override: appends the store description of the visual matching the cluster's subtype and age to the parent text. |
| `PlaceableHusbandryAnimals.consoleCommandAddAnimals(_: any, numAnimals: any, subTypeIndex: any)` | 1099 | ✍ Development console command `gsHusbandryAddAnimals`: raycasts below the active camera to find the husbandry, then adds animals (positive count, optional subtype) or removes them (negative count). Returns a status message. |

## Specialization

| Type | Name | Line |
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

- publishes `MessageType.HUSBANDRY_ANIMALS_CHANGED` (l.773)
