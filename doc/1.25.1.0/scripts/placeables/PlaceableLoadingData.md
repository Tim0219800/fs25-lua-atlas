# placeables/PlaceableLoadingData.lua

*[Version française](../../fr/scripts/placeables/PlaceableLoadingData.md)*

Source: `dataS/scripts/placeables/PlaceableLoadingData.lua` — FS25 1.25.1.0

✍ Plain data holder that gathers everything needed to load one placeable: store item, owner farm, property state, configurations, savegame data, position and rotation, and custom parameters. Callers fill it through the setters and then call `load`, which registers a pending load with `g_currentMission.placeableSystem`. The actual loading method `loadPlaceable` is not defined in this file (UNVERIFIED where it comes from).

- **PlaceableLoadingData** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableLoadingData.new(customMt: any) → PlaceableLoadingData` | 17 | ✍ Creates a loading data object with defaults: owned, owner `AccessHandler.EVERYONE`, registered, saved, valid location, position and rotation zero, empty configuration tables. |
| `PlaceableLoadingData:setFilename(filename: string)` | 55 | ✍ Looks up the store item by XML filename and applies it with `setStoreItem`. If none is found, logs an error and prints the call stack. |
| `PlaceableLoadingData:setStoreItem(storeItem: table)` | 68 | ✍ Stores the store item, sets the Y rotation from the item's rotation, records the XML filename to load, and marks the data valid when a placeable entry exists. |
| `PlaceableLoadingData:setPropertyState(propertyState: integer)` | 84 | ✍ Sets the property state the placeable will have after loading. |
| `PlaceableLoadingData:setOwnerFarmId(ownerFarmId: integer)` | 91 | ✍ Sets the farm id that will own the placeable. |
| `PlaceableLoadingData:setSavegameData(savegameData: table)` | 98 | ✍ Stores savegame data (xmlFile, key) and, if a store item is set, loads the saved configurations, bought configurations and configuration data from it, including the older `boughtConfiguration` entries. |
| `PlaceableLoadingData:setConfigurations(configurations: table)` | 146 | ✍ Sets the selected configurations table, or an empty table when nil. |
| `PlaceableLoadingData:setBoughtConfigurations(boughtConfigurations: table)` | 157 | ✍ Sets the bought configurations table, or an empty table when nil. |
| `PlaceableLoadingData:setConfigurationData(configurationData: table)` | 168 | ✍ Sets the per-configuration data table (for example custom colors), or an empty table when nil. |
| `PlaceableLoadingData:getConfigurations(configFileName: string) → table, table, table` | 182 | ✍ Returns deep copies of configurations, bought configurations and configuration data. Drops configurations unknown to the target XML's store item and fills missing ones with the default config id. |
| `PlaceableLoadingData:setIsRegistered(isRegistered: boolean)` | 212 | ✍ Sets whether the placeable is registered after loading. |
| `PlaceableLoadingData:setForceServer(forceServer: boolean)` | 219 | ✍ Sets whether the client also creates the placeable as a server-style placeable (for example with dynamic physics). |
| `PlaceableLoadingData:setIsSaved(isSaved: boolean)` | 226 | ✍ Sets whether the placeable is written to the savegame. |
| `PlaceableLoadingData:setCustomParameter(name: string, value: any)` | 234 | ✍ Stores a custom named parameter that the placeable can read later. |
| `PlaceableLoadingData:getCustomParameter(name: string) → any` | 242 | ✍ Returns the custom parameter stored under the given name, or nil. |
| `PlaceableLoadingData:setPosition(x: number, y: number, z: number)` | 251 | ✍ Sets the world spawn position. If y is nil, the terrain height at x, z is used. |
| `PlaceableLoadingData:setRotation(rx: number, ry: number, rz: number)` | 264 | ✍ Sets the world spawn rotation as three Euler angles. |
| `PlaceableLoadingData:setSpawnNode(node: integer)` | 271 | ✍ Copies position and rotation from the world transform of a node. |
| `PlaceableLoadingData:applyPositionData(placeable: table) → boolean` | 281 | ✍ Places the loaded placeable: returns false if the location is invalid or the savegame position is incomplete; returns true without moving it for preplaced ones; otherwise calls `setPose` with the savegame or stored values. |
| `PlaceableLoadingData:load(callback: function?, callbackTarget: table?, callbackArguments: table?)` | 315 | ✍ Starts loading: registers this data as a pending load in the placeable system, stores the optional callback, sets the state to OK and calls `loadPlaceable` (not defined in this file). |
