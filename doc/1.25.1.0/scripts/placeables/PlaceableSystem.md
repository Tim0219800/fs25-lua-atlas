# placeables/PlaceableSystem.lua

*[Version française](../../fr/scripts/placeables/PlaceableSystem.md)*

Source: `dataS/scripts/placeables/PlaceableSystem.lua` — FS25 1.25.1.0

✍ Mission-level registry of all placeables, reached as `g_currentMission.placeableSystem`. It tracks placeables by unique id, pending loads, preplaced data, weather stations, farmhouses and bunker silos, saves and loads them from the savegame XML, publishes `PLACEABLE_ADDED` and `PLACEABLE_REMOVED` on the message center, and offers developer console commands when `g_addTestCommands` is set. It uses `PlaceableLoadingData` for each load. Several members used here (`readStreamPreplacedInfo`, `loadFromXMLFile`, `savePlaceableToXML`, `placeableByUniqueId` helpers) are not defined in this file (UNVERIFIED).

- **PlaceableSystem** (l.20)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableSystem.new(mission: table, customMt: table?) → PlaceableSystem` | 27 | ✍ Creates the system for a mission with empty lists. On the server (and in some cases on clients), registers the test console commands gsPlaceablesDeleteAll, gsPlaceablesReloadAll, gsPlaceablesLoadAll, gsPlaceablesPendingLoadings and gsPlaceableSystemDrawBoundary, only if `g_addTestCommands` is set. |
| `PlaceableSystem:delete()` | 90 | ✍ Shuts the system down: cancels pending loads, deletes queued and all existing placeables, frees the savegame XML, clears the lists and removes the console commands. |
| `PlaceableSystem:deleteAll()` | 128 | ✍ Deletes every placeable (last to first) and returns how many there were. |
| `PlaceableSystem:addPlaceable(placeable: any)` | 297 | ✍ Registers a placeable. Rejects non-placeables and duplicate unique ids; assigns a new unique id if it has none; publishes `PLACEABLE_ADDED`. |
| `PlaceableSystem:removePlaceable(placeable: any)` | 325 | ✍ Removes a placeable from the list and the unique id lookup, then publishes `PLACEABLE_REMOVED`. |
| `PlaceableSystem:addPendingPlaceableLoad(placeableLoadingData: any)` | 470 | ✍ Adds a loading data object to the list of loads in progress. |
| `PlaceableSystem:removePendingPlaceableLoad(placeableLoadingData: any)` | 476 | ✍ Removes a loading data object from the pending list. |
| `PlaceableSystem:canStartMission()` | 486 | ✍ Returns true only when every placeable reports synchronized and no loads are pending. |
| `PlaceableSystem:addWeatherStation(weatherStation: any)` | 502 | ✍ Registers a weather station placeable. |
| `PlaceableSystem:removeWeatherStation(weatherStation: any)` | 508 | ✍ Unregisters a weather station placeable. |
| `PlaceableSystem:addBunkerSilo(bunkerSilo: any)` | 514 | ✍ Registers a bunker silo. |
| `PlaceableSystem:removeBunkerSilo(bunkerSilo: any)` | 520 | ✍ Unregisters a bunker silo. |
| `PlaceableSystem:getBunkerSilos()` | 526 | ✍ Returns the list of registered bunker silos. |
| `PlaceableSystem:getExistingPlaceableByXMLFilename(xmlFilename: string, ownerFarmId: integer?, excludeBoughtWithFarmland: boolean?) → Placeable?` | 537 | ✍ Returns the first placeable not marked for deletion that was loaded from the given XML, optionally limited to an owner farm and optionally skipping those bought with farmland. Useful for singleton placeables. Returns nil if none. |
| `PlaceableSystem:getHasWeatherStation(farmId: any)` | 557 | ✍ Returns true if a weather station exists, optionally only one owned by the given farm id. |
| `PlaceableSystem:addFarmhouse(farmhouse: any)` | 569 | ✍ Registers a farmhouse placeable. |
| `PlaceableSystem:removeFarmhouse(farmhouse: any)` | 575 | ✍ Unregisters a farmhouse placeable. |
| `PlaceableSystem:getFarmhouse(farmId: any)` | 581 | ✍ Returns the first farmhouse, optionally the one owned by the given farm id, or nil. |
| `PlaceableSystem:save(xmlFilename: any, usedModNames: any)` | 604 | ✍ Creates a `placeables` XML file at the given path, writes all placeables into it with `saveToXML`, saves and closes it. |
| `PlaceableSystem:saveToXML(xmlFile: any, usedModNames: any, savePreplaced: any)` | 615 | ✍ Writes the system version, then (unless disabled) the preplaced entries with unique id, deleted and farmland flags and custom image, then every placeable that needs saving and is not preplaced. |
| `PlaceableSystem:loadPlaceableFromXML(xmlFile: any, key: any, defaultItemsToSPFarm: any, preplacedData: any, callback: any, callbackTarget: any, callbackArguments: any)` | 762 | ✍ Starts an async load of one placeable from a savegame entry if the default-property and mission rules allow it. Returns true when a load was queued, false (with XML log) when the filename or store item is missing. Increments `placeablesToLoad`, which this file never initializes (UNVERIFIED). |
| `PlaceableSystem:loadPlaceableFinished(placeable: any, loadingState: any, arguments: any)` | 832 | ✍ Callback for a finished load: collects successful placeables, keeps the first failing loading state, and when the counter reaches zero runs the async callback as a task with the loaded list and state. |
| `PlaceableSystem:consoleCommandDeleteAllPlaceables(includePreplaced: any)` | 873 | ✍ Console command: deletes all placeables, keeping preplaced ones unless the argument is given, and returns a result message. |
| `PlaceableSystem:consoleCommandReloadAllPlaceables()` | 894 | ✍ Console command, single player only: saves all non-preplaced placeables to a temporary XML, deletes them and reloads them from it to test changed XML/i3d files. Placeables that fail stay queued for a later retry. |
| `PlaceableSystem:consoleCommandLoadAllPlaceables(modsOnly: string?)` | 973 | ✍ Console command, single player only: loads every store placeable one after another at map position 0,0, finalizes and deletes each, logging failures. Argument modsOnly limits it to mods and DLC. |

## Messages

- publishes `MessageType.PLACEABLE_ADDED` (l.317)
- publishes `MessageType.PLACEABLE_REMOVED` (l.333)
