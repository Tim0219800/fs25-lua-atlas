# misc/ProductionChainManager.lua

Source : `dataS/scripts/misc/ProductionChainManager.lua` — FS25 1.25.1.0

- **ProductionChainManager** hérite de `AbstractManager` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ProductionChainManager.new(isServer: any, customMt: any) → table` | 19 |  |
| `ProductionChainManager:initDataStructures()` | 43 |  |
| `ProductionChainManager:unloadMapData()` | 59 |  |
| `ProductionChainManager:addProductionPoint(productionPoint: any)` | 77 |  |
| `ProductionChainManager:addProductionPointToFarm(productionPoint: any, farmTable: any)` | 110 |  |
| `ProductionChainManager:addFactory(factory: any)` | 130 |  |
| `ProductionChainManager:addFactoryToFarm(factory: any, farmTable: any)` | 151 |  |
| `ProductionChainManager:removeProductionPoint(productionPoint: any)` | 161 |  |
| `ProductionChainManager:removeProductionPointFromFarm(productionPoint: any, farmTable: any)` | 182 |  |
| `ProductionChainManager:removeFactory(factory: any, farmId: any)` | 209 |  |
| `ProductionChainManager:removeFactoryFromFarm(factory: any, farmTable: any)` | 221 |  |
| `ProductionChainManager:getProductionPointsForFarmId(farmId: any)` | 237 |  |
| `ProductionChainManager:getFactoriesForFarmId(farmId: any)` | 243 |  |
| `ProductionChainManager:getNumOfProductionPoints()` | 249 |  |
| `ProductionChainManager:getUnownedProductionPoints()` | 255 |  |
| `ProductionChainManager:getUnownedFactories()` | 268 |  |
| `ProductionChainManager:getHasFreeSlots()` | 281 |  |
| `ProductionChainManager:hourChanged()` | 326 |  |
| `ProductionChainManager:updateBalance()` | 392 |  |

## Messages

- écoute `MessageType.HOUR_CHANGED` (l.35)
