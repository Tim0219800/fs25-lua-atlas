---@meta
-- FS25 1.25.1.0 : placeables/Placeable.lua (generated stub, FS25 Lua Atlas)

--- Base class of every placeable (buildings, fences, production points and so on), derived from `Object`. It runs the multi-step loading (pre-load, i3d load, load finished, synchronized), owns the XML schemas for placeable and savegame data, writes and reads network streams for joining clients, saves to the savegame, and raises lifecycle events (`onLoad`, `onFinalizePlacement`, `onDelete`, hourly or daily events and more) to the specializations of its placeable type. Functionality is supplied by specializations; economy, farmland and shop data come from the store item. Several helpers it calls live elsewhere or are missing from the dump (UNVERIFIED), for example `getMonetaryValue`, `getIsOnFarmland`, `getFarmlandId`, `getIsPreplaced`, `updateOwnership`, `PlaceableSystem:markPlaceableForDeletion`.
---@class Placeable : Object
Placeable = {}

--- Declares the events specializations can listen to on a placeable type: load steps, register, delete, save, network streams, placement, update, day/hour/minute/period/weather changes, farmland, buy, sell and owner changes.
---@param placeableType any
function Placeable.registerEvents(placeableType) end

--- Registers the base placeable functions (position, farmland, pose, owner, loading step and state, physics, naming, price, destruction, overlay color, visibility and similar) on the placeable type so that specializations can override them.
---@param placeableType any
function Placeable.registerFunctions(placeableType) end

--- Fills the placeable XML schema and the savegame schema (base data, store data, i3d mappings, unique id, name, position, age, price, farm id, overwrite flags and so on), lets each specialization register its own paths, adds the `placeableSlots` store spec and registers the color configuration type.
function Placeable.init() end

--- Registers the XML and savegame paths of every configuration item class once all configuration types are known, including the legacy `boughtConfiguration` savegame path.
function Placeable.postInit() end

--- Creates a placeable object for the given server/client role with default state: loading step CREATED, state OK, property state OWNED, age 0, price 0, no unique id.
---@param isServer any
---@param isClient any
---@param customMt any
function Placeable.new(isServer, isClient, customMt) end

--- Stores the config XML filename, its clean name, and the mod name and base directory derived from the path.
---@param filename any
function Placeable:setFilename(filename) end

--- Stores selected and bought configurations plus optional configuration data, and builds an alphabetically sorted list of configuration names.
---@param configurations any
---@param boughtConfigurations any
---@param configurationData any
function Placeable:setConfigurations(configurations, boughtConfigurations, configurationData) end

--- Applies the placeable type (specialization set) to this object. A `placeableType` configuration item may replace the given type; unknown names log a warning. Requires `setFilename` first.
---@param typeDef any
function Placeable:setType(typeDef) end

--- Stores the function, target and arguments to call when loading finishes or fails.
---@param loadCallbackFunction any
---@param loadCallbackFunctionTarget any
---@param loadCallbackFunctionArguments any
function Placeable:setLoadCallback(loadCallbackFunction, loadCallbackFunctionTarget, loadCallbackFunctionArguments) end

--- Calls the stored load callback with the placeable, its loading state and the arguments, then clears target and arguments.
function Placeable:loadCallback() end

--- Starts loading from a `PlaceableLoadingData`: opens the XML, resolves the store item, repairs configurations against the store item and configuration sets, creates spec environments, raises `onPreLoad`, then loads the i3d asynchronously or takes the preplaced node. Returns false on failure.
---@param placeableLoadingData any
function Placeable:load(placeableLoadingData) end

--- Callback when the i3d is ready: on failure sets the ERROR state and calls the load callback; if the placeable was deleted meanwhile sets CANCELED; otherwise stores the root node and queues `loadFinished` as an async task.
---@param i3dNode any
---@param failedReason any
---@param args any
---@param i3dLoadingId any
function Placeable:i3dFileLoaded(i3dNode, failedReason, args, i3dLoadingId) end

--- Final loading step: makes the placeable visible and, on the server with savegame data, calls each specialization's `loadFromXMLFile` and reads name, image, age, price, farm id and overwrite flags. Then raises `onLoadFinished`, finalizes placement for savegame loads, marks it synchronized on the server, registers it if requested and calls the load callback.
function Placeable:onFinishedLoading() end

--- Logs the error (XML-aware when the XML is open) and closes the XML file, sets the ERROR loading state and calls the load callback.
---@param msg any
function Placeable:onLoadingError(msg, ...) end

--- Creates a loading task for the given target through `SpecializationUtil.createLoadingTask`; the placeable finishes loading only after its tasks are done.
---@param target any
---@return table
function Placeable:createLoadingTask(target) end

--- Marks a loading task as done via `SpecializationUtil.finishLoadingTask`, which can trigger `onFinishedLoading` once everything is ready.
---@param task table
function Placeable:finishLoadingTask(task) end

--- Called when the placeable is actually placed: raises the pre, finalize and post-finalize events, adds it to physics, the placeable system and the owned items, registers pick nodes, handles farmland ownership and subscribes to day, hour, minute, weather and period messages as needed.
function Placeable:finalizePlacement() end

