# vehicles/specializations/events/MountableSetMountTypeEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/MountableSetMountTypeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/MountableSetMountTypeEvent.lua` — FS25 1.25.1.0

✍ Network event class `MountableSetMountTypeEvent` (extends `Event`) that replicates the dynamic mount type of a mountable object. It carries the object, a mount type (`MountableObject.MOUNT_TYPE_SEND_NUM_BITS` bits) and an optional mount object. It belongs to the vehicle specialization events and defines nothing else.

- **MountableSetMountTypeEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `MountableSetMountTypeEvent.emptyNew() → table` | 14 | ✍ Creates an empty `MountableSetMountTypeEvent` instance without data, used when the event is read from a network stream. |
| `MountableSetMountTypeEvent.new(object: table, mountType: boolean, mountObject: any)` | 23 | ✍ Creates the event with its data: the object, a mount type (`MountableObject.MOUNT_TYPE_SEND_NUM_BITS` bits) and an optional mount object. |
| `MountableSetMountTypeEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Reads the event data from the network stream (the object, a mount type (`MountableObject.MOUNT_TYPE_SEND_NUM_BITS` bits) and an optional mount object), then calls `run`. |
| `MountableSetMountTypeEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Writes the event data to the network stream (the object, a mount type (`MountableObject.MOUNT_TYPE_SEND_NUM_BITS` bits) and an optional mount object). |
| `MountableSetMountTypeEvent:run(connection: Connection)` | 62 | ✍ Executes the event on the receiving side: calls `setDynamicMountType(mountType, mountObject, true)` on the object. On the server it also forwards the event to the other clients, except the sender. |
| `MountableSetMountTypeEvent.sendEvent(vehicle: table, mountType: boolean, mountObject: boolean, noEventSend: boolean)` | 78 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
