---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistic.lua (generated stub, FS25 Lua Atlas)

--- Per-farmland statistics holder of Precision Farming. It owns two FarmlandStatisticCounter objects, one for the current period and one for the whole game, and handles XML save/load, network stream sync, reset and increments.
---@class FarmlandStatistic
FarmlandStatistic = {}

--- Constructor. Stores the farmland id, a hasChanged flag and creates fresh period and total counters.
---@param farmlandId any
---@param customMt any
function FarmlandStatistic.new(farmlandId, customMt) end

--- Loads both counters from the items XML if the stored #farmlandId matches this statistic; otherwise logs a warning and loads nothing.
---@param xmlFile any
---@param key any
function FarmlandStatistic:loadFromItemsXML(xmlFile, key) end

--- Writes the farmland id and both counters (periodCounter, totalCounter) under the given XML key.
---@param xmlFile any
---@param key any
---@param usedModNames any
function FarmlandStatistic:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client side on join: reads period then total counter from the stream. Order must match onWriteStream.
---@param streamId integer
---@param connection Connection
function FarmlandStatistic:onReadStream(streamId, connection) end

--- Server side on join: writes period then total counter to the stream.
---@param streamId integer
---@param connection Connection
function FarmlandStatistic:onWriteStream(streamId, connection) end

--- Resets the period counter; also resets the total counter when clearTotal is true.
---@param clearTotal any
function FarmlandStatistic:reset(clearTotal) end

--- Returns the named value from the total counter if total is true, otherwise from the period counter. Returns 0 for unknown names.
---@param total any
---@param name any
function FarmlandStatistic:getValue(total, name) end

--- Adds a value to the named field of both counters (only fields that exist) and sets hasChanged.
---@param name any
---@param value any
function FarmlandStatistic:updateStatistic(name, value) end
