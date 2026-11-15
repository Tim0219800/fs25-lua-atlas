---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreNitrogen.lua (stub généré, atlas Lua FS25)

---@class EnvironmentalScoreNitrogen : EnvironmentalScoreValue
EnvironmentalScoreNitrogen = {}

---@param pfModule any
---@param customMt any
function EnvironmentalScoreNitrogen.new(pfModule, customMt) end

---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function EnvironmentalScoreNitrogen:loadFromXML(xmlFile, key, baseDirectory, configFileName, mapFilename) end

---@param dt any
function EnvironmentalScoreNitrogen:update(dt) end

---@param farmlandId any
function EnvironmentalScoreNitrogen:getScore(farmlandId) end

function EnvironmentalScoreNitrogen:initFarmlandData() end

---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScoreNitrogen:loadFarmlandData(data, xmlFile, key) end

---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScoreNitrogen:saveFarmlandData(data, xmlFile, key) end

---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScoreNitrogen:readFarmlandDataFromStream(data, streamId, connection) end

---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScoreNitrogen:writeFarmlandDataToStream(data, streamId, connection) end

---@param farmlandId any
function EnvironmentalScoreNitrogen:onHarvestScoreReset(farmlandId) end

---@param farmlandId any
---@param area any
---@param nOffset any
function EnvironmentalScoreNitrogen:addWorkedArea(farmlandId, area, nOffset) end

---@param pfModule any
function EnvironmentalScoreNitrogen:overwriteGameFunctions(pfModule) end
