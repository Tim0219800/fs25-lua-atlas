# vehicles/VehicleLowerImplementEvent.lua

*[Version française](../../fr/scripts/vehicles/VehicleLowerImplementEvent.md)*

Source: `dataS/scripts/vehicles/VehicleLowerImplementEvent.lua` — FS25 1.25.1.0

✍ Network event synchronizing the lowering or raising of an implement on a given attacher joint. It carries the vehicle, a signed 8-bit joint index and the move-down flag, and calls `setJointMoveDown`. The server rebroadcasts events received from clients.

- **VehicleLowerImplementEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleLowerImplementEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance for stream deserialization. |
| `VehicleLowerImplementEvent.new(vehicle: table, jointIndex: integer, moveDown: boolean) → table` | 25 | ✍ Builds the event from vehicle, joint index and `moveDown` (true to lower). |
| `VehicleLowerImplementEvent:readStream(streamId: integer, connection: Connection)` | 37 | ✍ Reads the vehicle, a signed 8-bit joint index and the move-down flag, then calls `run`. |
| `VehicleLowerImplementEvent:writeStream(streamId: integer, connection: Connection)` | 48 | ✍ Writes the vehicle object, the signed 8-bit joint index and the move-down flag. |
| `VehicleLowerImplementEvent:run(connection: Connection)` | 57 | ✍ If the vehicle is synchronized, calls `setJointMoveDown(jointIndex, moveDown, true)` (no event re-sent). On the server it also rebroadcasts to the other clients. |
| `VehicleLowerImplementEvent.sendEvent(vehicle: table, jointIndex: integer, moveDown: boolean, noEventSend: boolean)` | 72 | ✍ Static helper: unless `noEventSend` is true, the server broadcasts the event and a client sends it to the server. |
