---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableSilo.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization with no prerequisites for silos. It builds an UnloadingStation, a LoadingStation and one or more Storage objects (one per farm slot when storages perFarm is set and in multiplayer), registers them with g_currentMission.storageSystem, streams them to clients, saves storage contents, handles selling with a content-value warning, and shows fill levels in the info HUD. The same file also defines PlaceableSiloActivatable (refill action) and PlaceableSiloRefillEvent (client to server refill request).
---@class PlaceableSilo
PlaceableSilo = {}

--- Placeable specialization with no prerequisites for silos. It builds an UnloadingStation, a LoadingStation and one or more Storage objects (one per farm slot when storages perFarm is set and in multiplayer), registers them with g_currentMission.storageSystem, streams them to clients, saves storage contents, handles selling with a content-value warning, and shows fill levels in the info HUD. The same file also defines PlaceableSiloActivatable (refill action) and PlaceableSiloRefillEvent (client to server refill request).
---@class PlaceableSiloActivatable
PlaceableSiloActivatable = {}

--- Placeable specialization with no prerequisites for silos. It builds an UnloadingStation, a LoadingStation and one or more Storage objects (one per farm slot when storages perFarm is set and in multiplayer), registers them with g_currentMission.storageSystem, streams them to clients, saves storage contents, handles selling with a content-value warning, and shows fill levels in the info HUD. The same file also defines PlaceableSiloActivatable (refill action) and PlaceableSiloRefillEvent (client to server refill request).
---@class PlaceableSiloRefillEvent : Event
PlaceableSiloRefillEvent = {}

--- Always returns true.
---@param specializations table
---@return boolean
function PlaceableSilo.prerequisitesPresent(specializations) end

--- Overrides collectPickObjects, setOwnerFarmId, canBeSold and updateInfo.
---@param placeableType any
function PlaceableSilo.registerOverwrittenFunctions(placeableType) end

--- Registers setAmount, refillAmount, getFillLevels and onPlayerActionTriggerCallback on the placeable type.
---@param placeableType any
function PlaceableSilo.registerFunctions(placeableType) end

--- Subscribes to onLoad, onDelete, onFinalizePlacement, onReadStream, onWriteStream and onSell.
---@param placeableType any
function PlaceableSilo.registerEventListeners(placeableType) end

--- Declares the XML under placeable.silo: sell warning text, player action trigger, perFarm and foreignSilo flags, plus unloading station, loading station and storage definitions.
---@param schema any
---@param basePath any
function PlaceableSilo.registerXMLPaths(schema, basePath) end

--- Declares savegame keys for each storage: its index and the Storage savegame data.
---@param schema any
---@param basePath any
function PlaceableSilo.registerSavegameXMLPaths(schema, basePath) end

--- Adds the shop spec type siloVolume (capacity icon) for placeables.
function PlaceableSilo.initSpecialization() end

--- Loads the player trigger and activatable, the unloading and loading stations, and the storages (one set per farm slot if perFarm and multiplayer, otherwise one). Each storage gets its farm id and foreignSilo flag. Reads the sell warning text.
---@param savegame table
function PlaceableSilo:onLoad(savegame) end

--- Detaches storages from the stations and the storage system, then deletes storages, stations (also removing a liquid manure loading station), the activatable and the trigger. Note: it passes spec.storageFilLLevelChangedCallback to removeFillLevelChangedListeners, a field that is never set in this file.
function PlaceableSilo:onDelete() end

--- Registers stations and storages as network objects, adds them to the storage system and links them, gives single-owner storages the placeable's farm, attaches storage extensions found in range, and enables the player action trigger.
function PlaceableSilo:onFinalizePlacement() end

--- Client initial sync: reads the unloading station, loading station and every storage (object id then data) and completes their registration with g_client.
---@param streamId any
---@param connection any
function PlaceableSilo:onReadStream(streamId, connection) end

--- Server initial sync: writes object id and data for the unloading station, loading station and every storage, registering each in the stream.
---@param streamId any
---@param connection any
function PlaceableSilo:onWriteStream(streamId, connection) end

