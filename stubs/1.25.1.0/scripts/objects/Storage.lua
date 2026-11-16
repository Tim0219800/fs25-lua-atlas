---@meta
-- FS25 1.25.1.0 : objects/Storage.lua (generated stub, FS25 Lua Atlas)

--- Generic multi-fill-type storage (silo, bunker, extension) extending Object. It tracks fill levels per fill type with optional per-type capacities, a shared total capacity or single-type mode, start levels, fill planes (static or dynamic) for visuals, daily upkeep costs, and server-to-client synchronization through a dirty flag with a configurable threshold. Unloading and loading stations register themselves with it, and other code can listen for fill level changes. Loaded from the owning placeable's XML.
---@class Storage : Object
Storage = {}

--- Registers the storage XML attributes: node, capacity, sync threshold, multiple fill types flag, upkeep cost, fill type lists or categories, extension flag, per-type capacities, start levels, fill planes and the dynamic fill plane.
---@param schema any
---@param basePath any
function Storage.registerXMLPaths(schema, basePath) end

--- Registers the savegame paths: owner `#farmId` and one `node(?)` entry per stored fill type with its name and level.
---@param schema any
---@param basePath any
function Storage.registerSavegameXMLPaths(schema, basePath) end

--- Constructor: builds the Object and initializes empty tables for unloading stations, loading stations and fill level listeners, plus rootNode 0 and `foreignSilo` false.
---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function Storage.new(isServer, isClient, customMt) end

--- Loads the storage from XML: accepted fill types from categories, names or per-type capacities (error and false if none), start levels with clamping rules, fill planes (custom class or `FillPlane`), the dynamic fill plane, extension flag and dirty flag. Subscribes to `FARM_DELETED`.
---@param components table
---@param xmlFile table
---@param key string
---@param i3dMappings table
---@param baseDirectory any
---@return boolean
function Storage:load(components, xmlFile, key, i3dMappings, baseDirectory) end

--- Unsubscribes from messages, deletes the fill planes, clears the station and listener tables, then calls the parent delete.
function Storage:delete() end

--- Client side initial sync: after the parent data, reads for each sorted fill type an optional Float32 level (preceded by a bool) and applies it with `setFillLevel`.
---@param streamId integer
---@param connection table
function Storage:readStream(streamId, connection) end

--- Server side initial sync: writes each fill level above zero as a bool plus Float32 and records it as last synced.
---@param streamId integer
---@param connection table
function Storage:writeStream(streamId, connection) end

--- Client side: if the server flagged a storage update, reads all fill levels in sorted fill type order and applies them with `setFillLevel`.
---@param streamId integer
---@param timestamp integer
---@param connection table
function Storage:readUpdateStream(streamId, timestamp, connection) end

--- Server side: when the storage dirty flag is set in the mask, writes all fill levels (bool plus Float32 when above zero) and records them as last synced.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Storage:writeUpdateStream(streamId, connection, dirtyMask) end

--- Loads from a savegame: restores the owner farm (default `AccessHandler.EVERYONE`), zeroes all levels, then sets each saved `node(i)` level for supported fill types, warning for unknown or unsupported ones. Returns true.
---@param xmlFile XMLFile
---@param key string
---@return boolean
function Storage:loadFromXMLFile(xmlFile, key) end

--- Saves the owner farm id and one `node(i)` entry for each fill type whose level is above zero.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Storage:saveToXMLFile(xmlFile, key, usedModNames) end

--- Sets every fill level to 0 directly, raising the dirty flag on the server for each. Does not notify listeners or update fill planes. Note: last-synced values are not reset here.
function Storage:empty() end

--- Sets each static fill plane's state to level divided by capacity for its fill type (1 if capacity is not positive).
function Storage:updateFillPlanes() end

--- Returns true if the fill type is in the accepted set.
---@param fillType integer
---@return boolean
function Storage:getIsFillTypeSupported(fillType) end

--- Returns the current level for a fill type, or 0 if unsupported.
---@param fillType integer
---@return number
function Storage:getFillLevel(fillType) end

--- Returns the internal table of fill levels indexed by fill type (not a copy).
function Storage:getFillLevels() end

--- Returns the custom capacity of the fill type, or the storage's general capacity if none is defined.
---@param fillType any
function Storage:getCapacity(fillType) end

--- Clamps and sets the level of a fill type. On change it notifies listeners (when the change exceeds 0.1 or the rounded value changed), raises the server dirty flag at threshold, empty or full, updates fill planes, and adds or removes material on the dynamic fill plane using the optional `fillInfo` area.
---@param fillLevel number
---@param fillType integer
---@param fillInfo table
function Storage:setFillLevel(fillLevel, fillType, fillInfo) end

--- Returns the remaining room for a fill type: 0 if unsupported; per-type or shared total capacity in multi-type mode; in single-type mode 0 when another type is already stored.
---@param fillType integer
---@return number
function Storage:getFreeCapacity(fillType) end

--- Returns the internal set of accepted fill types (keys are fill type indices).
function Storage:getSupportedFillTypes() end

--- Server only: charges the owner farm hourly upkeep (cost per level and day divided by 24, times the economy cost multiplier) over all stored levels, as property maintenance.
function Storage:hourChanged() end

--- Registers an unloading station that uses this storage.
---@param station any
function Storage:addUnloadingStation(station) end

--- Unregisters an unloading station from this storage.
---@param station any
function Storage:removeUnloadingStation(station) end

--- Registers a loading station that uses this storage.
---@param loadingStation any
function Storage:addLoadingStation(loadingStation) end

--- Unregisters a loading station from this storage.
---@param loadingStation any
function Storage:removeLoadingStation(loadingStation) end

--- Message handler for farm deletion: if the deleted farm owns this storage, sets all accepted fill types to 0.
---@param farmId any
function Storage:farmDestroyed(farmId) end

--- Adds a callback called as `func(fillType, delta)` when a level changes.
---@param func any
function Storage:addFillLevelChangedListeners(func) end

--- Removes a previously added fill level change callback.
---@param func any
function Storage:removeFillLevelChangedListeners(func) end

--- Debug rendering: shows a table of fill levels and capacities near the storage node, added as a frame element to the debug manager.
function Storage:draw() end
