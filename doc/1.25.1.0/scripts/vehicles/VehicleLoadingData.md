# vehicles/VehicleLoadingData.lua

Source: `dataS/scripts/vehicles/VehicleLoadingData.lua` — FS25 1.25.1.0

- **VehicleLoadingData** (l.21)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `VehicleLoadingData.new(customMt: any) → VehicleLoadingData` | 26 |  |
| `VehicleLoadingData:setFilename(filename: string)` | 71 |  |
| `VehicleLoadingData:setStoreItem(storeItem: table)` | 84 |  |
| `VehicleLoadingData:setPropertyState(propertyState: integer)` | 107 |  |
| `VehicleLoadingData:setOwnerFarmId(ownerFarmId: integer)` | 114 |  |
| `VehicleLoadingData:setSaleItem(saleItem: table)` | 121 |  |
| `VehicleLoadingData:setSavegameData(savegameData: table)` | 140 |  |
| `VehicleLoadingData:setConfigurations(configurations: table)` | 172 |  |
| `VehicleLoadingData:setBoughtConfigurations(boughtConfigurations: table)` | 183 |  |
| `VehicleLoadingData:setConfigurationData(configurationData: table)` | 194 |  |
| `VehicleLoadingData:getConfigurations(configFileName: string) → table, table, table` | 208 |  |
| `VehicleLoadingData:setIsRegistered(isRegistered: boolean)` | 264 |  |
| `VehicleLoadingData:setForceServer(forceServer: boolean)` | 271 |  |
| `VehicleLoadingData:setIsSaved(isSaved: boolean)` | 278 |  |
| `VehicleLoadingData:setAddToPhysics(addToPhysics: boolean)` | 285 |  |
| `VehicleLoadingData:setCustomParameter(name: string, value: any)` | 293 |  |
| `VehicleLoadingData:getCustomParameter(name: string) → any` | 301 |  |
| `VehicleLoadingData:setPosition(x: number, y: number, z: number, terrainOffset: number)` | 311 |  |
| `VehicleLoadingData:setRotation(rx: number, ry: number, rz: number)` | 324 |  |
| `VehicleLoadingData:setSpawnNode(node: integer)` | 331 |  |
| `VehicleLoadingData:setIgnoreShopOffset(ignoreShopOffset: boolean)` | 339 |  |
| `VehicleLoadingData:setComponentPositionData(vehicle: table)` | 346 |  |
| `VehicleLoadingData:applyPositionData(vehicle: table) → boolean` | 358 |  |
| `VehicleLoadingData:setLoadingPlace(places: table, usedPlaces: table, spawnOffset: number?, ignoreMinSpawnItemSize: boolean?)` | 507 |  |
| `VehicleLoadingData:load(callback: function?, callbackTarget: table?, callbackArguments: table?)` | 560 |  |
