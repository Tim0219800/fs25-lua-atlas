---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryAnimals.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that turns a husbandry placeable into a herd holder. It requires the `PlaceableHusbandry` specialization, reads the animal type, navigation mesh, capacity and delivery areas from `placeable.husbandry.animals`, and owns an `AnimalClusterSystem` (the animal data, server authoritative) plus an `AnimalClusterHusbandry` (the visible animals driven by the engine). It also handles reproduction on period change, health updates, riding, delivery-area checks and the shop capacity spec.
---@class PlaceableHusbandryAnimals
PlaceableHusbandryAnimals = {}

--- Returns true only if the `PlaceableHusbandry` specialization is among the placeable type's specializations.
---@param specializations table
---@return boolean
function PlaceableHusbandryAnimals.prerequisitesPresent(specializations) end

--- Declares the events `onHusbandryAnimalsCreated` and `onHusbandryAnimalsUpdate` on the placeable type.
---@param placeableType any
function PlaceableHusbandryAnimals.registerEvents(placeableType) end

--- Registers the specialization's public methods (cluster access, animal counts, riding, delivery area, navigation mesh helpers) on the placeable type. Some registered methods have no body in the SDK dump.
---@param placeableType any
function PlaceableHusbandryAnimals.registerFunctions(placeableType) end

--- Registers overrides of `getNeedDayChanged`, `updateInfo`, `updateOutput`, `canBeSold`, `getConditionInfos`, `getAnimalInfos` and `getAnimalDescription`.
---@param placeableType any
function PlaceableHusbandryAnimals.registerOverwrittenFunctions(placeableType) end

--- Subscribes the specialization to `onLoad`, `onDelete`, `onFinalizePlacement`, `onReadStream`, `onWriteStream`, `onUpdate`, `onPeriodChanged` and `onDayChanged`.
---@param placeableType any
function PlaceableHusbandryAnimals.registerEventListeners(placeableType) end

--- Registers the XML keys under `husbandry.animals`: navigation nodes and external file, animal type and config file, raycast distance, max animals, area per animal, visual animal limit, loading trigger and delivery areas.
---@param schema any
---@param basePath any
function PlaceableHusbandryAnimals.registerXMLPaths(schema, basePath) end

--- Registers the savegame XML paths of the animal clusters by delegating to `AnimalClusterSystem.registerSavegameXMLPaths` under `.clusters`.
---@param schema any
---@param basePath any
function PlaceableHusbandryAnimals.registerSavegameXMLPaths(schema, basePath) end

--- Adds the `numberAnimals` store spec (capacity icon) and, only in a development version, the console commands `gsHusbandryAddAnimals` and `gsHusbandryDebugToggle`.
function PlaceableHusbandryAnimals.initSpecialization() end

--- Reads the animal type (error state if missing or unknown), navigation mesh settings, capacity values and delivery areas, creates the cluster husbandry and cluster system, and subscribes to `AnimalClusterUpdateEvent`. May start an async load of an external navigation mesh and creates the loading trigger.
---@param savegame any
function PlaceableHusbandryAnimals:onLoad(savegame) end

--- Unsubscribes from messages, removes the navigation placement collision, removes and deletes the cluster husbandry, deletes the loading trigger and releases the shared navigation i3D file.
function PlaceableHusbandryAnimals:onDelete() end

--- Creates the navigation mesh once placement is final; for placeables loaded from a savegame it also schedules a one-shot callback at mission start.
function PlaceableHusbandryAnimals:onFinalizePlacement() end

--- Network read: lets the cluster system read the animal data sent by the server when a client joins.
---@param streamId any
---@param connection any
function PlaceableHusbandryAnimals:onReadStream(streamId, connection) end

--- Network write: lets the cluster system write its animal data to the stream for a joining client.
---@param streamId any
---@param connection any
function PlaceableHusbandryAnimals:onWriteStream(streamId, connection) end

--- Saves the animal clusters under the `.clusters` key of the savegame.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableHusbandryAnimals:saveToXMLFile(xmlFile, key, usedModNames) end

