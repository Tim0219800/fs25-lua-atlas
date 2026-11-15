---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/ReceivingHopperSetCreateBoxesEvent.lua (stub généré, atlas Lua FS25)

---@class ReceivingHopperSetCreateBoxesEvent : Event
ReceivingHopperSetCreateBoxesEvent = {}

---@return table
function ReceivingHopperSetCreateBoxesEvent.emptyNew() end

---@param object table
---@param state boolean
function ReceivingHopperSetCreateBoxesEvent.new(object, state) end

---@param streamId integer
---@param connection Connection
function ReceivingHopperSetCreateBoxesEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function ReceivingHopperSetCreateBoxesEvent:writeStream(streamId, connection) end

---@param connection Connection
function ReceivingHopperSetCreateBoxesEvent:run(connection) end

---@param vehicle table
---@param state boolean
---@param noEventSend boolean
function ReceivingHopperSetCreateBoxesEvent.sendEvent(vehicle, state, noEventSend) end
