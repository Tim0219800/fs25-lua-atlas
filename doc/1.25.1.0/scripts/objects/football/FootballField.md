# objects/football/FootballField.lua

*[Version française](../../../fr/scripts/objects/football/FootballField.md)*

Source: `dataS/scripts/objects/football/FootballField.lua` — FS25 1.25.1.0

✍ Football field object created from the map (onCreate) and registered in the onCreateObjectSystem. It owns the ball, goal triggers, game area, reset trigger, score and sounds; only creation, deletion and join streaming are in this dump, while `load` and the rest are UNVERIFIED here. It extends Object and is multiplayer-aware.

- **FootballField** inherits from `Object` (l.18)

## Functions

| Function | Line | Description |
|---|---|---|
| `FootballField.onCreate(_: integer, id: integer)` | 51 | ✍ i3d onCreate callback: creates the field for the local server/client roles, calls `load(id)`, then registers it in the on-create object system and the network, or deletes it if loading failed. |
| `FootballField.new(isServer: boolean, isClient: boolean, customMt: table) → table` | 67 | ✍ Constructor: builds the Object, registers the class name `FootballField` and initializes empty `i3dMappings` and `components` tables. |
| `FootballField:delete()` | 193 | ✍ Deletes the ball, removes the goal, game area and reset triggers, resets the ball timer, frees sounds, removes the reset activatable and the `gsFootballFieldReload` console command, then calls the parent delete. |
| `FootballField:writeStream(streamId: integer, connection: table)` | 246 | ✍ Server side on client join: after the parent data it writes the ball object id, the ball's own stream, registers the ball with the server for that connection, and sends both scores as UInt8. |