--- Deletes the placeable. Unless `immediate` is true (or the game is exiting) it is only queued via the placeable system. Otherwise raises `onPreDelete` and `onDelete`, unsubscribes messages, removes it from systems, frees the i3d and XML, and calls the parent delete. Logs an error if already deleted.
---@param immediate any
function Placeable:delete(immediate) end

--- Client side on join: reads whether it is preplaced (index) or its filename, position and rotation, then configurations and property state, builds a `PlaceableLoadingData` and starts the client-side load. Logs an error if loading was already started.
---@param streamId integer
---@param connection table
---@param objectId any
function Placeable:readStream(streamId, connection, objectId) end

--- Server side on join: writes the preplaced flag and index, or filename, translation and rotation of the root node, then configurations and property state.
---@param streamId integer
---@param connection table
function Placeable:writeStream(streamId, connection) end

--- Client side once loaded: finalizes placement, raises `onReadStream` (with per-spec bit counts when `Placeable.DEBUG_NETWORK` is set), reads optional custom name, l10n key and custom image, marks the placeable synchronized and requests updates.
---@param streamId integer
---@param connection table
function Placeable:postReadStream(streamId, connection) end

--- Server side after the client has loaded the placeable: raises `onWriteStream` (with debug sizes if enabled) and writes optional custom name, l10n key and custom image filename.
---@param streamId integer
---@param connection table
function Placeable:postWriteStream(streamId, connection) end

--- Client side network update: raises `onReadUpdateStream` for specializations (with per-spec bit counts when `Placeable.DEBUG_NETWORK_UPDATE` is set).
---@param streamId integer
---@param timestamp integer
---@param connection table
function Placeable:readUpdateStream(streamId, timestamp, connection) end

--- Server side network update: raises `onWriteUpdateStream` with the dirty mask (with debug sizes when `Placeable.DEBUG_NETWORK_UPDATE` is set).
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Placeable:writeUpdateStream(streamId, connection, dirtyMask) end

--- Writes the placeable to the savegame XML: unique id, filename, position and rotation (unless preplaced), age, price, farm id, tour id, custom name (if renamable), name l10n key, overwrite flags, custom image, configurations, then each specialization's own data.
---@param xmlFile string
---@param key any
---@param usedModNames any
---@return string
---@return string
function Placeable:saveToXMLFile(xmlFile, key, usedModNames) end

--- Sets the property state (for example owned or construction preview).
---@param state any
function Placeable:setPropertyState(state) end

--- Returns the property state.
function Placeable:getPropertyState() end

--- Shows or hides all component root nodes of the placeable.
---@param state any
function Placeable:setVisibility(state) end

--- Returns true when the loading step has reached SYNCHRONIZED.
function Placeable:getIsSynchronized() end

--- Returns true; the base placeable is always saved (the system also skips preplaced ones separately).
function Placeable:getNeedsSaving() end

--- Returns the placeable's unique id, or nil if none was set.
---@return string
function Placeable:getUniqueId() end

--- Sets the unique id. It should not be changed once set (checked only in debug builds).
---@param uniqueId string
function Placeable:setUniqueId(uniqueId) end

--- Per-frame update; raises `onUpdate` with the delta time for specializations.
---@param dt any
function Placeable:update(dt) end

--- Network tick update; raises `onUpdateTick` with the delta time.
---@param dt any
function Placeable:updateTick(dt) end

--- Draw callback; raises `onDraw` for specializations.
function Placeable:draw() end

--- Debug draw; raises `onDrawDebug` (only active with the scriptDebug start parameter, per the source comment).
function Placeable:drawDebug() end

--- Returns the display name: player custom name first, then the mapper's l10n name, then the store item name.
---@return string
function Placeable:getName() end

--- Returns the custom image filename if set, else the store item's image.
function Placeable:getImageFilename() end

--- Returns true if the placeable can be renamed and is owned by the given farm id.
---@param farmId any
function Placeable:getCanBeRenamedByFarm(farmId) end

--- Sets or resets (nil) the custom name when renaming is allowed, sending a `PlaceableNameEvent` unless `noEventSend`, and notifies loading and unloading station changes. Returns false if not renamable or the name is blank.
---@param name string
---@param noEventSend boolean
---@return boolean
function Placeable:setName(name, noEventSend) end

--- Stores a name localization key (without the `$l10n_` prefix) and the translated text if the key exists for the map's custom environment; otherwise does nothing.
---@param nameL10nKey string
function Placeable:setNameL10nKey(nameL10nKey) end

--- Raises `onBuy`, counts the placeables owned by the local farm and tries to unlock the NumPlaceables achievement.
function Placeable:onBuy() end

--- Publishes `FARM_PROPERTY_CHANGED` for the owner farm and raises `onSell`.
function Placeable:onSell() end

--- Returns the stored purchase price.
function Placeable:getPrice() end

--- Returns true unless the store item has a max item count already reached by the local farm.
---@return boolean
function Placeable:canBuy() end

