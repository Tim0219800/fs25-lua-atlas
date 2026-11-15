---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistic.lua (stub généré, atlas Lua FS25)

---@class FarmlandStatistic
FarmlandStatistic = {}

---@param farmlandId any
---@param customMt any
function FarmlandStatistic.new(farmlandId, customMt) end

---@param xmlFile any
---@param key any
function FarmlandStatistic:loadFromItemsXML(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function FarmlandStatistic:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function FarmlandStatistic:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function FarmlandStatistic:onWriteStream(streamId, connection) end

---@param clearTotal any
function FarmlandStatistic:reset(clearTotal) end

---@param total any
---@param name any
function FarmlandStatistic:getValue(total, name) end

---@param name any
---@param value any
function FarmlandStatistic:updateStatistic(name, value) end
