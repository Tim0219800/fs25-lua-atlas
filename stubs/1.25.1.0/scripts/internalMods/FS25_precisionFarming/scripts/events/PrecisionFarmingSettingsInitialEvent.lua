---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/PrecisionFarmingSettingsInitialEvent.lua (generated stub, FS25 Lua Atlas)

---@class PrecisionFarmingSettingsInitialEvent : Event
PrecisionFarmingSettingsInitialEvent = {}

---@return table
function PrecisionFarmingSettingsInitialEvent.emptyNew() end

---@param settings table
function PrecisionFarmingSettingsInitialEvent.new(settings) end

---@param streamId integer
---@param connection Connection
function PrecisionFarmingSettingsInitialEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PrecisionFarmingSettingsInitialEvent:writeStream(streamId, connection) end

---@param connection Connection
function PrecisionFarmingSettingsInitialEvent:run(connection) end