--- Skips nodes that are an unload trigger's exact fill root node or a load trigger node; otherwise defers to the parent.
---@param superFunc any
---@param node any
function PlaceableSilo:collectPickObjects(superFunc, node) end

--- Returns false for per-farm silos. Otherwise returns true and, if the first storage holds content, a warning listing each fill type with an estimated sell value (lowest selling-point price times PRICE_SELL_FACTOR); the total is kept for onSell.
---@param superFunc any
function PlaceableSilo:canBeSold(superFunc) end

--- Loads each saved storage by its index into the matching storage object.
---@param xmlFile any
---@param key any
function PlaceableSilo:loadFromXMLFile(xmlFile, key) end

--- Saves every storage with its 1-based index.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableSilo:saveToXMLFile(xmlFile, key, usedModNames) end

--- Calls the parent, then on the server propagates the farm id to all storages unless the silo is per farm.
---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceableSilo:setOwnerFarmId(superFunc, farmId, noEventSend) end

--- Sets the fill level of a fill type by filling storages in order, each up to its free capacity, until the amount is spent.
---@param fillType any
---@param amount any
function PlaceableSilo:setAmount(fillType, amount) end

--- Buys material to refill the silo. On a client it sends PlaceableSiloRefillEvent to the server; on the server it adds the amount across storages and charges the farm (BOUGHT_MATERIALS). Does nothing if an argument is nil.
---@param fillTypeIndex any
---@param amount any
---@param price any
function PlaceableSilo:refillAmount(fillTypeIndex, amount, price) end

--- Returns a table fill type index to level combined from all storages, keeping only fill types allowed by self.fillTypes when it is set. Note: for fill types in several storages the last value overwrites the earlier ones instead of summing.
function PlaceableSilo:getFillLevels() end

--- Server only: pays the farm the total stored-content value computed in canBeSold as HARVEST_INCOME.
function PlaceableSilo:onSell() end

--- When the local player of the owning farm enters or leaves the trigger, adds or removes the refill activatable.
---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
function PlaceableSilo:onPlayerActionTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

--- Calls the parent, then adds to the info table the largest fill levels (above 0.1) from the loading station for the local farm, up to INFO_TRIGGER_NUM_DISPLAYED_FILLTYPES entries, or an empty-silo line.
---@param superFunc any
---@param infoTable any
function PlaceableSilo:updateInfo(superFunc, infoTable) end

--- Reads the capacity of the first storage from the store item XML.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function PlaceableSilo.loadSpecValueVolume(xmlFile, customEnvironment, baseDir) end

--- Returns the silo volume formatted for the shop, or nil if the store item has none.
---@param storeItem any
---@param realItem any
function PlaceableSilo.getSpecValueVolume(storeItem, realItem) end

--- Creates the refill activatable for a silo placeable with the refill action text.
---@param placeable any
function PlaceableSiloActivatable.new(placeable) end

--- Sums the free capacity per fill type over all storages and opens RefillDialog, whose confirmation calls the placeable's refillAmount.
function PlaceableSiloActivatable:run() end

--- Creates an empty refill event, used when reading from the network.
function PlaceableSiloRefillEvent.emptyNew() end

--- Creates a refill event holding the placeable, fill type index, amount and price.
---@param placeable any
---@param fillTypeIndex any
---@param amount any
---@param price any
function PlaceableSiloRefillEvent.new(placeable, fillTypeIndex, amount, price) end

--- Writes the placeable, amount and price (int32) and the fill type index to the stream.
---@param streamId any
---@param connection any
function PlaceableSiloRefillEvent:writeStream(streamId, connection) end

--- Reads placeable, amount, price and fill type index, then runs the event immediately.
---@param streamId any
---@param connection any
function PlaceableSiloRefillEvent:readStream(streamId, connection) end

--- On the receiving server (connection not to a server), calls refillAmount on the placeable with the transmitted values.
---@param connection any
function PlaceableSiloRefillEvent:run(connection) end
