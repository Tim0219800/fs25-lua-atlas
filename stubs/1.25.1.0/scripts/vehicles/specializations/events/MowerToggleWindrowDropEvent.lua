---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/MowerToggleWindrowDropEvent.lua (generated stub, FS25 Lua Atlas)

---@class MowerToggleWindrowDropEvent : Event
MowerToggleWindrowDropEvent = {}

---@return table
function MowerToggleWindrowDropEvent.emptyNew() end

---@param object table
---@param useMowerWindrowDropAreas boolean
function MowerToggleWindrowDropEvent.new(object, useMowerWindrowDropAreas) end

---@param streamId integer
---@param connection Connection
function MowerToggleWindrowDropEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function MowerToggleWindrowDropEvent:writeStream(streamId, connection) end

---@param connection Connection
function MowerToggleWindrowDropEvent:run(connection) end

---@param vehicle table
---@param useMowerWindrowDropAreas boolean
---@param noEventSend boolean
function MowerToggleWindrowDropEvent.sendEvent(vehicle, useMowerWindrowDropAreas, noEventSend) end
