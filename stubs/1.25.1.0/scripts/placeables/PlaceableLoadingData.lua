---@meta
-- FS25 1.25.1.0 : placeables/PlaceableLoadingData.lua (generated stub, FS25 Lua Atlas)

--- Plain data holder that gathers everything needed to load one placeable: store item, owner farm, property state, configurations, savegame data, position and rotation, and custom parameters. Callers fill it through the setters and then call `load`, which registers a pending load with `g_currentMission.placeableSystem`. The actual loading method `loadPlaceable` is not defined in this file (UNVERIFIED where it comes from).
---@class PlaceableLoadingData
PlaceableLoadingData = {}

--- Creates a loading data object with defaults: owned, owner `AccessHandler.EVERYONE`, registered, saved, valid location, position and rotation zero, empty configuration tables.
---@param customMt any
---@return PlaceableLoadingData
function PlaceableLoadingData.new(customMt) end

--- Looks up the store item by XML filename and applies it with `setStoreItem`. If none is found, logs an error and prints the call stack.
---@param filename string
function PlaceableLoadingData:setFilename(filename) end

--- Stores the store item, sets the Y rotation from the item's rotation, records the XML filename to load, and marks the data valid when a placeable entry exists.
---@param storeItem table
function PlaceableLoadingData:setStoreItem(storeItem) end

--- Sets the property state the placeable will have after loading.
---@param propertyState integer
function PlaceableLoadingData:setPropertyState(propertyState) end

--- Sets the farm id that will own the placeable.
---@param ownerFarmId integer
function PlaceableLoadingData:setOwnerFarmId(ownerFarmId) end

--- Stores savegame data (xmlFile, key) and, if a store item is set, loads the saved configurations, bought configurations and configuration data from it, including the older `boughtConfiguration` entries.
---@param savegameData table
function PlaceableLoadingData:setSavegameData(savegameData) end

--- Sets the selected configurations table, or an empty table when nil.
---@param configurations table
function PlaceableLoadingData:setConfigurations(configurations) end

--- Sets the bought configurations table, or an empty table when nil.
---@param boughtConfigurations table
function PlaceableLoadingData:setBoughtConfigurations(boughtConfigurations) end

--- Sets the per-configuration data table (for example custom colors), or an empty table when nil.
---@param configurationData table
function PlaceableLoadingData:setConfigurationData(configurationData) end

--- Returns deep copies of configurations, bought configurations and configuration data. Drops configurations unknown to the target XML's store item and fills missing ones with the default config id.
---@param configFileName string
---@return table
---@return table
---@return table
function PlaceableLoadingData:getConfigurations(configFileName) end

--- Sets whether the placeable is registered after loading.
---@param isRegistered boolean
function PlaceableLoadingData:setIsRegistered(isRegistered) end

--- Sets whether the client also creates the placeable as a server-style placeable (for example with dynamic physics).
---@param forceServer boolean
function PlaceableLoadingData:setForceServer(forceServer) end

--- Sets whether the placeable is written to the savegame.
---@param isSaved boolean
function PlaceableLoadingData:setIsSaved(isSaved) end

--- Stores a custom named parameter that the placeable can read later.
---@param name string
---@param value any
function PlaceableLoadingData:setCustomParameter(name, value) end

--- Returns the custom parameter stored under the given name, or nil.
---@param name string
---@return any
function PlaceableLoadingData:getCustomParameter(name) end

--- Sets the world spawn position. If y is nil, the terrain height at x, z is used.
---@param x number
---@param y number
---@param z number
function PlaceableLoadingData:setPosition(x, y, z) end

--- Sets the world spawn rotation as three Euler angles.
---@param rx number
---@param ry number
---@param rz number
function PlaceableLoadingData:setRotation(rx, ry, rz) end

--- Copies position and rotation from the world transform of a node.
---@param node integer
function PlaceableLoadingData:setSpawnNode(node) end

--- Places the loaded placeable: returns false if the location is invalid or the savegame position is incomplete; returns true without moving it for preplaced ones; otherwise calls `setPose` with the savegame or stored values.
---@param placeable table
---@return boolean
function PlaceableLoadingData:applyPositionData(placeable) end

--- Starts loading: registers this data as a pending load in the placeable system, stores the optional callback, sets the state to OK and calls `loadPlaceable` (not defined in this file).
---@param callback function?
---@param callbackTarget table?
---@param callbackArguments table?
function PlaceableLoadingData:load(callback, callbackTarget, callbackArguments) end
