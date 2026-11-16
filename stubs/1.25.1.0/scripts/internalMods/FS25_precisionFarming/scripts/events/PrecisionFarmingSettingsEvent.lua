---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/PrecisionFarmingSettingsEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) that propagates a changed Precision Farming setting. A setting is identified by its index (settingIndexNumBits bits) plus a boolean state; only boolean settings are supported.
---@class PrecisionFarmingSettingsEvent : Event
PrecisionFarmingSettingsEvent = {}

--- Creates an empty PrecisionFarmingSettingsEvent instance with the Event metatable; the network layer calls it before readStream fills the fields.
---@return table
function PrecisionFarmingSettingsEvent.emptyNew() end

--- Creates the event for a setting table.
---@param setting table
function PrecisionFarmingSettingsEvent.new(setting) end

--- Reads the setting index and the boolean state, writes the state into the matching setting of g_precisionFarming.precisionFarmingSettings, then calls run.
---@param streamId integer
---@param connection Connection
function PrecisionFarmingSettingsEvent:readStream(streamId, connection) end

--- Writes the setting index and its state as a boolean (anything other than true is written as false).
---@param streamId integer
---@param connection Connection
function PrecisionFarmingSettingsEvent:writeStream(streamId, connection) end

--- Receiving side. The server re-broadcasts to the other clients, then every side calls precisionFarmingSettings:onSettingChanged(setting, true) so no new event is sent.
---@param connection Connection
function PrecisionFarmingSettingsEvent:run(connection) end

--- Entry point to sync a changed setting. Server: broadcasts to all clients; client: sends it to the server. Does nothing when noEventSend is true.
---@param setting table
---@param noEventSend boolean
function PrecisionFarmingSettingsEvent.sendEvent(setting, noEventSend) end
