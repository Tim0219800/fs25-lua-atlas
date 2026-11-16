---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableBoatyard.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for the boatyard, a boat-building site driven by a state machine of `BoatyardState*` classes loaded from XML. It manages a spline the boat travels on, an unloading (selling) station and storage, a player trigger, and sailing boats that react to wind via the wind updater. Several of its registered functions have no body in the SDK dump (UNVERIFIED).
---@class PlaceableBoatyard
PlaceableBoatyard = {}

--- Always returns true: no prerequisite specializations.
---@param specializations table
---@return boolean
function PlaceableBoatyard.prerequisitesPresent(specializations) end

--- Registers 13 functions on the placeable type (boat loading, mesh progress, state and spline time handling, boat creation/release, wind values, fill level, player trigger, buy request). Their bodies are not in the dump: UNVERIFIED.
---@param placeableType any
function PlaceableBoatyard.registerFunctions(placeableType) end

--- Overrides `collectPickObjects`, `updateInfo` and `setOwnerFarmId`.
---@param placeableType any
function PlaceableBoatyard.registerOverwrittenFunctions(placeableType) end

--- Subscribes to `onLoad`, `onDelete`, `onUpdate` and the four network stream events.
---@param placeableType any
function PlaceableBoatyard.registerEventListeners(placeableType) end

--- Declares the `boatyard` XML keys: spline, link node, player trigger, boat file and reward, progressive-visibility meshes, state machine states/transitions (delegating to the `BoatyardState*` classes), sailing splines with bobbing and swaying values, selling station and storage.
---@param schema any
---@param basePath any
function PlaceableBoatyard.registerXMLPaths(schema, basePath) end

--- Declares the savegame keys `state#index` and `splineTime`, and delegates to `BoatyardStateBuilding` and `Storage`.
---@param schema any
---@param basePath any
function PlaceableBoatyard.registerSavegameXMLPaths(schema, basePath) end

--- Loads the spline, the boat I3D (asynchronously), the unloading station and storage, the player trigger, the XML-defined state machine with its transitions, the sailing splines, and registers as a wind-change listener. Logs XML errors for duplicate or unknown states or classes.
---@param savegame table
function PlaceableBoatyard:onLoad(savegame) end

--- Skips picking nodes that are the exact-fill root node of one of the unloading station's triggers; any other node goes to the parent implementation.
---@param superFunc any
---@param node any
function PlaceableBoatyard:collectPickObjects(superFunc, node) end

--- Saves the state index, spline time and the current state's data only when the state index is above 0, and always saves the storage.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableBoatyard:saveToXMLFile(xmlFile, key, usedModNames) end

--- Replays states from 0 up to the saved index through `setState`, restores the spline time, then loads the current state's data and the storage.
---@param xmlFile any
---@param key any
function PlaceableBoatyard:loadFromXMLFile(xmlFile, key) end

--- Client side join: reads and registers the unloading station and storage, replays states up to the received index, then reads spline time, mesh progress values and the next sailing spline index.
---@param streamId any
---@param connection any
function PlaceableBoatyard:onReadStream(streamId, connection) end

--- Server side join: writes the unloading station and storage, the state index and current state data, spline time, mesh progress values and the next sailing spline index (mirror of `onReadStream`).
---@param streamId any
---@param connection any
function PlaceableBoatyard:onWriteStream(streamId, connection) end

--- Calls the parent, then, when the owner is `AccessHandler.EVERYONE`, registers the unloading station as a selling station and storage unloading station, otherwise removes it. The player trigger is visible only when the owner is EVERYONE.
---@param superFunc any
---@param farmId any
function PlaceableBoatyard:setOwnerFarmId(superFunc, farmId) end
