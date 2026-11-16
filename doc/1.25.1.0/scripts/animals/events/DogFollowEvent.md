# animals/events/DogFollowEvent.lua

*[Version française](../../../fr/scripts/animals/events/DogFollowEvent.md)*

Source: `dataS/scripts/animals/events/DogFollowEvent.lua` — FS25 1.25.1.0

✍ Network event sent by a client to make a dog follow a player, or to send it back to its spawn when no player is given. The stream carries a follow flag and, if set, the player. On run it calls Dog:followEntity or Dog:goToSpawn.

- **DogFollowEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `DogFollowEvent.emptyNew()` | 12 | ✍ Creates an empty event instance, used before reading from a stream. |
| `DogFollowEvent.new(dog: any, player: any)` | 19 | ✍ Creates the event for a dog and an optional player; the follow flag is true when a player is given. |
| `DogFollowEvent:readStream(streamId: any, connection: any)` | 31 | ✍ Reads the dog and the follow flag, then the player if following, and runs the event. |
| `DogFollowEvent:writeStream(streamId: any, connection: any)` | 43 | ✍ Writes the dog, the follow flag and, when following, the player. |
| `DogFollowEvent:run(connection: any)` | 52 | ✍ If the dog exists: with the follow flag, calls followEntity when the player resolved (it may not exist on this side); without it, calls goToSpawn. |
