---@meta
-- FS25 1.25.1.0 : placeables/PlaceableSystem.lua (generated stub, FS25 Lua Atlas)

--- Mission-level registry of all placeables, reached as `g_currentMission.placeableSystem`. It tracks placeables by unique id, pending loads, preplaced data, weather stations, farmhouses and bunker silos, saves and loads them from the savegame XML, publishes `PLACEABLE_ADDED` and `PLACEABLE_REMOVED` on the message center, and offers developer console commands when `g_addTestCommands` is set. It uses `PlaceableLoadingData` for each load. Several members used here (`readStreamPreplacedInfo`, `loadFromXMLFile`, `savePlaceableToXML`, `placeableByUniqueId` helpers) are not defined in this file (UNVERIFIED).
---@class PlaceableSystem
PlaceableSystem = {}

--- Creates the system for a mission with empty lists. On the server (and in some cases on clients), registers the test console commands gsPlaceablesDeleteAll, gsPlaceablesReloadAll, gsPlaceablesLoadAll, gsPlaceablesPendingLoadings and gsPlaceableSystemDrawBoundary, only if `g_addTestCommands` is set.
---@param mission table
---@param customMt table?
---@return PlaceableSystem
function PlaceableSystem.new(mission, customMt) end

--- Shuts the system down: cancels pending loads, deletes queued and all existing placeables, frees the savegame XML, clears the lists and removes the console commands.
function PlaceableSystem:delete() end

--- Deletes every placeable (last to first) and returns how many there were.
function PlaceableSystem:deleteAll() end

--- Registers a placeable. Rejects non-placeables and duplicate unique ids; assigns a new unique id if it has none; publishes `PLACEABLE_ADDED`.
---@param placeable any
function PlaceableSystem:addPlaceable(placeable) end

--- Removes a placeable from the list and the unique id lookup, then publishes `PLACEABLE_REMOVED`.
---@param placeable any
function PlaceableSystem:removePlaceable(placeable) end

--- Adds a loading data object to the list of loads in progress.
---@param placeableLoadingData any
function PlaceableSystem:addPendingPlaceableLoad(placeableLoadingData) end

--- Removes a loading data object from the pending list.
---@param placeableLoadingData any
function PlaceableSystem:removePendingPlaceableLoad(placeableLoadingData) end

--- Returns true only when every placeable reports synchronized and no loads are pending.
function PlaceableSystem:canStartMission() end

--- Registers a weather station placeable.
---@param weatherStation any
function PlaceableSystem:addWeatherStation(weatherStation) end

--- Unregisters a weather station placeable.
---@param weatherStation any
function PlaceableSystem:removeWeatherStation(weatherStation) end

--- Registers a bunker silo.
---@param bunkerSilo any
function PlaceableSystem:addBunkerSilo(bunkerSilo) end

--- Unregisters a bunker silo.
---@param bunkerSilo any
function PlaceableSystem:removeBunkerSilo(bunkerSilo) end

--- Returns the list of registered bunker silos.
function PlaceableSystem:getBunkerSilos() end

--- Returns the first placeable not marked for deletion that was loaded from the given XML, optionally limited to an owner farm and optionally skipping those bought with farmland. Useful for singleton placeables. Returns nil if none.
---@param xmlFilename string
---@param ownerFarmId integer?
---@param excludeBoughtWithFarmland boolean?
---@return Placeable?
function PlaceableSystem:getExistingPlaceableByXMLFilename(xmlFilename, ownerFarmId, excludeBoughtWithFarmland) end

--- Returns true if a weather station exists, optionally only one owned by the given farm id.
---@param farmId any
function PlaceableSystem:getHasWeatherStation(farmId) end

--- Registers a farmhouse placeable.
---@param farmhouse any
function PlaceableSystem:addFarmhouse(farmhouse) end

--- Unregisters a farmhouse placeable.
---@param farmhouse any
function PlaceableSystem:removeFarmhouse(farmhouse) end

--- Returns the first farmhouse, optionally the one owned by the given farm id, or nil.
---@param farmId any
function PlaceableSystem:getFarmhouse(farmId) end

--- Creates a `placeables` XML file at the given path, writes all placeables into it with `saveToXML`, saves and closes it.
---@param xmlFilename any
---@param usedModNames any
function PlaceableSystem:save(xmlFilename, usedModNames) end

--- Writes the system version, then (unless disabled) the preplaced entries with unique id, deleted and farmland flags and custom image, then every placeable that needs saving and is not preplaced.
---@param xmlFile any
---@param usedModNames any
---@param savePreplaced any
function PlaceableSystem:saveToXML(xmlFile, usedModNames, savePreplaced) end

--- Starts an async load of one placeable from a savegame entry if the default-property and mission rules allow it. Returns true when a load was queued, false (with XML log) when the filename or store item is missing. Increments `placeablesToLoad`, which this file never initializes (UNVERIFIED).
---@param xmlFile any
---@param key any
---@param defaultItemsToSPFarm any
---@param preplacedData any
---@param callback any
---@param callbackTarget any
---@param callbackArguments any
function PlaceableSystem:loadPlaceableFromXML(xmlFile, key, defaultItemsToSPFarm, preplacedData, callback, callbackTarget, callbackArguments) end

--- Callback for a finished load: collects successful placeables, keeps the first failing loading state, and when the counter reaches zero runs the async callback as a task with the loaded list and state.
---@param placeable any
---@param loadingState any
---@param arguments any
function PlaceableSystem:loadPlaceableFinished(placeable, loadingState, arguments) end

--- Console command: deletes all placeables, keeping preplaced ones unless the argument is given, and returns a result message.
---@param includePreplaced any
function PlaceableSystem:consoleCommandDeleteAllPlaceables(includePreplaced) end

--- Console command, single player only: saves all non-preplaced placeables to a temporary XML, deletes them and reloads them from it to test changed XML/i3d files. Placeables that fail stay queued for a later retry.
function PlaceableSystem:consoleCommandReloadAllPlaceables() end

--- Console command, single player only: loads every store placeable one after another at map position 0,0, finalizes and deletes each, logging failures. Argument modsOnly limits it to mods and DLC.
---@param modsOnly string?
function PlaceableSystem:consoleCommandLoadAllPlaceables(modsOnly) end
