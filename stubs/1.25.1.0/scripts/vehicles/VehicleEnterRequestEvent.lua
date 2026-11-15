---@meta
-- FS25 1.25.1.0 : vehicles/VehicleEnterRequestEvent.lua (stub généré, atlas Lua FS25)

---@class VehicleEnterRequestEvent : Event
VehicleEnterRequestEvent = {}

---@return table
function VehicleEnterRequestEvent.emptyNew() end

---@param object table
---@param playerStyle table
---@param farmId integer
---@param force boolean?
---@return VehicleEnterRequestEvent
function VehicleEnterRequestEvent.new(object, playerStyle, farmId, force) end

---@param streamId integer
---@param connection Connection
function VehicleEnterRequestEvent:writeStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function VehicleEnterRequestEvent:readStream(streamId, connection) end

---@param connection Connection
function VehicleEnterRequestEvent:run(connection) end
