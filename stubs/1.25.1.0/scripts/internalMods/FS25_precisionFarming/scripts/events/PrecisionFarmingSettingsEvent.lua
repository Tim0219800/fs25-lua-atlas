---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/PrecisionFarmingSettingsEvent.lua (stub généré, atlas Lua FS25)

---@class PrecisionFarmingSettingsEvent : Event
PrecisionFarmingSettingsEvent = {}

---@return table
function PrecisionFarmingSettingsEvent.emptyNew() end

---@param setting table
function PrecisionFarmingSettingsEvent.new(setting) end

---@param streamId integer
---@param connection Connection
function PrecisionFarmingSettingsEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PrecisionFarmingSettingsEvent:writeStream(streamId, connection) end

---@param connection Connection
function PrecisionFarmingSettingsEvent:run(connection) end

---@param setting table
---@param noEventSend boolean
function PrecisionFarmingSettingsEvent.sendEvent(setting, noEventSend) end
