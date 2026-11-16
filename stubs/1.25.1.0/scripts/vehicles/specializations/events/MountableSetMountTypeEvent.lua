---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/MountableSetMountTypeEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `MountableSetMountTypeEvent` (extends `Event`) that replicates the dynamic mount type of a mountable object. It carries the object, a mount type (`MountableObject.MOUNT_TYPE_SEND_NUM_BITS` bits) and an optional mount object. It belongs to the vehicle specialization events and defines nothing else.
---@class MountableSetMountTypeEvent : Event
MountableSetMountTypeEvent = {}

--- Creates an empty `MountableSetMountTypeEvent` instance without data, used when the event is read from a network stream.
---@return table
function MountableSetMountTypeEvent.emptyNew() end

--- Creates the event with its data: the object, a mount type (`MountableObject.MOUNT_TYPE_SEND_NUM_BITS` bits) and an optional mount object.
---@param object table
---@param mountType boolean
---@param mountObject any
function MountableSetMountTypeEvent.new(object, mountType, mountObject) end

--- Reads the event data from the network stream (the object, a mount type (`MountableObject.MOUNT_TYPE_SEND_NUM_BITS` bits) and an optional mount object), then calls `run`.
---@param streamId integer
---@param connection Connection
function MountableSetMountTypeEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the object, a mount type (`MountableObject.MOUNT_TYPE_SEND_NUM_BITS` bits) and an optional mount object).
---@param streamId integer
---@param connection Connection
function MountableSetMountTypeEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setDynamicMountType(mountType, mountObject, true)` on the object. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function MountableSetMountTypeEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set.
---@param vehicle table
---@param mountType boolean
---@param mountObject boolean
---@param noEventSend boolean
function MountableSetMountTypeEvent.sendEvent(vehicle, mountType, mountObject, noEventSend) end
