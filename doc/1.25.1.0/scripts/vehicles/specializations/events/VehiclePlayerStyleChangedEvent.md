# vehicles/specializations/events/VehiclePlayerStyleChangedEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/VehiclePlayerStyleChangedEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/VehiclePlayerStyleChangedEvent.lua` — FS25 1.25.1.0

✍ Network event used to synchronize the player style (character look) displayed in a vehicle. The data is applied directly while reading, so `run` is empty. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **VehiclePlayerStyleChangedEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehiclePlayerStyleChangedEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `VehiclePlayerStyleChangedEvent.new(vehicle: table, playerStyle: table) → table` | 24 | ✍ Builds the event with the data to send (a node object followed by a serialized PlayerStyle); stored on the instance for `writeStream`. |
| `VehiclePlayerStyleChangedEvent:readStream(streamId: integer, connection: Connection)` | 37 | ✍ Reads a node object followed by a serialized PlayerStyle from the stream and applies it directly when the object is synchronized; does not call `run`. |
| `VehiclePlayerStyleChangedEvent:writeStream(streamId: integer, connection: Connection)` | 53 | ✍ Writes a node object followed by a serialized PlayerStyle to the stream (same order as `readStream`). |
| `VehiclePlayerStyleChangedEvent:run(connection: Connection)` | 61 | ✍ Applies the event on the receiving side: empty; the work is done in `readStream`. |
