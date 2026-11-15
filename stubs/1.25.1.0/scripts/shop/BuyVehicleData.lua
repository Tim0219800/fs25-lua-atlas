---@meta
-- FS25 1.25.1.0 : shop/BuyVehicleData.lua (stub généré, atlas Lua FS25)

---@class BuyVehicleData
BuyVehicleData = {}

---@param customMt table?
---@return BuyVehicleData
function BuyVehicleData.new(customMt) end

---@return boolean
function BuyVehicleData:isValid() end

---@param storeItem table
function BuyVehicleData:setStoreItem(storeItem) end

---@param isFreeOfCharge boolean
function BuyVehicleData:setIsFreeOfCharge(isFreeOfCharge) end

---@param configurations table
---@param boughtConfigurations table
function BuyVehicleData:setConfigurations(configurations, boughtConfigurations) end

---@param configurationData table
function BuyVehicleData:setConfigurationData(configurationData) end

---@param leaseVehicle boolean
function BuyVehicleData:setLeaseVehicle(leaseVehicle) end

---@param ownerFarmId integer
function BuyVehicleData:setOwnerFarmId(ownerFarmId) end

---@param licensePlateData table
function BuyVehicleData:setLicensePlateData(licensePlateData) end

---@param saleItem table
function BuyVehicleData:setSaleItem(saleItem) end

---@param price integer
function BuyVehicleData:setPrice(price) end

function BuyVehicleData:updatePrice() end

---@return boolean
---@return boolean
function BuyVehicleData:getIsLimitedObjectPurchase() end

---@param streamId integer
---@param connection table
function BuyVehicleData:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function BuyVehicleData:writeStream(streamId, connection) end

---@param storePlaces table
---@param usedStorePlaces table
---@param callback function?
---@param callbackTarget table?
---@param callbackArguments table?
function BuyVehicleData:buy(storePlaces, usedStorePlaces, callback, callbackTarget, callbackArguments) end
