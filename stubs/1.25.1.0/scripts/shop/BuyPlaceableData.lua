---@meta
-- FS25 1.25.1.0 : shop/BuyPlaceableData.lua (generated stub, FS25 Lua Atlas)

--- Data holder for buying a placeable: store item, configurations, owner, price, terrain leveling options, position and rotation. It is serialized for multiplayer (readStream/writeStream, using g_placeableConfigurationManager) and executes the purchase through PlaceableLoadingData. The onLoaded callback used by buy is not defined in this file (UNVERIFIED).
---@class BuyPlaceableData
BuyPlaceableData = {}

--- Creates empty purchase data: no item, empty configuration tables, owner EVERYONE, zero price and displacement costs, no terrain modification, realign enabled, position and rotation zeroed.
---@param customMt table?
---@return BuyPlaceableData
function BuyPlaceableData.new(customMt) end

--- Returns true when a store item is set; on console builds its XML file must also exist.
---@return boolean
function BuyPlaceableData:isValid() end

--- Sets the store item to buy.
---@param storeItem table
function BuyPlaceableData:setStoreItem(storeItem) end

--- Sets whether the placeable is given for free, for example as a reward.
---@param isFreeOfCharge boolean
function BuyPlaceableData:setIsFreeOfCharge(isFreeOfCharge) end

--- Stores the selected and bought configurations (nil keeps the current ones) and marks every selected configuration index as bought.
---@param configurations table
---@param boughtConfigurations table
function BuyPlaceableData:setConfigurations(configurations, boughtConfigurations) end

--- Stores the per-configuration extra data; nil keeps the current value.
---@param configurationData table
function BuyPlaceableData:setConfigurationData(configurationData) end

--- Sets the id of the farm that will own the placeable.
---@param ownerFarmId integer
function BuyPlaceableData:setOwnerFarmId(ownerFarmId) end

--- Sets the purchase price directly, overriding any computed price.
---@param price integer
function BuyPlaceableData:setPrice(price) end

--- Recomputes the price from the economy manager's buy price for the store item and its current configurations.
function BuyPlaceableData:updatePrice() end

--- Sets the displacement (terrain moving) costs, sent with the purchase data. They are not added to the price in this file.
---@param displacementCosts integer
function BuyPlaceableData:setDisplacementCosts(displacementCosts) end

--- Sets whether the terrain is modified (leveled) when placing the placeable.
---@param modifyTerrain boolean
function BuyPlaceableData:setModifyTerrain(modifyTerrain) end

--- Sets whether the placeable is realigned to the terrain after leveling; the default is true.
---@param realignToTerrain boolean
function BuyPlaceableData:setRealignToTerrainAfterLeveling(realignToTerrain) end

--- Reads from a network stream the store item (by lower-cased XML filename), position, rotation, configurations, owner farm, free flag, displacement costs and the terrain flags. The price is not transmitted.
---@param streamId integer
---@param connection table
function BuyPlaceableData:readStream(streamId, connection) end

--- Writes the same fields as readStream, in the same order, to a network stream.
---@param streamId integer
---@param connection table
function BuyPlaceableData:writeStream(streamId, connection) end

--- Starts the purchase by loading the placeable with a PlaceableLoadingData configured with the item, configurations, owner, position and rotation. The optional callback is wrapped and called through self.onLoaded, not defined here (UNVERIFIED).
---@param callback function?
---@param callbackTarget table?
---@param callbackArguments table?
function BuyPlaceableData:buy(callback, callbackTarget, callbackArguments) end
