---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatisticCounter.lua (generated stub, FS25 Lua Atlas)

--- Plain data object of Precision Farming holding the numeric counters of one farmland (soil samples, lime, fertilizers, manure, seeds, herbicide, yield, fuel, vehicle and helper costs, subsidies, plus 'Regular' variants). It can be reset, loaded and saved as XML attributes and streamed over the network.
---@class FarmlandStatisticCounter
FarmlandStatisticCounter = {}

--- Constructor. Creates the object and initialises every counter to 0 through reset.
---@param customMt any
function FarmlandStatisticCounter.new(customMt) end

--- Reads every counter from XML attributes at the key, keeping the current value as default when an attribute is missing.
---@param xmlFile any
---@param key any
function FarmlandStatisticCounter:loadFromItemsXML(xmlFile, key) end

--- Writes every counter as an attribute (integer for numSoilSamples, float for the others). The usedModNames parameter is unused here.
---@param xmlFile any
---@param key any
---@param usedModNames any
function FarmlandStatisticCounter:saveToXMLFile(xmlFile, key, usedModNames) end

--- Sets all 24 counters (samples, costs, used inputs, yield values, fuel, vehicle/helper costs, subsidies) back to 0.
function FarmlandStatisticCounter:reset() end

--- Reads all counters from the stream: numSoilSamples as 16-bit unsigned, the rest as float32. Must stay in the same order as onWriteStream.
---@param streamId integer
---@param connection Connection
function FarmlandStatisticCounter:onReadStream(streamId, connection) end

--- Writes all counters to the stream (16-bit unsigned for numSoilSamples, float32 for the rest). Note: the 16-bit field caps at 65535 samples.
---@param streamId integer
---@param connection Connection
function FarmlandStatisticCounter:onWriteStream(streamId, connection) end
