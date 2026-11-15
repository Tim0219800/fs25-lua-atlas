# economy/FarmlandManager.lua

Source : `dataS/scripts/economy/FarmlandManager.lua` — FS25 1.25.1.0

- **FarmlandManager** hérite de `AbstractManager` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FarmlandManager.new(customMt: any) → table` | 37 |  |
| `FarmlandManager:initDataStructures()` | 44 |  |
| `FarmlandManager:loadMapData(xmlFile: any) → boolean` | 60 |  |
| `FarmlandManager:loadFarmlandData(xmlFileHandle: any) → boolean` | 68 |  |
| `FarmlandManager:unloadMapData()` | 229 |  |
| `FarmlandManager:saveToXMLFile(xmlFilename: string) → boolean` | 257 |  |
| `FarmlandManager:loadFromXMLFile(xmlFilename: string)` | 282 |  |
| `FarmlandManager:delete()` | 316 |  |
| `FarmlandManager:getLocalMap() → integer` | 322 |  |
| `FarmlandManager:getIsOwnedByFarmAtWorldPosition(farmId: integer, worldPosX: number, worldPosZ: number) → boolean` | 332 |  |
| `FarmlandManager:getIsOwnedByFarmAlongLine(farmId: integer, worldPosX1: number, worldPosZ1: number, worldPosX2: number, worldPosZ2: number) → boolean` | 348 |  |
| `FarmlandManager:getCanAccessLandAtWorldPosition(farmId: integer, worldPosX: number, worldPosZ: number) → boolean` | 389 |  |
| `FarmlandManager:getFarmlandOwner(farmlandId: integer) → integer` | 407 |  |
| `FarmlandManager:getFarmlandIdAtWorldPosition(worldPosX: number, worldPosZ: number) → integer` | 421 |  |
| `FarmlandManager:getFarmlandAtWorldPosition(worldPosX: any, worldPosZ: any)` | 432 |  |
| `FarmlandManager:getOwnerIdAtWorldPosition(worldPosX: any, worldPosZ: any)` | 439 |  |
| `FarmlandManager:getIsValidFarmlandId(farmlandId: integer) → boolean` | 448 |  |
| `FarmlandManager:setLandOwnership(farmlandId: integer, farmId: integer, loadFromSavegame: any)` | 462 |  |
| `FarmlandManager:getFarmlandById(farmlandId: integer) → table` | 492 |  |
| `FarmlandManager:getFarmlands() → table` | 499 |  |
| `FarmlandManager:getPricePerHa()` | 505 |  |
| `FarmlandManager:getOwnedFarmlandIdsByFarmId(id: integer) → array` | 513 |  |
| `FarmlandManager:getNumOwnedFarmlandIdsByFarmId(id: integer) → integer` | 527 |  |
| `FarmlandManager:convertWorldToLocalPosition(worldPosX: number, worldPosZ: number) → number, number` | 543 |  |
| `FarmlandManager:farmDestroyed(farmId: any)` | 551 |  |
| `FarmlandManager:consoleCommandBuyFarmland(farmlandIdStr: any)` | 572 |  |
| `FarmlandManager:consoleCommandBuyAllFarmlands()` | 611 |  |
| `FarmlandManager:consoleCommandSellFarmland(farmlandIdStr: any)` | 626 |  |
| `FarmlandManager:consoleCommandSellAllFarmlands()` | 663 |  |
| `FarmlandManager:consoleCommandShowFarmlands()` | 676 |  |

## Messages

- écoute `MessageType.FARM_DELETED` (l.207)
- écoute `MessageType.FARM_SETTINGS_CHANGED` (l.208)
- publie `MessageType.FARMLAND_OWNER_CHANGED` (l.483)
