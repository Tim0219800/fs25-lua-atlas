---@meta
-- FS25 1.25.1.0 : economy/FarmlandManager.lua (generated stub, FS25 Lua Atlas)

---@class FarmlandManager : AbstractManager
FarmlandManager = {}

---@param customMt any
---@return table
function FarmlandManager.new(customMt) end

function FarmlandManager:initDataStructures() end

---@param xmlFile any
---@return boolean
function FarmlandManager:loadMapData(xmlFile) end

---@param xmlFileHandle any
---@return boolean
function FarmlandManager:loadFarmlandData(xmlFileHandle) end

function FarmlandManager:unloadMapData() end

---@param xmlFilename string
---@return boolean
function FarmlandManager:saveToXMLFile(xmlFilename) end

---@param xmlFilename string
function FarmlandManager:loadFromXMLFile(xmlFilename) end

function FarmlandManager:delete() end

---@return integer
function FarmlandManager:getLocalMap() end

---@param farmId integer
---@param worldPosX number
---@param worldPosZ number
---@return boolean
function FarmlandManager:getIsOwnedByFarmAtWorldPosition(farmId, worldPosX, worldPosZ) end

---@param farmId integer
---@param worldPosX1 number
---@param worldPosZ1 number
---@param worldPosX2 number
---@param worldPosZ2 number
---@return boolean
function FarmlandManager:getIsOwnedByFarmAlongLine(farmId, worldPosX1, worldPosZ1, worldPosX2, worldPosZ2) end

---@param farmId integer
---@param worldPosX number
---@param worldPosZ number
---@return boolean
function FarmlandManager:getCanAccessLandAtWorldPosition(farmId, worldPosX, worldPosZ) end

---@param farmlandId integer
---@return integer
function FarmlandManager:getFarmlandOwner(farmlandId) end

---@param worldPosX number
---@param worldPosZ number
---@return integer
function FarmlandManager:getFarmlandIdAtWorldPosition(worldPosX, worldPosZ) end

---@param worldPosX any
---@param worldPosZ any
function FarmlandManager:getFarmlandAtWorldPosition(worldPosX, worldPosZ) end

---@param worldPosX any
---@param worldPosZ any
function FarmlandManager:getOwnerIdAtWorldPosition(worldPosX, worldPosZ) end

---@param farmlandId integer
---@return boolean
function FarmlandManager:getIsValidFarmlandId(farmlandId) end

---@param farmlandId integer
---@param farmId integer
---@param loadFromSavegame any
function FarmlandManager:setLandOwnership(farmlandId, farmId, loadFromSavegame) end

---@param farmlandId integer
---@return table
function FarmlandManager:getFarmlandById(farmlandId) end

---@return table
function FarmlandManager:getFarmlands() end

function FarmlandManager:getPricePerHa() end

---@param id integer
---@return array
function FarmlandManager:getOwnedFarmlandIdsByFarmId(id) end

---@param id integer
---@return integer
function FarmlandManager:getNumOwnedFarmlandIdsByFarmId(id) end

---@param worldPosX number
---@param worldPosZ number
---@return number
---@return number
function FarmlandManager:convertWorldToLocalPosition(worldPosX, worldPosZ) end

---@param farmId any
function FarmlandManager:farmDestroyed(farmId) end

---@param farmlandIdStr any
function FarmlandManager:consoleCommandBuyFarmland(farmlandIdStr) end

function FarmlandManager:consoleCommandBuyAllFarmlands() end

---@param farmlandIdStr any
function FarmlandManager:consoleCommandSellFarmland(farmlandIdStr) end

function FarmlandManager:consoleCommandSellAllFarmlands() end

function FarmlandManager:consoleCommandShowFarmlands() end
