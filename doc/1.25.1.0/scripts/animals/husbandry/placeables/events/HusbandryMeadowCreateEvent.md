# animals/husbandry/placeables/events/HusbandryMeadowCreateEvent.lua

*[Version française](../../../../../fr/scripts/animals/husbandry/placeables/events/HusbandryMeadowCreateEvent.md)*

Source: `dataS/scripts/animals/husbandry/placeables/events/HusbandryMeadowCreateEvent.lua` — FS25 1.25.1.0

✍ Network event telling that a husbandry meadow is created or not, chosen by a boolean. A client sends it to the server, which rebroadcasts it to the other clients and applies it locally.

- **HusbandryMeadowCreateEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `HusbandryMeadowCreateEvent.emptyNew()` | 17 | ✍ Creates an empty event instance for the network layer to fill in `readStream`. |
| `HusbandryMeadowCreateEvent.new(placeable: any, createMeadow: any)` | 24 | ✍ Creates the event for a placeable and a boolean saying whether the meadow should be created. |
| `HusbandryMeadowCreateEvent:readStream(streamId: any, connection: any)` | 35 | ✍ Reads the placeable (node object) and the create bool from the stream, then runs the event. |
| `HusbandryMeadowCreateEvent:writeStream(streamId: any, connection: any)` | 43 | ✍ Writes the placeable as a node object and the create bool to the stream. |
| `HusbandryMeadowCreateEvent:run(connection: any)` | 50 | ✍ If received by the server, rebroadcasts it to other clients. When the placeable is synchronized, calls `createMeadow(createMeadow, true)` on it. |
