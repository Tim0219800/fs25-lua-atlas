---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableBuyingStation.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that wraps a `BuyingStation` (loaded from `placeable.buyingStation`) where players load purchased goods. It registers the station as a loading station in the storage system, syncs it to joining clients, and declares a store spec showing the fill types it sells.
---@class PlaceableBuyingStation
PlaceableBuyingStation = {}

--- Always returns true: no prerequisite specializations.
---@param specializations table
---@return boolean
function PlaceableBuyingStation.prerequisitesPresent(specializations) end

--- Registers `getBuyingStation`.
---@param placeableType any
function PlaceableBuyingStation.registerFunctions(placeableType) end

--- Overrides `collectPickObjects`.
---@param placeableType any
function PlaceableBuyingStation.registerOverwrittenFunctions(placeableType) end

--- Subscribes to `onLoad`, `onDelete`, `onFinalizePlacement`, `onReadStream` and `onWriteStream`.
---@param placeableType any
function PlaceableBuyingStation.registerEventListeners(placeableType) end

--- Declares the `buyingStation` XML keys by delegating to `BuyingStation.registerXMLPaths`.
---@param schema any
---@param basePath any
function PlaceableBuyingStation.registerXMLPaths(schema, basePath) end

--- Adds the store spec type `buyingStationFillTypes` (icon `shopListAttributeIconOutput`) for placeables, using the `BuyingStation` spec value loader and getter.
function PlaceableBuyingStation.initSpecialization() end

--- Creates and loads the `BuyingStation`; on success stores it, sets its owning placeable and registers it as a loading station. On failure logs an XML error and deletes it.
---@param savegame table
function PlaceableBuyingStation:onLoad(savegame) end

--- Unregisters the loading station from the storage system and deletes the `BuyingStation`, if loaded.
function PlaceableBuyingStation:onDelete() end

--- Registers the `BuyingStation` network object, if loaded.
function PlaceableBuyingStation:onFinalizePlacement() end

--- Client side join: reads the buying station object id and stream and finishes its registration.
---@param streamId any
---@param connection any
function PlaceableBuyingStation:onReadStream(streamId, connection) end

--- Server side join: writes the buying station object id and stream and registers it in the connection's stream.
---@param streamId integer
---@param connection table
function PlaceableBuyingStation:onWriteStream(streamId, connection) end

--- Skips picking nodes that are one of the buying station's load trigger nodes; other nodes go to the parent implementation.
---@param superFunc any
---@param node any
function PlaceableBuyingStation:collectPickObjects(superFunc, node) end

--- Returns the `BuyingStation` object (nil if it failed to load).
function PlaceableBuyingStation:getBuyingStation() end
