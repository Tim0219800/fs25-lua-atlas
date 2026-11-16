---@meta
-- FS25 1.25.1.0 : shop/BuyHandToolData.lua (generated stub, FS25 Lua Atlas)

--- Data holder for buying a hand tool: store item, free-of-charge flag, owner farm and price. It can be sent over the network (readStream/writeStream) and executes the purchase through HandToolLoadingData. The onBought callback used by buy is not defined in this file (UNVERIFIED), and `holder` is only read here, never set.
---@class BuyHandToolData
BuyHandToolData = {}

--- Creates empty purchase data: no store item, not free, owner AccessHandler.EVERYONE, price 0 and no holder.
---@param customMt any
---@return table
function BuyHandToolData.new(customMt) end

--- Returns true when a store item is set; on console builds the item's XML file must also exist.
---@return boolean
function BuyHandToolData:isValid() end

--- Sets the store item to buy.
---@param storeItem table
function BuyHandToolData:setStoreItem(storeItem) end

--- Sets whether the tool is given for free, for example as a reward.
---@param isFreeOfCharge boolean
function BuyHandToolData:setIsFreeOfCharge(isFreeOfCharge) end

--- Sets the id of the farm that will own the tool.
---@param ownerFarmId integer
function BuyHandToolData:setOwnerFarmId(ownerFarmId) end

--- Sets the purchase price directly, overriding any computed price.
---@param price integer
function BuyHandToolData:setPrice(price) end

--- Recomputes the price from the economy manager's buy price for the store item.
function BuyHandToolData:updatePrice() end

--- Reads the store item (by lower-cased XML filename), the free flag and the owner farm id from a network stream. The price is not transmitted.
---@param streamId integer
---@param connection table
function BuyHandToolData:readStream(streamId, connection) end

--- Writes the store item XML filename, the free flag and the owner farm id to a network stream, mirroring readStream.
---@param streamId integer
---@param connection table
function BuyHandToolData:writeStream(streamId, connection) end

--- Starts the purchase by loading the hand tool with a HandToolLoadingData built from this data. The optional callback is wrapped and called through self.onBought after loading, which is not defined here (UNVERIFIED).
---@param callback function?
---@param callbackTarget table?
---@param callbackArguments table?
function BuyHandToolData:buy(callback, callbackTarget, callbackArguments) end
