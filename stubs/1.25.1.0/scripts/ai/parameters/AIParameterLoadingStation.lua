---@meta
-- FS25 1.25.1.0 : ai/parameters/AIParameterLoadingStation.lua (stub généré, atlas Lua FS25)

---@class AIParameterLoadingStation : AIParameter
AIParameterLoadingStation = {}

---@param customMt any
function AIParameterLoadingStation.new(customMt) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function AIParameterLoadingStation:saveToXMLFile(xmlFile, key, usedModNames) end

---@param xmlFile any
---@param key any
function AIParameterLoadingStation:loadFromXMLFile(xmlFile, key) end

---@param args any
function AIParameterLoadingStation:onPlaceableLoaded(args) end

---@param uniqueId any
---@param index any
function AIParameterLoadingStation:setLoadingStationFromUniqueId(uniqueId, index) end

---@param streamId any
---@param connection any
function AIParameterLoadingStation:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AIParameterLoadingStation:writeStream(streamId, connection) end

---@param loadingStation any
function AIParameterLoadingStation:setLoadingStation(loadingStation) end

function AIParameterLoadingStation:getLoadingStation() end

function AIParameterLoadingStation:getString() end

---@param loadingStationIds any
function AIParameterLoadingStation:setValidLoadingStations(loadingStationIds) end

function AIParameterLoadingStation:setNextItem() end

function AIParameterLoadingStation:setPreviousItem() end

---@param fillTypeIndex any
---@param farmId any
function AIParameterLoadingStation:validate(fillTypeIndex, farmId) end
