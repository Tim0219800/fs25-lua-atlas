---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/events/PrecisionFarmingSettingsInitialEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event (subclass of Event) that sends the current values of all server-side Precision Farming settings to a client, typically when it joins. Settings flagged isServerSetting are written as one boolean each, in list order.
---@class PrecisionFarmingSettingsInitialEvent : Event
PrecisionFarmingSettingsInitialEvent = {}

--- Creates an empty PrecisionFarmingSettingsInitialEvent instance with the Event metatable; the network layer calls it before readStream fills the fields.
---@return table
function PrecisionFarmingSettingsInitialEvent.emptyNew() end

--- Creates the event with the settings list to send.
---@param settings table
function PrecisionFarmingSettingsInitialEvent.new(settings) end

--- Client side: reads one boolean per server setting into setting.state, in order, then calls run.
---@param streamId integer
---@param connection Connection
function PrecisionFarmingSettingsInitialEvent:readStream(streamId, connection) end

--- Server side: writes one boolean per server setting, in list order. The order must match readStream.
---@param streamId integer
---@param connection Connection
function PrecisionFarmingSettingsInitialEvent:writeStream(streamId, connection) end

--- Calls onSettingChanged(setting, true) on the settings object for every server setting so the client applies the received values.
---@param connection Connection
function PrecisionFarmingSettingsInitialEvent:run(connection) end
