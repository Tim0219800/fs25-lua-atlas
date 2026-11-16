---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableConstructible.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for buildings erected in stages by a state machine of `ConstructibleState` classes (building, finalize, etc.) defined in the XML, with named states, transitions, a start state and a preview state. It owns a selling (unloading) station and a storage that receive construction materials, syncs the current state to joining clients, and saves the state name. Several registered functions (`setConstructibleState`, `finalizeConstruction`, `getConstructibleFillLevel`, etc.) have no body in the dump: UNVERIFIED.
---@class PlaceableConstructible
PlaceableConstructible = {}

--- Always returns true: no prerequisite specializations.
---@param specializations table
---@return boolean
function PlaceableConstructible.prerequisitesPresent(specializations) end

--- Registers 13 functions: state setting and lookup, finalize, fill level and fill type support, preview state, reset, a console command to finish a state and its removal, finished-state count and progress info. Their bodies are not in the dump: UNVERIFIED.
---@param placeableType any
function PlaceableConstructible.registerFunctions(placeableType) end

--- Overrides `collectPickObjects`, `updateInfo` and `setOwnerFarmId`. Only `collectPickObjects` has a body in the dump.
---@param placeableType any
function PlaceableConstructible.registerOverwrittenFunctions(placeableType) end

--- Subscribes to `onLoad`, `onFinalizePlacement`, `onDelete`, `onUpdate`, the four network stream events, and the info trigger enter/leave events.
---@param placeableType any
function PlaceableConstructible.registerEventListeners(placeableType) end

--- Declares the `constructible` keys: state definitions (`name`, `class`, `isStartState`, `isPreviewState` plus the `ConstructibleState*` keys), transitions (`from`/`to`), selling station and storage.
---@param schema any
---@param basePath any
function PlaceableConstructible.registerXMLPaths(schema, basePath) end

--- Declares the savegame keys `state#index`, `state#name`, and delegates to `ConstructibleStateBuilding` and `Storage`.
---@param schema any
---@param basePath any
function PlaceableConstructible.registerSavegameXMLPaths(schema, basePath) end

--- Creates the unloading station and storage and registers them with the storage and economy systems, then builds the state machine from the XML (up to 255 states, state classes must derive from `ConstructibleState`, dirty flags are shared round-robin over 10 flags) and its transitions. Applies the preview state when the placeable is in construction preview.
---@param savegame table
function PlaceableConstructible:onLoad(savegame) end

--- Sets the owner farm on the station and storage. On the server it replays states from 1 up to the loaded (or start) state, runs the pending post-finalize load step and keeps itself active.
---@param savegame any
function PlaceableConstructible:onFinalizePlacement(savegame) end

--- Removes the finish-state console command, unsubscribes from messages, unregisters and deletes the unloading station, deletes the storage and every state.
function PlaceableConstructible:onDelete() end

--- Skips picking nodes that are the exact-fill root node of one of the unloading triggers; other nodes go to the parent implementation.
---@param superFunc any
---@param node any
function PlaceableConstructible:collectPickObjects(superFunc, node) end

--- Saves the current state name and its own data, then the storage.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableConstructible:saveToXMLFile(xmlFile, key, usedModNames) end

--- Reads the saved state name into a pending state index (falling back to 1), schedules the state's own data to load after finalization (so physics is not overwritten), and loads the storage.
---@param xmlFile any
---@param key any
function PlaceableConstructible:loadFromXMLFile(xmlFile, key) end

--- Client side join: reads and registers the unloading station and storage, then, if a state was sent, replays states up to that index and reads the state's stream data.
---@param streamId any
---@param connection any
function PlaceableConstructible:onReadStream(streamId, connection) end

--- Server side join: writes the station and storage, then a flag telling whether a state exists, followed by the state index and its stream data.
---@param streamId any
---@param connection any
function PlaceableConstructible:onWriteStream(streamId, connection) end

--- Store spec loader: if the XML has a `constructible` section, adds every fill type named by a state's `input` entry to the result table (keyed by name) and returns it.
---@param xmlFile XMLFile
---@param customEnvironment string?
---@param baseDir string?
---@param resultTable table?
---@return table?
function PlaceableConstructible.loadSpecValueFillTypes(xmlFile, customEnvironment, baseDir, resultTable) end
