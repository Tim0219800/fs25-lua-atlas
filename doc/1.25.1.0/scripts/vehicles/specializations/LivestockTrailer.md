# vehicles/specializations/LivestockTrailer.lua

*[Version française](../../../fr/scripts/vehicles/specializations/LivestockTrailer.md)*

Source: `dataS/scripts/vehicles/specializations/LivestockTrailer.lua` — FS25 1.25.1.0

✍ Specialization for trailers that carry live animals. Animals are held in an `AnimalClusterSystem`; per animal type the XML defines slot nodes where posed animal meshes are loaded. A load trigger collects rideable animals, spawn places define unloading areas, and a `LivestockTrailerActivatable` opens the interaction. The trailer adds animal weight and value (75 percent) to mass and sell price, ages its clusters on day/period changes, and registers with `g_currentMission.husbandrySystem`. No prerequisites.

- **LivestockTrailer** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `LivestockTrailer.initSpecialization()` | 17 | ✍ Registers the store spec types for cow, pig, sheep and horse counts, the XML schema (animal type, node, slot count, load trigger, spawn places) and the savegame attributes including cluster paths. |
| `LivestockTrailer.prerequisitesPresent(specializations: any)` | 42 | ✍ Always returns true: no other specialization is required. |
| `LivestockTrailer.registerFunctions(vehicleType: any)` | 48 | ✍ Registers the animal, cluster, slot, trigger, unload-place and screen-controller functions of this specialization on the vehicle type. |
| `LivestockTrailer.registerOverwrittenFunctions(vehicleType: any)` | 75 | ✍ Overrides `getAdditionalComponentMass`, `getSellPrice`, `dayChanged` and `periodChanged`. |
| `LivestockTrailer.registerEventListeners(vehicleType: any)` | 84 | ✍ Subscribes to onLoad, onLoadFinished, onDelete, onReadStream and onWriteStream. |
| `LivestockTrailer:onLoad(savegame: table)` | 95 | ✍ Builds the animal places and slots per type, adds the load trigger and spawn places, creates the activatable and the cluster system, subscribes to `AnimalClusterUpdateEvent` and registers with the husbandry system. Note: the spawn place width defaults to 15 in the schema but 5 in the loader. |
| `LivestockTrailer:onLoadFinished(savegame: any)` | 173 | ✍ Loads the cluster data from the savegame (unless vehicles are reset) and refreshes the cluster system immediately. |
| `LivestockTrailer:onDelete()` | 186 | ✍ Clears animals, unsubscribes from cluster updates, unregisters from the husbandry system, removes trigger and activatable, detaches rideable delete listeners and releases the loading trigger link. |
| `LivestockTrailer:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 218 | ✍ Saves the cluster system to the vehicle savegame entry. |
| `LivestockTrailer:onReadStream(streamId: any, connection: any)` | 225 | ✍ Client join: reads the cluster system from the stream. |
| `LivestockTrailer:onWriteStream(streamId: any, connection: any)` | 232 | ✍ Server join: writes the cluster system to the stream. |
| `LivestockTrailer:getSupportsAnimalType(animalTypeIndex: any)` | 239 | ✍ Returns true if the trailer defines a place for the given animal type index. |
| `LivestockTrailer:getSupportsAnimalSubType(subTypeIndex: any)` | 245 | ✍ Returns true if the type owning the given animal sub-type index is supported by this trailer. |
| `LivestockTrailer:getCurrentAnimalType()` | 255 | ✍ Returns the animal type table of the first loaded cluster, or nil when the trailer is empty. |
| `LivestockTrailer:setLoadingTrigger(trigger: any)` | 271 | ✍ Stores the animal loading trigger currently linked to this trailer. |
| `LivestockTrailer:getLoadingTrigger()` | 277 | ✍ Returns the linked loading trigger, or nil. |
| `LivestockTrailer:setAnimalScreenController(controller: any)` | 283 | ✍ Stores the animal screen controller that is notified when rideables enter or leave the trigger. |
| `LivestockTrailer:addAnimals(subTypeIndex: any, numAnimals: any, age: any)` | 289 | ✍ Creates cluster(s) for a sub-type with the given count and age and adds them. Mergeable clusters become one cluster; otherwise one single-animal cluster per animal. |
| `LivestockTrailer:addCluster(cluster: any)` | 309 | ✍ Queues the cluster as pending add in the cluster system and updates it right away. |
| `LivestockTrailer:getClusters()` | 318 | ✍ Returns the list of animal clusters on the trailer. |
| `LivestockTrailer:getRideablesInTrigger()` | 325 | ✍ Returns the table of supported rideable animals currently in the load trigger. |
| `LivestockTrailer:getClusterById(id: any)` | 332 | ✍ Returns the cluster with the given id from the cluster system. |
| `LivestockTrailer:getClusterSystem()` | 339 | ✍ Returns the trailer's `AnimalClusterSystem`. |
| `LivestockTrailer:getNumOfAnimals()` | 346 | ✍ Returns the number of occupied slots for the current animal type (0 if empty). |
| `LivestockTrailer:getMaxNumOfAnimals(animalType: any)` | 363 | ✍ Returns slot capacity for the given animal type, or the current type if nil. Returns 0 if the trailer is empty and no type is given, holds another type, or does not support the type. |
| `LivestockTrailer:getNumOfFreeAnimalSlots(subTypeIndex: any)` | 387 | ✍ Returns free slots for the type of the given sub-type index: capacity minus current animal count. |
| `LivestockTrailer:updatedClusters(trailer: any)` | 399 | ✍ Message-center callback: when the updated trailer is this one, rebuilds the visible animals and marks the mass dirty. |
| `LivestockTrailer:updateAnimals()` | 408 | ✍ Clears existing meshes then asynchronously loads a posed animal model per animal into consecutive slots, chosen by sub-type and age. |
| `LivestockTrailer:clearAnimals()` | 443 | ✍ Releases shared i3D load requests and deletes all loaded animal meshes in all slots. |
| `LivestockTrailer:onAnimalLoaded(i3dNode: any, failedReason: any, args: any)` | 463 | ✍ Async load callback: on success, links the mesh to its slot node and sets the atlas UV shader parameter for the visual variation and zero dirt. |
| `LivestockTrailer:getAdditionalComponentMass(superFunc: any, component: any)` | 483 | ✍ Override: adds the animals' weight (fill type mass per liter times animal count) to the component mass. |
| `LivestockTrailer:getSellPrice(superFunc: any)` | 502 | ✍ Override: adds 75 percent of the animals' total sell price to the vehicle sell price. |
| `LivestockTrailer:dayChanged(superFunc: any)` | 518 | ✍ Override: after the parent behaviour, calls `onDayChanged` on every cluster. |
| `LivestockTrailer:periodChanged(superFunc: any)` | 530 | ✍ Override: after the parent behaviour, calls `onPeriodChanged` on every cluster. |
| `LivestockTrailer:onAnimalLoadTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 542 | ✍ Trigger callback: tracks rideable animals of a supported sub-type entering or leaving the load trigger, listens for their deletion and notifies the animal screen controller. |
| `LivestockTrailer:onAnimalRideableDeleted(rideable: any)` | 571 | ✍ Delete-listener callback: removes the deleted rideable from the trigger list and notifies the animal screen controller. |
| `LivestockTrailer:getAnimalUnloadPlaces()` | 583 | ✍ Builds and returns a list of unload place descriptors (start position, rotation, directions, width, unlimited size, y offset 1) from the spawn place nodes. |
| `LivestockTrailer.loadSpecValueNumberAnimals(xmlFile: any, customEnvironment: any, baseDir: any, animalTypeName: any)` | 611 | ✍ Reads the `numSlots` of the first `livestockTrailer.animal` entry matching the given animal type name (case-insensitive) from a store item XML; returns nil if none. |
| `LivestockTrailer.loadSpecValueNumberAnimalsCow(xmlFile: any, customEnvironment: any, baseDir: any)` | 635 | ✍ Store spec loader for the cow slot count. |
| `LivestockTrailer.loadSpecValueNumberAnimalsPig(xmlFile: any, customEnvironment: any, baseDir: any)` | 641 | ✍ Store spec loader for the pig slot count. |
| `LivestockTrailer.loadSpecValueNumberAnimalsSheep(xmlFile: any, customEnvironment: any, baseDir: any)` | 647 | ✍ Store spec loader for the sheep slot count. |
| `LivestockTrailer.loadSpecValueNumberAnimalsHorse(xmlFile: any, customEnvironment: any, baseDir: any)` | 653 | ✍ Store spec loader for the horse slot count. |
| `LivestockTrailer.getSpecValueNumberAnimals(storeItem: any, realItem: any, specName: any)` | 659 | ✍ Formats the stored slot count of the named spec as a text with the pieces unit; returns nil if the store item has no such spec. |
| `LivestockTrailer.getSpecValueNumberAnimalsCow(storeItem: any, realItem: any)` | 668 | ✍ Store spec getter for the cow slot count text. |
| `LivestockTrailer.getSpecValueNumberAnimalsPig(storeItem: any, realItem: any)` | 674 | ✍ Store spec getter for the pig slot count text. |
| `LivestockTrailer.getSpecValueNumberAnimalsSheep(storeItem: any, realItem: any)` | 680 | ✍ Store spec getter for the sheep slot count text. |
| `LivestockTrailer.getSpecValueNumberAnimalsHorse(storeItem: any, realItem: any)` | 686 | ✍ Store spec getter for the horse slot count text. |

## Specialization

| Type | Name | Line |
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
