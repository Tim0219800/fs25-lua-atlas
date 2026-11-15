---@meta
-- FS25 1.25.1.0 : vehicles/VehicleEnterResponseEvent.lua (generated stub, FS25 Lua Atlas)

---@class VehicleEnterResponseEvent : Event
VehicleEnterResponseEvent = {}

---@return table
function VehicleEnterResponseEvent.emptyNew() end

---@param id table
---@param isOwner boolean
---@param playerStyle table
---@param farmId integer
---@param userId integer
---@return VehicleEnterResponseEvent
function VehicleEnterResponseEvent.new(id, isOwner, playerStyle, farmId, userId) end

---@param streamId integer
---@param connection Connection
function VehicleEnterResponseEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function VehicleEnterResponseEvent:writeStream(streamId, connection) end

---@param connection Connection
function VehicleEnterResponseEvent:run(connection) end
