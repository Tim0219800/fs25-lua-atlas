---@meta
-- FS25 1.25.1.0 : vehicles/VehicleLoadingData.lua (generated stub, FS25 Lua Atlas)

--- Collects everything needed to load a vehicle (or a bundle of vehicles) from a store item: configurations, owner, property state, spawn position/rotation, savegame data, flags such as registered, saved, added to physics and force-server. `load` starts loading through `g_currentMission.vehicleSystem` and `g_vehicleTypeManager`. Note: the SDK dump omits parts of this class (e.g. `loadVehicle`, `resetVehiclePosition`, `getPositionAndRotation` are called but not present), so loading internals are UNVERIFIED.
---@class VehicleLoadingData
VehicleLoadingData = {}

--- Creates a loading-data object with defaults: invalid until a store item is set, owned property state, owner `AccessHandler.EVERYONE`, registered, saved, added to physics, centred on spawn position, position and rotation zero.
---@param customMt any
---@return VehicleLoadingData
function VehicleLoadingData.new(customMt) end

--- Finds the store item by XML filename in `g_storeManager` and sets it; logs an error with callstack if none exists.
---@param filename string
function VehicleLoadingData:setFilename(filename) end

--- Sets the store item, takes its Y rotation, and builds the vehicle list: one entry per bundle item (with offsets) for a bundle, otherwise the item itself. `isValid` becomes true if the list is non-empty.
---@param storeItem table
function VehicleLoadingData:setStoreItem(storeItem) end

--- Sets the vehicle property state (a `VehiclePropertyState` value, owned by default).
---@param propertyState integer
function VehicleLoadingData:setPropertyState(propertyState) end

--- Sets the farm id that will own the loaded vehicle.
---@param ownerFarmId integer
function VehicleLoadingData:setOwnerFarmId(ownerFarmId) end

--- Stores the sale item and merges its bought configurations into this object's own table.
---@param saleItem table
function VehicleLoadingData:setSaleItem(saleItem) end

--- Stores savegame data (expects `xmlFile`, `key`, and optional `resetVehicles`, `keepPosition`, `useNewPosition`). If a store item is set, loads configurations from the savegame, plus legacy `boughtConfiguration` entries (warning on invalid ones).
---@param savegameData table
function VehicleLoadingData:setSavegameData(savegameData) end

--- Sets the configuration table (id per configuration name); nil resets to an empty table.
---@param configurations table
function VehicleLoadingData:setConfigurations(configurations) end

--- Sets the bought-configurations table; nil resets to an empty table.
---@param boughtConfigurations table
function VehicleLoadingData:setBoughtConfigurations(boughtConfigurations) end

--- Sets the extra configuration data table; nil resets to an empty table.
---@param configurationData table
function VehicleLoadingData:setConfigurationData(configurationData) end

--- Returns deep copies of configurations, bought configurations and configuration data for one config file. For a bundle item other than the main one, drops configs it does not offer, fills defaults and applies dependent configurations.
---@param configFileName string
---@return table
---@return table
---@return table
function VehicleLoadingData:getConfigurations(configFileName) end

--- Sets whether the vehicle is registered in the game after loading.
---@param isRegistered boolean
function VehicleLoadingData:setIsRegistered(isRegistered) end

--- Sets whether the vehicle is created with server-side behaviour (e.g. dynamic physics) even on a client.
---@param forceServer boolean
function VehicleLoadingData:setForceServer(forceServer) end

--- Sets whether the vehicle is written to the savegame.
---@param isSaved boolean
function VehicleLoadingData:setIsSaved(isSaved) end

--- Sets whether the vehicle is added to the physics world when loaded.
---@param addToPhysics boolean
function VehicleLoadingData:setAddToPhysics(addToPhysics) end

--- Stores a named custom value that the loaded vehicle can read later.
---@param name string
---@param value any
function VehicleLoadingData:setCustomParameter(name, value) end

--- Returns the custom parameter stored under the given name, or nil.
---@param name string
---@return any
function VehicleLoadingData:getCustomParameter(name) end

--- Sets the world spawn position. If `y` is nil, uses the terrain height at x/z plus an optional offset.
---@param x number
---@param y number
---@param z number
---@param terrainOffset number
function VehicleLoadingData:setPosition(x, y, z, terrainOffset) end

--- Sets the world spawn rotation (rx, ry, rz).
---@param rx number
---@param ry number
---@param rz number
function VehicleLoadingData:setRotation(rx, ry, rz) end

--- Copies world translation and rotation from a scene node as the spawn pose.
---@param node integer
function VehicleLoadingData:setSpawnNode(node) end

--- Sets whether the shop translation/rotation offset from the XML is ignored when positioning.
---@param ignoreShopOffset boolean
function VehicleLoadingData:setIgnoreShopOffset(ignoreShopOffset) end

--- Records world translation and rotation of every component of an existing vehicle so they can be re-applied to the newly loaded one.
---@param vehicle table
function VehicleLoadingData:setComponentPositionData(vehicle) end

--- Places a loaded vehicle: returns false if the spawn place was invalid. Uses recorded component data, else savegame component positions (falling back to `resetVehiclePosition` on invalid, missing or reset data), else the default store position. Returns true on success.
---@param vehicle table
---@return boolean
function VehicleLoadingData:applyPositionData(vehicle) end

--- Picks a free spot among shop spawn places for the store item (size from `StoreItemUtil`, with minimum dimensions and offsets) and sets position and rotation. Returns false and marks the location invalid if none fits; requires the store item to be set first.
---@param places table
---@param usedPlaces table
---@param spawnOffset number?
---@param ignoreMinSpawnItemSize boolean?
function VehicleLoadingData:setLoadingPlace(places, usedPlaces, spawnOffset, ignoreMinSpawnItemSize) end

--- Starts loading all vehicles of the item: registers a pending load on `vehicleSystem`, resolves each vehicle type/class, and aborts with `VehicleLoadingState.ERROR` (calling the callback) if one is missing. Otherwise calls `loadVehicle` for each (not in this dump, UNVERIFIED).
---@param callback function?
---@param callbackTarget table?
---@param callbackArguments table?
function VehicleLoadingData:load(callback, callbackTarget, callbackArguments) end
