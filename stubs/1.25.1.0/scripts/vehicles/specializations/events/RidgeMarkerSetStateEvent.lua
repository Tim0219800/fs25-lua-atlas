---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/RidgeMarkerSetStateEvent.lua (stub généré, atlas Lua FS25)

---@class RidgeMarkerSetStateEvent : Event
RidgeMarkerSetStateEvent = {}

---@return table
function RidgeMarkerSetStateEvent.emptyNew() end

---@param vehicle table
---@param state integer
function RidgeMarkerSetStateEvent.new(vehicle, state) end

---@param streamId integer
---@param connection Connection
function RidgeMarkerSetStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function RidgeMarkerSetStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function RidgeMarkerSetStateEvent:run(connection) end

---@param vehicle table
---@param state integer
---@param noEventSend boolean
function RidgeMarkerSetStateEvent.sendEvent(vehicle, state, noEventSend) end
