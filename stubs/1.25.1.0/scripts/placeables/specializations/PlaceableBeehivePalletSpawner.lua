---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableBeehivePalletSpawner.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for the farm's honey pallet location. It wraps a `PalletSpawner`, accumulates honey liters on the server and spawns or refills a HONEY pallet once enough is pending, and syncs a 'too many pallets' flag to clients. It registers itself with `beehiveSystem`, and only one may be bought per farm.
---@class PlaceableBeehivePalletSpawner
PlaceableBeehivePalletSpawner = {}

--- Always returns true: no prerequisite specializations.
---@param specializations table
---@return boolean
function PlaceableBeehivePalletSpawner.prerequisitesPresent(specializations) end

--- Registers `addFillLevel`, `updatePallets` and `getPalletCallback` on the placeable type.
---@param placeableType any
function PlaceableBeehivePalletSpawner.registerFunctions(placeableType) end

--- Overrides `canBuy` and `updateInfo`.
---@param placeableType any
function PlaceableBeehivePalletSpawner.registerOverwrittenFunctions(placeableType) end

--- Subscribes to `onLoad`, `onDelete`, `onFinalizePlacement` and the four network stream events (read/write stream and update stream).
---@param placeableType any
function PlaceableBeehivePalletSpawner.registerEventListeners(placeableType) end

--- Declares the pallet spawner XML keys under `beehivePalletSpawner` by delegating to `PalletSpawner.registerXMLPaths`.
---@param schema any
---@param basePath any
function PlaceableBeehivePalletSpawner.registerXMLPaths(schema, basePath) end

--- Declares the savegame key `beehivePalletSpawner#pendingLiters`.
---@param schema any
---@param basePath any
function PlaceableBeehivePalletSpawner.registerSavegameXMLPaths(schema, basePath) end

--- Creates and loads the `PalletSpawner`; on failure logs an XML error and sets the loading state to ERROR. Also initializes pending liters, flags, the HONEY fill type and a dirty flag.
---@param savegame table
function PlaceableBeehivePalletSpawner:onLoad(savegame) end

--- Deletes the pallet spawner (if loaded) and unregisters this spawner from `beehiveSystem`.
function PlaceableBeehivePalletSpawner:onDelete() end

--- Registers this pallet spawner with `beehiveSystem`.
function PlaceableBeehivePalletSpawner:onFinalizePlacement() end

--- Client side: reads the pallet limit flag from the initial join stream.
---@param streamId any
---@param connection any
function PlaceableBeehivePalletSpawner:onReadStream(streamId, connection) end

--- Server side: writes the pallet limit flag to the initial join stream.
---@param streamId any
---@param connection any
function PlaceableBeehivePalletSpawner:onWriteStream(streamId, connection) end

--- Client side: reads the pallet limit flag from an update stream. The flag is read unconditionally, without a dirty mask check.
---@param streamId any
---@param timestamp any
---@param connection any
function PlaceableBeehivePalletSpawner:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: writes the pallet limit flag to an update stream, without testing the dirty mask.
---@param streamId any
---@param connection any
---@param dirtyMask any
function PlaceableBeehivePalletSpawner:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Restores the pending honey liters from the savegame, keeping the current value if absent.
---@param xmlFile any
---@param key any
function PlaceableBeehivePalletSpawner:loadFromXMLFile(xmlFile, key) end

--- Saves the pending liters to the savegame, only when greater than zero.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableBeehivePalletSpawner:saveToXMLFile(xmlFile, key, usedModNames) end

--- Server only: adds the given liters to the pending honey amount; ignored when nil.
---@param fillLevel any
function PlaceableBeehivePalletSpawner:addFillLevel(fillLevel) end

--- Server only: when more than 10 liters are pending and no spawn is in progress, asks the pallet spawner for a pallet, with `getPalletCallback` as callback.
function PlaceableBeehivePalletSpawner:updatePallets() end

--- Spawn result handler: for a new pallet it empties it, then fills it with the pending liters and subtracts what fit. On a pallet limit it sets the synced limit flag; on no space nothing happens (a TODO in code).
---@param pallet any
---@param result any
---@param fillTypeIndex any
function PlaceableBeehivePalletSpawner:getPalletCallback(pallet, result, fillTypeIndex) end

--- Calls the parent `updateInfo`, then adds a 'too many pallets' line when the pallet limit flag is set.
---@param superFunc any
---@param infoTable any
function PlaceableBeehivePalletSpawner:updateInfo(superFunc, infoTable) end

--- Extends the parent check: refuses the purchase with a one-per-farm warning if the local farm already has a beehive pallet spawner.
---@param superFunc any
function PlaceableBeehivePalletSpawner:canBuy(superFunc) end