--- Loads the animal clusters from the `.clusters` key of the savegame.
---@param xmlFile any
---@param key any
function PlaceableHusbandryAnimals:loadFromXMLFile(xmlFile, key) end

--- Per-frame update: on the server updates the cluster system, then updates the cluster husbandry, refreshes the visual animals if flagged, and keeps the placeable active while the husbandry still needs updates.
---@param dt any
function PlaceableHusbandryAnimals:onUpdate(dt) end

--- Callback of the async external navigation file load: picks the mesh node by path, links it under the navigation root node, deletes the loaded root and finishes the loading task. Logs an error if the node is missing.
---@param node any
---@param failedReason any
---@param args any
function PlaceableHusbandryAnimals:onExternalNavigationMeshLoaded(node, failedReason, args) end

--- Validates the navigation mesh (exists, is a navigation mesh, has surface area), then creates the engine husbandry with the single- or multiplayer animal collision mask and registers it in the husbandry system. Raises `onHusbandryAnimalsCreated` on success.
function PlaceableHusbandryAnimals:createHusbandry() end

--- Extends the base info list with the animal count (current / maximum) and the average health percentage across all clusters.
---@param superFunc any
---@param infoTable any
function PlaceableHusbandryAnimals:updateInfo(superFunc, infoTable) end

--- Override that always returns true, so this husbandry always asks for day-change callbacks.
---@param superFunc any
function PlaceableHusbandryAnimals:getNeedDayChanged(superFunc) end

--- One-shot callback at mission start that refreshes the visual animals, so a dedicated server (paused at startup) shows them to the first joining player.
---@param isNewSavegame any
function PlaceableHusbandryAnimals:onMissionStarted(isNewSavegame) end

--- Pushes the current clusters to the cluster husbandry so the visible animals match the data, and keeps the placeable active.
function PlaceableHusbandryAnimals:updateVisualAnimals() end

--- Returns the animal type index of this husbandry.
function PlaceableHusbandryAnimals:getAnimalTypeIndex() end

--- Override: on the server updates each cluster's health with the food factor, then calls the parent implementation.
---@param superFunc any
---@param foodFactor any
---@param productionFactor any
---@param globalProductionFactor any
function PlaceableHusbandryAnimals:updateOutput(superFunc, foodFactor, productionFactor, globalProductionFactor) end

--- Server only. For each cluster runs its period logic and reproduction; newborns are added as a new pending cluster, limited by the free slots, and the breeding farm stat is updated.
function PlaceableHusbandryAnimals:onPeriodChanged() end

--- Server only: calls the day-change handler of every animal cluster.
function PlaceableHusbandryAnimals:onDayChanged() end

--- Returns the total number of animals, summed over all clusters.
function PlaceableHusbandryAnimals:getNumOfAnimals() end

--- Returns the current capacity: `spec.maxNumAnimals` if set, otherwise the base maximum from the XML.
function PlaceableHusbandryAnimals:getMaxNumOfAnimals() end

--- Returns the number of free slots (capacity minus animals), never below zero.
function PlaceableHusbandryAnimals:getNumOfFreeAnimalSlots() end

--- Returns true if the given animal subtype belongs to this husbandry's animal type.
---@param subTypeIndex any
function PlaceableHusbandryAnimals:getSupportsAnimalSubType(subTypeIndex) end

--- Returns the number of animal clusters in the husbandry.
function PlaceableHusbandryAnimals:getNumOfClusters() end

--- Returns the list of animal clusters from the cluster system.
function PlaceableHusbandryAnimals:getClusters() end

--- Returns the cluster at the given index from the cluster system.
---@param index any
function PlaceableHusbandryAnimals:getCluster(index) end

--- Returns the cluster with the given id from the cluster system.
---@param id any
function PlaceableHusbandryAnimals:getClusterById(id) end

--- Queues a cluster as pending add in the cluster system and wakes the placeable. Does nothing if the cluster is nil.
---@param cluster any
function PlaceableHusbandryAnimals:addCluster(cluster) end

--- Adds animals of a subtype with a given age: as one merged cluster if the cluster supports merging, otherwise as one single-animal cluster per animal.
---@param subTypeIndex any
---@param numAnimals any
---@param age any
function PlaceableHusbandryAnimals:addAnimals(subTypeIndex, numAnimals, age) end

