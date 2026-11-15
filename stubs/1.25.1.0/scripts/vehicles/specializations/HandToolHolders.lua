---@meta
-- FS25 1.25.1.0 : vehicles/specializations/HandToolHolders.lua (stub généré, atlas Lua FS25)

---@class HandToolHolders
HandToolHolders = {}

---@param vehicleType any
function HandToolHolders.registerEvents(vehicleType) end

---@param vehicleType any
function HandToolHolders.registerFunctions(vehicleType) end

---@param vehicleType any
function HandToolHolders.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function HandToolHolders.registerEventListeners(vehicleType) end

---@param savegame any
function HandToolHolders:onLoad(savegame) end

---@param handToolHolder any
---@param args any
function HandToolHolders:onHandToolHolderFinished(handToolHolder, args) end

function HandToolHolders:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function HandToolHolders:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId any
---@param connection any
function HandToolHolders:onWriteStream(streamId, connection) end

---@param streamId any
---@param connection any
function HandToolHolders:onReadStream(streamId, connection) end

---@param superFunc any
---@param ownerFarmId any
---@param noEventSend any
function HandToolHolders:setOwnerFarmId(superFunc, ownerFarmId, noEventSend) end
