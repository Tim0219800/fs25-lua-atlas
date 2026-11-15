---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScore.lua (stub généré, atlas Lua FS25)

---@class EnvironmentalScore
EnvironmentalScore = {}

---@param pfModule any
---@param customMt any
function EnvironmentalScore.new(pfModule, customMt) end

function EnvironmentalScore:delete() end

---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function EnvironmentalScore:loadFromXML(xmlFile, key, baseDirectory, configFileName, mapFilename) end

---@param xmlFile any
---@param key any
function EnvironmentalScore:loadFromItemsXML(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function EnvironmentalScore:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
---@param farmId any
function EnvironmentalScore:readStream(streamId, connection, farmId) end

---@param streamId integer
---@param connection Connection
---@param farmId any
function EnvironmentalScore:writeStream(streamId, connection, farmId) end

---@param dt any
function EnvironmentalScore:update(dt) end

---@param state any
function EnvironmentalScore:toggleWindowSize(state) end

---@param mapFrame any
function EnvironmentalScore:setMapFrame(mapFrame) end

function EnvironmentalScore:onEnvScoreDetailsButton() end

function EnvironmentalScore:updateInputGlyphs() end

---@param mapFrame any
function EnvironmentalScore:onMapFrameOpen(mapFrame) end

---@param farmlandId any
function EnvironmentalScore:onHarvestScoreReset(farmlandId) end

---@param farmlandId any
function EnvironmentalScore:getFarmlandScore(farmlandId) end

---@param scoreValue any
---@param farmId any
function EnvironmentalScore:getTotalScoreFromValue(scoreValue, farmId) end

---@param farmId any
function EnvironmentalScore:getTotalScore(farmId) end

function EnvironmentalScore:updateUI() end

---@param element any
---@param ingameMap any
function EnvironmentalScore:onDraw(element, ingameMap) end

---@param element any
---@param ingameMap any
---@param x any
---@param y any
---@param farmland any
function EnvironmentalScore:onDrawFieldNumber(element, ingameMap, x, y, farmland) end

---@param x any
---@param y any
---@param dataKey any
---@param farmlandId any
---@param zoom any
function EnvironmentalScore:drawFarmlandScore(x, y, dataKey, farmlandId, zoom) end

---@param currentPeriod any
function EnvironmentalScore:onPeriodChanged(currentPeriod) end

function EnvironmentalScore:setColorBlindMode() end

---@param pfModule any
function EnvironmentalScore:overwriteGameFunctions(pfModule) end
