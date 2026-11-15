---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/FellerBuncherReleaseEvent.lua (generated stub, FS25 Lua Atlas)

---@class FellerBuncherReleaseEvent : Event
FellerBuncherReleaseEvent = {}

---@return table
function FellerBuncherReleaseEvent.emptyNew() end

---@param object table
---@return table
function FellerBuncherReleaseEvent.new(object) end

---@param streamId integer
---@param connection Connection
function FellerBuncherReleaseEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function FellerBuncherReleaseEvent:writeStream(streamId, connection) end

---@param connection Connection
function FellerBuncherReleaseEvent:run(connection) end

---@param vehicle table
---@param noEventSend boolean
function FellerBuncherReleaseEvent.sendEvent(vehicle, noEventSend) end
