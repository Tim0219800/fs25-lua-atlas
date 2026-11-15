---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/SetFillUnitCapacityEvent.lua (stub généré, atlas Lua FS25)

---@class SetFillUnitCapacityEvent : Event
SetFillUnitCapacityEvent = {}

---@return table
function SetFillUnitCapacityEvent.emptyNew() end

---@param vehicle table
---@param fillUnitIndex boolean
---@param capacity boolean
function SetFillUnitCapacityEvent.new(vehicle, fillUnitIndex, capacity) end

---@param streamId integer
---@param connection Connection
function SetFillUnitCapacityEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function SetFillUnitCapacityEvent:writeStream(streamId, connection) end

---@param connection Connection
function SetFillUnitCapacityEvent:run(connection) end

---@param vehicle table
---@param fillUnitIndex boolean
---@param capacity boolean
---@param noEventSend boolean
function SetFillUnitCapacityEvent.sendEvent(vehicle, fillUnitIndex, capacity, noEventSend) end
