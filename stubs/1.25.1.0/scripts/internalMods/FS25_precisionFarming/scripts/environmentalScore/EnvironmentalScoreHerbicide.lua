---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreHerbicide.lua (generated stub, FS25 Lua Atlas)

---@class EnvironmentalScoreHerbicide : EnvironmentalScoreValue
EnvironmentalScoreHerbicide = {}

---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function EnvironmentalScoreHerbicide:loadFromXML(xmlFile, key, baseDirectory, configFileName, mapFilename) end

---@param dt any
function EnvironmentalScoreHerbicide:update(dt) end

---@param farmlandId any
function EnvironmentalScoreHerbicide:getScore(farmlandId) end

function EnvironmentalScoreHerbicide:initFarmlandData() end

---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScoreHerbicide:loadFarmlandData(data, xmlFile, key) end

---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScoreHerbicide:saveFarmlandData(data, xmlFile, key) end

---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScoreHerbicide:readFarmlandDataFromStream(data, streamId, connection) end

---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScoreHerbicide:writeFarmlandDataToStream(data, streamId, connection) end

---@param farmlandId any
function EnvironmentalScoreHerbicide:onHarvestScoreReset(farmlandId) end

---@param farmlandId any
---@param area any
---@param type any
function EnvironmentalScoreHerbicide:addWorkedArea(farmlandId, area, type) end

---@param pfModule any
function EnvironmentalScoreHerbicide:overwriteGameFunctions(pfModule) end
