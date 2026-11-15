---@meta
-- FS25 1.25.1.0 : vehicles/VehicleLowerImplementEvent.lua (stub généré, atlas Lua FS25)

---@class VehicleLowerImplementEvent : Event
VehicleLowerImplementEvent = {}

---@return table
function VehicleLowerImplementEvent.emptyNew() end

---@param vehicle table
---@param jointIndex integer
---@param moveDown boolean
---@return table
function VehicleLowerImplementEvent.new(vehicle, jointIndex, moveDown) end

---@param streamId integer
---@param connection Connection
function VehicleLowerImplementEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function VehicleLowerImplementEvent:writeStream(streamId, connection) end

---@param connection Connection
function VehicleLowerImplementEvent:run(connection) end

---@param vehicle table
---@param jointIndex integer
---@param moveDown boolean
---@param noEventSend boolean
function VehicleLowerImplementEvent.sendEvent(vehicle, jointIndex, moveDown, noEventSend) end
