# player/events/PlayerTeleportEvent.lua

*[Version française](../../../fr/scripts/player/events/PlayerTeleportEvent.md)*

Source: `dataS/scripts/player/events/PlayerTeleportEvent.lua` — FS25 1.25.1.0

✍ Client-to-server event ordering a player teleportation, either to world coordinates or to the exit point of a vehicle. It is processed only on the server, which looks up the player of the sending connection, and uses the main network channel.

- **PlayerTeleportEvent** inherits from `Event` (l.4)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerTeleportEvent.emptyNew() → table` | 11 | ✍ Creates an empty event on the main network channel for stream reading. |
| `PlayerTeleportEvent.new(x: number, y: number, z: number, isAbsolute: boolean, isRootNode: boolean) → table` | 24 | ✍ Builds a coordinate teleport event with x, y, z and two flags, `isAbsolute` and `isRootNode`, which are serialized. |
| `PlayerTeleportEvent.newExitVehicle(exitVehicle: table) → table` | 38 | ✍ Builds a teleport event that places the player at the exit point of the given vehicle. |
| `PlayerTeleportEvent:readStream(streamId: integer, connection: table)` | 48 | ✍ Reads a boolean: if true, a vehicle node object; otherwise three floats and the two flags. Then runs the event. |
| `PlayerTeleportEvent:writeStream(streamId: integer, connection: table)` | 65 | ✍ Writes a boolean telling whether an exit vehicle is set, then either the vehicle node object or the x, y, z floats and the two flags. |
| `PlayerTeleportEvent:run(connection: table)` | 80 | ✍ Ignored on clients. On the server, finds the player for the connection and calls `teleportToExitPoint` for a vehicle, or `teleportTo(x, y, z, true, true)` for coordinates; the stored `isAbsolute` and `isRootNode` are not used here. |
