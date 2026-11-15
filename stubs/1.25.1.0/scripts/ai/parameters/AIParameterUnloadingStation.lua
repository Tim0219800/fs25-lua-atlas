---@meta
-- FS25 1.25.1.0 : ai/parameters/AIParameterUnloadingStation.lua (stub généré, atlas Lua FS25)

---@class AIParameterUnloadingStation : AIParameter
AIParameterUnloadingStation = {}

---@param customMt any
function AIParameterUnloadingStation.new(customMt) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function AIParameterUnloadingStation:saveToXMLFile(xmlFile, key, usedModNames) end

---@param xmlFile any
---@param key any
function AIParameterUnloadingStation:loadFromXMLFile(xmlFile, key) end

---@param args any
function AIParameterUnloadingStation:onPlaceableLoaded(args) end

---@param uniqueId any
---@param index any
function AIParameterUnloadingStation:setUnloadingStationFromUniqueId(uniqueId, index) end

---@param streamId any
---@param connection any
function AIParameterUnloadingStation:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AIParameterUnloadingStation:writeStream(streamId, connection) end

---@param unloadingStation any
function AIParameterUnloadingStation:setUnloadingStation(unloadingStation) end

function AIParameterUnloadingStation:getUnloadingStation() end

function AIParameterUnloadingStation:getString() end

---@param unloadingStations any
function AIParameterUnloadingStation:setValidUnloadingStations(unloadingStations) end

function AIParameterUnloadingStation:setNextItem() end

function AIParameterUnloadingStation:setPreviousItem() end

---@param fillTypeIndex any
---@param farmId any
function AIParameterUnloadingStation:validate(fillTypeIndex, farmId) end
