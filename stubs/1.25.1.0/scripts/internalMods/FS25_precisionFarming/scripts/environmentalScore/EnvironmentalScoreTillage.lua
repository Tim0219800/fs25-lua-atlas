---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreTillage.lua (generated stub, FS25 Lua Atlas)

--- Environmental score criterion for tillage. Per farmland it tracks the worked area (in square meters) for each tillage type (none, deep cultivation, flat cultivation, direct planting) and weights them (0.5, 0, 0.5, 1) into a 0 to 1 score. Server hooks on Cultivator, SowingMachine, FertilizingSowingMachine and HarvestExtension feed it. Subclass of EnvironmentalScoreValue.
---@class EnvironmentalScoreTillage : EnvironmentalScoreValue
EnvironmentalScoreTillage = {}

--- Constructor: sets the xmlKey to "tillage" and the weight of each tillage type.
---@param pfModule any
---@param customMt any
function EnvironmentalScoreTillage.new(pfModule, customMt) end

--- Calls the parent loadFromXML and returns its result.
---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function EnvironmentalScoreTillage:loadFromXML(xmlFile, key, baseDirectory, configFileName, mapFilename) end

--- Empty update hook.
---@param dt any
function EnvironmentalScoreTillage:update(dt) end

--- Returns the tillage score: the client score if present, else the sum over types of the worked share of the field (capped at 1) times the type weight, capped at 1. Without field area it returns the weight of the none type.
---@param farmlandId any
function EnvironmentalScoreTillage:getScore(farmlandId) end

--- Creates the per-farmland record. The none-type area starts at math.huge as a marker meaning "not yet initialised"; the other areas start at 0.
function EnvironmentalScoreTillage:initFarmlandData() end

--- Reads totalFieldArea and the four worked areas (none, deep, flat, direct) from the savegame XML.
---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScoreTillage:loadFarmlandData(data, xmlFile, key) end

--- Writes the total field area and the four worked areas, but only once the record has been initialised (none-type area no longer math.huge).
---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScoreTillage:saveFarmlandData(data, xmlFile, key) end

--- Client side: reads an 8 bit score and stores it as clientScore, rounded to two decimals.
---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScoreTillage:readFarmlandDataFromStream(data, streamId, connection) end

--- Server side: writes the current score as an 8 bit value (score times 255).
---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScoreTillage:writeFarmlandDataToStream(data, streamId, connection) end

--- Registers area worked with a tillage type. On first use the farmland's total area becomes the none-type area; the converted area is then taken evenly from the other types and added to the given type.
---@param farmlandId any
---@param area any
---@param type any
function EnvironmentalScoreTillage:addWorkedArea(farmlandId, area, type) end

--- Server only. Hooks Cultivator.processCultivatorArea (deep or flat by useDeepMode), SowingMachine and FertilizingSowingMachine.processSowingMachineArea (direct planting) and HarvestExtension.setLastScoringValues (grass counts as direct planting). Uses vehicle:getPFStatisticInfo for the farmland.
---@param pfModule any
function EnvironmentalScoreTillage:overwriteGameFunctions(pfModule) end
