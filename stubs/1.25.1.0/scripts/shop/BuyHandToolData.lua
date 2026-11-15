---@meta
-- FS25 1.25.1.0 : shop/BuyHandToolData.lua (stub généré, atlas Lua FS25)

---@class BuyHandToolData
BuyHandToolData = {}

---@param customMt any
---@return table
function BuyHandToolData.new(customMt) end

---@return boolean
function BuyHandToolData:isValid() end

---@param storeItem table
function BuyHandToolData:setStoreItem(storeItem) end

---@param isFreeOfCharge boolean
function BuyHandToolData:setIsFreeOfCharge(isFreeOfCharge) end

---@param ownerFarmId integer
function BuyHandToolData:setOwnerFarmId(ownerFarmId) end

---@param price integer
function BuyHandToolData:setPrice(price) end

function BuyHandToolData:updatePrice() end

---@param streamId integer
---@param connection table
function BuyHandToolData:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function BuyHandToolData:writeStream(streamId, connection) end

---@param callback function?
---@param callbackTarget table?
---@param callbackArguments table?
function BuyHandToolData:buy(callback, callbackTarget, callbackArguments) end
