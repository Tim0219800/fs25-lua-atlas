# vehicles/VehicleEnterRequestEvent.lua

*[Version française](../../fr/scripts/vehicles/VehicleEnterRequestEvent.md)*

Source: `dataS/scripts/vehicles/VehicleEnterRequestEvent.lua` — FS25 1.25.1.0

✍ Network event a client sends to the server to ask to enter a vehicle, with the player style, farm id and a force flag. The server validates the request, records the controller (owner connection, farm, user) and answers with `VehicleEnterResponseEvent`. Sent on the main channel.

- **VehicleEnterRequestEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleEnterRequestEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance on the main network channel. |
| `VehicleEnterRequestEvent.new(object: table, playerStyle: table, farmId: integer, force: boolean?) → VehicleEnterRequestEvent` | 26 | ✍ Builds the request from vehicle, `playerStyle`, `farmId` and optional `force` (defaults to false); also stores the vehicle's network object id. |
| `VehicleEnterRequestEvent:writeStream(streamId: integer, connection: Connection)` | 40 | ✍ Writes the vehicle object id, the farm id, the player style and the force flag. |
| `VehicleEnterRequestEvent:readStream(streamId: integer, connection: Connection)` | 52 | ✍ Reads object id, farm id, player style (creating a `PlayerStyle` if needed) and force flag, resolves the vehicle and calls `run`. |
| `VehicleEnterRequestEvent:run(connection: Connection)` | 70 | ✍ Server side: ignores the request if the vehicle is unsynchronized, not yet a ghost object for that connection (unless forced), lacks `spec_enterable` or is already controlled. Otherwise sets owner connection, farm and user, then sends `VehicleEnterResponseEvent` to the requester (owner) and broadcasts one to the others. |
