---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistics.lua (generated stub, FS25 Lua Atlas)

--- Manager of all FarmlandStatistic objects of Precision Farming, created by the precision farming module. It saves/loads them, syncs a farmland's statistics to clients on request, opens the economic analysis dialog from the map, and converts quantities to weight or price. It hooks FarmlandManager.loadFarmlandData to create one statistic per farmland.
---@class FarmlandStatistics
FarmlandStatistics = {}

--- Constructor. Keeps a reference to the precision farming module and creates empty lists of statistics (ordered and indexed by farmland id).
---@param pfModule any
---@param customMt any
function FarmlandStatistics.new(pfModule, customMt) end

--- Subscribes to the FARMLAND_OWNER_CHANGED message (handler onFarmlandStateChanged, not in this file, UNVERIFIED) and returns true. Ignores the XML arguments.
---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function FarmlandStatistics:loadFromXML(xmlFile, key, baseDirectory, configFileName, mapFilename) end

--- Loads each statistic from '<key>.farmlandStatistics.farmlandStatistic(i)' in list order, stopping at the first missing entry.
---@param xmlFile any
---@param key any
function FarmlandStatistics:loadFromItemsXML(xmlFile, key) end

--- Saves every statistic as an indexed farmlandStatistic entry under '<key>.farmlandStatistics'.
---@param xmlFile any
---@param key any
---@param usedModNames any
function FarmlandStatistics:saveToXMLFile(xmlFile, key, usedModNames) end

--- Unsubscribes from all messages and clears the statistics lists.
function FarmlandStatistics:delete() end

--- Client side: reads an optional total field area (stored on the farmland) and the farmland's statistic, then opens the statistics dialog without sending a request back.
---@param farmlandId any
---@param streamId any
---@param connection any
function FarmlandStatistics:readStatisticFromStream(farmlandId, streamId, connection) end

--- Server side: writes a flag and the farmland's total field area when the farmland exists, then the farmland's statistic. Counterpart of readStatisticFromStream.
---@param farmlandId any
---@param streamId any
---@param connection any
function FarmlandStatistics:writeStatisticToStream(farmlandId, streamId, connection) end

--- Stores the map frame used later to clear the map selection when opening statistics.
---@param mapFrame any
function FarmlandStatistics:setMapFrame(mapFrame) end

--- Appends an 'economic analysis' action to the farmland hotspot action list, bound to openStatistics.
---@param actions any
function FarmlandStatistics:collectFarmlandHotspotActions(actions) end

--- Clears the map selection and shows FarmlandStatsDialog when the farmland has a statistic and a field area of at least 0.01. A client without server sends RequestFarmlandStatisticsEvent unless noEventSend is set.
---@param farmlandId any
---@param noEventSend any
function FarmlandStatistics:openStatistics(farmlandId, noEventSend) end

--- Delegates to the precision farming module's getFarmlandFieldInfo and returns field number and area (implementation not in this file, UNVERIFIED).
---@param farmlandId any
function FarmlandStatistics:getFarmlandFieldInfo(farmlandId) end

--- Adds a value to the named counter of the given farmland's statistic, if that farmland has one.
---@param farmlandId any
---@param name any
---@param value any
function FarmlandStatistics:updateStatistic(farmlandId, name, value) end

--- Resets the period counter of a farmland's statistic, and the total too when clearTotal is true.
---@param farmlandId any
---@param clearTotal any
function FarmlandStatistics:resetStatistic(farmlandId, clearTotal) end

--- Converts a fill level into weight using the fill type's massPerLiter divided by FillTypeManager.MASS_SCALE; returns the level unchanged for an unknown type.
---@param fillLevel any
---@param fillTypeIndex any
function FarmlandStatistics:getFillLevelWeight(fillLevel, fillTypeIndex) end

--- Returns fillLevel times price per liter. The special id 'soilSamples' uses the soil map's price per sample for the current economic difficulty. Unknown types return the level unchanged.
---@param fillLevel any
---@param fillTypeIndex any
function FarmlandStatistics:getFillLevelPrice(fillLevel, fillTypeIndex) end

--- Registers FarmlandStatsDialog and overrides FarmlandManager.loadFarmlandData: after the original succeeds, it creates one FarmlandStatistic per farmland. Returns false if the original fails.
---@param pfModule any
function FarmlandStatistics:overwriteGameFunctions(pfModule) end
