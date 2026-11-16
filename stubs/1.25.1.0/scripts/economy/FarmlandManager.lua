---@meta
-- FS25 1.25.1.0 : economy/FarmlandManager.lua (generated stub, FS25 Lua Atlas)

--- Manager of land ownership, a subclass of AbstractManager. Reads the farmland info layer or bit vector map and the map farmlands XML, keeps a farmland id to farm id table, saves and loads ownership, and answers ownership queries by world position. Ownership changes publish FARMLAND_OWNER_CHANGED on the message center. Also registers gsFarmland* cheat console commands.
---@class FarmlandManager : AbstractManager
FarmlandManager = {}

--- Constructor. Creates the manager from AbstractManager.new with the given or default metatable.
---@param customMt any
---@return table
function FarmlandManager.new(customMt) end

--- Resets farmland tables, id lists, farmland-to-farm mapping, local map handle and size, and the bit count (8).
function FarmlandManager:initDataStructures() end

--- Calls the parent, then loads the map farmlands XML section through XMLUtil.loadDataFromMapXML with loadFarmlandData. Returns that result.
---@param xmlFile any
---@return boolean
function FarmlandManager:loadMapData(xmlFile) end

--- Core loader: takes the info layer or loads a bit vector map, scans every pixel to compute area, centre and bounding box per id, creates Farmland objects from XML, gives default farms to a new singleplayer game, subscribes to farm messages and registers cheat commands. Returns false if the density map file is missing or fails to load.
---@param xmlFileHandle any
---@return boolean
function FarmlandManager:loadFarmlandData(xmlFileHandle) end

--- Removes the console commands, unsubscribes from messages, deletes the bit vector map unless it came from the terrain, deletes all farmlands and calls the parent.
function FarmlandManager:unloadMapData() end

--- Writes one farmlands.farmland entry per mapping (#id, #farmId) to the given XML file. Returns false if the file cannot be created.
---@param xmlFilename string
---@return boolean
function FarmlandManager:saveToXMLFile(xmlFilename) end

--- Reads saved ownership and applies it with setLandOwnership (marked as loaded from savegame) for farms above the no-owner id, then calls g_farmManager:mergeFarmlandsForSingleplayer. Returns false if no file. Note: a missing #farmId would error on the comparison.
---@param xmlFilename string
function FarmlandManager:loadFromXMLFile(xmlFilename) end

--- Empty function; cleanup is done in unloadMapData.
function FarmlandManager:delete() end

--- Returns the farmland bit vector map handle, or nil if not loaded.
---@return integer
function FarmlandManager:getLocalMap() end

--- Returns true if the given farm owns the farmland at the world X/Z position. False for a nil or no-owner farm id.
---@param farmId integer
---@param worldPosX number
---@param worldPosZ number
---@return boolean
function FarmlandManager:getIsOwnedByFarmAtWorldPosition(farmId, worldPosX, worldPosZ) end

--- Samples the farmland map along a world segment and returns true only if the farm owns every sampled point. Sampling is coarse, about every two map pixels, so tiny strips may be missed.
---@param farmId integer
---@param worldPosX1 number
---@param worldPosZ1 number
---@param worldPosX2 number
---@param worldPosZ2 number
---@return boolean
function FarmlandManager:getIsOwnedByFarmAlongLine(farmId, worldPosX1, worldPosZ1, worldPosX2, worldPosZ2) end

--- Returns true if the farm owns the land at the position or the access handler lets it use the owner farm land. False for nil or no-owner farm.
---@param farmId integer
---@param worldPosX number
---@param worldPosZ number
---@return boolean
function FarmlandManager:getCanAccessLandAtWorldPosition(farmId, worldPosX, worldPosZ) end

--- Returns the owner farm id of a farmland id, or the no-owner id if the id is nil or unknown. Expects an id, not a farmland object.
---@param farmlandId integer
---@return integer
function FarmlandManager:getFarmlandOwner(farmlandId) end

--- Returns the farmland id read from the bit vector map at a world X/Z position; 0 means no valid farmland. Returns the no-owner id if no map is loaded.
---@param worldPosX number
---@param worldPosZ number
---@return integer
function FarmlandManager:getFarmlandIdAtWorldPosition(worldPosX, worldPosZ) end

--- Returns the Farmland object at a world X/Z position, or nil.
---@param worldPosX any
---@param worldPosZ any
function FarmlandManager:getFarmlandAtWorldPosition(worldPosX, worldPosZ) end

--- Returns the owner farm id of the farmland at a world X/Z position.
---@param worldPosX any
---@param worldPosZ any
function FarmlandManager:getOwnerIdAtWorldPosition(worldPosX, worldPosZ) end

--- Returns true if the id is a positive number matching a defined farmland.
---@param farmlandId integer
---@return boolean
function FarmlandManager:getIsValidFarmlandId(farmlandId) end

--- Assigns a farmland to a farm (no-owner id to sell), updates the Farmland object and publishes FARMLAND_OWNER_CHANGED with the loadFromSavegame flag. Returns false for invalid ids or the not-buyable farm id. Does not do networking itself.
---@param farmlandId integer
---@param farmId integer
---@param loadFromSavegame any
function FarmlandManager:setLandOwnership(farmlandId, farmId, loadFromSavegame) end

--- Returns the Farmland object for an id, or nil.
---@param farmlandId integer
---@return table
function FarmlandManager:getFarmlandById(farmlandId) end

--- Returns the table of all farmlands indexed by id (the internal table, not a copy).
---@return table
function FarmlandManager:getFarmlands() end

--- Returns the base price per hectare read from the map XML (60000 if not set).
function FarmlandManager:getPricePerHa() end

--- Returns a new array of the farmland ids owned by the given farm id.
---@param id integer
---@return array
function FarmlandManager:getOwnedFarmlandIdsByFarmId(id) end

--- Returns how many farmlands the given farm owns.
---@param id integer
---@return integer
function FarmlandManager:getNumOwnedFarmlandIdsByFarmId(id) end

--- Converts world X/Z to integer pixel coordinates in the farmland map using terrain size and map resolution. Returns two values; no bounds clamping.
---@param worldPosX number
---@param worldPosZ number
---@return number
---@return number
function FarmlandManager:convertWorldToLocalPosition(worldPosX, worldPosZ) end

--- Message handler for a deleted farm: sets every farmland it owned back to the no-owner id.
---@param farmId any
function FarmlandManager:farmDestroyed(farmId) end

--- Console command gsFarmlandBuy [id]: for server or master user with a client, sends a FarmlandStateEvent to buy the given or current-position farmland for the local player farm.
---@param farmlandIdStr any
function FarmlandManager:consoleCommandBuyFarmland(farmlandIdStr) end

--- Console command gsFarmlandBuyAll: sends a buy event for every farmland for the local player farm. Same permission condition as the single buy.
function FarmlandManager:consoleCommandBuyAllFarmlands() end

--- Console command gsFarmlandSell [id]: sends an event setting the given or current-position farmland to no owner. Errors if it is already unowned.
---@param farmlandIdStr any
function FarmlandManager:consoleCommandSellFarmland(farmlandIdStr) end

--- Console command gsFarmlandSellAll: sends a sell event for every farmland.
function FarmlandManager:consoleCommandSellAllFarmlands() end

--- Console command gsFarmlandShow: toggles registration of this manager as a debug drawable (overlay needs debug mode, F5). The draw code is not in this file.
function FarmlandManager:consoleCommandShowFarmlands() end
