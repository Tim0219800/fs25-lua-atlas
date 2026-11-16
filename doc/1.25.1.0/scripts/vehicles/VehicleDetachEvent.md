# vehicles/VehicleDetachEvent.lua

*[Version française](../../fr/scripts/vehicles/VehicleDetachEvent.md)*

Source: `dataS/scripts/vehicles/VehicleDetachEvent.lua` — FS25 1.25.1.0

✍ Network event announcing that an implement was detached from a vehicle. Unlike most events here, the work is done directly in `readStream`; `run` is empty. The flag passed to `detachImplementByObject` differs depending on whether the sender is the server.

- **VehicleDetachEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleDetachEvent.emptyNew() → table` | 18 | ✍ Creates an empty event instance for stream deserialization. |
| `VehicleDetachEvent.new(vehicle: table, implement: table) → table` | 28 | ✍ Builds the event from the vehicle and the implement to detach. |
| `VehicleDetachEvent:readStream(streamId: integer, connection: Connection)` | 39 | ✍ Reads vehicle and implement, then, if the vehicle is synchronized, calls `detachImplementByObject`; passes `true` as second argument only when the sender is the server. |
| `VehicleDetachEvent:writeStream(streamId: integer, connection: Connection)` | 56 | ✍ Writes the vehicle and implement node objects to the stream. |
| `VehicleDetachEvent:run(connection: any)` | 63 | ✍ Empty: all processing is done in `readStream`. |
