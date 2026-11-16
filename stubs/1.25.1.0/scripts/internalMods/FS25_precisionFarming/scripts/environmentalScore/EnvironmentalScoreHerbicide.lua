---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreHerbicide.lua (generated stub, FS25 Lua Atlas)

--- Environmental score criterion for weed control. It accumulates treated area per method on each farmland (spot spraying, full spraying, mechanical weeding) and converts the proportions into a 0 to 1 score. Server hooks on Sprayer, Weeder and HarvestExtension feed the data; clients receive only a compressed score. Subclass of EnvironmentalScoreValue.
---@class EnvironmentalScoreHerbicide : EnvironmentalScoreValue
EnvironmentalScoreHerbicide = {}

--- Calls the parent loadFromXML (through EnvironmentalScoreTillage:superClass(), which is the same parent class) and returns its result. Note: no Herbicide.new is defined in this file; it relies on the inherited constructor.
---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function EnvironmentalScoreHerbicide:loadFromXML(xmlFile, key, baseDirectory, configFileName, mapFilename) end

--- Empty update hook.
---@param dt any
function EnvironmentalScoreHerbicide:update(dt) end

--- Returns the weed control score for a farmland. It uses the client score if present, 0.5 when nothing was treated, else a weighted share: spot spray 1, mechanical 0.75, full spray 0.6.
---@param farmlandId any
function EnvironmentalScoreHerbicide:getScore(farmlandId) end

--- Creates the per-farmland record: area by treatment type (all 0) and a pendingReset flag set to false.
function EnvironmentalScoreHerbicide:initFarmlandData() end

--- Reads the three treated areas and pendingReset from the savegame XML attributes.
---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScoreHerbicide:loadFarmlandData(data, xmlFile, key) end

--- Writes the three treated areas and pendingReset as XML attributes.
---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScoreHerbicide:saveFarmlandData(data, xmlFile, key) end

--- Client side: reads the score sent as an 8 bit value (0 to 255) and keeps it as clientScore, rounded to two decimals.
---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScoreHerbicide:readFarmlandDataFromStream(data, streamId, connection) end

--- Server side: writes the current score of the farmland as an 8 bit value (score times 255).
---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScoreHerbicide:writeFarmlandDataToStream(data, streamId, connection) end

--- Flags the farmland so its treated areas are cleared at the next treatment instead of immediately.
---@param farmlandId any
function EnvironmentalScoreHerbicide:onHarvestScoreReset(farmlandId) end

--- Adds treated area of a given type to a farmland, first clearing all three areas if a reset is pending.
---@param farmlandId any
---@param area any
---@param type any
function EnvironmentalScoreHerbicide:addWorkedArea(farmlandId, area, type) end

--- Server only. Hooks Sprayer.processSprayerArea (herbicide counts as spot or full spray depending on getIsSpotSprayEnabled), Weeder.processWeederArea (mechanical) and HarvestExtension.setLastScoringValues (grass harvests count as spot-spray area).
---@param pfModule any
function EnvironmentalScoreHerbicide:overwriteGameFunctions(pfModule) end
