---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreSoilSample.lua (generated stub, FS25 Lua Atlas)

--- Environmental score criterion for soil sampling. It stores, per farmland, the fraction of the field that has been sampled (-1 when unknown) and uses it directly as the score. The fraction is refreshed from the Precision Farming coverMap after sampler work, soil map purchases and the analyse cheat command (server hooks). Subclass of EnvironmentalScoreValue.
---@class EnvironmentalScoreSoilSample : EnvironmentalScoreValue
EnvironmentalScoreSoilSample = {}

--- Constructor: sets the xmlKey to "soilSample" and defines type weights (none 0, sampled 1).
---@param pfModule any
---@param customMt any
function EnvironmentalScoreSoilSample.new(pfModule, customMt) end

--- Calls the parent loadFromXML (through EnvironmentalScoreTillage:superClass(), the same parent class) and returns its result.
---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function EnvironmentalScoreSoilSample:loadFromXML(xmlFile, key, baseDirectory, configFileName, mapFilename) end

--- Empty update hook.
---@param dt any
function EnvironmentalScoreSoilSample:update(dt) end

--- Returns the sampled fraction of the farmland (0 to 1), the client score if present, or 0.5 while no sample state is known.
---@param farmlandId any
function EnvironmentalScoreSoilSample:getScore(farmlandId) end

--- Creates the per-farmland record with samplePercentage set to -1 (unknown).
function EnvironmentalScoreSoilSample:initFarmlandData() end

--- Reads samplePercentage from the savegame XML.
---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScoreSoilSample:loadFarmlandData(data, xmlFile, key) end

--- Writes samplePercentage to the savegame XML.
---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScoreSoilSample:saveFarmlandData(data, xmlFile, key) end

--- Client side: reads an 8 bit score and stores it as clientScore, rounded to two decimals.
---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScoreSoilSample:readFarmlandDataFromStream(data, streamId, connection) end

--- Server side: writes the current score as an 8 bit value (score times 255).
---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScoreSoilSample:writeFarmlandDataToStream(data, streamId, connection) end

--- When the harvest scoring period ends, recomputes the sampled percentage of the farmland instead of flagging a reset.
---@param farmlandId any
function EnvironmentalScoreSoilSample:onHarvestScoreReset(farmlandId) end

--- Reads the sampled share of a farmland from pfModule.coverMap:getFarmlandSampleState and stores it clamped to 0 to 1.
---@param farmlandId any
function EnvironmentalScoreSoilSample:updateFarmlandSampleState(farmlandId) end

--- Server only. Hooks SoilSampler.processSoilSampling, CoverMap.onCoverUpdateFinished and CoverMap.analyseArea. Note: the second hook calls self:onFarmlandSampleStatesFinished, which is not defined in this dump (UNVERIFIED).
---@param pfModule any
function EnvironmentalScoreSoilSample:overwriteGameFunctions(pfModule) end
