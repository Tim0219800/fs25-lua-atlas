---@meta
-- FS25 1.25.1.0 : shop/BuyVehicleData.lua (generated stub, FS25 Lua Atlas)

--- Data holder for buying a vehicle or changing an existing vehicle's configuration: store item, configurations, lease flag, owner, license plate, sale item and price. It is serialized for multiplayer (using g_vehicleConfigurationManager) and executes the purchase through VehicleLoadingData at given store places. The onBought callback used by buy is not defined in this file (UNVERIFIED).
---@class BuyVehicleData
BuyVehicleData = {}

--- Creates empty purchase data: no item, empty configuration tables, not leased, owner EVERYONE, no license plate or sale item, price 0.
---@param customMt table?
---@return BuyVehicleData
function BuyVehicleData.new(customMt) end

--- Returns true when a store item is set; on console builds its XML file must also exist.
---@return boolean
function BuyVehicleData:isValid() end

--- Sets the store item to buy.
---@param storeItem table
function BuyVehicleData:setStoreItem(storeItem) end

--- Sets whether the vehicle is given for free, for example as a reward.
---@param isFreeOfCharge boolean
function BuyVehicleData:setIsFreeOfCharge(isFreeOfCharge) end

--- Stores the selected and bought configurations (nil keeps the current ones) and marks every selected configuration index as bought.
---@param configurations table
---@param boughtConfigurations table
function BuyVehicleData:setConfigurations(configurations, boughtConfigurations) end

--- Stores the per-configuration extra data; nil keeps the current value.
---@param configurationData table
function BuyVehicleData:setConfigurationData(configurationData) end

--- Sets whether the vehicle is leased instead of bought; this changes the price in updatePrice and the property state in buy.
---@param leaseVehicle boolean
function BuyVehicleData:setLeaseVehicle(leaseVehicle) end

--- Sets the id of the farm that will own the vehicle.
---@param ownerFarmId integer
function BuyVehicleData:setOwnerFarmId(ownerFarmId) end

--- Sets the license plate data transmitted with the purchase.
---@param licensePlateData table
function BuyVehicleData:setLicensePlateData(licensePlateData) end

--- Sets the used-vehicle sale entry when the purchase comes from the sales list; it also influences the price and is passed to the loading data.
---@param saleItem table
function BuyVehicleData:setSaleItem(saleItem) end

--- Sets the purchase price directly, overriding any computed price.
---@param price integer
function BuyVehicleData:setPrice(price) end

--- Recomputes the price from the economy manager for the item, configurations and sale item; for a lease it converts that price into the initial leasing price.
function BuyVehicleData:updatePrice() end

--- Opens the store item's XML and returns two booleans: bale purchase and pallet purchase, from the `vehicle.multipleItemPurchase#isVehicle` attribute. Both are false if the element is absent.
---@return boolean
---@return boolean
function BuyVehicleData:getIsLimitedObjectPurchase() end

--- Reads from a network stream the store item, free flag, configurations, lease flag, owner farm, license plate data and a sale id (0 means none, otherwise it looks up the sale via vehicleSaleSystem). The price is not transmitted.
---@param streamId integer
---@param connection table
function BuyVehicleData:readStream(streamId, connection) end

--- Writes the same fields as readStream, in the same order, to a network stream; the sale item is sent as its id or 0.
---@param streamId integer
---@param connection table
function BuyVehicleData:writeStream(streamId, connection) end

--- Starts the purchase by loading the vehicle(s) with a VehicleLoadingData configured with the item, configurations, store places, owned or leased state, owner and sale item. The callback is wrapped and called through self.onBought, not defined here (UNVERIFIED).
---@param storePlaces table
---@param usedStorePlaces table
---@param callback function?
---@param callbackTarget table?
---@param callbackArguments table?
function BuyVehicleData:buy(storePlaces, usedStorePlaces, callback, callbackTarget, callbackArguments) end
