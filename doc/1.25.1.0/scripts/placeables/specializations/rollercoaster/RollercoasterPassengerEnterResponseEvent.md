# placeables/specializations/rollercoaster/RollercoasterPassengerEnterResponseEvent.lua

*[Version française](../../../../fr/scripts/placeables/specializations/rollercoaster/RollercoasterPassengerEnterResponseEvent.md)*

Source: `dataS/scripts/placeables/specializations/rollercoaster/RollercoasterPassengerEnterResponseEvent.lua` — FS25 1.25.1.0

✍ Server-to-client event telling clients which user takes which seat of a rollercoaster, so the matching player can enter the ride. It is the answer to RollercoasterPassengerEnterRequestEvent; seat indices are sent with `PlaceableRollercoaster.SEAT_INDEX_NUM_BITS` bits, zero-based on the wire and one-based in Lua.

- **RollercoasterPassengerEnterResponseEvent** inherits from `Event` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `RollercoasterPassengerEnterResponseEvent.emptyNew() → table` | 19 | ✍ Creates an empty event with the class metatable and default channel. |
| `RollercoasterPassengerEnterResponseEvent.new(rollercoaster: table, userId: integer, seatIndex: integer) → table` | 30 | ✍ Builds the response from the rollercoaster, a user id and the one-based seat index to occupy. |
| `RollercoasterPassengerEnterResponseEvent:readStream(streamId: integer, connection: Connection)` | 44 | ✍ Reads the rollercoaster, the user id and the seat index (adding 1 to the transmitted value), then runs the event. |
| `RollercoasterPassengerEnterResponseEvent:writeStream(streamId: integer, connection: Connection)` | 56 | ✍ Writes the rollercoaster, the user id and the seat index minus 1. |
| `RollercoasterPassengerEnterResponseEvent:run(connection: Connection)` | 65 | ✍ Finds the player whose unique user id matches the user id among `playerSystem.players` and calls `onEnterRollercoaster` with the seat. Note: if no player matches, `player` stays nil and the call errors. |
