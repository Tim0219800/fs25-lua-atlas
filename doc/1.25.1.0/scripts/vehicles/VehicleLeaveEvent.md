# vehicles/VehicleLeaveEvent.lua

*[Version française](../../fr/scripts/vehicles/VehicleLeaveEvent.md)*

Source: `dataS/scripts/vehicles/VehicleLeaveEvent.lua` — FS25 1.25.1.0

✍ Network event signalling that a user left a vehicle. Clients send it to the server, which clears the owner connection and controller farm and rebroadcasts it; every machine then calls `leaveVehicle` on the matching player. `sendEvent` is the entry point used by game code. Main channel.

- **VehicleLeaveEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleLeaveEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance on the main network channel. |
| `VehicleLeaveEvent.new(vehicle: table, userId: any) → table` | 23 | ✍ Builds the event from the vehicle and the id of the user leaving it. |
| `VehicleLeaveEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the vehicle object and the user id from the stream, then calls `run`. |
| `VehicleLeaveEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the vehicle object and the user id to the stream. |
| `VehicleLeaveEvent:run(connection: Connection)` | 52 | ✍ Ignored if the vehicle is missing or unsynchronized. On the server it resets owner connection and `controllerFarmId` and rebroadcasts to other clients. Everywhere it calls `leaveVehicle(vehicle, true)` on the player found by user id. |
| `VehicleLeaveEvent.sendEvent(vehicle: any, userId: any, noEventSend: any)` | 81 | ✍ Static helper: unless `noEventSend` is true, the server broadcasts the event to clients and a client sends it to the server connection. |
