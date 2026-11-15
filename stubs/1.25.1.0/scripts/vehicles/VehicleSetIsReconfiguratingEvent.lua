---@meta
-- FS25 1.25.1.0 : vehicles/VehicleSetIsReconfiguratingEvent.lua (generated stub, FS25 Lua Atlas)

---@class VehicleSetIsReconfiguratingEvent : Event
VehicleSetIsReconfiguratingEvent = {}

---@return table
function VehicleSetIsReconfiguratingEvent.emptyNew() end

---@param object table
function VehicleSetIsReconfiguratingEvent.new(object) end

---@param streamId integer
---@param connection Connection
function VehicleSetIsReconfiguratingEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function VehicleSetIsReconfiguratingEvent:writeStream(streamId, connection) end
