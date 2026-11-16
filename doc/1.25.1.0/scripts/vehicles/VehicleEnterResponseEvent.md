# vehicles/VehicleEnterResponseEvent.lua

*[Version française](../../fr/scripts/vehicles/VehicleEnterResponseEvent.md)*

Source: `dataS/scripts/vehicles/VehicleEnterResponseEvent.lua` — FS25 1.25.1.0

✍ Network event sent by the server in answer to a vehicle enter request. It tells every machine which user entered which vehicle, with the player style, farm id and an `isOwner` flag. On receipt it calls `onEnterVehicle` on the matching player. Sent on the main channel.

- **VehicleEnterResponseEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleEnterResponseEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance on the main network channel. |
| `VehicleEnterResponseEvent.new(id: table, isOwner: boolean, playerStyle: table, farmId: integer, userId: integer) → VehicleEnterResponseEvent` | 27 | ✍ Builds the response from vehicle object id, `isOwner`, `playerStyle`, `farmId` and `userId`. |
| `VehicleEnterResponseEvent:readStream(streamId: integer, connection: Connection)` | 43 | ✍ Reads object id, owner flag, player style (creating a `PlayerStyle` if needed), farm id and user id, then calls `run`. |
| `VehicleEnterResponseEvent:writeStream(streamId: integer, connection: Connection)` | 62 | ✍ Writes object id, owner flag, player style, farm id and user id to the stream. |
| `VehicleEnterResponseEvent:run(connection: Connection)` | 76 | ✍ Looks up the vehicle and the player by user id; skips with a dev warning if either is missing or the vehicle is unsynchronized. Otherwise calls `player:onEnterVehicle(vehicle)`. The `isOwner` flag is not used here. |