--- Returns the `AnimalClusterSystem` of this husbandry.
function PlaceableHusbandryAnimals:getClusterSystem() end

--- Handler for `AnimalClusterUpdateEvent`; if it concerns this husbandry, raises `onHusbandryAnimalsUpdate`, publishes `HUSBANDRY_ANIMALS_CHANGED` and flags a visual refresh.
---@param husbandry any
function PlaceableHusbandryAnimals:updatedClusters(husbandry) end

--- Sends an `AnimalNameEvent` (network sync unless `noEventSend`) and sets the new name on the cluster with that id.
---@param clusterId any
---@param name any
---@param noEventSend any
function PlaceableHusbandryAnimals:renameAnimal(clusterId, name, noEventSend) end

--- Returns true if the cluster with this id has a rideable vehicle file.
---@param clusterId any
function PlaceableHusbandryAnimals:getAnimalSupportsRiding(clusterId) end

--- Asks the husbandry system whether the owning farm may add another rideable animal; the cluster id is not used.
---@param clusterId any
function PlaceableHusbandryAnimals:getAnimalCanBeRidden(clusterId) end

--- On a client sends an `AnimalRidingEvent` to the server. On the server removes one animal from the cluster and spawns the rideable vehicle at its position; the player enters it once loaded.
---@param clusterId any
---@param player any
function PlaceableHusbandryAnimals:startRiding(clusterId, player) end

--- Callback after the rideable loads: on failure gives the animal back to the cluster; on success clones the cluster with one animal, assigns it to the vehicle and sets the player to enter.
---@param vehicles any
---@param vehicleLoadState any
---@param arguments any
function PlaceableHusbandryAnimals:onLoadedRideable(vehicles, vehicleLoadState, arguments) end

--- Reads one delivery area (start, width and height nodes) from the XML; logs a warning and returns false if any node is missing.
---@param xmlFile any
---@param key any
---@param area any
function PlaceableHusbandryAnimals:loadDeliveryArea(xmlFile, key, area) end

--- Tests whether the world position (x, z) is in the delivery zone: the outdoor contour polygon if present, else any delivery parallelogram, else within 30 m of the placeable root when no area is defined.
---@param x any
---@param z any
function PlaceableHusbandryAnimals:getIsInAnimalDeliveryArea(x, z) end

--- Store spec loader: returns the max animal count and the animal type name if the XML has `placeable.husbandry.animals`, otherwise nil.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function PlaceableHusbandryAnimals.loadSpecValueNumberAnimals(xmlFile, customEnvironment, baseDir) end

--- Store spec getter: returns the maximum animal count and the shop icon profile matching cow, sheep, horse, pig or chicken (nil profile for other types).
---@param storeItem any
---@param realItem any
function PlaceableHusbandryAnimals.getSpecValueNumberAnimals(storeItem, realItem) end

--- Override: refuses the sale with a message while the husbandry contains animals, otherwise defers to the parent.
---@param superFunc any
function PlaceableHusbandryAnimals:canBeSold(superFunc) end

--- Override: for animal types other than horse and pig, appends a productivity entry (global times local production factor, as a percentage).
---@param superFunc any
function PlaceableHusbandryAnimals:getConditionInfos(superFunc) end

--- Override: gets the parent info list and lets the cluster append its own entries. Note: calls the parent without forwarding the cluster argument.
---@param superFunc any
---@param cluster any
function PlaceableHusbandryAnimals:getAnimalInfos(superFunc, cluster) end

--- Override: appends the store description of the visual matching the cluster's subtype and age to the parent text.
---@param superFunc any
---@param cluster any
function PlaceableHusbandryAnimals:getAnimalDescription(superFunc, cluster) end

--- Development console command `gsHusbandryAddAnimals`: raycasts below the active camera to find the husbandry, then adds animals (positive count, optional subtype) or removes them (negative count). Returns a status message.
---@param _ any
---@param numAnimals any
---@param subTypeIndex any
function PlaceableHusbandryAnimals.consoleCommandAddAnimals(_, numAnimals, subTypeIndex) end
