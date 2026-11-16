---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableDoghouse.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for the farm's dog house. The server spawns a `Dog` and a `DogBall` at nodes defined in the XML (optionally per `dogHouse` configuration), a construction preview shows a textured dog model instead, and players can interact via a trigger to fill the food bowl. Only one dog house is allowed per farm, tracked in `g_currentMission.doghouses`, and the bowl is emptied every game hour.
---@class PlaceableDoghouse
PlaceableDoghouse = {}

--- Always returns true: no prerequisite specializations.
---@param specializations table
---@return boolean
function PlaceableDoghouse.prerequisitesPresent(specializations) end

--- Adds the placeable configuration type `dogHouse` (selectable doghouse configurations) to the placeable configuration manager.
function PlaceableDoghouse.initSpecialization() end

--- Registers eight functions: interaction trigger callback, registration checks and (un)registration with the mission, food bowl state, dog and spawn node getters, and the preview dog load callback.
---@param placeableType any
function PlaceableDoghouse.registerFunctions(placeableType) end

--- Overrides `setOwnerFarmId`, `canBuy`, `getCanBePlacedAt` and `getNeedHourChanged`.
---@param placeableType any
function PlaceableDoghouse.registerOverwrittenFunctions(placeableType) end

--- Subscribes to `onLoad`, `onDelete`, `onFinalizePlacement`, `onWriteStream`, `onReadStream` and `onHourChanged`.
---@param placeableType any
function PlaceableDoghouse.registerEventListeners(placeableType) end

--- Declares the dog house keys (dog node, preview node, texture tile indices, dog XML, nameplate, ball node and file, interaction trigger, bowl food node and fill sound) both under `dogHouse` and under each `dogHouseConfiguration`.
---@param schema any
---@param basePath any
function PlaceableDoghouse.registerXMLPaths(schema, basePath) end

--- Declares the savegame keys by delegating to `Dog.registerSavegameXMLPaths`.
---@param schema any
---@param basePath any
function PlaceableDoghouse.registerSavegameXMLPaths(schema, basePath) end

--- Picks the active configuration, then on the server (not in preview) creates and registers the `Dog` and `DogBall`. In construction preview it loads the dog model asynchronously for display. Sets up the interaction trigger, bowl food node and sound and the activatable. If the spawn node or dog is invalid, it removes most listeners and stops.
---@param savegame table
function PlaceableDoghouse:onLoad(savegame) end

--- Removes the activatable, unregisters the doghouse from the mission, and on the server deletes the dog and ball if not already deleted. Removes the trigger, deletes the fill sound and releases the preview dog i3d.
function PlaceableDoghouse:onDelete() end

--- Server: calls `finalizePlacement` on the dog. Then registers the doghouse with the mission.
function PlaceableDoghouse:onFinalizePlacement() end

--- Client side join: reads the dog network object (and links the dog back to this spawner) and the food bowl visibility.
---@param streamId any
---@param connection any
function PlaceableDoghouse:onReadStream(streamId, connection) end

--- Server side join: writes the dog network object and the food bowl visibility.
---@param streamId integer
---@param connection table
function PlaceableDoghouse:onWriteStream(streamId, connection) end

--- Delegates loading of the savegame data to the dog, if there is one.
---@param xmlFile any
---@param key any
function PlaceableDoghouse:loadFromXMLFile(xmlFile, key) end

--- Delegates saving to the dog, if there is one.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableDoghouse:saveToXMLFile(xmlFile, key, usedModNames) end

--- Async callback for the preview dog model: links it to the preview node (or root node) and sets the texture atlas tile shader parameter. Always finishes the loading task.
---@param node any
---@param failedReason any
---@param args any
function PlaceableDoghouse:onPreviewDogLoaded(node, failedReason, args) end

--- Trigger callback: when the local player of the owning farm enters or leaves and a dog exists, adds or removes the doghouse activatable.
---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
function PlaceableDoghouse:dogInteractionTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

--- Returns true if the mission already has a doghouse for this placeable's owner farm.
---@return boolean
function PlaceableDoghouse:isDoghouseRegistered() end

--- Adds this placeable to `g_currentMission.doghouses` unless the farm already has one; returns whether it was added.
---@return boolean
function PlaceableDoghouse:registerDoghouseToMission() end

--- Removes this placeable from `g_currentMission.doghouses` and returns true.
---@return boolean
function PlaceableDoghouse:unregisterDoghouseToMission() end

--- Calls the parent, then on the server propagates the new owner farm id to the dog and the ball.
---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceableDoghouse:setOwnerFarmId(superFunc, farmId, noEventSend) end

--- Sends a bowl state event, shows or hides the food node and, when filled, tells the dog about the bowl and plays the fill sound. Does nothing without a food node.
---@param isFilled any
---@param noEventSend any
function PlaceableDoghouse:setFoodBowlState(isFilled, noEventSend) end

--- Returns the `Dog` object (nil on clients not yet synced or when none was spawned).
function PlaceableDoghouse:getDog() end

--- Returns the dog spawn node.
function PlaceableDoghouse:getSpawnNode() end

--- Refuses placement with a one-per-farm warning if a doghouse is already registered; otherwise defers to the parent.
---@param superFunc any
---@param x any
---@param y any
---@param z any
---@param farmId any
function PlaceableDoghouse:getCanBePlacedAt(superFunc, x, y, z, farmId) end

--- Runs the parent check, then refuses the purchase with a one-per-farm warning if a doghouse already exists for the farm.
---@param superFunc any
function PlaceableDoghouse:canBuy(superFunc) end

--- Always returns true so the placeable receives `onHourChanged`.
---@param superFunc any
function PlaceableDoghouse:getNeedHourChanged(superFunc) end

--- Empties the food bowl every game hour, without sending an event (`setFoodBowlState(false, true)`).
function PlaceableDoghouse:onHourChanged() end
