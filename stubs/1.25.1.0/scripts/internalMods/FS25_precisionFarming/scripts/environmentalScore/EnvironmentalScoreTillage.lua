---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreTillage.lua (generated stub, FS25 Lua Atlas)

---@class EnvironmentalScoreTillage : EnvironmentalScoreValue
EnvironmentalScoreTillage = {}

---@param pfModule any
---@param customMt any
function EnvironmentalScoreTillage.new(pfModule, customMt) end

---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function EnvironmentalScoreTillage:loadFromXML(xmlFile, key, baseDirectory, configFileName, mapFilename) end

---@param dt any
function EnvironmentalScoreTillage:update(dt) end

---@param farmlandId any
function EnvironmentalScoreTillage:getScore(farmlandId) end

function EnvironmentalScoreTillage:initFarmlandData() end

---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScoreTillage:loadFarmlandData(data, xmlFile, key) end

---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScoreTillage:saveFarmlandData(data, xmlFile, key) end

---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScoreTillage:readFarmlandDataFromStream(data, streamId, connection) end

---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScoreTillage:writeFarmlandDataToStream(data, streamId, connection) end

---@param farmlandId any
---@param area any
---@param type any
function EnvironmentalScoreTillage:addWorkedArea(farmlandId, area, type) end

---@param pfModule any
function EnvironmentalScoreTillage:overwriteGameFunctions(pfModule) end
