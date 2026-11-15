---@meta
-- FS25 1.25.1.0 : vehicles/VehicleSetIsReconfiguratingEvent.lua (stub généré, atlas Lua FS25)

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
