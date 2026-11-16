# vehicles/VehicleTeleportEvent.lua

*[Version française](../../fr/scripts/vehicles/VehicleTeleportEvent.md)*

Source: `dataS/scripts/vehicles/VehicleTeleportEvent.lua` — FS25 1.25.1.0

✍ Network event asking the server to teleport a vehicle to a world position and heading. It is sent on the main channel and the handler only acts when the receiving side is the server. The file has no constructor or stream functions in this dump, only the empty constructor and `run`.

- **VehicleTeleportEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleTeleportEvent.emptyNew() → table` | 18 | ✍ Creates an empty event instance on the main network channel, used before reading a stream. |
| `VehicleTeleportEvent:run(connection: Connection)` | 53 | ✍ On the server only, if the vehicle exists and is synchronized, calls `g_currentMission:teleportVehicle` with the stored x, z and rotY. Ignored when received by a client. |
