# animals/events/DogFetchItemEvent.lua

*[Version française](../../../fr/scripts/animals/events/DogFetchItemEvent.md)*

Source: `dataS/scripts/animals/events/DogFetchItemEvent.lua` — FS25 1.25.1.0

✍ Network event sent by a client asking the server to make a dog fetch an item (a ball) thrown by a player. On run it calls Dog:fetchItem if the dog, player and item all resolved.

- **DogFetchItemEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `DogFetchItemEvent.emptyNew()` | 12 | ✍ Creates an empty event instance, used before reading from a stream. |
| `DogFetchItemEvent.new(dog: any, player: any, item: any)` | 19 | ✍ Creates the event for a dog, the throwing player and the item. |
| `DogFetchItemEvent:readStream(streamId: any, connection: any)` | 31 | ✍ Reads the dog, player and item node objects, then runs the event. |
| `DogFetchItemEvent:writeStream(streamId: any, connection: any)` | 41 | ✍ Writes the dog, player and item node objects to the stream. |
| `DogFetchItemEvent:run(connection: any)` | 49 | ✍ If dog, player and item are all non-nil, calls fetchItem on the dog. |
