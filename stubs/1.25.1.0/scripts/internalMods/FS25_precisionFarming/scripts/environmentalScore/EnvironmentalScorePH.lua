---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScorePH.lua (generated stub, FS25 Lua Atlas)

---@class EnvironmentalScorePH : EnvironmentalScoreValue
EnvironmentalScorePH = {}

---@param pfModule any
---@param customMt any
function EnvironmentalScorePH.new(pfModule, customMt) end

---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function EnvironmentalScorePH:loadFromXML(xmlFile, key, baseDirectory, configFileName, mapFilename) end

---@param dt any
function EnvironmentalScorePH:update(dt) end

---@param farmlandId any
function EnvironmentalScorePH:getScore(farmlandId) end

function EnvironmentalScorePH:initFarmlandData() end

---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScorePH:loadFarmlandData(data, xmlFile, key) end

---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScorePH:saveFarmlandData(data, xmlFile, key) end

---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScorePH:readFarmlandDataFromStream(data, streamId, connection) end

---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScorePH:writeFarmlandDataToStream(data, streamId, connection) end

---@param farmlandId any
function EnvironmentalScorePH:onHarvestScoreReset(farmlandId) end

---@param farmlandId any
---@param area any
---@param nOffset any
function EnvironmentalScorePH:addWorkedArea(farmlandId, area, nOffset) end

---@param pfModule any
function EnvironmentalScorePH:overwriteGameFunctions(pfModule) end
