---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TrailerToggleManualTipEvent.lua (stub généré, atlas Lua FS25)

---@class TrailerToggleManualTipEvent : Event
TrailerToggleManualTipEvent = {}

---@return table
function TrailerToggleManualTipEvent.emptyNew() end

---@param object table
---@param state boolean
---@return TrailerToggleManualTipEvent
function TrailerToggleManualTipEvent.new(object, state) end

---@param streamId integer
---@param connection Connection
function TrailerToggleManualTipEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function TrailerToggleManualTipEvent:writeStream(streamId, connection) end

---@param connection Connection
function TrailerToggleManualTipEvent:run(connection) end

---@param vehicle table
---@param state boolean
---@param noEventSend boolean?
function TrailerToggleManualTipEvent.sendEvent(vehicle, state, noEventSend) end
