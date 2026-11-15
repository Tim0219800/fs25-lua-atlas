---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreSoilSample.lua (generated stub, FS25 Lua Atlas)

---@class EnvironmentalScoreSoilSample : EnvironmentalScoreValue
EnvironmentalScoreSoilSample = {}

---@param pfModule any
---@param customMt any
function EnvironmentalScoreSoilSample.new(pfModule, customMt) end

---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function EnvironmentalScoreSoilSample:loadFromXML(xmlFile, key, baseDirectory, configFileName, mapFilename) end

---@param dt any
function EnvironmentalScoreSoilSample:update(dt) end

---@param farmlandId any
function EnvironmentalScoreSoilSample:getScore(farmlandId) end

function EnvironmentalScoreSoilSample:initFarmlandData() end

---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScoreSoilSample:loadFarmlandData(data, xmlFile, key) end

---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScoreSoilSample:saveFarmlandData(data, xmlFile, key) end

---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScoreSoilSample:readFarmlandDataFromStream(data, streamId, connection) end

---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScoreSoilSample:writeFarmlandDataToStream(data, streamId, connection) end

---@param farmlandId any
function EnvironmentalScoreSoilSample:onHarvestScoreReset(farmlandId) end

---@param farmlandId any
function EnvironmentalScoreSoilSample:updateFarmlandSampleState(farmlandId) end

---@param pfModule any
function EnvironmentalScoreSoilSample:overwriteGameFunctions(pfModule) end
