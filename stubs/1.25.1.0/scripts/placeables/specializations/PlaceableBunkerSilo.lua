---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableBunkerSilo.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that wraps a `BunkerSilo` object (loaded from `placeable.bunkerSilo`) and syncs it to joining clients. It also supports extendable silos that snap next to an existing silo of the same config and hide the shared walls, warns on sale when the silo is not empty, and clears the silo area when sold.
---@class PlaceableBunkerSilo
PlaceableBunkerSilo = {}

--- Always returns true: no prerequisite specializations.
---@param specializations table
---@return boolean
function PlaceableBunkerSilo.prerequisitesPresent(specializations) end

--- Subscribes to `onLoad`, `onDelete`, `onFinalizePlacement`, `onReadStream`, `onWriteStream` and `onSell`.
---@param placeableType any
function PlaceableBunkerSilo.registerEventListeners(placeableType) end

--- Registers `updateBunkerSiloWalls`, `setWallVisibility` and `getIsBunkerSiloExtendable`.
---@param placeableType any
function PlaceableBunkerSilo.registerFunctions(placeableType) end

--- Overrides the placement functions `getPlacementPosition`, `getPlacementRotation`, `getHasOverlap`, `startPlacementCheck`, plus `canBeSold` and `setOwnerFarmId`.
---@param placeableType any
function PlaceableBunkerSilo.registerOverwrittenFunctions(placeableType) end

--- Declares the `bunkerSilo` XML keys (delegating to `BunkerSilo`) and `isExtendable`, `siloToSiloDistance`, `snapDistance` (default 1.1 times the silo distance) and `sellWarningText`.
---@param schema any
---@param basePath any
function PlaceableBunkerSilo.registerXMLPaths(schema, basePath) end

--- Declares the savegame XML keys by delegating to `BunkerSilo.registerSavegameXMLPaths`.
---@param schema any
---@param basePath any
function PlaceableBunkerSilo.registerSavegameXMLPaths(schema, basePath) end

--- Creates and loads the `BunkerSilo` (deleting it on failure) and reads the extendable settings. If the silo is extendable but `siloToSiloDistance` is missing, logs an XML error and sets the loading state to ERROR.
---@param savegame table
function PlaceableBunkerSilo:onLoad(savegame) end

--- Restores the neighbour silos' walls, deletes the `BunkerSilo` and removes this placeable from the placeable system's bunker silo list.
function PlaceableBunkerSilo:onDelete() end

--- Hides the walls shared with neighbouring silos, registers the `BunkerSilo` network object with the owner farm id and adds the placeable to the system's bunker silo list.
function PlaceableBunkerSilo:onFinalizePlacement() end

--- Client side join: reads the bunker silo object id, reads its stream and finishes its registration.
---@param streamId any
---@param connection any
function PlaceableBunkerSilo:onReadStream(streamId, connection) end

--- Server side join: writes the bunker silo object id, its stream, and registers it in the connection's stream.
---@param streamId any
---@param connection any
function PlaceableBunkerSilo:onWriteStream(streamId, connection) end

--- Loads the savegame data through the `BunkerSilo` and returns its result.
---@param xmlFile any
---@param key any
function PlaceableBunkerSilo:loadFromXMLFile(xmlFile, key) end

--- Saves the `BunkerSilo` data to the savegame.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableBunkerSilo:saveToXMLFile(xmlFile, key, usedModNames) end

--- Forwards the left and right wall visibility flags to the `BunkerSilo`. Passing nil for a side leaves it unchanged (UNVERIFIED: depends on `BunkerSilo`).
---@param isLeftVisible any
---@param isRightVisible any
function PlaceableBunkerSilo:setWallVisibility(isLeftVisible, isRightVisible) end

--- Returns whether this silo is marked extendable in the XML.
function PlaceableBunkerSilo:getIsBunkerSiloExtendable() end

--- Finds extendable silos of the same config and farm within the silo spacing plus 0.5 m, and hides (or, when deleting, shows) their wall on the side facing this silo.
---@param isDeleting any
function PlaceableBunkerSilo:updateBunkerSiloWalls(isDeleting) end

--- Calls the parent, then propagates the new owner farm id to the `BunkerSilo` without sending an event.
---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceableBunkerSilo:setOwnerFarmId(superFunc, farmId, noEventSend) end

--- Calls `clearSiloArea` on the `BunkerSilo` when the placeable is sold.
function PlaceableBunkerSilo:onSell() end

--- Always allows the sale; returns the sell warning text as second value when the silo fill level is above zero, otherwise nil.
---@param superFunc any
function PlaceableBunkerSilo:canBeSold(superFunc) end

--- Runs the parent check, then for extendable silos finds the nearest owned silo of the same config within snap distance and stores it, with the side, as the snapping target.
---@param superFunc function
---@param x number?
---@param y number?
---@param z number?
---@param rotY number?
function PlaceableBunkerSilo:startPlacementCheck(superFunc, x, y, z, rotY) end

--- When a snapping silo is found, wraps the overlap check so that the snapping silo itself does not count as an obstruction, then calls the parent.
---@param superFunc any
---@param x any
---@param y any
---@param z any
---@param rotY any
---@param checkFunc any
function PlaceableBunkerSilo:getHasOverlap(superFunc, x, y, z, rotY, checkFunc) end

--- Returns the parent rotation, replaced by the snapping silo's Y orientation when snapping is active.
---@param superFunc any
---@param x any
---@param y any
---@param z any
function PlaceableBunkerSilo:getPlacementRotation(superFunc, x, y, z) end

--- Returns the parent position, replaced by a point offset by the silo spacing to the left or right of the snapping silo when snapping is active.
---@param superFunc any
---@param x any
---@param y any
---@param z any
function PlaceableBunkerSilo:getPlacementPosition(superFunc, x, y, z) end
