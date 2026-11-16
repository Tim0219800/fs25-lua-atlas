# animals/events/AnimalNameEvent.lua

*[Version française](../../../fr/scripts/animals/events/AnimalNameEvent.md)*

Source: `dataS/scripts/animals/events/AnimalNameEvent.lua` — FS25 1.25.1.0

✍ Network event for renaming an animal cluster in a husbandry. A client sends it to the server, which applies the rename and rebroadcasts it to the other clients. The static sendEvent helper picks the right path (broadcast on the server, send to server on a client).

- **AnimalNameEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `AnimalNameEvent.emptyNew()` | 12 | ✍ Creates an empty event instance, used before reading from a stream. |
| `AnimalNameEvent.new(husbandry: any, clusterId: any, name: any)` | 19 | ✍ Creates the event for a husbandry, cluster id and new name. |
| `AnimalNameEvent:readStream(streamId: any, connection: any)` | 31 | ✍ Reads the husbandry, cluster id and name string, then runs the event. |
| `AnimalNameEvent:writeStream(streamId: any, connection: any)` | 41 | ✍ Writes the husbandry, cluster id and name to the stream. |
| `AnimalNameEvent:run(connection: any)` | 49 | ✍ Calls renameAnimal on the husbandry (without sending a new event). If it came from a client, the server rebroadcasts the event to the other clients. There is no nil check on the husbandry. |
| `AnimalNameEvent.sendEvent(husbandry: any, clusterId: any, name: any, noEventSend: any)` | 59 | ✍ Sends the rename unless noEventSend is true: the server broadcasts to clients, a client sends to the server. |
