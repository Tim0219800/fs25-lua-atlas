---@meta
-- FS25 1.25.1.0 : vehicles/VehicleLoadingData.lua (stub généré, atlas Lua FS25)

---@class VehicleLoadingData
VehicleLoadingData = {}

---@param customMt any
---@return VehicleLoadingData
function VehicleLoadingData.new(customMt) end

---@param filename string
function VehicleLoadingData:setFilename(filename) end

---@param storeItem table
function VehicleLoadingData:setStoreItem(storeItem) end

---@param propertyState integer
function VehicleLoadingData:setPropertyState(propertyState) end

---@param ownerFarmId integer
function VehicleLoadingData:setOwnerFarmId(ownerFarmId) end

---@param saleItem table
function VehicleLoadingData:setSaleItem(saleItem) end

---@param savegameData table
function VehicleLoadingData:setSavegameData(savegameData) end

---@param configurations table
function VehicleLoadingData:setConfigurations(configurations) end

---@param boughtConfigurations table
function VehicleLoadingData:setBoughtConfigurations(boughtConfigurations) end

---@param configurationData table
function VehicleLoadingData:setConfigurationData(configurationData) end

---@param configFileName string
---@return table
---@return table
---@return table
function VehicleLoadingData:getConfigurations(configFileName) end

---@param isRegistered boolean
function VehicleLoadingData:setIsRegistered(isRegistered) end

---@param forceServer boolean
function VehicleLoadingData:setForceServer(forceServer) end

---@param isSaved boolean
function VehicleLoadingData:setIsSaved(isSaved) end

---@param addToPhysics boolean
function VehicleLoadingData:setAddToPhysics(addToPhysics) end

---@param name string
---@param value any
function VehicleLoadingData:setCustomParameter(name, value) end

---@param name string
---@return any
function VehicleLoadingData:getCustomParameter(name) end

---@param x number
---@param y number
---@param z number
---@param terrainOffset number
function VehicleLoadingData:setPosition(x, y, z, terrainOffset) end

---@param rx number
---@param ry number
---@param rz number
function VehicleLoadingData:setRotation(rx, ry, rz) end

---@param node integer
function VehicleLoadingData:setSpawnNode(node) end

---@param ignoreShopOffset boolean
function VehicleLoadingData:setIgnoreShopOffset(ignoreShopOffset) end

---@param vehicle table
function VehicleLoadingData:setComponentPositionData(vehicle) end

---@param vehicle table
---@return boolean
function VehicleLoadingData:applyPositionData(vehicle) end

---@param places table
---@param usedPlaces table
---@param spawnOffset number?
---@param ignoreMinSpawnItemSize boolean?
function VehicleLoadingData:setLoadingPlace(places, usedPlaces, spawnOffset, ignoreMinSpawnItemSize) end

---@param callback function?
---@param callbackTarget table?
---@param callbackArguments table?
function VehicleLoadingData:load(callback, callbackTarget, callbackArguments) end
