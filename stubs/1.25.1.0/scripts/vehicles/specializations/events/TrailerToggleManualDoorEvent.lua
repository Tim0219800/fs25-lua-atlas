---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TrailerToggleManualDoorEvent.lua (stub généré, atlas Lua FS25)

---@class TrailerToggleManualDoorEvent : Event
TrailerToggleManualDoorEvent = {}

---@return table
function TrailerToggleManualDoorEvent.emptyNew() end

---@param object table
---@param tipSideIndex boolean
---@param state boolean
function TrailerToggleManualDoorEvent.new(object, tipSideIndex, state) end

---@param streamId integer
---@param connection Connection
function TrailerToggleManualDoorEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function TrailerToggleManualDoorEvent:writeStream(streamId, connection) end

---@param connection Connection
function TrailerToggleManualDoorEvent:run(connection) end

---@param vehicle table
---@param tipSideIndex boolean
---@param state integer
---@param noEventSend boolean
function TrailerToggleManualDoorEvent.sendEvent(vehicle, tipSideIndex, state, noEventSend) end
