---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/FellerBuncherCutEvent.lua (stub généré, atlas Lua FS25)

---@class FellerBuncherCutEvent : Event
FellerBuncherCutEvent = {}

---@return table
function FellerBuncherCutEvent.emptyNew() end

---@param object table
---@return table
function FellerBuncherCutEvent.new(object) end

---@param streamId integer
---@param connection Connection
function FellerBuncherCutEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function FellerBuncherCutEvent:writeStream(streamId, connection) end

---@param connection Connection
function FellerBuncherCutEvent:run(connection) end

---@param vehicle table
---@param noEventSend boolean
function FellerBuncherCutEvent.sendEvent(vehicle, noEventSend) end
