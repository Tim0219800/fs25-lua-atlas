# vehicles/VehicleBrokenEvent.lua

*[Version française](../../fr/scripts/vehicles/VehicleBrokenEvent.md)*

Source: `dataS/scripts/vehicles/VehicleBrokenEvent.lua` — FS25 1.25.1.0

✍ Minimal network event that marks a vehicle as broken on the receiving side. It only carries the vehicle object and calls `setBroken` on it.

- **VehicleBrokenEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleBrokenEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance for stream deserialization. |
| `VehicleBrokenEvent.new(object: table) → table` | 24 | ✍ Builds the event for the given vehicle object (stored in `self.object`). |
| `VehicleBrokenEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the vehicle node object from the stream and calls `run`. |
| `VehicleBrokenEvent:writeStream(streamId: integer, connection: Connection)` | 43 | ✍ Writes the vehicle node object to the stream. |
| `VehicleBrokenEvent:run(connection: Connection)` | 50 | ✍ If the object exists and is synchronized, calls its `setBroken()`. Does not rebroadcast. |
