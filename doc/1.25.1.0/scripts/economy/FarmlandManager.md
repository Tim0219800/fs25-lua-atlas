# economy/FarmlandManager.lua

*[Version française](../../fr/scripts/economy/FarmlandManager.md)*

Source: `dataS/scripts/economy/FarmlandManager.lua` — FS25 1.25.1.0

✍ Manager of land ownership, a subclass of AbstractManager. Reads the farmland info layer or bit vector map and the map farmlands XML, keeps a farmland id to farm id table, saves and loads ownership, and answers ownership queries by world position. Ownership changes publish FARMLAND_OWNER_CHANGED on the message center. Also registers gsFarmland* cheat console commands.

- **FarmlandManager** inherits from `AbstractManager` (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `FarmlandManager.new(customMt: any) → table` | 37 | ✍ Constructor. Creates the manager from AbstractManager.new with the given or default metatable. |
| `FarmlandManager:initDataStructures()` | 44 | ✍ Resets farmland tables, id lists, farmland-to-farm mapping, local map handle and size, and the bit count (8). |
| `FarmlandManager:loadMapData(xmlFile: any) → boolean` | 60 | ✍ Calls the parent, then loads the map farmlands XML section through XMLUtil.loadDataFromMapXML with loadFarmlandData. Returns that result. |
| `FarmlandManager:loadFarmlandData(xmlFileHandle: any) → boolean` | 68 | ✍ Core loader: takes the info layer or loads a bit vector map, scans every pixel to compute area, centre and bounding box per id, creates Farmland objects from XML, gives default farms to a new singleplayer game, subscribes to farm messages and registers cheat commands. Returns false if the density map file is missing or fails to load. |
| `FarmlandManager:unloadMapData()` | 229 | ✍ Removes the console commands, unsubscribes from messages, deletes the bit vector map unless it came from the terrain, deletes all farmlands and calls the parent. |
| `FarmlandManager:saveToXMLFile(xmlFilename: string) → boolean` | 257 | ✍ Writes one farmlands.farmland entry per mapping (#id, #farmId) to the given XML file. Returns false if the file cannot be created. |
| `FarmlandManager:loadFromXMLFile(xmlFilename: string)` | 282 | ✍ Reads saved ownership and applies it with setLandOwnership (marked as loaded from savegame) for farms above the no-owner id, then calls g_farmManager:mergeFarmlandsForSingleplayer. Returns false if no file. Note: a missing #farmId would error on the comparison. |
| `FarmlandManager:delete()` | 316 | ✍ Empty function; cleanup is done in unloadMapData. |
| `FarmlandManager:getLocalMap() → integer` | 322 | ✍ Returns the farmland bit vector map handle, or nil if not loaded. |
| `FarmlandManager:getIsOwnedByFarmAtWorldPosition(farmId: integer, worldPosX: number, worldPosZ: number) → boolean` | 332 | ✍ Returns true if the given farm owns the farmland at the world X/Z position. False for a nil or no-owner farm id. |
| `FarmlandManager:getIsOwnedByFarmAlongLine(farmId: integer, worldPosX1: number, worldPosZ1: number, worldPosX2: number, worldPosZ2: number) → boolean` | 348 | ✍ Samples the farmland map along a world segment and returns true only if the farm owns every sampled point. Sampling is coarse, about every two map pixels, so tiny strips may be missed. |
| `FarmlandManager:getCanAccessLandAtWorldPosition(farmId: integer, worldPosX: number, worldPosZ: number) → boolean` | 389 | ✍ Returns true if the farm owns the land at the position or the access handler lets it use the owner farm land. False for nil or no-owner farm. |
| `FarmlandManager:getFarmlandOwner(farmlandId: integer) → integer` | 407 | ✍ Returns the owner farm id of a farmland id, or the no-owner id if the id is nil or unknown. Expects an id, not a farmland object. |
| `FarmlandManager:getFarmlandIdAtWorldPosition(worldPosX: number, worldPosZ: number) → integer` | 421 | ✍ Returns the farmland id read from the bit vector map at a world X/Z position; 0 means no valid farmland. Returns the no-owner id if no map is loaded. |
| `FarmlandManager:getFarmlandAtWorldPosition(worldPosX: any, worldPosZ: any)` | 432 | ✍ Returns the Farmland object at a world X/Z position, or nil. |
| `FarmlandManager:getOwnerIdAtWorldPosition(worldPosX: any, worldPosZ: any)` | 439 | ✍ Returns the owner farm id of the farmland at a world X/Z position. |
| `FarmlandManager:getIsValidFarmlandId(farmlandId: integer) → boolean` | 448 | ✍ Returns true if the id is a positive number matching a defined farmland. |
| `FarmlandManager:setLandOwnership(farmlandId: integer, farmId: integer, loadFromSavegame: any)` | 462 | ✍ Assigns a farmland to a farm (no-owner id to sell), updates the Farmland object and publishes FARMLAND_OWNER_CHANGED with the loadFromSavegame flag. Returns false for invalid ids or the not-buyable farm id. Does not do networking itself. |
| `FarmlandManager:getFarmlandById(farmlandId: integer) → table` | 492 | ✍ Returns the Farmland object for an id, or nil. |
| `FarmlandManager:getFarmlands() → table` | 499 | ✍ Returns the table of all farmlands indexed by id (the internal table, not a copy). |
| `FarmlandManager:getPricePerHa()` | 505 | ✍ Returns the base price per hectare read from the map XML (60000 if not set). |
| `FarmlandManager:getOwnedFarmlandIdsByFarmId(id: integer) → array` | 513 | ✍ Returns a new array of the farmland ids owned by the given farm id. |
| `FarmlandManager:getNumOwnedFarmlandIdsByFarmId(id: integer) → integer` | 527 | ✍ Returns how many farmlands the given farm owns. |
| `FarmlandManager:convertWorldToLocalPosition(worldPosX: number, worldPosZ: number) → number, number` | 543 | ✍ Converts world X/Z to integer pixel coordinates in the farmland map using terrain size and map resolution. Returns two values; no bounds clamping. |
| `FarmlandManager:farmDestroyed(farmId: any)` | 551 | ✍ Message handler for a deleted farm: sets every farmland it owned back to the no-owner id. |
| `FarmlandManager:consoleCommandBuyFarmland(farmlandIdStr: any)` | 572 | ✍ Console command gsFarmlandBuy [id]: for server or master user with a client, sends a FarmlandStateEvent to buy the given or current-position farmland for the local player farm. |
| `FarmlandManager:consoleCommandBuyAllFarmlands()` | 611 | ✍ Console command gsFarmlandBuyAll: sends a buy event for every farmland for the local player farm. Same permission condition as the single buy. |
| `FarmlandManager:consoleCommandSellFarmland(farmlandIdStr: any)` | 626 | ✍ Console command gsFarmlandSell [id]: sends an event setting the given or current-position farmland to no owner. Errors if it is already unowned. |
| `FarmlandManager:consoleCommandSellAllFarmlands()` | 663 | ✍ Console command gsFarmlandSellAll: sends a sell event for every farmland. |
| `FarmlandManager:consoleCommandShowFarmlands()` | 676 | ✍ Console command gsFarmlandShow: toggles registration of this manager as a debug drawable (overlay needs debug mode, F5). The draw code is not in this file. |

## Messages

- subscribes `MessageType.FARM_DELETED` (l.207)
- subscribes `MessageType.FARM_SETTINGS_CHANGED` (l.208)
- publishes `MessageType.FARMLAND_OWNER_CHANGED` (l.483)
