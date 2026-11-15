---@meta
-- FS25 1.25.1.0 : handTools/HandToolLoadingData.lua (generated stub, FS25 Lua Atlas)

---@class HandToolLoadingData
HandToolLoadingData = {}

---@param customMt any
---@return table
function HandToolLoadingData.new(customMt) end

---@param filename string
function HandToolLoadingData:setFilename(filename) end

---@param storeItem table
function HandToolLoadingData:setStoreItem(storeItem) end

---@param ownerFarmId integer
function HandToolLoadingData:setOwnerFarmId(ownerFarmId) end

---@param isRegistered boolean
function HandToolLoadingData:setIsRegistered(isRegistered) end

---@param savegameData table
function HandToolLoadingData:setSavegameData(savegameData) end

---@param callback function?
---@param callbackTarget table?
---@param callbackArguments table?
function HandToolLoadingData:load(callback, callbackTarget, callbackArguments) end
