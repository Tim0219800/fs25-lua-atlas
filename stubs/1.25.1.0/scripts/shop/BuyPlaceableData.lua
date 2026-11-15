---@meta
-- FS25 1.25.1.0 : shop/BuyPlaceableData.lua (stub généré, atlas Lua FS25)

---@class BuyPlaceableData
BuyPlaceableData = {}

---@param customMt table?
---@return BuyPlaceableData
function BuyPlaceableData.new(customMt) end

---@return boolean
function BuyPlaceableData:isValid() end

---@param storeItem table
function BuyPlaceableData:setStoreItem(storeItem) end

---@param isFreeOfCharge boolean
function BuyPlaceableData:setIsFreeOfCharge(isFreeOfCharge) end

---@param configurations table
---@param boughtConfigurations table
function BuyPlaceableData:setConfigurations(configurations, boughtConfigurations) end

---@param configurationData table
function BuyPlaceableData:setConfigurationData(configurationData) end

---@param ownerFarmId integer
function BuyPlaceableData:setOwnerFarmId(ownerFarmId) end

---@param price integer
function BuyPlaceableData:setPrice(price) end

function BuyPlaceableData:updatePrice() end

---@param displacementCosts integer
function BuyPlaceableData:setDisplacementCosts(displacementCosts) end

---@param modifyTerrain boolean
function BuyPlaceableData:setModifyTerrain(modifyTerrain) end

---@param realignToTerrain boolean
function BuyPlaceableData:setRealignToTerrainAfterLeveling(realignToTerrain) end

---@param streamId integer
---@param connection table
function BuyPlaceableData:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function BuyPlaceableData:writeStream(streamId, connection) end

---@param callback function?
---@param callbackTarget table?
---@param callbackArguments table?
function BuyPlaceableData:buy(callback, callbackTarget, callbackArguments) end
