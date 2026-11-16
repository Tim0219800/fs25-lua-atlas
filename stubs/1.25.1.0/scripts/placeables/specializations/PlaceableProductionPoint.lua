---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableProductionPoint.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that wraps a ProductionPoint object (production chains with input/output storage, loading and unloading stations). It requires PlaceableInfoTrigger, supports a configuration per XML (productionPointConfigurations), a not-yet-finalized state for constructible buildings, network streaming of the production point, savegame forwarding, and a limit on production points via g_currentMission.productionChainManager. It raises onOutputFillTypesChanged and onProductionStatusChanged.
---@class PlaceableProductionPoint
PlaceableProductionPoint = {}

--- Requires the PlaceableInfoTrigger specialization to be present.
---@param specializations table
---@return boolean
function PlaceableProductionPoint.prerequisitesPresent(specializations) end

--- Registers the events onOutputFillTypesChanged and onProductionStatusChanged on the placeable type.
---@param placeableType any
function PlaceableProductionPoint.registerEvents(placeableType) end

--- Registers outputsChanged and productionStatusChanged, which the ProductionPoint calls to notify its placeable.
---@param placeableType any
function PlaceableProductionPoint.registerFunctions(placeableType) end

--- Overrides setOwnerFarmId, collectPickObjects, canBuy, updateInfo and finalizeConstruction (the last is registered here but not defined in this file's dump, UNVERIFIED).
---@param placeableType any
function PlaceableProductionPoint.registerOverwrittenFunctions(placeableType) end

--- Subscribes to onLoad, onDelete, onFinalizePlacement, onWriteStream, onReadStream and onBuy.
---@param placeableType any
function PlaceableProductionPoint.registerEventListeners(placeableType) end

--- Declares the production point XML at placeable.productionPoint and inside each productionPointConfiguration, adding an isFinalized flag for constructible buildings.
---@param schema any
---@param basePath any
function PlaceableProductionPoint.registerXMLPaths(schema, basePath) end

--- Registers the savegame XML paths by delegating to ProductionPoint.registerSavegameXMLPaths.
---@param schema any
---@param basePath any
function PlaceableProductionPoint.registerSavegameXMLPaths(schema, basePath) end

--- Adds the shop spec types prodPointInputFillTypes and prodPointOutputFillTypes for placeables and registers the productionPoint configuration type with g_placeableConfigurationManager.
function PlaceableProductionPoint.initSpecialization() end

--- Picks the XML node of the selected configuration (falling back to placeable.productionPoint), creates and loads the ProductionPoint. If isFinalized is false, it hides the station from the prices menu and disables missions; on load failure it sets the loading state to ERROR.
---@param savegame table
function PlaceableProductionPoint:onLoad(savegame) end

--- Deletes the production point and clears the reference.
function PlaceableProductionPoint:onDelete() end

--- Registers the production point, sets its owner (AccessHandler.EVERYONE if not finalized), finds storage extensions and updates effects. Disables the interaction trigger for buying if the placeable has a buying trigger.
function PlaceableProductionPoint:onFinalizePlacement() end

--- Calls the parent updateInfo, then lets the production point add its own lines to the info table.
---@param superFunc any
---@param infoTable any
function PlaceableProductionPoint:updateInfo(superFunc, infoTable) end

--- Raises the placeable event onOutputFillTypesChanged with the outputs and the state.
---@param outputs any
---@param state any
function PlaceableProductionPoint:outputsChanged(outputs, state) end

--- Raises the placeable event onProductionStatusChanged with the production and its status.
---@param production any
---@param status any
function PlaceableProductionPoint:productionStatusChanged(production, status) end

--- Client side of the initial sync: reads the production point's object id, its stream data, then completes the object registration with g_client.
---@param streamId any
---@param connection any
function PlaceableProductionPoint:onReadStream(streamId, connection) end

--- Server side of the initial sync: writes the production point's object id and data, and registers the object in the stream for that connection.
---@param streamId any
---@param connection any
function PlaceableProductionPoint:onWriteStream(streamId, connection) end

--- Forwards savegame loading to the production point.
---@param xmlFile any
---@param key any
function PlaceableProductionPoint:loadFromXMLFile(xmlFile, key) end

--- Forwards savegame saving to the production point.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableProductionPoint:saveToXMLFile(xmlFile, key, usedModNames) end

--- Calls the parent, then gives the production point the owner (EVERYONE while not finalized). If not finalized, also removes it from the productionChainManager.
---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceableProductionPoint:setOwnerFarmId(superFunc, farmId, noEventSend) end

--- Skips adding the node to pick objects when it is a load trigger node or an unloading trigger's exact fill root node; otherwise defers to the parent.
---@param superFunc any
---@param node any
function PlaceableProductionPoint:collectPickObjects(superFunc, node) end

--- Returns false with a warning text when productionChainManager has no free slot; otherwise returns the parent result.
---@param superFunc any
function PlaceableProductionPoint:canBuy(superFunc) end

--- Counts production points owned by the current farm and passes the count to g_achievementManager under NumProductionPoints. Note: it counts every owned placeable with this specialization, finalized or not.
function PlaceableProductionPoint:onBuy() end
