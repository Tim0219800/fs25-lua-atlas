# vehicles/specializations/events/WearableRepairEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/WearableRepairEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/WearableRepairEvent.lua` — FS25 1.25.1.0

✍ Network event requesting a repair of a wearable vehicle, optionally flagged as done at a selling point. The server re-broadcasts it for UI updates and VEHICLE_REPAIRED is published. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **WearableRepairEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `WearableRepairEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `WearableRepairEvent.new(vehicle: table, atSellingPoint: any)` | 21 | ✍ Builds the event with the data to send (a node object and a boolean 'at selling point' flag); stored on the instance for `writeStream`. |
| `WearableRepairEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Reads a node object and a boolean 'at selling point' flag from the stream, then calls `run(connection)`. |
| `WearableRepairEvent:writeStream(streamId: integer, connection: Connection)` | 42 | ✍ Writes a node object and a boolean 'at selling point' flag to the stream (same order as `readStream`). |
| `WearableRepairEvent:run(connection: Connection)` | 50 | ✍ Applies the event on the receiving side: calls `repairVehicle(atSellingPoint)` if the vehicle has it; on the server it re-broadcasts the event, and it publishes MessageType.VEHICLE_REPAIRED with the flag. |

## Messages

- publishes `MessageType.VEHICLE_REPAIRED` (l.59)
