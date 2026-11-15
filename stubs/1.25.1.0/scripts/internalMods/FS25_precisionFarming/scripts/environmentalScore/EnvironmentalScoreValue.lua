---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreValue.lua (stub généré, atlas Lua FS25)

---@class EnvironmentalScoreValue
EnvironmentalScoreValue = {}

---@param pfModule any
---@param customMt any
function EnvironmentalScoreValue.new(pfModule, customMt) end

function EnvironmentalScoreValue:initFarmlandData() end

---@param farmlandId any
function EnvironmentalScoreValue:getFarmlandData(farmlandId) end

---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function EnvironmentalScoreValue:loadFromXML(xmlFile, key, baseDirectory, configFileName, mapFilename) end

---@param xmlFile any
---@param key any
function EnvironmentalScoreValue:loadFromItemsXML(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function EnvironmentalScoreValue:saveToXMLFile(xmlFile, key, usedModNames) end

---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScoreValue:loadFarmlandData(data, xmlFile, key) end

---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScoreValue:saveFarmlandData(data, xmlFile, key) end

---@param streamId integer
---@param connection Connection
---@param farmId any
function EnvironmentalScoreValue:readStream(streamId, connection, farmId) end

---@param streamId integer
---@param connection Connection
---@param farmId any
function EnvironmentalScoreValue:writeStream(streamId, connection, farmId) end

---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScoreValue:readFarmlandDataFromStream(data, streamId, connection) end

---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScoreValue:writeFarmlandDataToStream(data, streamId, connection) end

---@param dt any
function EnvironmentalScoreValue:update(dt) end

function EnvironmentalScoreValue:getScore() end

---@param pfModule any
function EnvironmentalScoreValue:overwriteGameFunctions(pfModule) end
