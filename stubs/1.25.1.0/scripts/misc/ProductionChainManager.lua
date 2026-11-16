---@meta
-- FS25 1.25.1.0 : misc/ProductionChainManager.lua (generated stub, FS25 Lua Atlas)

--- Map-bound manager (extends AbstractManager) that keeps the registry of production points and factories, overall and per farm, including a per-farm mapping from input fill type to production points. It registers gsProductionPoint* console commands, and on the server subscribes to hour changes and joins the updateable list while production points exist. Several handlers it references (console commands, update) are not in this dump file (UNVERIFIED).
---@class ProductionChainManager : AbstractManager
ProductionChainManager = {}

--- Creates the manager with the isServer flag, registers six gsProductionPoint* console commands (list, auto-deliver mapping, set owner, production state, output mode, fill level) and, on the server, subscribes to MessageType.HOUR_CHANGED. The handlers are not in this file.
---@param isServer any
---@param customMt any
---@return table
function ProductionChainManager.new(isServer, customMt) end

--- Resets the production point and factory lists with their reverse lookups, the per-farm table, the update index and the hour-change flags.
function ProductionChainManager:initDataStructures() end

--- Removes the console commands, unsubscribes from the hour message on the server, then calls the parent.
function ProductionChainManager:unloadMapData() end

--- Registers a production point unless already known (warning) or the ProductionChainManager.NUM_MAX_PRODUCTION_POINTS limit is reached. The first one on the server adds the manager to the mission updateables. Owned points are also added to their farm's tables. Returns true on success.
---@param productionPoint any
function ProductionChainManager:addProductionPoint(productionPoint) end

--- Adds a production point to a farm table and indexes it by each of its input fill types in inputTypeToProductionPoints, creating the sub-tables as needed.
---@param productionPoint any
---@param farmTable any
function ProductionChainManager:addProductionPointToFarm(productionPoint, farmTable) end

--- Registers a factory unless already known (warning), adds it to its owner farm's table when owned, and returns true on success.
---@param factory any
function ProductionChainManager:addFactory(factory) end

--- Adds a factory to the factories list of a farm table, creating the list if needed.
---@param factory any
---@param farmTable any
function ProductionChainManager:addFactoryToFarm(factory, farmTable) end

--- Unregisters a production point and removes it from its owner farm's data. When none remain on the server, removes the manager from the mission updateables.
---@param productionPoint any
function ProductionChainManager:removeProductionPoint(productionPoint) end

--- Removes a production point from a farm table and from its input-type index (logging an error if the index entry is missing), dropping empty entries. Returns the table, or nil when the farm table has neither production points nor factories left.
---@param productionPoint any
---@param farmTable any
function ProductionChainManager:removeProductionPointFromFarm(productionPoint, farmTable) end

--- Unregisters a factory and removes it from the data of the given farm id when that farm is known and not EVERYONE.
---@param factory any
---@param farmId any
function ProductionChainManager:removeFactory(factory, farmId) end

--- Removes a factory from a farm table; returns the table, or nil when the farm has neither factories nor production points left.
---@param factory any
---@param farmTable any
function ProductionChainManager:removeFactoryFromFarm(factory, farmTable) end

--- Returns the production points owned by a farm, or an empty table.
---@param farmId any
function ProductionChainManager:getProductionPointsForFarmId(farmId) end

--- Returns the factories owned by a farm, or an empty table.
---@param farmId any
function ProductionChainManager:getFactoriesForFarmId(farmId) end

--- Returns the total number of registered production points.
function ProductionChainManager:getNumOfProductionPoints() end

--- Returns a new list of production points whose owner farm id is AccessHandler.EVERYONE, meaning not owned by a farm.
function ProductionChainManager:getUnownedProductionPoints() end

--- Returns a new list of factories whose owner farm id is AccessHandler.EVERYONE.
function ProductionChainManager:getUnownedFactories() end

--- Returns true while the production point count is below ProductionChainManager.NUM_MAX_PRODUCTION_POINTS.
function ProductionChainManager:getHasFreeSlots() end

--- Callback for the hour message: only sets hourChangedDirty to true. Its consumer, the manager's update, is not in this dump (UNVERIFIED).
function ProductionChainManager:hourChanged() end

--- Empty function with no body logic in this dump; its purpose is UNVERIFIED.
function ProductionChainManager:updateBalance() end
