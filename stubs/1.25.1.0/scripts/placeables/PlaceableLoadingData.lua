---@meta
-- FS25 1.25.1.0 : placeables/PlaceableLoadingData.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableLoadingData
PlaceableLoadingData = {}

---@param customMt any
---@return PlaceableLoadingData
function PlaceableLoadingData.new(customMt) end

---@param filename string
function PlaceableLoadingData:setFilename(filename) end

---@param storeItem table
function PlaceableLoadingData:setStoreItem(storeItem) end

---@param propertyState integer
function PlaceableLoadingData:setPropertyState(propertyState) end

---@param ownerFarmId integer
function PlaceableLoadingData:setOwnerFarmId(ownerFarmId) end

---@param savegameData table
function PlaceableLoadingData:setSavegameData(savegameData) end

---@param configurations table
function PlaceableLoadingData:setConfigurations(configurations) end

---@param boughtConfigurations table
function PlaceableLoadingData:setBoughtConfigurations(boughtConfigurations) end

---@param configurationData table
function PlaceableLoadingData:setConfigurationData(configurationData) end

---@param configFileName string
---@return table
---@return table
---@return table
function PlaceableLoadingData:getConfigurations(configFileName) end

---@param isRegistered boolean
function PlaceableLoadingData:setIsRegistered(isRegistered) end

---@param forceServer boolean
function PlaceableLoadingData:setForceServer(forceServer) end

---@param isSaved boolean
function PlaceableLoadingData:setIsSaved(isSaved) end

---@param name string
---@param value any
function PlaceableLoadingData:setCustomParameter(name, value) end

---@param name string
---@return any
function PlaceableLoadingData:getCustomParameter(name) end

---@param x number
---@param y number
---@param z number
function PlaceableLoadingData:setPosition(x, y, z) end

---@param rx number
---@param ry number
---@param rz number
function PlaceableLoadingData:setRotation(rx, ry, rz) end

---@param node integer
function PlaceableLoadingData:setSpawnNode(node) end

---@param placeable table
---@return boolean
function PlaceableLoadingData:applyPositionData(placeable) end

---@param callback function?
---@param callbackTarget table?
---@param callbackArguments table?
function PlaceableLoadingData:load(callback, callbackTarget, callbackArguments) end
