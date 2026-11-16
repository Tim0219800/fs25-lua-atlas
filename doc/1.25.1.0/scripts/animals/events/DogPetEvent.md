# animals/events/DogPetEvent.lua

*[Version française](../../../fr/scripts/animals/events/DogPetEvent.md)*

Source: `dataS/scripts/animals/events/DogPetEvent.lua` — FS25 1.25.1.0

✍ Network event sent by a client to make the server pet a dog. On run it calls Dog:pet when the dog exists.

- **DogPetEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `DogPetEvent.emptyNew()` | 12 | ✍ Creates an empty event instance, used before reading from a stream. |
| `DogPetEvent.new(dog: any)` | 19 | ✍ Creates the event for a dog. |
| `DogPetEvent:readStream(streamId: any, connection: any)` | 29 | ✍ Reads the dog node object, then runs the event. |
| `DogPetEvent:writeStream(streamId: any, connection: any)` | 37 | ✍ Writes the dog node object to the stream. |
| `DogPetEvent:run(connection: any)` | 43 | ✍ If the dog exists, calls pet on it. |