--- Base check for placing at a position for a farm: always returns true, nil (specializations may override).
---@param x any
---@param y any
---@param z any
---@param farmId any
function Placeable:getCanBePlacedAt(x, y, z, farmId) end

--- Base check: always returns true, nil (second value is presumably an optional reason, UNVERIFIED).
function Placeable:canBeSold() end

--- Returns `Placeable.DESTRUCTION.SELL`, the default way of removing the placeable.
function Placeable:getDestructionMethod() end

--- Base hook returning nil; specializations can return the nodes that would be destroyed for a given node.
---@param node any
function Placeable:previewNodeDestructionNodes(node) end

--- Base hook returning false, false (nothing destroyed, placeable not to be removed); specializations override it.
---@param node integer
---@return boolean
---@return boolean
function Placeable:performNodeDestruction(node) end

--- On farmland ownership change, calls `updateOwnership` if the placeable is bought with farmland and sits on that farmland.
---@param farmlandId any
---@param farmId any
---@param loadFromSavegame any
function Placeable:onFarmlandStateChanged(farmlandId, farmId, loadFromSavegame) end

--- Registers the object via the parent class and raises `onRegistered`.
---@param alreadySent any
function Placeable:register(alreadySent) end

--- Sets the owner farm: updates farmland ownership if it buys farmland, calls the parent, raises `onOwnerChanged` after the load step, and re-registers the owned item (except in construction preview).
---@param farmId any
---@param noEventSend any
function Placeable:setOwnerFarmId(farmId, noEventSend) end

--- Sets the loading state if valid; otherwise prints the call stack and logs an error.
---@param loadingState any
function Placeable:setLoadingState(loadingState) end

--- Recursively collects nodes with a rigid body into `pickObjects`, used to map nodes back to the placeable.
---@param node integer
function Placeable:collectPickObjects(node) end

--- Sets the loading step through `SpecializationUtil.setLoadingStep`, which logs an error for an invalid step.
---@param loadingStep SpecializationLoadStep
function Placeable:setLoadingStep(loadingStep) end

--- Sets the `placeableColorScale` shader parameter (r, g, b, alpha) on all shapes that support it, finding them once and caching them.
---@param r any
---@param g any
---@param b any
---@param alpha any
function Placeable:setOverlayColor(r, g, b, alpha) end

--- Recursively collects shape nodes that have the `placeableColorScale` parameter and are not terrain decals into the given table.
---@param node integer
---@param nodeTable table
function Placeable:setOverlayColorNodes(node, nodeTable) end

--- Returns the daily upkeep from the store item and configurations, increased with age up to `EconomyManager.MAX_DAILYUPKEEP_MULTIPLIER` when the item has a lifetime.
---@return integer
function Placeable:getDailyUpkeep() end

--- Returns the sell price and a flag. Within `Placeable.UNDO_DURATION` after placement (and after the construction screen was opened) it returns the full price and true, else `getMonetaryValue()` and false.
---@return integer
---@return boolean
function Placeable:getSellPrice() end

--- Returns `Placeable.SELL_AND_SPECTATOR_FARM` for preplaced placeables on public land or that cannot be deleted, or when the savegame forbids deletion; otherwise `Placeable.SELL_AND_DELETE`.
---@return integer
function Placeable:getSellAction() end

--- Adds the root node to the physics world if it exists.
function Placeable:addToPhysics() end

--- Removes the root node from the physics world if it exists.
function Placeable:removeFromPhysics() end

--- Moves the root node to a world position and sets only the Y rotation (rotX and rotZ are ignored).
---@param x any
---@param y any
---@param z any
---@param rotX any
---@param rotY any
---@param rotZ any
function Placeable:setPreviewPosition(x, y, z, rotX, rotY, rotZ) end

--- Returns false; specializations override it to receive weather changes.
function Placeable:getNeedWeatherChanged() end

--- Message handler for day/night changes (subscribed to `DAY_NIGHT_CHANGED`); raises `onWeatherChanged`.
function Placeable:weatherChanged() end

--- Returns false; specializations override it to receive hour changes.
function Placeable:getNeedHourChanged() end

--- Message handler for hour changes; raises `onHourChanged` with the hour.
---@param hour any
function Placeable:hourChanged(hour) end

--- Returns false; specializations override it to receive minute changes.
function Placeable:getNeedMinuteChanged() end

--- Message handler for minute changes; raises `onMinuteChanged` with the minute.
---@param minute any
function Placeable:minuteChanged(minute) end

--- Returns false; specializations override it to receive day changes.
function Placeable:getNeedDayChanged() end

--- Message handler for day changes; raises `onDayChanged` with the day.
---@param day any
function Placeable:dayChanged(day) end

--- Message handler for period changes: increases the placeable's age by 1 (months) and raises `onPeriodChanged`.
---@param period any
function Placeable:periodChanged(period) end

--- Store spec text for the slots used: formats the slot usage of the store item (first copy or not) as '+N $SLOTS$'.
---@param storeItem any
---@param realItem any
function Placeable.getSpecValueSlots(storeItem, realItem) end
