---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/MountableSetMountTypeEvent.lua (generated stub, FS25 Lua Atlas)

---@class MountableSetMountTypeEvent : Event
MountableSetMountTypeEvent = {}

---@return table
function MountableSetMountTypeEvent.emptyNew() end

---@param object table
---@param mountType boolean
---@param mountObject any
function MountableSetMountTypeEvent.new(object, mountType, mountObject) end

---@param streamId integer
---@param connection Connection
function MountableSetMountTypeEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function MountableSetMountTypeEvent:writeStream(streamId, connection) end

---@param connection Connection
function MountableSetMountTypeEvent:run(connection) end

---@param vehicle table
---@param mountType boolean
---@param mountObject boolean
---@param noEventSend boolean
function MountableSetMountTypeEvent.sendEvent(vehicle, mountType, mountObject, noEventSend) end
