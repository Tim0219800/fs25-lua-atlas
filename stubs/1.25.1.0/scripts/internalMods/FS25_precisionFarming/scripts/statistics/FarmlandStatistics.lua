---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistics.lua (generated stub, FS25 Lua Atlas)

---@class FarmlandStatistics
FarmlandStatistics = {}

---@param pfModule any
---@param customMt any
function FarmlandStatistics.new(pfModule, customMt) end

---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function FarmlandStatistics:loadFromXML(xmlFile, key, baseDirectory, configFileName, mapFilename) end

---@param xmlFile any
---@param key any
function FarmlandStatistics:loadFromItemsXML(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function FarmlandStatistics:saveToXMLFile(xmlFile, key, usedModNames) end

function FarmlandStatistics:delete() end

---@param farmlandId any
---@param streamId any
---@param connection any
function FarmlandStatistics:readStatisticFromStream(farmlandId, streamId, connection) end

---@param farmlandId any
---@param streamId any
---@param connection any
function FarmlandStatistics:writeStatisticToStream(farmlandId, streamId, connection) end

---@param mapFrame any
function FarmlandStatistics:setMapFrame(mapFrame) end

---@param actions any
function FarmlandStatistics:collectFarmlandHotspotActions(actions) end

---@param farmlandId any
---@param noEventSend any
function FarmlandStatistics:openStatistics(farmlandId, noEventSend) end

---@param farmlandId any
function FarmlandStatistics:getFarmlandFieldInfo(farmlandId) end

---@param farmlandId any
---@param name any
---@param value any
function FarmlandStatistics:updateStatistic(farmlandId, name, value) end

---@param farmlandId any
---@param clearTotal any
function FarmlandStatistics:resetStatistic(farmlandId, clearTotal) end

---@param fillLevel any
---@param fillTypeIndex any
function FarmlandStatistics:getFillLevelWeight(fillLevel, fillTypeIndex) end

---@param fillLevel any
---@param fillTypeIndex any
function FarmlandStatistics:getFillLevelPrice(fillLevel, fillTypeIndex) end

---@param pfModule any
function FarmlandStatistics:overwriteGameFunctions(pfModule) end
