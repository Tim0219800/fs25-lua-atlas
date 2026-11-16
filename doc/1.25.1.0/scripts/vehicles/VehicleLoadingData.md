# vehicles/VehicleLoadingData.lua

*[Version française](../../fr/scripts/vehicles/VehicleLoadingData.md)*

Source: `dataS/scripts/vehicles/VehicleLoadingData.lua` — FS25 1.25.1.0

✍ Collects everything needed to load a vehicle (or a bundle of vehicles) from a store item: configurations, owner, property state, spawn position/rotation, savegame data, flags such as registered, saved, added to physics and force-server. `load` starts loading through `g_currentMission.vehicleSystem` and `g_vehicleTypeManager`. Note: the SDK dump omits parts of this class (e.g. `loadVehicle`, `resetVehiclePosition`, `getPositionAndRotation` are called but not present), so loading internals are UNVERIFIED.

- **VehicleLoadingData** (l.21)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleLoadingData.new(customMt: any) → VehicleLoadingData` | 26 | ✍ Creates a loading-data object with defaults: invalid until a store item is set, owned property state, owner `AccessHandler.EVERYONE`, registered, saved, added to physics, centred on spawn position, position and rotation zero. |
| `VehicleLoadingData:setFilename(filename: string)` | 71 | ✍ Finds the store item by XML filename in `g_storeManager` and sets it; logs an error with callstack if none exists. |
| `VehicleLoadingData:setStoreItem(storeItem: table)` | 84 | ✍ Sets the store item, takes its Y rotation, and builds the vehicle list: one entry per bundle item (with offsets) for a bundle, otherwise the item itself. `isValid` becomes true if the list is non-empty. |
| `VehicleLoadingData:setPropertyState(propertyState: integer)` | 107 | ✍ Sets the vehicle property state (a `VehiclePropertyState` value, owned by default). |
| `VehicleLoadingData:setOwnerFarmId(ownerFarmId: integer)` | 114 | ✍ Sets the farm id that will own the loaded vehicle. |
| `VehicleLoadingData:setSaleItem(saleItem: table)` | 121 | ✍ Stores the sale item and merges its bought configurations into this object's own table. |
| `VehicleLoadingData:setSavegameData(savegameData: table)` | 140 | ✍ Stores savegame data (expects `xmlFile`, `key`, and optional `resetVehicles`, `keepPosition`, `useNewPosition`). If a store item is set, loads configurations from the savegame, plus legacy `boughtConfiguration` entries (warning on invalid ones). |
| `VehicleLoadingData:setConfigurations(configurations: table)` | 172 | ✍ Sets the configuration table (id per configuration name); nil resets to an empty table. |
| `VehicleLoadingData:setBoughtConfigurations(boughtConfigurations: table)` | 183 | ✍ Sets the bought-configurations table; nil resets to an empty table. |
| `VehicleLoadingData:setConfigurationData(configurationData: table)` | 194 | ✍ Sets the extra configuration data table; nil resets to an empty table. |
| `VehicleLoadingData:getConfigurations(configFileName: string) → table, table, table` | 208 | ✍ Returns deep copies of configurations, bought configurations and configuration data for one config file. For a bundle item other than the main one, drops configs it does not offer, fills defaults and applies dependent configurations. |
| `VehicleLoadingData:setIsRegistered(isRegistered: boolean)` | 264 | ✍ Sets whether the vehicle is registered in the game after loading. |
| `VehicleLoadingData:setForceServer(forceServer: boolean)` | 271 | ✍ Sets whether the vehicle is created with server-side behaviour (e.g. dynamic physics) even on a client. |
| `VehicleLoadingData:setIsSaved(isSaved: boolean)` | 278 | ✍ Sets whether the vehicle is written to the savegame. |
| `VehicleLoadingData:setAddToPhysics(addToPhysics: boolean)` | 285 | ✍ Sets whether the vehicle is added to the physics world when loaded. |
| `VehicleLoadingData:setCustomParameter(name: string, value: any)` | 293 | ✍ Stores a named custom value that the loaded vehicle can read later. |
| `VehicleLoadingData:getCustomParameter(name: string) → any` | 301 | ✍ Returns the custom parameter stored under the given name, or nil. |
| `VehicleLoadingData:setPosition(x: number, y: number, z: number, terrainOffset: number)` | 311 | ✍ Sets the world spawn position. If `y` is nil, uses the terrain height at x/z plus an optional offset. |
| `VehicleLoadingData:setRotation(rx: number, ry: number, rz: number)` | 324 | ✍ Sets the world spawn rotation (rx, ry, rz). |
| `VehicleLoadingData:setSpawnNode(node: integer)` | 331 | ✍ Copies world translation and rotation from a scene node as the spawn pose. |
| `VehicleLoadingData:setIgnoreShopOffset(ignoreShopOffset: boolean)` | 339 | ✍ Sets whether the shop translation/rotation offset from the XML is ignored when positioning. |
| `VehicleLoadingData:setComponentPositionData(vehicle: table)` | 346 | ✍ Records world translation and rotation of every component of an existing vehicle so they can be re-applied to the newly loaded one. |
| `VehicleLoadingData:applyPositionData(vehicle: table) → boolean` | 358 | ✍ Places a loaded vehicle: returns false if the spawn place was invalid. Uses recorded component data, else savegame component positions (falling back to `resetVehiclePosition` on invalid, missing or reset data), else the default store position. Returns true on success. |
| `VehicleLoadingData:setLoadingPlace(places: table, usedPlaces: table, spawnOffset: number?, ignoreMinSpawnItemSize: boolean?)` | 507 | ✍ Picks a free spot among shop spawn places for the store item (size from `StoreItemUtil`, with minimum dimensions and offsets) and sets position and rotation. Returns false and marks the location invalid if none fits; requires the store item to be set first. |
| `VehicleLoadingData:load(callback: function?, callbackTarget: table?, callbackArguments: table?)` | 560 | ✍ Starts loading all vehicles of the item: registers a pending load on `vehicleSystem`, resolves each vehicle type/class, and aborts with `VehicleLoadingState.ERROR` (calling the callback) if one is missing. Otherwise calls `loadVehicle` for each (not in this dump, UNVERIFIED). |
