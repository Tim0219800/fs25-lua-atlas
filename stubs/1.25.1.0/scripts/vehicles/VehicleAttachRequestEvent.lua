---@meta
-- FS25 1.25.1.0 : vehicles/VehicleAttachRequestEvent.lua (generated stub, FS25 Lua Atlas)

---@class VehicleAttachRequestEvent : Event
VehicleAttachRequestEvent = {}

---@return table
function VehicleAttachRequestEvent.emptyNew() end

---@param info table
---@return table
function VehicleAttachRequestEvent.new(info) end

---@param streamId integer
---@param connection Connection
function VehicleAttachRequestEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function VehicleAttachRequestEvent:writeStream(streamId, connection) end

---@param connection Connection
function VehicleAttachRequestEvent:run(connection) end
