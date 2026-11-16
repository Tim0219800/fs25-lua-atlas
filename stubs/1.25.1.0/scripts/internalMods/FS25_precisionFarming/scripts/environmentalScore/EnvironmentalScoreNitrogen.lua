---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreNitrogen.lua (generated stub, FS25 Lua Atlas)

--- Environmental score criterion for nitrogen fertilisation accuracy. On each harvest it records the difference between applied and target nitrogen, averaged per harvested area, and maps it to a 0 to 1 score through a curve read from XML (scoreMapping.scoreValue with nOffset and score). Server-side hook on HarvestExtension; clients get a compressed score. Subclass of EnvironmentalScoreValue.
---@class EnvironmentalScoreNitrogen : EnvironmentalScoreValue
EnvironmentalScoreNitrogen = {}

--- Constructor: builds on the parent constructor and sets the xmlKey to "nitrogen".
---@param pfModule any
---@param customMt any
function EnvironmentalScoreNitrogen.new(pfModule, customMt) end

--- Loads the score curve from scoreMapping.scoreValue entries. Each nOffset is divided by the nitrogen of one state change from g_precisionFarming.nitrogenMap when that map exists, so the curve is expressed in map states.
---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function EnvironmentalScoreNitrogen:loadFromXML(xmlFile, key, baseDirectory, configFileName, mapFilename) end

--- Empty update hook.
---@param dt any
function EnvironmentalScoreNitrogen:update(dt) end

--- Returns the nitrogen score: the client score if present, else the curve value for the average offset (offset sum over harvested area, rescaled by COMPRESSION), or 0.5 with no harvested area.
---@param farmlandId any
function EnvironmentalScoreNitrogen:getScore(farmlandId) end

--- Creates the per-farmland record: harvestedArea 0, nOffsetSum 0, pendingReset false.
function EnvironmentalScoreNitrogen:initFarmlandData() end

--- Reads harvestedArea, nOffsetSum and pendingReset from the savegame XML.
---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScoreNitrogen:loadFarmlandData(data, xmlFile, key) end

--- Writes harvestedArea, nOffsetSum and pendingReset to the savegame XML.
---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScoreNitrogen:saveFarmlandData(data, xmlFile, key) end

--- Client side: reads an 8 bit score and stores it as clientScore, rounded to two decimals.
---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScoreNitrogen:readFarmlandDataFromStream(data, streamId, connection) end

--- Server side: writes the current score as an 8 bit value (score times 255).
---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScoreNitrogen:writeFarmlandDataToStream(data, streamId, connection) end

--- Flags the farmland so its accumulated values are cleared on the next harvest record.
---@param farmlandId any
function EnvironmentalScoreNitrogen:onHarvestScoreReset(farmlandId) end

--- Adds a harvested area and its nitrogen offset (both divided by COMPRESSION) to the farmland sums, resetting them first if a reset is pending.
---@param farmlandId any
---@param area any
---@param nOffset any
function EnvironmentalScoreNitrogen:addWorkedArea(farmlandId, area, nOffset) end

--- Server only. Hooks HarvestExtension.setLastScoringValues and records nActual minus nTarget for the harvested area; with ignoreOverfertilization, positive differences are clamped to 0.
---@param pfModule any
function EnvironmentalScoreNitrogen:overwriteGameFunctions(pfModule) end
