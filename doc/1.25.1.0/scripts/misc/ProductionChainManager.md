# misc/ProductionChainManager.lua

*[Version française](../../fr/scripts/misc/ProductionChainManager.md)*

Source: `dataS/scripts/misc/ProductionChainManager.lua` — FS25 1.25.1.0

✍ Map-bound manager (extends AbstractManager) that keeps the registry of production points and factories, overall and per farm, including a per-farm mapping from input fill type to production points. It registers gsProductionPoint* console commands, and on the server subscribes to hour changes and joins the updateable list while production points exist. Several handlers it references (console commands, update) are not in this dump file (UNVERIFIED).

- **ProductionChainManager** inherits from `AbstractManager` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `ProductionChainManager.new(isServer: any, customMt: any) → table` | 19 | ✍ Creates the manager with the isServer flag, registers six gsProductionPoint* console commands (list, auto-deliver mapping, set owner, production state, output mode, fill level) and, on the server, subscribes to MessageType.HOUR_CHANGED. The handlers are not in this file. |
| `ProductionChainManager:initDataStructures()` | 43 | ✍ Resets the production point and factory lists with their reverse lookups, the per-farm table, the update index and the hour-change flags. |
| `ProductionChainManager:unloadMapData()` | 59 | ✍ Removes the console commands, unsubscribes from the hour message on the server, then calls the parent. |
| `ProductionChainManager:addProductionPoint(productionPoint: any)` | 77 | ✍ Registers a production point unless already known (warning) or the ProductionChainManager.NUM_MAX_PRODUCTION_POINTS limit is reached. The first one on the server adds the manager to the mission updateables. Owned points are also added to their farm's tables. Returns true on success. |
| `ProductionChainManager:addProductionPointToFarm(productionPoint: any, farmTable: any)` | 110 | ✍ Adds a production point to a farm table and indexes it by each of its input fill types in inputTypeToProductionPoints, creating the sub-tables as needed. |
| `ProductionChainManager:addFactory(factory: any)` | 130 | ✍ Registers a factory unless already known (warning), adds it to its owner farm's table when owned, and returns true on success. |
| `ProductionChainManager:addFactoryToFarm(factory: any, farmTable: any)` | 151 | ✍ Adds a factory to the factories list of a farm table, creating the list if needed. |
| `ProductionChainManager:removeProductionPoint(productionPoint: any)` | 161 | ✍ Unregisters a production point and removes it from its owner farm's data. When none remain on the server, removes the manager from the mission updateables. |
| `ProductionChainManager:removeProductionPointFromFarm(productionPoint: any, farmTable: any)` | 182 | ✍ Removes a production point from a farm table and from its input-type index (logging an error if the index entry is missing), dropping empty entries. Returns the table, or nil when the farm table has neither production points nor factories left. |
| `ProductionChainManager:removeFactory(factory: any, farmId: any)` | 209 | ✍ Unregisters a factory and removes it from the data of the given farm id when that farm is known and not EVERYONE. |
| `ProductionChainManager:removeFactoryFromFarm(factory: any, farmTable: any)` | 221 | ✍ Removes a factory from a farm table; returns the table, or nil when the farm has neither factories nor production points left. |
| `ProductionChainManager:getProductionPointsForFarmId(farmId: any)` | 237 | ✍ Returns the production points owned by a farm, or an empty table. |
| `ProductionChainManager:getFactoriesForFarmId(farmId: any)` | 243 | ✍ Returns the factories owned by a farm, or an empty table. |
| `ProductionChainManager:getNumOfProductionPoints()` | 249 | ✍ Returns the total number of registered production points. |
| `ProductionChainManager:getUnownedProductionPoints()` | 255 | ✍ Returns a new list of production points whose owner farm id is AccessHandler.EVERYONE, meaning not owned by a farm. |
| `ProductionChainManager:getUnownedFactories()` | 268 | ✍ Returns a new list of factories whose owner farm id is AccessHandler.EVERYONE. |
| `ProductionChainManager:getHasFreeSlots()` | 281 | ✍ Returns true while the production point count is below ProductionChainManager.NUM_MAX_PRODUCTION_POINTS. |
| `ProductionChainManager:hourChanged()` | 326 | ✍ Callback for the hour message: only sets hourChangedDirty to true. Its consumer, the manager's update, is not in this dump (UNVERIFIED). |
| `ProductionChainManager:updateBalance()` | 392 | ✍ Empty function with no body logic in this dump; its purpose is UNVERIFIED. |

## Messages

- subscribes `MessageType.HOUR_CHANGED` (l.35)
