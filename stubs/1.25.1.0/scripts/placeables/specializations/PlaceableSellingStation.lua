---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableSellingStation.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization with no prerequisites that wraps a SellingStation (a place where players sell fill types, e.g. a market or processor). It creates the station from placeable.sellingStation, registers it with g_currentMission.storageSystem and economyManager when placed, streams it to clients and forwards savegame load/save. The SellingStation class itself is not in this file.
---@class PlaceableSellingStation
PlaceableSellingStation = {}

--- Always returns true.
---@param specializations table
---@return boolean
function PlaceableSellingStation.prerequisitesPresent(specializations) end

--- Registers getSellingStation on the placeable type.
---@param placeableType any
function PlaceableSellingStation.registerFunctions(placeableType) end

--- Overrides collectPickObjects.
---@param placeableType any
function PlaceableSellingStation.registerOverwrittenFunctions(placeableType) end

--- Subscribes to onLoad, onDelete, onFinalizePlacement, onReadStream and onWriteStream.
---@param placeableType any
function PlaceableSellingStation.registerEventListeners(placeableType) end

--- Declares the XML schema by delegating to SellingStation.registerXMLPaths under placeable.sellingStation.
---@param schema any
---@param basePath any
function PlaceableSellingStation.registerXMLPaths(schema, basePath) end

--- Declares savegame XML paths via SellingStation.registerSavegameXMLPaths.
---@param schema any
---@param basePath any
function PlaceableSellingStation.registerSavegameXMLPaths(schema, basePath) end

--- Adds the shop spec type sellingStationFillTypes (input icon) for placeables, using SellingStation's load and get functions.
function PlaceableSellingStation.initSpecialization() end

--- Creates the SellingStation and loads it from placeable.sellingStation, linking it to the first component node; the placeable is stored as owningPlaceable. The return value of load is ignored.
---@param savegame table
function PlaceableSellingStation:onLoad(savegame) end

--- Removes the station from the storage system and the economy manager, then deletes it.
function PlaceableSellingStation:onDelete() end

--- Registers the station as a network object and adds it to the storage system (as unloading station) and the economy manager.
function PlaceableSellingStation:onFinalizePlacement() end

--- Client initial sync: reads the station's object id and data, then completes its registration with g_client.
---@param streamId any
---@param connection any
function PlaceableSellingStation:onReadStream(streamId, connection) end

--- Server initial sync: writes the station's object id and data and registers it in the stream for this connection.
---@param streamId any
---@param connection any
function PlaceableSellingStation:onWriteStream(streamId, connection) end

--- Returns the SellingStation object of this placeable.
function PlaceableSellingStation:getSellingStation() end

--- Skips the node when it is an unload trigger's exact fill root node; otherwise defers to the parent implementation.
---@param superFunc any
---@param node any
function PlaceableSellingStation:collectPickObjects(superFunc, node) end

--- Forwards savegame loading to the selling station.
---@param xmlFile any
---@param key any
function PlaceableSellingStation:loadFromXMLFile(xmlFile, key) end

--- Forwards savegame saving to the selling station.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableSellingStation:saveToXMLFile(xmlFile, key, usedModNames) end
