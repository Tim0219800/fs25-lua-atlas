---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableSiloExtension.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization with no prerequisites for storage extensions that add capacity to existing silos. It owns a single Storage object, registers it with g_currentMission.storageSystem and attaches it to the unloading and loading stations in range of the same farm. Placement is refused when no station is in range, and selling warns about stored content and pays its estimated value. The storage is streamed to clients and saved with the placeable.
---@class PlaceableSiloExtension
PlaceableSiloExtension = {}

--- Always returns true.
---@param specializations table
---@return boolean
function PlaceableSiloExtension.prerequisitesPresent(specializations) end

--- Overrides setOwnerFarmId, getCanBePlacedAt and canBeSold.
---@param placeableType any
function PlaceableSiloExtension.registerOverwrittenFunctions(placeableType) end

--- Subscribes to onLoad, onDelete, onFinalizePlacement, onReadStream, onWriteStream and onSell.
---@param placeableType any
function PlaceableSiloExtension.registerEventListeners(placeableType) end

--- Declares the XML under placeable.siloExtension: foreignSilo flag, a translatable warning for placement away from a silo, storage node and the Storage definition.
---@param schema any
---@param basePath any
function PlaceableSiloExtension.registerXMLPaths(schema, basePath) end

--- Declares the savegame keys by delegating to Storage.registerSavegameXMLPaths.
---@param schema any
---@param basePath any
function PlaceableSiloExtension.registerSavegameXMLPaths(schema, basePath) end

--- Adds the shop spec type siloExtensionVolume (capacity icon) for placeables.
function PlaceableSiloExtension.initSpecialization() end

--- Creates and loads the Storage from placeable.siloExtension.storage (warns if missing), copies the foreignSilo flag to it and reads the near-silo warning text.
---@param savegame table
function PlaceableSiloExtension:onLoad(savegame) end

--- If the storage is known to the storage system, detaches it from all its unloading and loading stations and removes it; then deletes the storage.
function PlaceableSiloExtension:onDelete() end

--- Finds extendable unloading and loading stations in range for the owner farm, gives the storage its owner, registers it as a network object and adds it to the storage system and those stations.
function PlaceableSiloExtension:onFinalizePlacement() end

--- Client initial sync: reads the storage's object id and data and completes its registration with g_client, if the placeable has a storage.
---@param streamId any
---@param connection any
function PlaceableSiloExtension:onReadStream(streamId, connection) end

--- Server initial sync: writes the storage's object id and data and registers it in the stream for this connection.
---@param streamId any
---@param connection any
function PlaceableSiloExtension:onWriteStream(streamId, connection) end

--- Returns the parent's refusal if any; also false without a storage. Looks for extendable unloading and loading stations in range at the position for that farm and returns false with the near-silo warning if none is found, otherwise true.
---@param superFunc any
---@param x any
---@param y any
---@param z any
---@param farmId any
function PlaceableSiloExtension:getCanBePlacedAt(superFunc, x, y, z, farmId) end

--- Returns true; if the storage holds content, also returns a warning listing each fill type with an estimated value (lowest selling-point price times PRICE_SELL_FACTOR), and keeps the total for onSell.
---@param superFunc any
function PlaceableSiloExtension:canBeSold(superFunc) end

--- Forwards savegame loading to the storage, if any.
---@param xmlFile any
---@param key any
function PlaceableSiloExtension:loadFromXMLFile(xmlFile, key) end

--- Forwards savegame saving to the storage, if any.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableSiloExtension:saveToXMLFile(xmlFile, key, usedModNames) end

--- Calls the parent, then on the server gives the same owner farm to the storage.
---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceableSiloExtension:setOwnerFarmId(superFunc, farmId, noEventSend) end

--- Server only: pays the farm the total stored-content value computed in canBeSold as HARVEST_INCOME.
function PlaceableSiloExtension:onSell() end

--- Reads the storage capacity from the store item XML.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function PlaceableSiloExtension.loadSpecValueVolume(xmlFile, customEnvironment, baseDir) end

--- Returns the extension volume formatted for the shop, or nil if the store item has none.
---@param storeItem any
---@param realItem any
function PlaceableSiloExtension.getSpecValueVolume(storeItem, realItem) end
