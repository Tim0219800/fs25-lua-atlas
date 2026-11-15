---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/PalletFillerStateEvent.lua (stub généré, atlas Lua FS25)

---@class PalletFillerStateEvent : Event
PalletFillerStateEvent = {}

---@return table
function PalletFillerStateEvent.emptyNew() end

---@param object table
---@param state table
---@return table
function PalletFillerStateEvent.new(object, state) end

---@param streamId integer
---@param connection Connection
function PalletFillerStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PalletFillerStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function PalletFillerStateEvent:run(connection) end

---@param vehicle table
---@param state integer
---@param noEventSend boolean
function PalletFillerStateEvent.sendEvent(vehicle, state, noEventSend) end
