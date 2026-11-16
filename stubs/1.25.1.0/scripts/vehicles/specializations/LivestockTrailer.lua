---@meta
-- FS25 1.25.1.0 : vehicles/specializations/LivestockTrailer.lua (generated stub, FS25 Lua Atlas)

--- Specialization for trailers that carry live animals. Animals are held in an `AnimalClusterSystem`; per animal type the XML defines slot nodes where posed animal meshes are loaded. A load trigger collects rideable animals, spawn places define unloading areas, and a `LivestockTrailerActivatable` opens the interaction. The trailer adds animal weight and value (75 percent) to mass and sell price, ages its clusters on day/period changes, and registers with `g_currentMission.husbandrySystem`. No prerequisites.
---@class LivestockTrailer
LivestockTrailer = {}

--- Registers the store spec types for cow, pig, sheep and horse counts, the XML schema (animal type, node, slot count, load trigger, spawn places) and the savegame attributes including cluster paths.
function LivestockTrailer.initSpecialization() end

--- Always returns true: no other specialization is required.
---@param specializations any
function LivestockTrailer.prerequisitesPresent(specializations) end

--- Registers the animal, cluster, slot, trigger, unload-place and screen-controller functions of this specialization on the vehicle type.
---@param vehicleType any
function LivestockTrailer.registerFunctions(vehicleType) end

--- Overrides `getAdditionalComponentMass`, `getSellPrice`, `dayChanged` and `periodChanged`.
---@param vehicleType any
function LivestockTrailer.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onLoadFinished, onDelete, onReadStream and onWriteStream.
---@param vehicleType any
function LivestockTrailer.registerEventListeners(vehicleType) end

--- Builds the animal places and slots per type, adds the load trigger and spawn places, creates the activatable and the cluster system, subscribes to `AnimalClusterUpdateEvent` and registers with the husbandry system. Note: the spawn place width defaults to 15 in the schema but 5 in the loader.
---@param savegame table
function LivestockTrailer:onLoad(savegame) end

--- Loads the cluster data from the savegame (unless vehicles are reset) and refreshes the cluster system immediately.
---@param savegame any
function LivestockTrailer:onLoadFinished(savegame) end

--- Clears animals, unsubscribes from cluster updates, unregisters from the husbandry system, removes trigger and activatable, detaches rideable delete listeners and releases the loading trigger link.
function LivestockTrailer:onDelete() end

--- Saves the cluster system to the vehicle savegame entry.
---@param xmlFile any
---@param key any
---@param usedModNames any
function LivestockTrailer:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client join: reads the cluster system from the stream.
---@param streamId any
---@param connection any
function LivestockTrailer:onReadStream(streamId, connection) end

--- Server join: writes the cluster system to the stream.
---@param streamId any
---@param connection any
function LivestockTrailer:onWriteStream(streamId, connection) end

--- Returns true if the trailer defines a place for the given animal type index.
---@param animalTypeIndex any
function LivestockTrailer:getSupportsAnimalType(animalTypeIndex) end

--- Returns true if the type owning the given animal sub-type index is supported by this trailer.
---@param subTypeIndex any
function LivestockTrailer:getSupportsAnimalSubType(subTypeIndex) end

--- Returns the animal type table of the first loaded cluster, or nil when the trailer is empty.
function LivestockTrailer:getCurrentAnimalType() end

--- Stores the animal loading trigger currently linked to this trailer.
---@param trigger any
function LivestockTrailer:setLoadingTrigger(trigger) end

--- Returns the linked loading trigger, or nil.
function LivestockTrailer:getLoadingTrigger() end

--- Stores the animal screen controller that is notified when rideables enter or leave the trigger.
---@param controller any
function LivestockTrailer:setAnimalScreenController(controller) end

--- Creates cluster(s) for a sub-type with the given count and age and adds them. Mergeable clusters become one cluster; otherwise one single-animal cluster per animal.
---@param subTypeIndex any
---@param numAnimals any
---@param age any
function LivestockTrailer:addAnimals(subTypeIndex, numAnimals, age) end

--- Queues the cluster as pending add in the cluster system and updates it right away.
---@param cluster any
function LivestockTrailer:addCluster(cluster) end

--- Returns the list of animal clusters on the trailer.
function LivestockTrailer:getClusters() end

--- Returns the table of supported rideable animals currently in the load trigger.
function LivestockTrailer:getRideablesInTrigger() end

--- Returns the cluster with the given id from the cluster system.
---@param id any
function LivestockTrailer:getClusterById(id) end

--- Returns the trailer's `AnimalClusterSystem`.
function LivestockTrailer:getClusterSystem() end

