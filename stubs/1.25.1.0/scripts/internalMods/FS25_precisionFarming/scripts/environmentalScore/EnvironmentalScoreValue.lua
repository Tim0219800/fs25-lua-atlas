---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreValue.lua (generated stub, FS25 Lua Atlas)

--- Base class for one criterion of the environmental score. It keeps a table of per-farmland data (farmlandDatas), handles generic loading and saving under the criterion's xmlKey, and the network stream layout (count, then farmland id plus data). Subclasses override getScore (0 to 1), initFarmlandData, the load/save/stream hooks and overwriteGameFunctions.
---@class EnvironmentalScoreValue
EnvironmentalScoreValue = {}

--- Constructor: stores pfModule and sets the default xmlKey to "default". Subclasses pass their own metatable and xmlKey.
---@param pfModule any
---@param customMt any
function EnvironmentalScoreValue.new(pfModule, customMt) end

--- Returns a fresh per-farmland data table; the base version returns an empty table and is meant to be overridden.
function EnvironmentalScoreValue:initFarmlandData() end

--- Returns the data table of a farmland, creating it through initFarmlandData (and storing the farmlandId in it) on first access. Returns nil for a nil id.
---@param farmlandId any
function EnvironmentalScoreValue:getFarmlandData(farmlandId) end

--- Initialises an empty farmlandDatas table and returns true. Subclasses call it first when loading their map XML configuration.
---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function EnvironmentalScoreValue:loadFromXML(xmlFile, key, baseDirectory, configFileName, mapFilename) end

--- Savegame loading: iterates the <xmlKey>.farmland entries and passes each to loadFarmlandData for the matching farmland id.
---@param xmlFile any
---@param key any
function EnvironmentalScoreValue:loadFromItemsXML(xmlFile, key) end

--- Savegame writing: writes one <xmlKey>.farmland entry per stored farmland and lets saveFarmlandData add the details.
---@param xmlFile any
---@param key any
---@param usedModNames any
function EnvironmentalScoreValue:saveToXMLFile(xmlFile, key, usedModNames) end

--- Empty hook to read one farmland's saved values; overridden by subclasses.
---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScoreValue:loadFarmlandData(data, xmlFile, key) end

--- Empty hook to write one farmland's values; overridden by subclasses.
---@param data any
---@param xmlFile any
---@param key any
function EnvironmentalScoreValue:saveFarmlandData(data, xmlFile, key) end

--- Client side read: reads a farmland count, then for each entry a farmland id and the data via readFarmlandDataFromStream. Bit width comes from g_farmlandManager.numberOfBits.
---@param streamId integer
---@param connection Connection
---@param farmId any
function EnvironmentalScoreValue:readStream(streamId, connection, farmId) end

--- Server side write: counts the farmlands owned by the given farm, then writes each farmland id followed by its data via writeFarmlandDataToStream.
---@param streamId integer
---@param connection Connection
---@param farmId any
function EnvironmentalScoreValue:writeStream(streamId, connection, farmId) end

--- Empty hook for reading one farmland's data from a stream; overridden by subclasses.
---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScoreValue:readFarmlandDataFromStream(data, streamId, connection) end

--- Empty hook for writing one farmland's data to a stream; overridden by subclasses.
---@param data any
---@param streamId any
---@param connection any
function EnvironmentalScoreValue:writeFarmlandDataToStream(data, streamId, connection) end

--- Empty per-frame update hook for subclasses.
---@param dt any
function EnvironmentalScoreValue:update(dt) end

--- Returns a neutral score of 0.5; subclasses return a 0 to 1 value for a given farmland id.
function EnvironmentalScoreValue:getScore() end

--- Hooks FertilizingSowingMachine.processSowingMachineArea to count direct-planting area through addWorkedArea. Note: the base class has no addWorkedArea, and every subclass overrides this method, so this body appears to be unused leftover code.
---@param pfModule any
function EnvironmentalScoreValue:overwriteGameFunctions(pfModule) end
