---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScorePH.lua (generated stub, FS25 Lua Atlas)

--- Environmental score criterion for soil pH management. On each harvest it records the difference between actual and target pH, averaged per harvested area, and maps it to a 0 to 1 score with an XML curve (scoreMapping.scoreValue with phOffset and score). Server-side hook on HarvestExtension; clients get a compressed score. Subclass of EnvironmentalScoreValue.
---@class EnvironmentalScorePH : EnvironmentalScoreValue
EnvironmentalScorePH = {}

--- Constructor: builds on the parent constructor and sets the xmlKey to "ph".
---@param pfModule any
---@param customMt any
function EnvironmentalScorePH.new(pfModule, customMt) end

--- Loads the score curve from scoreMapping.scoreValue entries. Each phOffset is divided by the pH change of one state from g_precisionFarming.pHMap when that map exists.
---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function EnvironmentalScorePH:loadFromXML(xmlFile, key, baseDirectory, configFileName, mapFilename) end

--- Empty update hook.
---@param dt any
function EnvironmentalScorePH:update(dt) end

--- Returns the pH score: the client score if present, else the curve value for the average offset (sum over harvested area, rescaled by COMPRESSION), or 0.5 with no harvested area.
---@param farmlandId any
function EnvironmentalScorePH:getScore(farmlandId) end

--- Creates the per-farmland record: harvestedArea 0, phOffsetSum 0, pendingReset false.
function EnvironmentalScorePH:initFarmlandData() end

--- Reads harvestedArea, phOffsetSum and pendingReset from the savegame XML.
---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScorePH:loadFarmlandData(data, xmlFile, key) end

--- Writes harvestedArea, phOffsetSum and pendingReset to the savegame XML.
---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScorePH:saveFarmlandData(data, xmlFile, key) end

--- Client side: reads an 8 bit score and stores it as clientScore, rounded to two decimals.
---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScorePH:readFarmlandDataFromStream(data, streamId, connection) end

--- Server side: writes the current score as an 8 bit value (score times 255).
---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScorePH:writeFarmlandDataToStream(data, streamId, connection) end

--- Flags the farmland so its accumulated values are cleared on the next harvest record.
---@param farmlandId any
function EnvironmentalScorePH:onHarvestScoreReset(farmlandId) end

--- Adds a harvested area and its pH offset (both divided by COMPRESSION) to the farmland sums, resetting them first if a reset is pending. The third parameter is named nOffset in the source but carries a pH difference.
---@param farmlandId any
---@param area any
---@param nOffset any
function EnvironmentalScorePH:addWorkedArea(farmlandId, area, nOffset) end

--- Server only. Hooks HarvestExtension.setLastScoringValues and records pHActual minus pHTarget for the harvested area when both values are present.
---@param pfModule any
function EnvironmentalScorePH:overwriteGameFunctions(pfModule) end