--- Returns the number of occupied slots for the current animal type (0 if empty).
function LivestockTrailer:getNumOfAnimals() end

--- Returns slot capacity for the given animal type, or the current type if nil. Returns 0 if the trailer is empty and no type is given, holds another type, or does not support the type.
---@param animalType any
function LivestockTrailer:getMaxNumOfAnimals(animalType) end

--- Returns free slots for the type of the given sub-type index: capacity minus current animal count.
---@param subTypeIndex any
function LivestockTrailer:getNumOfFreeAnimalSlots(subTypeIndex) end

--- Message-center callback: when the updated trailer is this one, rebuilds the visible animals and marks the mass dirty.
---@param trailer any
function LivestockTrailer:updatedClusters(trailer) end

--- Clears existing meshes then asynchronously loads a posed animal model per animal into consecutive slots, chosen by sub-type and age.
function LivestockTrailer:updateAnimals() end

--- Releases shared i3D load requests and deletes all loaded animal meshes in all slots.
function LivestockTrailer:clearAnimals() end

--- Async load callback: on success, links the mesh to its slot node and sets the atlas UV shader parameter for the visual variation and zero dirt.
---@param i3dNode any
---@param failedReason any
---@param args any
function LivestockTrailer:onAnimalLoaded(i3dNode, failedReason, args) end

--- Override: adds the animals' weight (fill type mass per liter times animal count) to the component mass.
---@param superFunc any
---@param component any
function LivestockTrailer:getAdditionalComponentMass(superFunc, component) end

--- Override: adds 75 percent of the animals' total sell price to the vehicle sell price.
---@param superFunc any
function LivestockTrailer:getSellPrice(superFunc) end

--- Override: after the parent behaviour, calls `onDayChanged` on every cluster.
---@param superFunc any
function LivestockTrailer:dayChanged(superFunc) end

--- Override: after the parent behaviour, calls `onPeriodChanged` on every cluster.
---@param superFunc any
function LivestockTrailer:periodChanged(superFunc) end

--- Trigger callback: tracks rideable animals of a supported sub-type entering or leaving the load trigger, listens for their deletion and notifies the animal screen controller.
---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
function LivestockTrailer:onAnimalLoadTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

--- Delete-listener callback: removes the deleted rideable from the trigger list and notifies the animal screen controller.
---@param rideable any
function LivestockTrailer:onAnimalRideableDeleted(rideable) end

--- Builds and returns a list of unload place descriptors (start position, rotation, directions, width, unlimited size, y offset 1) from the spawn place nodes.
function LivestockTrailer:getAnimalUnloadPlaces() end

--- Reads the `numSlots` of the first `livestockTrailer.animal` entry matching the given animal type name (case-insensitive) from a store item XML; returns nil if none.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
---@param animalTypeName any
function LivestockTrailer.loadSpecValueNumberAnimals(xmlFile, customEnvironment, baseDir, animalTypeName) end

--- Store spec loader for the cow slot count.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function LivestockTrailer.loadSpecValueNumberAnimalsCow(xmlFile, customEnvironment, baseDir) end

--- Store spec loader for the pig slot count.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function LivestockTrailer.loadSpecValueNumberAnimalsPig(xmlFile, customEnvironment, baseDir) end

--- Store spec loader for the sheep slot count.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function LivestockTrailer.loadSpecValueNumberAnimalsSheep(xmlFile, customEnvironment, baseDir) end

--- Store spec loader for the horse slot count.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function LivestockTrailer.loadSpecValueNumberAnimalsHorse(xmlFile, customEnvironment, baseDir) end

--- Formats the stored slot count of the named spec as a text with the pieces unit; returns nil if the store item has no such spec.
---@param storeItem any
---@param realItem any
---@param specName any
function LivestockTrailer.getSpecValueNumberAnimals(storeItem, realItem, specName) end

--- Store spec getter for the cow slot count text.
---@param storeItem any
---@param realItem any
function LivestockTrailer.getSpecValueNumberAnimalsCow(storeItem, realItem) end

--- Store spec getter for the pig slot count text.
---@param storeItem any
---@param realItem any
function LivestockTrailer.getSpecValueNumberAnimalsPig(storeItem, realItem) end

--- Store spec getter for the sheep slot count text.
---@param storeItem any
---@param realItem any
function LivestockTrailer.getSpecValueNumberAnimalsSheep(storeItem, realItem) end

--- Store spec getter for the horse slot count text.
---@param storeItem any
---@param realItem any
function LivestockTrailer.getSpecValueNumberAnimalsHorse(storeItem, realItem) end
