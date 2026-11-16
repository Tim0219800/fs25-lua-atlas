# placeables/specializations/rollercoaster/RollercoasterPassengerEnterRequestEvent.lua

*[Version française](../../../../fr/scripts/placeables/specializations/rollercoaster/RollercoasterPassengerEnterRequestEvent.md)*

Source: `dataS/scripts/placeables/specializations/rollercoaster/RollercoasterPassengerEnterRequestEvent.lua` — FS25 1.25.1.0

✍ Client-to-server event asking to board a rollercoaster, carrying the rollercoaster and the requesting player. The server handles it with `tryEnterRide`; the answer is a RollercoasterPassengerEnterResponseEvent (sent by code outside this file).

- **RollercoasterPassengerEnterRequestEvent** inherits from `Event` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `RollercoasterPassengerEnterRequestEvent.emptyNew() → table` | 19 | ✍ Creates an empty event with the class metatable and default channel. |
| `RollercoasterPassengerEnterRequestEvent.new(rollercoaster: table, player: table) → table` | 29 | ✍ Builds the request from the rollercoaster object and the player making it. |
| `RollercoasterPassengerEnterRequestEvent:readStream(streamId: integer, connection: Connection)` | 40 | ✍ Reads the rollercoaster and the player as network objects, then runs the event. |
| `RollercoasterPassengerEnterRequestEvent:writeStream(streamId: integer, connection: Connection)` | 51 | ✍ Writes the rollercoaster and the player as network objects. |
| `RollercoasterPassengerEnterRequestEvent:run(connection: Connection)` | 59 | ✍ If the rollercoaster is synchronized, calls `tryEnterRide` with the connection and the player. The player is not nil-checked here. |
