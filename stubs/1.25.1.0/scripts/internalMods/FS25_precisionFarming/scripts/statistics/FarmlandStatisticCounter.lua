---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatisticCounter.lua (stub généré, atlas Lua FS25)

---@class FarmlandStatisticCounter
FarmlandStatisticCounter = {}

---@param customMt any
function FarmlandStatisticCounter.new(customMt) end

---@param xmlFile any
---@param key any
function FarmlandStatisticCounter:loadFromItemsXML(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function FarmlandStatisticCounter:saveToXMLFile(xmlFile, key, usedModNames) end

function FarmlandStatisticCounter:reset() end

---@param streamId integer
---@param connection Connection
function FarmlandStatisticCounter:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function FarmlandStatisticCounter:onWriteStream(streamId, connection) end
