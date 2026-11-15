---@meta
-- FS25 1.25.1.0 : misc/ProductionChainManager.lua (generated stub, FS25 Lua Atlas)

---@class ProductionChainManager : AbstractManager
ProductionChainManager = {}

---@param isServer any
---@param customMt any
---@return table
function ProductionChainManager.new(isServer, customMt) end

function ProductionChainManager:initDataStructures() end

function ProductionChainManager:unloadMapData() end

---@param productionPoint any
function ProductionChainManager:addProductionPoint(productionPoint) end

---@param productionPoint any
---@param farmTable any
function ProductionChainManager:addProductionPointToFarm(productionPoint, farmTable) end

---@param factory any
function ProductionChainManager:addFactory(factory) end

---@param factory any
---@param farmTable any
function ProductionChainManager:addFactoryToFarm(factory, farmTable) end

---@param productionPoint any
function ProductionChainManager:removeProductionPoint(productionPoint) end

---@param productionPoint any
---@param farmTable any
function ProductionChainManager:removeProductionPointFromFarm(productionPoint, farmTable) end

---@param factory any
---@param farmId any
function ProductionChainManager:removeFactory(factory, farmId) end

---@param factory any
---@param farmTable any
function ProductionChainManager:removeFactoryFromFarm(factory, farmTable) end

---@param farmId any
function ProductionChainManager:getProductionPointsForFarmId(farmId) end

---@param farmId any
function ProductionChainManager:getFactoriesForFarmId(farmId) end

function ProductionChainManager:getNumOfProductionPoints() end

function ProductionChainManager:getUnownedProductionPoints() end

function ProductionChainManager:getUnownedFactories() end

function ProductionChainManager:getHasFreeSlots() end

function ProductionChainManager:hourChanged() end

function ProductionChainManager:updateBalance() end
