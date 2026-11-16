# vehicles/specializations/events/WearableRepaintEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/WearableRepaintEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/WearableRepaintEvent.lua` — FS25 1.25.1.0

✍ Network event requesting a repaint of a wearable vehicle. After repainting, the server re-broadcasts it so clients refresh their UI, and the VEHICLE_REPAINTED message is published. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **WearableRepaintEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `WearableRepaintEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `WearableRepaintEvent.new(vehicle: table)` | 21 | ✍ Builds the event with the data to send (only the vehicle node object); stored on the instance for `writeStream`. |
| `WearableRepaintEvent:readStream(streamId: integer, connection: Connection)` | 31 | ✍ Reads only the vehicle node object from the stream, then calls `run(connection)`. |
| `WearableRepaintEvent:writeStream(streamId: integer, connection: Connection)` | 40 | ✍ Writes only the vehicle node object to the stream (same order as `readStream`). |
| `WearableRepaintEvent:run(connection: Connection)` | 47 | ✍ Applies the event on the receiving side: calls `repaintVehicle()` if the vehicle has it; on the server it re-broadcasts the event, and it publishes MessageType.VEHICLE_REPAINTED on the message center. |

## Messages

- publishes `MessageType.VEHICLE_REPAINTED` (l.56)
